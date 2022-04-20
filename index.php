<?php
	require_once 'util.php';
?>
<!DOCTYPE HTML>
<html lang="ru">
	<head>
		  <meta charset="utf-8"/> 
		  <title>Товары</title>
  		  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		  <link rel="stylesheet" href="style.css">
	</head>
	<body>
		<?php 
			$result = new Util();
			$res = $result->getProducts();
		?>

<div class="container">
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<?php 
			$result = new Util();
			$res = $result->getProducts();
			// echo '<pre>',print_r($res,1),'</pre>';
			$result->showProducts($res);
		?>
	</div>
</div>
</body>
</html>