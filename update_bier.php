<?php
    include 'menu.php';
    echo "<h1>Update Bier</h1>";
    require_once('functions.php');

    // Test of er op de wijzig-knop is gedrukt 
    if(isset($_POST) && isset($_POST['btn_wzg'])){
        UpdateBier($_POST);

        header("location: voorraad.php");
    }

    if(isset($_GET['id'])){  
        echo "Data uit het vorige formulier:<br>";
        // Haal alle info van de betreffende biercode $_GET['biercode']
        $id = $_GET['id'];
        $row = Getproducts($id);
    }
   ?>

<html>
    <body>
        <form method="post">
        <br>
        Id:<input type="" name="id" value="<?php echo $row['id'];?>"><br>
        Name:<input type="" name="naam" value="<?php echo $row['name'];?>"><br> 
        description: <input type="text" name="soort" value="<?= $row['description']?>"><br>
        price: <input type="text" name="stijl" value="<?= $row['price']?>"><br>
        image: <input type="text" name="alcohol" value="<?= $row['image']?>"><br>
         <input type="submit" name="btn_wzg" value="Wijzigen"><br>
        </form>
    </body>
</html>