<?php
class Pelanggan{
  
  private $conn;
  private $table_name = "213_pelanggan";
  
  public $id;
  public $nama;
  public $jk;
  public $alamat;
  public $tgl;
  public $telp;
  public $jenis;
  public $nopol;


  
  public function __construct($db){
    $this->conn = $db;
  }
  
  
 function insert(){
    
    $query = "insert into ".$this->table_name." values('',?,?,?,?,?,?,?)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(1, $this->nama);
    $stmt->bindParam(2, $this->jk);
     $stmt->bindParam(3, $this->alamat);
     $stmt->bindParam(4, $this->tgl);
    $stmt->bindParam(5, $this->telp);
     $stmt->bindParam(6, $this->jenis);
     $stmt->bindParam(7, $this->nopol);
    
    if($stmt->execute()){
      return true;
    }else{
      return false;
    }
    
  }
  
  function readAll(){

    $query = "SELECT * FROM ".$this->table_name." ORDER BY id_pelanggan ASC";
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    
    return $stmt;
  }
  
  // used when filling up the update product form
  function readOne(){
    
    $query = "SELECT * FROM " . $this->table_name . " WHERE id_pelanggan=? LIMIT 0,1";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(1, $this->id);
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
    $this->id = $row['id_pelanggan'];
    $this->nama = $row['nama'];
    $this->jk = $row['jk'];
    $this->alamat = $row['alamat'];
    $this->tgl = $row['tgl'];
    $this->telp = $row['telp'];
    $this->jenis = $row['jenis'];
    $this->nopol = $row['nopol'];

  }
  
  // update the product
  function update(){

    $query = "UPDATE 
          " . $this->table_name . " 
        SET 
          nama = :nama,
          jk = :jk,
          alamat = :alamat,
          tgl = :tgl,
          telp = :telp,
          jenis = :jenis,
          nopol = :nopol

        WHERE
          id_pelanggan = :id";

    $stmt = $this->conn->prepare($query);

    $stmt->bindParam(':nama', $this->nama);
    $stmt->bindParam(':jk', $this->jk);
    $stmt->bindParam(':alamat', $this->alamat);
    $stmt->bindParam(':tgl', $this->tgl);
    $stmt->bindParam(':telp', $this->telp);
    $stmt->bindParam(':jenis', $this->jenis);
    $stmt->bindParam(':nopol', $this->nopol);
    $stmt->bindParam(':id', $this->id);
      
    if($stmt->execute()){
      return true;
    }else{
      return false;
    }
  }
  
  // delete the product
  function delete(){
  
    $query = "DELETE FROM " . $this->table_name . " WHERE id_pelanggan = ?";
    
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(1, $this->id);

    if($result = $stmt->execute()){
      return true;
    }else{
      return false;
    }
  }
  function countAll(){

    $query = "SELECT * FROM ".$this->table_name." ORDER BY id_pelanggan ASC";
    $stmt = $this->conn->prepare( $query );
    $stmt->execute();
    
    return $stmt->rowCount();
  }
  function hapusell($ax){
  
    $query = "DELETE FROM " . $this->table_name . " WHERE id_pelanggan in $ax";
    
    $stmt = $this->conn->prepare($query);

    if($result = $stmt->execute()){
      return true;
    }else{
      return false;
    }
  }
}
?>