<?php

namespace app\components;

use JBBCode\CodeDefinitionBuilder;
use JBBCode\CodeDefinitionSet;
use JBBCode\validators\UrlValidator;
use yii\base\BaseObject;

/**
 * Provides a default set of common bbcode definitions.
 * Support BB-codes: 
 * [b]bold[/b]
 * [i]italic[/i]
 * [s]strike[/s]
 * [url=http://domain.zone]This is link[/url]
 * [code]code[/code]
 * 
 * @inheritdoc
 * 
 * @author Belosludcev Vasilij http://github.com/bupy7
 * @version 1.1
 */
class BBCodeDefinitionSet extends BaseObject implements CodeDefinitionSet
{
    /* The default code definitions in this set. */
    protected $definitions = array();

    public function __construct()
    {
        /* [code] code tag */
        $builder = new CodeDefinitionBuilder('code', '<code>{param}</code>');
        array_push($this->definitions, $builder->build());
        
        /* [s] strike tag */
        $builder = new CodeDefinitionBuilder('s', '<strike>{param}</strike>');
        array_push($this->definitions, $builder->build());  

        /* [b] bold tag */
        $builder = new CodeDefinitionBuilder('b', '<strong>{param}</strong>');
        array_push($this->definitions, $builder->build());

        /* [i] italic tag */
        $builder = new CodeDefinitionBuilder('i', '<i>{param}</i>');
        array_push($this->definitions, $builder->build());

        $urlValidator = new UrlValidator();

        /* [url] link tag */
        $builder = new CodeDefinitionBuilder('url', '<a href="{param}">{param}</a>');
        $builder->setParseContent(false)->setBodyValidator($urlValidator);
        array_push($this->definitions, $builder->build());

        /* [url=http://example.com] link tag */
        $builder = new CodeDefinitionBuilder('url', '<a href="{param}">{param}</a>');
        $builder->setUseOption(true)->setParseContent(true)->setOptionValidator($urlValidator);
        array_push($this->definitions, $builder->build());
        
    }

    public function getCodeDefinitions() 
    {
        return $this->definitions;
    }

}
