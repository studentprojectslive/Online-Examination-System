<?php
error_reporting(E_ALL & ~E_NOTICE  &  ~E_STRICT & ~E_WARNING);
if(!isset($_SESSION)) 
{ 
    session_start(); 
}
$dttim= date("Y-m-d H:i:s");
$dt= date("Y-m-d");
$tim= date("H:i:s");
$con=mysqli_connect("localhost","root","","onlineexamination");
echo  mysqli_connect_error();
?>