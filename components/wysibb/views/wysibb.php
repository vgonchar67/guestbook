<?php
$js = <<<JS
$("#$inputId").wysibb({
	buttons: "bold,italic,strike,|,code,|,link,",
	traceTextarea: true,
	lang: 'ru'
});
JS;
$this->registerJs($js);
?>