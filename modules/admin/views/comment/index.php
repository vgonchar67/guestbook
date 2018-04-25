<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use app\modules\admin\models\Comment;
use yii\helpers\StringHelper;
use yii\helpers\ArrayHelper;
use yii\helpers\HtmlPurifier;
/* @var $this yii\web\View */
/* @var $searchModel app\modules\admin\models\CommentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Comments';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="comment-index">

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Comment', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\ActionColumn'],
            'id',
            'username',
            'email:email',
            [
                'attribute' => 'homepage',
                'format' => 'raw',
                'value' => function ($model) {
                    $url = Html::encode($model->homepage);
                    return Html::a(StringHelper::truncate($url, 25), $url, ['target' => '_blank']);
                },
            ],
            [
                'attribute' => 'active',
                'value' => 'activeHTML',
                'format' => 'html',
                'filter' => [ Comment::ACTIVE => 'Да', Comment::NO_ACTIVE => 'Нет'],
            ],
            [
                'value' => 'searchTextBBCode',
                'attribute' => 'text_bbcode',
                'format' => 'html',
                'contentOptions' => ['style' => 'font-size: 12px; max-width:400px;'],
            ],
            

            
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
