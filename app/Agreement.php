<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agreement extends Model
{
    //
    protected $fillable = ['title','content'];
    public function user() {
        return $this->belongsTo(User::class);
    }
}
