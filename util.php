<?php
require_once 'mysql.php';

class Util {
	
	private $productsForCollectionsList;
	
	private function getProd ( $colID ) { // Получаем товары определенной коллекции
		$connect = DB::connect();
		$products = array ();
		$res = $connect->query("SELECT `ID`, `NAME`, `PRICE` FROM `prod_products` WHERE `KEYCOL` = ".$colID."");
		while ( $row = $res->fetch_assoc() ) { $products[] = $row; }
		return $products;
		$connect->close();
	}
	
	private function getProductsForCollectionsList () { // Получаем список товаров разбитый по коллекциям
		$connect = DB::connect();
		$returnedArray = array ();
		$collectionsArray = $connect->query("SELECT * FROM `prod_collections`");
		while ( $collection = $collectionsArray->fetch_assoc() ) { $returnedArray[$collection['COLLECTION']] = $this->getProd ( $collection['ID'] ); }
		return $returnedArray;
		$connect->close();
	}
	
	public function getCollectionFromId ( $id ) { // Получение коллекции по id
		$connect = DB::connect();
		$res = $connect->query("SELECT * FROM `prod_collections` WHERE `ID` = ".$id."");
		while ( $row = $res->fetch_assoc() ) {
			$connect->close();
			return $row;
		}
	}
	
	public function getProductFromId ( $id ) { // Получение товара по id
		$connect = DB::connect();
		$res = $connect->query("SELECT * FROM `prod_products` WHERE `ID` = ".$id."");
		while ( $row = $res->fetch_assoc() ) {
			$collection = $this->getCollectionFromId ( $row["KEYCOL"] );
			$row["COLLECTION"] = $collection["COLLECTION"];
			$connect->close();
			return $row;
		}
	}
	
	public function getProducts () { return $this->$productsForCollectionsList; }
	
	function __construct () { $this->$productsForCollectionsList = $this->getProductsForCollectionsList(); }
	
	function __destruct () { unset ( $this->$productsForCollectionsList ); }

	public function showProducts($products) {
		$counter = 1;
		foreach ($products as $key => $value) {
			if ($counter % 3 === 0) {
				echo "<div class='clearfix'></div>";
				$counter = 1;
			}
			echo "<div class='col'>
					<div class='card collection'>
						<div class='card-body'>
							<h5 class='card-title'>$key</h5>
							<p class='card-text'></p>
						</div>
					</div>
					</div>";
					$counter++;
			foreach($value as $item => $properties) {
				echo "<div class='col'>
					<div class='card collection'>
						<div class='card-body'>
							<h5><a class='card-title' href='./item-card.php?id=".$properties['ID']."'>".$properties['NAME']."</a></h5>
							<p class='card-text'>".$properties['PRICE']."</p>
						</div>
					</div>
					</div>";
					$counter++;
			}
		}
	}
}
?>