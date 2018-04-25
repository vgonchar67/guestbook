<?php

namespace app\modules\admin\models;

use Yii;
use app\components\BBCodeBehavior;
use app\components\BBCodeDefinitionSet;
use yii\helpers\ArrayHelper;
use yii\helpers\StringHelper;
use yii\helpers\Html;
use yii\helpers\HtmlPurifier;

/**
 * This is the model class for table "comment".
 *
 * @property int $id
 * @property string $username
 * @property string $email
 * @property string $homepage
 * @property string $text_bbcode
 * @property string $text_html
 * @property int $active
 */
class Comment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */

    const ACTIVE = 1;
    const NO_ACTIVE = 0;

    public static function tableName()
    {
        return 'comment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'email', 'text_bbcode'], 'required'],
            [['text_bbcode', 'text_html'], 'string'],
            [['active'], 'integer'],
            [['username'], 'string', 'max' => 50],
            [['email'], 'email'],
            [['email'], 'string', 'max' => 25],
            [['homepage'], 'url'],
            [['homepage'], 'string', 'max' => 100],
        ];
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
            'text_bbcode' => 'Текст',
            'text_html' => 'Текст',
            'active' => 'Активность',
        ];
    }

    public function behaviors()
    {

        return [
            [
                'class' => BBCodeBehavior::className(),
                'attribute' => 'text_bbcode',
                'saveAttribute' => 'text_html',
                'codeDefinitionSet' => [
                    BBCodeDefinitionSet::className(),
                ],
                'enableHtmlPurifierAfter' => true,
                'configHtmlPurifierAfter' => array(
                    'HTML.TargetBlank'=>true,
                ),
            ],
            
        ];
    }

    public function lightingSearchTruncate($name, $truncateLength = 300, $useEncode = true) {

        $content = $this->$name;
        $searchParam = ArrayHelper::getValue(Yii::$app->request->get('CommentSearch', []), $name);

        if (!$searchParam) {
            return StringHelper::truncate($content, $truncateLength);
        }

        $pregStr = preg_quote ($searchParam, '/');
        if($useEncode) {
            $pregStr = Html::encode($pregStr);
        }
        $pregStr = preg_replace ('/[её]/iu', '[её]', $pregStr);
        $pos = 0;
        $len_tag = 0;
        $content = preg_replace_callback('/'.$pregStr.'/iu', function($matches) use (&$pos, &$content, &$len_tag) {
            $result = Html::tag('span', $matches[0], ['style' => 'background: yellow;']);
            $pos = $pos?:mb_stripos($content, $matches[0]);
            $len_tag = $len_tag?:mb_strlen($result);
            return $result;
        }, $content);
        if(  $pos + $len_tag  >= $truncateLength) {
            $content = '...' . mb_substr($content, $pos - 50);
        }
        $content = StringHelper::truncate($content, $truncateLength);
        return HtmlPurifier::process($content, [
            'Core.EscapeInvalidTags' => true,
        ]);
    }

    public function getActiveHTML() {
        $cssClass = $this->active? 'text-success' : 'text-danger';
        $text = $this->active? 'Да' : 'Нет';
        return '<span class="' . $cssClass . '">' . $text . '</span>'; 
    }
    public function getSearchTextBBCode() {
       return $this->lightingSearchTruncate('text_bbcode');
    }
}
