<?php 
include "connectpdo.php";

if(isset($_GET['grow']))
{
  $grow = $_GET['grow'];
  echo "$grow";

  try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);

    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "DELETE FROM klachten WHERE grow=:grow";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':grow', $grow);
    $stmt->execute();
    echo "Record deleted successfully";
    header('Location: klachten.php');
  }
  catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
  }
  $conn = null;
}
?>