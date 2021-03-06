<?php

namespace App\Model;

use App\Core\Controller;

use PDO;

use App\Libs\Algolia;

class Users extends Controller
{
    public function register($username, $password, $email, $fullname, $avatar)
    {
        $sql = "INSERT INTO users (username, password, email, fullname, avatar) VALUES (:username, :password, :email, :fullname, :avatar)";
        try {
            $query = $this->db->prepare($sql);
            $parameters = array(
                ":username" => $username,
                ":password" => $password,
                ":email" => $email,
                ":fullname" => $fullname,
                ":avatar" => $avatar
            );
            $query->execute($parameters);

            $lastInsertId = $this->db->lastInsertId();

            $array = $this->getUserById($lastInsertId);

//            var_dump($array);exit;

            $algolia = new Algolia();

            $algolia->saveObject($array, $lastInsertId);

            return $lastInsertId;
        } catch (PDOException $e) {
            echo ($e->getMessage());
        }
    }

    public function getUserById($userId)
    {
        $sql = "SELECT * FROM users WHERE user_id = $userId";
        try{
            $query = $this->db->prepare($sql);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(PDOException $e){
            echo ($e->getMessage());
        }
    }

    public function checkUser($username) {
        $sql = "SELECT * FROM users WHERE username = :username";
        try {
            $query = $this->db->prepare($sql);
            $parameters = array(
                ":username" => $username,
            );
            $query->execute($parameters);
            return $query->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo ($e->getMessage());
        }
    }

    public function login($username, $password)
    {
        $sql = "SELECT * FROM users WHERE username = :username AND password = :password";
        try {
            $query = $this->db->prepare($sql);
            $parameters = array(
                ":username" => $username,
                ":password" => $password
            );
            $query->execute($parameters);
            return $query->fetch();
        } catch (PDOException $e) {
            echo ($e->getMessage());
        }
    }

    public function checkEmail($email)
    {
        $sql = "SELECT * FROM users WHERE email = :email";
        try{
            $query = $this->db->prepare($sql);
            $parameters = array(
                ":email" => $email
            );
            $query->execute($parameters);
            return $query->fetch(PDO::FETCH_ASSOC);
        }catch(PDOException $e){
            echo ($e->getMessage());
        }
    }

    public function updatePassword($password, $userId)
    {
        $sql = "UPDATE users SET password = :password WHERE user_id = :user_id";
        try{
            $query = $this->db->prepare($sql);
            $parameters = array(
                ":password" => $password,
                ":user_id" => $userId
            );
            $result = $query->execute($parameters);

            $array = $this->getUserById($userId);

            $algolia = new Algolia();

            $algolia->saveObject($array, $userId);

            return $result;
        }catch(PDOException $e){
            echo ($e->getMessage());
        }
    }

    public function updateGoogle($userId, $username, $email, $fullname, $avatar)
    {
        $sql = "UPDATE users SET username = :username, email = :email, fullname = :fullname, avatar = :avatar WHERE user_id = :user_id";
        try{
            $query = $this->db->prepare($sql);
            $parameters = array(
                ":username" => $username,
                ":email" => $email,
                ":fullname" => $fullname,
                ":avatar" => $avatar,
                ":user_id" => $userId
            );
            $result = $query->execute($parameters);

            $array = $this->getUserById($userId);

            $algolia = new Algolia();

            $algolia->saveObject($array, $userId);

            return $result;
        }catch(PDOException $e){
            echo ($e->getMessage());
        }
    }
}