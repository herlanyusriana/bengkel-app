<?php
session_start();
if(!isset($_SESSION['nama_pengguna'])){
	echo "<script>location.href='login.php'</script>";
}
 // Define relative path from this script to mPDF
 
 $nama_dokumen='Data Service '; //Beri nama file PDF hasil.
define('_MPDF_PATH','MPDF57/');
include(_MPDF_PATH . "mpdf.php");
$mpdf=new mPDF('utf-8', 'A4'); // Create new mPDF Document
 
//Beginning Buffer to save PHP variables and HTML tags
ob_start(); 
?>
<!--sekarang Tinggal Codeing seperti biasanya. HTML, CSS, PHP tidak masalah.-->
<!--CONTOH Code START-->
<?php
 //KONEKSI
$host="localhost"; //isi dengan host anda. contoh "localhost"
$user="root"; //isi dengan username mysql anda. contoh "root"
$password=""; //isi dengan password mysql anda. jika tidak ada, biarkan kosong.
$database="bengxell";//isi nama database dengan tepat.
mysql_connect($host,$user,$password);
mysql_select_db($database);

$id_pembelian = $_GET['id'];
//  echo $id_pembelian;
?>

<style type="text/css">
h4, p{
	text-align:left;
	font-style:bold;
	font-size:12px
}
h1, h5, h2{
	text-align:center;
	padding-top:inherit;
	
}
table {
   border-collapse:collapse;
   width:100%;
}
 
table, td, th {
   border:1px solid black;
}
 
tbody tr:nth-child(odd) {
   background-color: #ccc;
}
</style>
<h2>Bengkel MOTOR</h2>
<h5>Jl, cirebon raya No.144 (0232)8880558</h5>
<hr>

</tr>
</table>

<?php
$query=mysql_query("SELECT * FROM 213_pembelian JOIN 213_mekanik ON 213_pembelian.id_mekanik=213_mekanik.id_mekanik 
JOIN 213_sparepart ON 213_pembelian.id_sparepart=213_sparepart.id_sparepart 
JOIN 213_pelanggan ON 213_pelanggan.id_pelanggan = 213_pembelian.id_pelanggan
where 213_pembelian.id_pembelian = $id_pembelian
ORDER BY id_pembelian ASC");
$nm_pelanggan = mysql_fetch_array($query);
$service + mysql_fetch_array($query);
// print($nm_pelanggan['nama']);
?>

<h4> Surat Perintah Kerja  dengan ( No Service: <?php echo $nm_pelanggan['id_pembelian'] ?> )</h4>
<p align="left">Nama Kasir: <?php echo $_SESSION['nama_pengguna'] ?></p>
<p align="left">Tanggal: <?php date_default_timezone_set("Asia/Jakarta"); echo $date = date('Y-m-d |  H:i:s'); ?> </p>
<p align="left">Nama Pelanggan: <?php echo $nm_pelanggan['nama'] ?> </p>

<table >
<thead>
<tr>
<th>Nama Mekanik</td>
<th>Sparepart</td>
<th>Qty</td>
<th>Harga Sparepart</td>
<th>Harga Jasa</td>
<th>Jumlah</td>
<th>Tanggal</td>


</tr>
</thead>
<?php 
$sql=mysql_query("SELECT * FROM 213_pembelian JOIN 213_mekanik ON 213_pembelian.id_mekanik=213_mekanik.id_mekanik 
JOIN 213_sparepart ON 213_pembelian.id_sparepart=213_sparepart.id_sparepart 
JOIN 213_pelanggan ON 213_pelanggan.id_pelanggan = 213_pembelian.id_pelanggan
where 213_pembelian.id_pembelian = $id_pembelian
ORDER BY id_pembelian ASC");
while($data=mysql_fetch_assoc($sql)){
?>
<tbody>
<tr>
<td><?php echo $data['nama_mekanik']?></td>
<td><?php echo $data['sparepart']?></td>
<td><?php echo $data['qty']?></td>
<td><?php echo $data['harga']?></td>
<td><?php echo $data['harga_jasa']?></td>
<td>
<?php 
	$hs= $data['harga'];
	$qt= $data['qty'];
	$hj= $data['harga_jasa'];
	$tot = ($hs * $qt) + $hj;
	echo"$tot";

			
			?>
</td>
<td><?php echo $data['tgl_beli']?></td>
</tr></tbody>';
<?php
}
?>
</table>

<!--CONTOH Code END-->
 
<?php
$html = ob_get_contents(); //Proses untuk mengambil hasil dari OB..
ob_end_clean();
//Here convert the encode for UTF-8, if you prefer the ISO-8859-1 just change for $mpdf->WriteHTML($html);
$mpdf->WriteHTML(utf8_encode($html));
$mpdf->Output($nama_dokumen.".pdf" ,'I');
exit;
?>