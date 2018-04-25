<?php 
use yii\widgets\ActiveForm;
use yii\helpers\Html;
use \himiklab\yii2\recaptcha\ReCaptcha;
use app\components\wysibb\WysiBB;

?>

<?php $form = ActiveForm::begin();?>
    <?php if(Yii::$app->user->isGuest): ?>
        <?= $form->field($model, 'username') ?>
        <?= $form->field($model, 'email') ?>
        <?= $form->field($model, 'homepage') ?>
    <?php endif;?>
    <?= $form->field($model, 'text_bbcode')->widget(WysiBB::className()) ?>
    <?php if(Yii::$app->user->isGuest): ?>
        <?= $form->field($model, 'captcha')->widget(
            ReCaptcha::className(),
            ['siteKey' => '6Lf-bkAUAAAAALRVYjQ55JOCodefTnUV9eD11p4i']
        ) ?>
    <?php endif;?>
    <div class="form-group">
        <?= Html::submitButton('Отправить сообщение', ['class' => 'btn btn-primary']) ?>
    </div>

<?php ActiveForm::end();?>