import React, { Component } from 'react';
import ReactDOM from 'react-dom';


export default class App extends Component {
    constructor(props) {
        super(props);
        this.state = {
            isAdmin:'',
            goToNext:false,
            name: '',
            completed:false,
            buttonTxt:'Create',
            showUsers:false,
            users:[],
            agreements: [],
            pendingAgreements:[]
        };

        // bind
        this.handleChange = this.handleChange.bind(this);

        // bind handleSubmit method
        this.handleSubmit = this.handleSubmit.bind(this);
        this.renderAgreements = this.renderAgreements.bind(this);
        this.handleDelete = this.handleDelete.bind(this);
        this.handleAccept = this.handleAccept.bind(this);
        this.handleEdit = this.handleEdit.bind(this);
        this.handleUpdate = this.handleUpdate.bind(this);
        this.showUsers = this.showUsers.bind(this);
       
    }
     // lifecycle method
     componentWillMount() {
         this.getAgreements();

    }
    // handle change
    handleChange(e) {
        const target = e.target;
        const value = target.type === 'checkbox' ? target.checked : target.value;
        const name = target.name;
    
        this.setState({
          [name]: value
        });

    }


// make agreemnts create request to the backend - admin feature
handleSubmit(e) {
    e.preventDefault();

        axios
            .post('/agreement', {
                title: this.state.title,
                content: this.state.content,
            })
            .then(response => {
                console.log('from handle submit', response);
                // set state
                this.setState({
                    agreements: [response.data, ...this.state.agreements]
                });
                // then clear the value of textarea
                this.setState({
                    title: '',
                    content: '',
                    completed:false
                });
            });
    }
    // make agreemnts update request to the backend - admin feature
    handleUpdate(e) {
        e.preventDefault();
    
            axios
                .put('/agreement/'+this.state.id, {
                    title: this.state.title,
                    content: this.state.content,
                })
                .then(response => {
                    console.log('from handle update', response);
                   
                    this.state.agreements.map(item => {
                        if (item.id === this.state.id){
                            item.title = this.state.title;
                            item.content = this.state.content;
                        }
                         
                        
                        return item;
                      });
                   
                    // then clear the value of fields
                    this.setState({
                        title: '',
                        content:'',
                        id:'',
                        buttonTxt:'Create'
                    });
                });
        }
    //populate all added agreements - feature for admin only    
    renderAgreements() {
        return ( 
        <div className="table-responsive">          
        <table className="table">
          <thead>
            <tr>
              <th>#</th>
              <th>Title</th>
              <th>Actions</th>
          
            </tr>
          </thead>
          <tbody>

            {
               this.state.agreements.map((agreement,index) => (
                <tr key={agreement.id} >
                <td>{index+1}</td>
                <td>{agreement.title}</td>
                <td>  
                     <button
                                onClick={() => this.handleDelete(agreement.id)}
                                className="btn btn-sm btn-danger float-right"
                            >
                                Delete
                            </button>
                            <button
                                onClick={() => this.handleEdit(agreement)}
                                className="btn btn-sm btn-primary float-right"
                            >
                                Edit
                            </button>
                </td>
              
                </tr>
               
            )) 
            }
          </tbody>
        </table>
        </div>
        )
        
    }
    //populate agent view according to pending agreement status
    renderAgentAgreements() {
     
        return (
            
            <div className="row container">
            <div className="col-md-12">
         
                       
                      
                      
                
                {

                      (this.state.goToNext)? this.agentDash():
                      <div id="accordion">          
                   

            {

                this.state.agreements.map((agreement,index) => { 
                                        
                    return (
                        <div key={agreement.id} className="card">
                        <div className="card-header" id={"heading"+index}>
                          <h5 className="mb-0">
                            <button className={"btn btn-"+(agreement.completed ? "success" : "link")}  data-toggle="collapse" data-target={"#collapseOne"} aria-expanded="true" aria-controls="collapseOne">
                              <h4>{agreement.title}</h4>
                            </button>
                          </h5>
                        </div>
                    
                        <div id={"collapse"+index} className="collapse show" aria-labelledby={"heading"+index} data-parent="#accordion">
                          <div className="card-body">
                          {agreement.content}
                           <div>
                         
                            <input type="checkbox" value={agreement.completed} defaultChecked={agreement.completed} onClick={() => this.handleAccept(agreement.id)}   id={'agreement_'+agreement.id} className="checkbox checkbox--checkbox checkbox--success" tabIndex="1" />
                              <label htmlFor=  {'agreement_'+agreement.id}  className="checkbox__label">Accept</label>
                          </div>
                           
                             
                          </div>
                        </div>
                      </div>
                     
                            
                         
               

                    )}
                    )

            }
         
        <button className="btn btn-info" onClick={() => this.doProceed()} >Proceed</button> 
        </div>
                    
                     
                                     
                }
              
                </div>
            </div>
          

        );
    }
    //get all agreements : response are based on user type
    getAgreements() {
        axios.get('/agreement').then((
            response // console.log(response.data.agreements)
        ) =>
            this.setState({
                ...response.data
            })
        );

     
    }
    //get all users except current one - feature for admin only
    getOtherUsers() {
        axios.get('/agreement/OtherUsers').then((
            response 
        ) =>
            this.setState({
                users: [...response.data.users]
            })
        );
    }
     // edit agreement - admin feature
    handleEdit(agreement) {
        this.setState({
            id:agreement.id,
            title: agreement.title,
            content: agreement.content,
            buttonTxt:'Update'
        });
    }

    handleDelete(id) {
        // remove agreement - admin feature
        const isNotId = agreement => agreement.id !== id;
        const updatedAgreements = this.state.agreements.filter(isNotId);
        this.setState({ agreements: updatedAgreements });
        // make delete request to the backend
        axios.delete(`/agreement/${id}`);
    }

 
    handleAccept(id) {
       //while accepting each agreement, remove it from pending agreements state
        this.state.agreements.map((agreement) => {
            if (agreement.id === id){
                agreement.completed = !agreement.completed;
                console.log(this.state.pendingAgreements)
                if(agreement.completed){
                    this.setState({pendingAgreements: this.state.pendingAgreements.filter(value => value!=id)});
                }else{
                    let joined = this.state.pendingAgreements.concat(''+id);
                    this.setState({pendingAgreements: joined});

                   
                }
                console.log(this.state.pendingAgreements)
            }
            return agreement;
          });
        
      
         
       
    }
    //proceed after accepting agreements , agents are allowed to welcome page only after accepting all agreements
    doProceed(){

        if(this.state.pendingAgreements.length>0){
           
                 alert("Please accept all agreements !")
            
        }else{
            axios
            .post('/agreement/complete', {
                ...this.state.pendingAgreements
            })
            .then(response => {
              this.setState({
                goToNext: true,
            });
           
              console.log('from handle complete', this.state);
            
            });
        }
       
    
     }
    //display all users - admin feature
    showUsers(id) {
       
        this.setState({
            showUsers: !this.state.showUsers
        });
        
    }
    //welcome view for users who accepted all agreements
    agentDash(){
        return (
            <div className="container">
            <div className="row">
            <h1>Welcome dude !</h1>
            </div>
            </div>
        )
    }
    //view for admin user
    adminView(){
        return (
          
            <div className="container">
            <div className="row">
            <div className="col-md-10">
            <div className="row justify-content-center">
                    <div className="col-md-8">
                        <div className="card">
                            <div className="card-header"><h4><b>Create Agreement</b></h4></div>
                            <div className="card-body">
                                <form > 
                                    <div className="form-group">
                                    <input type="text" 
                                          onChange={this.handleChange}
                                         value={this.state.title}
                                         className="form-control"
                                     
                                         maxLength="100"
                                         placeholder="Agreement title"
                                         required
                                         name="title" />
                                    <textarea
                                         name="content"
                                          onChange={this.handleChange}
                                          value={this.state.content}
                                          className="form-control"
                                          rows="5"
                                          maxLength=""
                                          placeholder="Create agreement content"
                                          required
                                        />
                                    </div>
                                    {this.state.id?(<button type="submit" onClick={this.handleUpdate} className="btn btn-primary">
                                    {this.state.buttonTxt}
                                    </button>):(<button type="submit" onClick={this.handleSubmit} className="btn btn-primary">
                                    {this.state.buttonTxt}
                                    </button>)
                                    }
                                    
                                </form>
                                <hr />
       

                            </div>
                        </div>
                    </div>
                </div>
            
                <div className="row justify-content-center">
              
                    <div className="col-md-12">
                    <h4><b>Added Agreements</b></h4>
                    {this.renderAgreements()}
                       
                    </div>
                
                    </div>
            </div>
            <div className="col-md-2">
            <button  className="btn btn-success"onClick={this.showUsers} > Show all users</button>
            </div>
            
            </div>
               
                    <Modal show={this.state.showUsers} handleClose={this.showUsers} setAgreement={this.showUsers}  >

                    <div className="row container">
                    <div className="col-md-12">
                        <div className="panel panel-success">
                            <div className="panel-heading">All users</div>
                                <div className="panel-body">
                                    {this.state.users.map((user,i) =><p key={i}><b>{user.name}</b>{' '+user.email }</p> ) }
                                </div>
                            </div>
                        </div>
                    </div>


                    </Modal>
            </div>

        );
    }
    //set view according to usertype
    renderView() {
        return (this.state.isAdmin)?this.adminView():this.renderAgentAgreements();
       
    }
 
      
    render() {
        return(
            <div className="container">
            
            {this.renderView()}
            
            </div>
           
        )
   
        
    }
}

const Modal = ({ handleClose, show, children }) => {
    const showHideClassName = show ? 'modal display-block' : 'modal display-none';
  
    return (
      <div className={showHideClassName}>
        <section className='modal-main'>
          {children}
          
          <button className="btn btn-primary" onClick={handleClose}>Close </button>
         
        </section>
      </div>
    );
  };

