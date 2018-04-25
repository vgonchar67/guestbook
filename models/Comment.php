<?php

namespace app\models;

use Yii;
use app\components\BBCodeBehavior;
use app\components\BBCodeDefinitionSet;

/**
 * This is the model class for table "comment".
 *
 * @property int $id
 * @property string $username
 * @property string $email
 * @property string $homepage
 * @property string $text
 * @property int $active
 */
class Comment extends \yii\db\ActiveRecord
{
    const USE_RECAPTCHA = TRUE;
    const ACTIVE = 1;
    const NO_ACTIVE = 0;

    public $captcha;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'comment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        $emptyUserId = function($model){
            return empty($model->user_id);
        };
        $rules = [
            [['text_bbcode'], 'required'],
            [['text_bbcode', 'text_html'], 'string'],
            [['active'], 'integer'],   
            [['username', 'email'], 'required', 'when' => $emptyUserId],   
            [['username'], 'string', 'max' => 50, 'when' => $emptyUserId],  
            [['email'], 'email', 'when' => $emptyUserId],
            [['email'], 'string', 'max' => 25, 'when' => $emptyUserId],
            [['homepage'], 'url', 'when' => $emptyUserId],
            [['homepage'], 'string', 'max' => 100, 'when' => $emptyUserId]
        ];
        if(self::USE_RECAPTCHA) {
            $rules[] =  [['captcha'], \himiklab\yii2\recaptcha\ReCaptchaValidator::className(), 'secret' => '6Lf-bkAUAAAAACoQ5ju0Z7L4Az7w24HT6bT4Aq7l', 'when' => $emptyUserId];
        } else {
            $rules[] =  ['captcha', 'captcha', 'when' => $emptyUserId];
        }
        return $rules;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Имя',
            'email' => 'Email',
            'homepage' => 'Homepage',
            'text_bbcode' => 'Текст сообщения',
            'active' => 'Active',
            'captcha' => 'Капча'
        ];
    }

    public function behaviors()
    {

        return [
            [
                'class' => BBCodeBehavior::className(),
                'attribute' => 'text_bbcode',
                'saveAttribute' => 'text_html',
                'enableHtmlPurifierAfter' => true,
                'configHtmlPurifierAfter' => array(
                    'HTML.TargetBlank'=>true,
                ),
                'defaultCodeDefinitionSet' => BBCodeDefinitionSet::className(),
            ],
            
        ];
    }
}
