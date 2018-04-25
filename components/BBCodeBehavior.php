<?php

namespace app\components;

use yii\base\Behavior;
use yii\helpers\Html;


class BBCodeBehavior extends \bupy7\bbcode\BBCodeBehavior {
    
    public function beforeSave($event) {
        $this->owner->text_bbcode = Html::encode($this->owner->text_bbcode);
        parent::beforeSave($event);
        //$this->owner->text_bbcode = Html::encode($this->owner->text_bbcode);
    }
}