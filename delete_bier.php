<?php
    include'menu.php';
    echo "<h1>Delete Bier</h1>";
    require_once('functions.php');

  
    

    if(isset($_POST) && isset($_POST['btn_wzg'])){
        DeleteBier($_POST);

        header('Location: voorraad.php');
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
            id:<input type="" name="id" value="<?php echo $row['id'];?>" readonly><br>

            Name:<input type="" name="naam" value="<?php echo $row['name'];?>" readonly><br> 

            image: <input type="text" name="soort" value="<?= $row['description']?>" readonly><br>

            price: <input type="text" name="stijl" value="<?= $row['price']?>" readonly><br>

            image: <input type="text" name="alcohol" value="<?= $row['image']?>" readonly><br>

            
            <input type="submit" name="btn_wzg" value="Delete"><br>
        </form>
    </body>
</html>
