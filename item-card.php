<?php
require_once 'util.php';
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Карточка товара</title>
</head>
<body>
    <?php
        $util = new Util();
        $product = $util->getProductFromId($_GET['id']);
        print("<h1>Название: {$product['NAME']}</h1><br><h1>Цена: {$product['PRICE']}</h1><br><h1>Коллекция: {$product['COLLECTION']}</h1>");
        print_r("<a href='./'>На главную</a>");
    ?>
</body>
</html>