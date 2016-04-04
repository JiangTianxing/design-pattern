<?php
//基本搞不懂它的内涵吧，无奈啊
//菜单类	
	class MenuItem {
		public $name;
		public $description;
		public $vegetarian;
		public $price;

		function __construct($name, $description, $vegetarian, $price) {
			$this->name = $name;
			$this->description = $description;
			$this->vegetarian = $vegetarian;
			$this->price = $price;
		}

		public function getName() {
			return $this->name;
		}
		public function getDescription() {
			return $this->description;
		}
		public function getPrice() {
			return $this->price;
		}
		public function isVegetarian() {
			return $this->vegetarian;
		}
	}
//午餐菜单迭代器类
	class DinerMenuIterator implements Iterator {
		public $array;
		public $position = 0;

		public function __construct($item) {
			$this->array = $item;
		}

		function rewind() {
	         $this->position = 0;
	    }

	    function current() {
	        return $this->array[$this->position];
	    }

	    function key() {
	        return $this->position ;
	    }

	    function next() {
	        ++$this->position ;
	    }

	    function valid() {
	        return isset($this->array[$this->position]);
	    }
	}
//午餐菜单类
	class DinerMenu {
		public $numberOfItems = 0;
		public $menuItems = array();

		public function __construct() {
			$this->addItem('Vegetarian BLT', "(Fakin') Bacon with lettuce & tomato om whole wheat", true, 2.99);
		}

		public function addItem($name, $description,  $vegetarian, $price) {
			$this->menuItems[] = new MenuItem($name, $description, $vegetarian, $price);
		}

		// public function getMenuItems() {
		// 	return $this->menuItems;
		// }
		public function creatIterator() {
			return new DinerMenuIterator($this->menuItems);
		}
	}
//服务员类
	class Waitress {
		public $dinerMenu;

		public function __construct($dinerMenu) {
			$this->dinerMenu = $dinerMenu;
		}

		public function printMenu() {
			$dinerIterator = $this->dinerMenu->creatIterator();
			// while($dinerIterator->valid()) {
			// 	$infor = $dinerIterator->current();
			// 	$dinerIterator->next();
			// }
			var_dump($dinerIterator);
			while ($dinerIterator->valid()) {
				echo "<br/>";
				var_dump($dinerIterator->current());
				$dinerIterator->next();
			}
		}
	}

	$dinerMenu = new DinerMenu();
	$waitress = new Waitress($dinerMenu);
	$waitress->printMenu();

	