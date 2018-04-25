<?php
    use yii\widgets\LinkPager;
    use yii\widgets\Pjax;
    use yii\helpers\Html;
?>


<?= $this->render('_form', [
    'model' => $commentModel,
]) ?>
<?php Pjax::begin([
    'clientOptions' => [
        'scrollOffset' => -50,
    ],
    'scrollTo' => true,
]); ?>
<table class="table">
    <thead>
        <tr>
            <th>Пользователь</th>
            <th>E-mail</th>
            <th>Homepage</th>
            <th>Text</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach($comments as $item):?>
        <tr>
            <td><?=$item->username?></td>
            <td><?= Html::mailto($item->email) ?></td>
            <td><?= Html::a($item->homepage, $item->homepage, [
                'target' => '_blank',
                'rel' => 'noreferrer noopener'
            ]) ?></td>
            <td><?=$item->text_html?></td>
        </tr>
    <?php endforeach;?>
    </tbody>
</table>

<?=LinkPager::widget([
    'pagination' => $pages,
]);?>
<?php Pjax::end();?>
<div class="clearfix"></div>

