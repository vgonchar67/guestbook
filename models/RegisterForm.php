<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class RegisterForm extends Model
{
    public $login;
    public $username;
    public $password;
    public $repeatePassword;
    public $email;
    public $homepage;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['login', 'email', 'password', 'username'], 'required'],
            ['email', 'email'],
            ['homepage', 'url'],
            ['repeatePassword', 'validateRepeatePassword'],
            ['login', 'validateLogin']
        ];
    }

    /**
     * @return bool whether the user is registered in successfully
     */
    public function register()
    {
        if ($this->validate()) {
            $user = new User();
            $user->setPassword($this->password);
            $user->login = $this->login;
            $user->email = $this->email;
            $user->homepage = $this->homepage;
            $user->username = $this->username;
            return $user->save();
        }
        return false;
    }

    public function attributeLabels()
    {
        return [
            'login' => 'Логин',
            'username' => 'Имя',
            'password' => 'Пароль',
        ];
    }

    public function validateLogin($attribute, $params)
    {
        if(User::findByLogin($this->login)) {
            $this->addError($attribute, 'Пользователь ' . $this->login . ' уже зарегистрирован');
        }
    }

    public function validateRepeatePassword($attribute, $params) {
        if(!$this->hasErrors() && User::findByLogin($this->login)) {
            $this->addError($attribute, 'Логин занят');
        }
    }
}
