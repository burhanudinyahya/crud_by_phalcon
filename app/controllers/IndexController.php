<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
	  	$emp = Employee::find(['order' => 'emp_id DESC']);
    	$this->view->emp = $emp;
    }

}

