<?php
class keluhan{
  
  private $conn;
  private $table_name = "213_keluhan";
  
  public $id;
  public $nama;
  public $keluhan;



  
  public function __construct($db){
    $this->conn = $db;
  }
  
  
  function insert(){
    
    $query = "insert into ".$this->table_name." values('',?,?,?)";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(1, $this->nama);
    $stmt->bindParam(2, $this->keluhan);	
	
    
    if($stmt->execute()){
      return true;
    }
	else{
      return false;
    }
  
  }

  	function readAll(){

		$query = "SELECT * FROM ".$this->table_name." ORDER BY id_keluhan ASC";
		$stmt = $this->conn->prepare( $query );
		$stmt->execute();
		
		return $stmt;
	}
	
	function countAll(){

		$query = "SELECT * FROM ".$this->table_name;
		$stmt = $this->conn->prepare( $query );
		$stmt->execute();
		
		return $stmt->rowCount();
	}
  
  function readOne(){
    
    $query = "SELECT * FROM ".$this->table_name." WHERE id_keluhan=? LIMIT 0,1";

    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(1, $this->id);
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
    $this->id = $row['id_keluhan'];
    $this->nama = $row['nama'];
    $this->keluhan = $row['keluhan'];

  }
  
  // update the product
  function update(){

    $query = "UPDATE 
			" . $this->table_name . " 
        SET  
          nama = :nama,
		  keluhan	 = :keluhan
	
    
        WHERE
          id_keluhan = :id";

    $stmt = $this->conn->prepare($query);

    $stmt->bindParam(':nama', $this->nama);
	$stmt->bindParam(':keluhan', $this->keluhan);
    $stmt->bindParam(':id', $this->id);

    
    // execute the query
    if($stmt->execute()){
      return true;
    }else{
      return false;
    }
  }
  
  // delete the product
  function delete(){
  
    $query = "DELETE FROM " . $this->table_name . " WHERE id_keluhan = ?";
    
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(1, $this->id);

    if($result = $stmt->execute()){
      return true;
    }else{
      return false;
    }
  }
  function hapusell($ax){
  
    $query = "DELETE FROM " . $this->table_name . " WHERE id_keluhan in $ax";
    
    $stmt = $this->conn->prepare($query);

    if($result = $stmt->execute()){
      return true;
    }else{
      return false;
    }
  }
}
?>