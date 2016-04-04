<?php 
// 单例类构造
// 1.构造函数修饰符必须为私有，不可在外部实例化
// 2.单例类必须存在一个静态变量，用以指向单例类的唯一实例
// 3.必须存在一个修饰符为公有且为静态的函数，能在外部直接静态使用，函数返回单例类的唯一实例，若单例类无实例则此函数调动构造函数再返回实例

// 单例类使用情况
// 1.当类只能有一个实例而且客户可以从一个众所周知的访问点访问它时
// 2.当这个唯一实例应该是通过子类化可扩展的。并且用户应该无需更改代码就能使用一个扩展的实例时
	class Singleton {
		private static $instance = null;

		private function __construct() {
		}

		public static function getInstance() {
			if (is_null(self::$instance)) {
				self::$instance = new Singleton();
			}
			return self::$instance;
		}

		public function test() {
			echo "this is a singleton!";
		}
	}

	class Test {
		public static function main() {
			$instance = Singleton::getInstance();
			$instance->test();
		}
	}

	$test = Test::main();
?>