<?php

namespace app\controllers;

use yii\web\Controller;
use app\models\Comment;
use yii\data\Pagination;
use yii\web\Session;
use Yii;

class CommentController extends Controller {

    const COUNT_ON_PAGE = 5;

    public function actionIndex() {

        $query = Comment::find()->andWhere(['or',
            ['active'=>Comment::ACTIVE],
            ['user_id'=>Yii::$app->user->id]
        ])->orderBy('id DESC');

       
        $pages = new Pagination([
            'totalCount' => $query->count(), 
            'pageSize' => self::COUNT_ON_PAGE,
            'forcePageParam' => false,
            'pageSizeParam' => false
        ]);

        $comments = $query->offset($pages->offset)
            ->limit($pages->limit)
            ->all();

        $commentModel = new Comment;
        $commentModel->user_id = Yii::$app->user->id;

        if($commentModel->load(Yii::$app->request->post())) {
            
            if($commentModel->save()) {
                Yii::$app->session->setFlash('success', 'Сообщение успешно отправлено.');
                return $this->refresh();
            } else {
                Yii::$app->session->setFlash('danger', 'Ошибка. Сообщение не отправлено.');
            }
        }

        return $this->render('index', compact('comments', 'pages', 'commentModel', 'session'));
    }


}
