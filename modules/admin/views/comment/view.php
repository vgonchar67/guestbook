<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Comment */

$this->title = 'Просмотр комментария: ID ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Comments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="comment-view">


    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'attribute' => 'active',
                'value' => function($model) {
                    $cssClass = $model->active? 'text-success' : 'text-danger';
                    $text = $model->active? 'Да' : 'Нет';
                    return '<span class="' . $cssClass . '">' . $text . '</span>'; 
                },
                'format' => 'html',
            ],
            'username',
            'email:email',
            [
                'attribute' => 'homepage',
                'format' => 'raw',
                'value' => function ($model) {
                    $url = Html::encode($model->homepage);
                    return Html::a($url, $url, ['target' => '_blank']);
                },
            ],
            'text_html:raw',
            
        ],
    ]) ?>

</div>
