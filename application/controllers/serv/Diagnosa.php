<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Diagnosa extends REST_Controller {
    function __construct()
    {
        parent::__construct();
        $this->load->model('M_api');
    }
    //indexGet
    function index_get(){
        if ($this->get('serv')=="getDataDiagnosa") {
            $data_get = $this->M_api->getSoal($this->get('id_penyakit'));
            if ($data_get) {
                $data = array("data" => $data_get
            );
                $this->response($data, REST_Controller::HTTP_OK);
            }
        } 
    }

    //indexPost
    function index_post(){
            // $this->response(['hasila'=>"hello"], REST_Controller::HTTP_OK);
            $jsonCFuser = json_decode($this->post("cf"),true);
            $id_penyakit = $this->post("id_penyakit");

            $cfuser = array();
            $cfpakar = array();
            $cfhe = array();
        //ambildatacfuser
            foreach ($jsonCFuser as $nilai => $cfUserAndro) {
                array_push($cfuser, $cfUserAndro);
            }
        //selectgejalawherepenyakit
            $gejala = $this->db->get_where('rule',array("id_penyakit"=>$id_penyakit))->result();
        // ambildatacfpakar
            foreach ($gejala as $cfpakardb) {
                array_push($cfpakar, $cfpakardb->bobot_pakar);
            }
            //hitung cfhe
            for ($i=0; $i <count($cfuser) ; $i++) { 
                $hitungcfhe = $cfuser[$i] * $cfpakar[$i];
                array_push($cfhe, $hitungcfhe);
            }
            //combine
            $old = 0;
            for ($i=0; $i <count($cfhe) ; $i++) { 
                if ($i == 0) {
                $comb = $cfhe[$i]+$cfhe[$i+1] *(1-$cfhe[$i]);
                $old = $comb;
                }
                else if($i < count($cfhe)) {
                    $combb = $old+$cfhe[$i] * (1-$old);
                    $old = $combb;
                }else{
                    $combb = $old+$cfhe[$i+1] * (1-$old);
                    $old = $combb;
                }
            }
            $kirim = $old*100;
            $hasil = number_format($kirim,2);
            $penyakit = $this->db->get_where('penyakit',array('id_penyakit'=>$id_penyakit))->row_array();

            $this->response(['cfpakar'=>$cfpakar, 'cfuser'=>$cfuser, 'cfhe'=>$cfhe,'hasil'=>$hasil,'penyakit'=>$penyakit], REST_Controller::HTTP_OK);
    }
}
