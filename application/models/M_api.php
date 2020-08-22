<?php

if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class M_api extends CI_Model
{

  function __construct()
  {
    parent::__construct();
  }

  function getSoal($penyakit){
    $this->db->select('penyakit.*,gejala.*,rule.*');
    $this->db->join('penyakit', 'penyakit.id_penyakit = rule.id_penyakit','RIGHT');
    $this->db->join('gejala', 'gejala.id_gejala = rule.id_gejala','LEFT');
    $this->db->where('rule.id_penyakit',$penyakit);
    return $this->db->get('rule')->result();
  }
  function getHasil($array){
    $this->db->select('penyakit.*,data_solusi.*');
    $this->db->join('data_solusi','penyakit.id_solusi = data_solusi.id_solusi');
    $this->db->where_in('penyakit.id_penyakit',$array);
    return $this->db->get('penyakit')->result();
  }
  public function get_hasil_diagnosa($id_penyakit){
    $this->db->select('penyakit.*,data_solusi.*');
    $this->db->join('data_solusi', 'penyakit.id_solusi = data_solusi.id_solusi');
    $this->db->where('penyakit.id_penyakit', $id_penyakit);
    return $this->db->get('penyakit')->result();
  }

}
