<?php
include'menu.php'
?>
<html>
    <body>
        <div class="rform">
            <form method="post" action="">
            <input type="text" name="naam" id="naam" class="r-naam" placeholder="naam"><br></br>
            <textarea type="text" name="bericht" id="bericht" class="r-msg" placeholder="review"></textarea><br><br>
            <input type="submit" name="knop" id="knop" class="r-knop">
            </form>
        </div>    
    </body>        
</html>

<?php
  include "connectpdo.php";

  if(isset($_POST['knop'])) {
    $name = $_POST['naam'];
    $review = $_POST['bericht'];
    $datetime = date("Y-m-d H:i:s"); // current date and time

    try {
      $stmt = $conn->prepare("INSERT INTO reviews (name, review, datetime) 
      VALUES (:name, :review, :datetime)");
     $stmt->bindParam(':name', $name);
     $stmt->bindParam(':review', $review);
     $stmt->bindParam(':datetime', $datetime);
  
  
      // Define the $datumtijd variable
      $datetime = date('Y-m-d H:i:s');
  
      $stmt->execute();
      header('location: review.php');
  } catch(PDOException $e) {
      echo "Error: " . $e->getMessage();
  }
  }

  $sqlSelect = "SELECT * FROM reviews ";
  $data = $conn->query($sqlSelect);

  foreach ($data as $row) {
    echo $row['Id'] . " ";
    echo $row['datetime'] . " ";
    echo $row['name'] . " ";
    echo $row['review'] . " ";
    echo "<a href='VerwijderBericht.php?id=" . $row['Id'] . "'>Verwijderen</a>";
    echo "<br/>";
  }
?>