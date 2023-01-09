<?php

header("Access-Control-Allow-Origin:*");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include "../../database/database.php";

$data = json_decode(file_get_contents("php://input"));
$isibarang = $data->isi_barang;
$tujuan = $data->tujuan;
$id = $data->id;

$hasil["success"] = false;
$hasil["data"] = array();

$update_sql = "UPDATE pengiriman SET isi_barang='$isibarang', tujuan='$tujuan' where id=$id";
$result = mysqli_query($connection,$update_sql);
if($result){
    $hasil["success"] = true;
    $hasil["data"] = $data;
}

echo json_encode($hasil);

?>