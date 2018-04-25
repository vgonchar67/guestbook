<?php

namespace app\components\wysibb;

use yii\web\AssetBundle;
use yii\web\View;

class WysiBBAsset extends AssetBundle
{
    public $sourcePath = '@app/components/wysibb/assets';
    public $css = [
        'theme/default/wbbtheme.css',
    ];
    public $js = [
        'jquery.wysibb.js',
        'lang/ru.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
