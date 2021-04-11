<?php
include_once 'header.php';
if($_POST){
	
	include_once 'includes/mekanik.inc.php';
	$eks = new Mekanik($db);

	$eks->nama_mekanik = $_POST['nama_mekanik'];
	$eks->umur = $_POST['umur'];

	
	if($eks->insert()){
?>
<script type="text/javascript">
window.onload=function(){
	showStickySuccessToast();
	setTimeout(function(){
		window.location.href = "mekanik.php";

	}, 1000); 
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
			  <li><a href="mekanik.php"><span class="fa fa-users"></span> Mekanik</a></li>
			  <li class="active"><span class="fa fa-clone"></span> Tambah Data</li>
			</ol>
		  	<p style="margin-bottom:10px;">
		  		<strong style="font-size:18pt;"><span class="fa fa-clone"></span> Tambah Data Mekanik</strong>
		  	</p>
		  	<div class="panel panel-default">
		<div class="panel-body">
			
			    <form method="post">
				  <div class="form-group">
				    <label for="nama_mekanik">Nama Mekanik</label>
				    <input type="text" class="form-control" id="nama_mekanik" name="nama_mekanik" required>
				  </div>
				  <div class="form-group">
				    <label for="umur"> Umur</label>
				    <input type="text" class="form-control" id="umur" name="umur" required>
				  </div>
			
				<input type="hidden" id="tgllk" value="" name="tgllk"/>
				  </div>
				  <button type="submit" class="btn btn-success"><span class="fa fa-save"></span> Simpan</button>
				  <button type="button" onclick="location.href='mekanik.php'" class="btn btn-info"><span class="fa fa-history"></span> Kembali</button>
				</form>
				</div>
				</div>
			  
		  </div>
		</div>
		<?php
include_once 'footer.php';
?>