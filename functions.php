<?php

function dump() {
    foreach (func_get_args() as $value) {
        echo '<pre>';
        var_dump($value);
        echo '</pre>';
    }
}


function pr() {
    foreach (func_get_args() as $value) {
        echo '<pre style="margin-top: 100px">';
        print_r($value);
        echo '</pre>';
    }
}
