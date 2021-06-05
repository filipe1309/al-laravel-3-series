<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Serie extends Model
{
    public $timestamps = false;
    protected $fillable = ['nome', 'capa'];

    public function getCapaUrlAttribute()
    {
        return Storage::url($this->capa ?? 'serie/sem-imagem.jpg');
    }

    public function temporadas()
    {
        return $this->hasMany(Temporada::class);
    }
}
