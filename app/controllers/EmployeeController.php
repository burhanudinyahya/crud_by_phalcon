<?php

use Phalcon\Http\Response as Response;

class EmployeeController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {

    }

    public function saveAction()
    {
    	$this->view->disable();

    	$res = new Response;

    	$emp_id = $this->request->getPost("emp_id");

    	if($emp_id == ''){

	    	$create = new Employee();

	    	$create->assign(array(
	    		'emp_fullname' => $this->request->getPost('InputName'),
	    		'emp_nickname' => $this->request->getPost('InputNick'),
	    		'emp_email' => $this->request->getPost('InputEmail')
	    	));

	    	$action = $create->save();

	    }else{

	    	$emp = Employee::findFirst($emp_id);

	      	$emp->emp_id = $emp_id;
	   		$emp->emp_fullname = $this->request->getPost("InputName");
	   		$emp->emp_nickname = $this->request->getPost("InputNick");
	   		$emp->emp_email = $this->request->getPost("InputEmail");

	   		$action = $emp->save();
	    }

   		if (! $action) {
			$return = array('return' => false, 'msg' => 'Error ! while saving data');
		} else {
			$return = array('return' => true);
		}

    	$res->setContent( json_encode( $return ) );

   		return $res;
    }    

    public function editAction(){
    	$this->view->disable();

    	$res = new Response;

    	$id = $this->request->getPost('id');
   		$emp = Employee::findFirst($id);

   		$res->setContent( json_encode( array(
   			'emp_id'=>$emp->emp_id,
   			'emp_fullname'=>$emp->emp_fullname,
   			'emp_nickname'=>$emp->emp_nickname,
   			'emp_email'=>$emp->emp_email
   		) ) );

   		return $res;
    }

    public function deleteAction()
    {
    	$this->view->disable();

    	$res = new Response;

    	$id = $this->request->getPost('emp_id');
   		$emp = Employee::findFirst($id);

   		if (! $emp->delete()) {
			$return = array('return' => false, 'msg' => 'Error ! while deleting data');
		} else {
			$return = array('return' => true);
		}

    	$res->setContent( json_encode( $return ) );

   		return $res;
    }

}

