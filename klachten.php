<?php
include'menu.php'
?>
<html>
    <body>
        <div class="kform">
            <form method="post" action="">
            <input type="text" name="naam" id="naam" placeholder="naam" class="k-naam"><br></br>
            <textarea type="text" name="bericht" id="bericht" placeholder="klacht" class="k-msg"></textarea><br><br>
            <input type="submit" name="knop" id="knop" class="k-knop">
            </form>
        </div>
    </body>
</html>

<?php
  include "connectpdo.php";

  if(isset($_POST['knop'])) {
    $naam = $_POST['naam'];
    $bericht = $_POST['bericht'];
    $datumtijd = date("Y-m-d H:i:s"); // current date and time

    try {
      $stmt = $conn->prepare("INSERT INTO klachten (naam, bericht, datumtijd) 
      VALUES (:naam, :bericht, :datumtijd)");
     $stmt->bindParam(':naam', $naam);
     $stmt->bindParam(':bericht', $bericht);
     $stmt->bindParam(':datumtijd', $datumtijd);
  
  
      // Define the $datumtijd variable
      $datumtijd = date('Y-m-d H:i:s');
  
      $stmt->execute();
      header('location: klachten.php');
  } catch(PDOException $e) {
      echo "Error: " . $e->getMessage();
  }
  }

  $sqlSelect = "SELECT * FROM klachten";
  $data = $conn->query($sqlSelect);

  foreach ($data as $row) {
    echo $row['datumtijd'] . " ";
    echo $row['naam'] . " ";
    echo $row['bericht'] . " ";
    echo "<a href='deletemsg.php?id=" . $row['id'] . "'>Verwijderen</a>";
    echo "<br/>";
  }
?>