<?php
include_once 'header.php';
$id = isset($_GET['id']) ? $_GET['id'] : die('ERROR: missing ID.');

include_once 'includes/pelanggan.inc.php';
$eks = new Pelanggan($db);

$eks->id = $id;

$eks->readOne();

if($_POST){

	$eks->nama = $_POST['nama'];
	$eks->jk = $_POST['jk'];
	$eks->alamat = $_POST['alamat'];
	$eks->tgl = $_POST['tgl'];
	$eks->telp = $_POST['telp'];
	$eks->jenis = $_POST['jenis'];
	$eks->nopol = $_POST['nopol'];



	
	if($eks->update()){
		echo "<script>location.href='pelanggan.php'</script>";
	} else{
?>
<script type="text/javascript">
window.onload=function(){
	showStickyErrorToast();
};
</script>
<?php
	}
}
?>
		<div class="row">

		  <div class="col-xs-12 col-sm-12 col-md-2">
			<?php
			include_once 'sidebar.php';
			?>
		  </div>
		  <div class="col-xs-12 col-sm-12 col-md-10">
		  <ol class="breadcrumb">
			  <li><a href="index.php"><span class="fa fa-home"></span> Beranda</a></li>
			  <li><a href="pelanggan.php"><span class="fa fa-users"></span> Data Pelanggan</a></li>
			  <li class="active"><span class="fa fa-pencil"></span> Ubah Data</li>
			</ol>
		  	<p style="margin-bottom:10px;">
		  		<strong style="font-size:18pt;"><span class="fa fa-pencil"></span> Ubah Data Pelanggan</strong>
		  	</p>
		  	<div class="panel panel-default">
		<div class="panel-body">
			
			    <form method="post">
			    	
				  <div class="form-group">
				    <label for="nama">Nama Pelanggan</label>
				    <input type="text" class="form-control" id="nama" name="nama" value="<?php echo $eks->nama; ?>">
				  </div>
				  <div class="form-group">
				    <label for="jk">Jenis Kelamin</label>
				    <input type="text" class="form-control" id="jk" name="jk" value="<?php echo $eks->jk; ?>">
				  </div>
				  <div class="form-group">
				    <label for="alamat">Alamat</label>
				    <input type="text" class="form-control" id="alamat" name="alamat" value="<?php echo $eks->alamat; ?>">
				  </div>
				  <div class="form-group">
				    <label for="tgl">Tanggal</label>
				    <input type="text" class="form-control" id="tgl" name="tgl" value="<?php echo $eks->tgl; ?>">
				  </div>
				  <div class="form-group">
				    <label for="telp">No Telp</label>
				    <input type="text" class="form-control" id="telp" name="telp" value="<?php echo $eks->telp; ?>">
				  </div>
				  <div class="form-group">
				    <label for="jenis">Tipe Kendaraan</label>
				    <input type="text" class="form-control" id="jenis" name="jenis" value="<?php echo $eks->jenis; ?>">
				  </div>
				  <div class="form-group">
				    <label for="nopol">No Pol</label>
				    <input type="text" class="form-control" id="nopol" name="nopol" value="<?php echo $eks->nopol; ?>">
				  </div>
				
				  <button type="submit" class="btn btn-warning"><span class="fa fa-edit"></span> Ubah</button>
				  <button type="button" onclick="location.href='sparepart.php'" class="btn btn-success"><span class="fa fa-history"></span> Kembali</button>
				</form>
			  
		  </div></div></div>
		  <div class="col-xs-12 col-sm-12 col-md-2">
		  </div>
		</div>
		<?php
include_once 'footer.php';
?>