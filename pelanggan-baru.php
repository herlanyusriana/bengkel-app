<?php
include_once 'header.php';
if($_POST){
	
	include_once 'includes/pelanggan.inc.php';
	$eks = new Pelanggan($db);

	$eks->nama = $_POST['nama'];
	$eks->jk = $_POST['jk'];
	$eks->alamat = $_POST['alamat'];
	$eks->tgl = $_POST['tgl'];
	$eks->telp = $_POST['telp'];
	$eks->jenis = $_POST['jenis'];
    $eks->nopol = $_POST['nopol'];
	
	if($eks->insert()){
?>
<script type="text/javascript">
window.onload=function(){
	showStickySuccessToast();
};
</script>
<?php
	}
	
	else{
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
			  <li><a href="pelanggan.php"><span class="fa fa-users"></span> Pelanggan</a></li>
			  <li class="active"><span class="fa fa-users"></span> Tambah Data</li>
			</ol>
		  	<p style="margin-bottom:10px;">
		  		<strong style="font-size:18pt;"><span class="fa fa-cogs"></span> Tambah Data Pelanggan</strong>
		  	</p>
		  	<div class="panel panel-default">
		<div class="panel-body">
			
			    <form method="post">
				  <div class="form-group">
				    <label for="nama">Nama Pelanggan</label>
				    <input type="text" class="form-control" id="nama" name="nama" required>
				  </div>
				<div class="form-group">
				    <label for="jk">Jenis Kelamin</label>
				    <input type="text" class="form-control" id="jk" name="jk" required>
				  </div>
				<div class="form-group">
				    <label for="alamat">Alamat</label>
				    <input type="text" class="form-control" id="alamat" name="alamat" required>
				  </div>
				  <div class="form-group">
				    <label for="tgl">Tanggal</label>
				    <input type="text" class="form-control" id="tgl" name="tgl" required>
				  </div>
				<div class="form-group">
				    <label for="telp">No Telp</label>
				    <input type="text" class="form-control" id="telp" name="telp" required>
				  </div>
				<div class="form-group">
				    <label for="jenis">Tipe Kendaraan</label>
				    <input type="text" class="form-control" id="jenis" name="jenis" required>
				  </div>
				  <div class="form-group">
				    <label for="nopol">No Pol</label>
				    <input type="text" class="form-control" id="nopol" name="nopol" required>
				  </div>
				  </div>
				  <button type="submit" class="btn btn-primary"><span class="fa fa-save"></span> Simpan</button>
				  <button type="button" onclick="location.href='pelanggan.php'" class="btn btn-success"><span class="fa fa-history"></span> Kembali</button>
				</form>
				</div>
				</div>
			  
		  </div>
		</div>
		<?php
include_once 'footer.php';
?>