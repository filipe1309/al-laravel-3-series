<?php

namespace App\Listeners;

use App\Events\NovaSerie;
use App\User;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class EnviarEmailNovaSerieCadastrada implements ShouldQueue
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  NovaSerie  $event
     * @return void
     */
    public function handle(NovaSerie $event)
    {
        $users = User::all();
        foreach ($users as $i => $user) {
            $email = new \App\Mail\NovaSerie(
                $event->nomeSerie,
                $event->qtdTemporadas,
                $event->qtdEpisodios
            );

            $email->subject = 'Nova Serie Adicionada!';

            $multiplicador = $i + 1;
            $quando = now()->addSecond($multiplicador * 10);
            \Illuminate\Support\Facades\Mail::to($user)->later(
                $quando,
                $email
            );
        }
    }
}
