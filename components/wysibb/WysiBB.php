<?php

namespace app\components\wysibb;

use yii\widgets\InputWidget;
use app\components\wysibb\WysiBBAsset;
use yii\helpers\Html;

class WysiBB extends InputWidget {

	public function run()
    {
        WysiBBAsset::register($this->view);
        $inputId = Html::getInputId($this->model, $this->attribute);
        $this->options['class'] = 'form-control';
        $this->options['rows'] = '9';
        $this->options['value'] = Html::decode($this->model->text_bbcode);
        $this->view->registerJs("wysibbOptions = {buttons: 'bold,italic,strike,|,code,|,link,'};");
        $this->view->registerJs("$('#$inputId').wysibb(wysibbOptions);");
        return Html::activeTextarea($this->model, $this->attribute, $this->options);        
    }
}