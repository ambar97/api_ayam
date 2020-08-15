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
        else if ($this->get('service')=="hasilDiagnosa") {
            $row = $this->M_api->get_hasil_diagnosa($this->get('penyakit'));
            if ($row) {
                $data = array("data" => $row
            );
                $this->response($data, REST_Controller::HTTP_OK);
            }
        }
    }

    //indexPost
    function index_post(){
        $jsonPenyakit =json_decode($this->post("data"),true);

        $tempAndro = array();
        $tempDb = array();
        $penyakit = array();
        $hasil = array();
        $data_kosong = array();

        foreach ($jsonPenyakit as $variable => $idPenyakit) {
            array_push($penyakit, $idPenyakit);
        }

        $cek_data_sama = array_count_values($penyakit);
        foreach($cek_data_sama as $x => $x_value) {
            $rr = array('id_p'=>$x,'jml'=>$x_value);
            array_push($tempAndro, $rr);
        } 

        $jumlah_p_from_db = $this->db->get('data_penyakit')->result();
        foreach ($jumlah_p_from_db as $key) {
            $hitung = $this->db->get_where('data_aturan',array('id_penyakit'=>$key->id_penyakit))->num_rows();
            $kirim = array('id_penyakit'=>$key->id_penyakit,'jumlah'=>$hitung);
            array_push($tempDb, $kirim);
        }
        //bandingkanjumlahData

        for ($i=0; $i < count($tempDb) ; $i++) { 
            for ($j=0; $j < count($tempAndro) ; $j++) { 
                if ($tempDb[$i]['id_penyakit'] == $tempAndro[$j]['id_p']) {
                    if ($tempDb[$i]['jumlah'] == $tempAndro[$j]['jml']) {
                        array_push($hasil, $tempDb[$i]['id_penyakit']);
                    }
                    else{
                        array_push($data_kosong, 1);
                    }
                }
            }
        }
        if (count($data_kosong) != count($tempDb)) {
           $result_data = $this->M_api->getHasil($hasil);   
       }else{
        $result_data=array();
    }
    $this->response(['hasila'=>$penyakit,'andro'=>$hasil,'temp'=>$tempAndro,'hasil'=>$result_data], REST_Controller::HTTP_OK);
}
}
