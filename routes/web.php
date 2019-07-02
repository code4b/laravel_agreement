<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::resource('agreement', 'AgreementController');
Route::post('/agreement/complete', 'AgreementController@complete');
Route::post('/agreement/OtherUsers', 'AgreementController@OtherUsers');
Route::post('/agreement/share/{id}', 'AgreementController@share');
Route::post('/agreement/sharedWithMe', 'AgreementController@sharedWithMe');
