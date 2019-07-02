<?php

namespace App\Http\Controllers;
use Auth;
use App\User;
use App\Agreement;
use Illuminate\Http\Request;
use DB;

class AgreementController extends Controller {
 // apply auth middleware so only authenticated users have access
	public function __construct() {
		$this->middleware('auth');
	}

	public function index(Request $request, Agreement $agreement) {
		// get all the agreements based on current user id
        $isAdmin = Auth::user()->isAdmin;
        $agreements=[];
        $pendingAgreements=[];
        if($isAdmin){
            $agreements = $agreement->orderBy('created_at', 'desc')->get();
            $users = User::where('id', '!=', Auth::id())->get();
        }else{
            $users = [];
            $userAgreements = DB::table('userAgreements')->where('userId', Auth::id())->pluck('agreements');
            $pendingAgreements= trim($userAgreements[0])!=''?explode(',', $userAgreements[0]):[];
            
            if(sizeof($userAgreements[0])>0){
                $allAgreements = $agreement->whereIn('id', $pendingAgreements);
                $agreements = $allAgreements->orderBy('created_at', 'desc')->get();
            }
        
        }
     
		// return json response
		return response()->json([
            'agreements' => $agreements,
            'isAdmin'=>$isAdmin,
            'pendingAgreements'=>$pendingAgreements,
            'goToNext'=>empty($pendingAgreements),
            'users'=> $users
		]);
	}

	public function create() {
		//
    }
    public function OtherUsers() {
        $users = User::where('id', '!=', Auth::id())->get();
        return response()->json([
			'users' => $users,
		]);
    }
   
    public function addToUser($userId,Request $request) {
        $userAgreements = DB::table('userAgreements');
        $userAgreements = $userAgreements->insert([
            'agreements' => $request->get('agreements'),
            'userId'=>$userId,
            "created_at" =>  \Carbon\Carbon::now(), # \Datetime()
            "updated_at" => \Carbon\Carbon::now(),  # \Datetime()
		]);
        return response(200);
	}
	public function store(Request $request) {
		// validate
		$this->validate($request, [
            'title' => 'required|max:100',
			'content' => 'required',
		]);
		// create a new agreement

        $agreements = new Agreement;
        $agreements = $agreements->create([
            'title' => $request->title,
            'content' => $request->content,
            "created_at" =>  \Carbon\Carbon::now(), # \Datetime()
            "updated_at" => \Carbon\Carbon::now(),  # \Datetime()
		]);

		// return agreement with user object
		return response()->json(array("title"=>$agreements->title,"content"=>$agreements->content,"id"=>$agreements->id));
	}

	public function show($id) {
		//
	}

	public function edit($id) {
        $agreement = Agreement::find($id);
        return response()->json($Agreement);
	}

    public function update($id,Request $request)
    {
        $agreement = Agreement::find($id);
        $agreement->title = $request->get('title');
        $agreement->content = $request->get('content');
        $agreement->save();

        return response()->json($agreement->with('user')->find($agreement->id));
    }
    public function complete(Request $request) {
        $pendingAgreement=$request->get('pendingAgreement');
        $id=Auth::id();
        DB::table('userAgreements')
        ->where('userId',$id)
        ->update(['agreements' => $pendingAgreement?$pendingAgreement:'']);

        return response(200);
	}
    public function destroy($id) {
        Agreement::findOrFail($id)->delete();
    }
}
