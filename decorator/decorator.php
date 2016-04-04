<?php
    abstract class Beverage {
        public $description = 'Unknown Beverage';

        public abstract function cost();

        public function getDescription() {
            return $this->description;
        } 
    }

    abstract class CondimentDecrator extends Beverage{}
    //真心不知道这个有啥用

    class HouseBlend extends Beverage{
        public function __construct() {
            $this->description = 'House Blend';
        }

        public function cost() {
            return 18;
        }
    }

    class Espresso extends CondimentDecrator {
        public $beverage;

        public function __construct($beverage) {
            $this->beverage = $beverage;
        }

        public function getDescription() {
            return $this->beverage->getDescription().',Espresso';
        }

        public function cost() {
            return $this->beverage->cost()+10;
        }
    }

    $houseblend = new HouseBlend();
    $espresso = new Espresso($houseblend);
    echo $espresso->cost();
    echo "<br/>";
    echo $espresso->getDescription();
?>