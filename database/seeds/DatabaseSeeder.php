<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'John Doe',
            'email' => 'test@test.com',
            'password' => bcrypt('123mudar'),
        ]);
        // $this->call(UsersTableSeeder::class);
        // $this->call([
        //     UserSeeder::class
        // ]);
    }
}
