<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class GetData extends REST_Controller {
	function __construct()
	{
		parent::__construct();
	}
	function index_get(){
		if ($this->get('service')=="gejala") {
			$get = $this->db->get('gejala')->result();
				$data = array(
					"data"     => $get
				);
				$this->response($data, REST_Controller::HTTP_OK);   
			
		}
		else if ($this->get('service')=="penyakit") {
			$get = $this->db->get('penyakit')->result();
				$data = array(
					"data"     => $get
				);
				$this->response($data, REST_Controller::HTTP_OK);   
		}
	}
}