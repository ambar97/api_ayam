<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Admin extends REST_Controller {
    function __construct()
    {
        parent::__construct();
        $this->load->model('M_api');
    }
    //indexGet
    function index_get(){
        if ($this->get('admin')=="getGejala") {
            $this->db->get_where()->result();
                $this->response($data, REST_Controller::HTTP_OK);
            }
        else if ($this->get('admin')=="deleteGejala") {
            $rr = $this->M_api->hapus_data('gejala',array('id_gejala'=>$this->get('id_gejala')));
            $this->M_api->hapus_data('rule',array('id_gejala'=>$this->get('id_gejala'),'id_penyakit'=>$this->get('id_p')));
            $this->response(['hasil'=>'ok','alert'=>'Data Berhasil Di Hapus'], REST_Controller::HTTP_OK);
            
            // $this->response("Sukses Di hapus", REST_Controller::HTTP_OK);
        }
    }

    //indexPost
    function index_post(){
            $bobot = $this->post('bobot');
            $gejala = $this->post('nama_gejala');
            $id_penyakit = $this->post('id');
            $ert = $this->db->insert('gejala',array('nama_gejala'=>$gejala));
            if ($ert) {
                $save = $this->db->insert_id();
                $cek = $this->db->insert('rule',array('id_gejala'=>$save,'id_penyakit'=>$id_penyakit,'bobot_pakar'=>$bobot));
                if ($cek) {
                    $hasil = 'sukses';
                }else{
                    $hasil = 'gagal';
                }
            }else{
                $hasil='insert gejala gagal';
            }
            $this->response(['hasil'=>$hasil], REST_Controller::HTTP_OK);
        
    }
}
