<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Employee extends \Phalcon\Mvc\Model
{
    public $emp_id;
    public $emp_fullname;
    public $emp_nickname;
    public $emp_email;
}
