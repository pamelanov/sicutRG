<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Template extends CI_Controller {

    function __construct() {
        parent::__construct();

        $this->load->model('', true);
    }

    public function index() {
        $data['judul'] = "Halaman Depan";
        $data['main'] = "home/home";
        $this->load->view('home/template', $data);
    }

    public function contact() {
        $data['judul'] = "Contact Us";
        $data['main'] = "home/contact";
        $this->load->view('home/template', $data);
    }

    public function about() {
        $data['judul'] = "About Us";
        $data['main'] = "home/about";
        $this->load->view('home/template', $data);
    }

    public function login() {
        $data['judul'] = "Halaman Login";
        $data['main'] = "home/login";
        $this->load->view('home/template', $data);
    }

    function ceklogin() {
        $this->load->library('encrypt');
        if ($this->input->post('username')) {
            $u = $this->input->post('username');
            $pw = $this->input->post('password');
            $row = $this->madmins->verifyUser($u, $pw);
            if (count($row)) {
                $_SESSION['userid'] = $row['id'];
                $_SESSION['role'] = 1;
                redirect('admin/dashboard', 'refresh');
            } else {
                $this->session->set_flashdata('result', 'maap username atau password Anda salah!');
                redirect('template/login', 'refresh');
            }
        } else {
            $this->session->set_flashdata('result', 'Isi Username dan password dulu!');
            redirect('template/login', 'refresh');
        }
    }

    function logout() {
        $sesi_items = array('user' => '');
        $this->session->unset_userdata($sesi_items);
        $this->session->set_flashdata('result', 'Log out sukses');
        header('location:' . base_url() . 'index.php/template/login');
    }

}

?>