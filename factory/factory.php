<?php
// 工厂类
// 1.构造函数修饰符必须为私有，不可在外部实例化
// 2.工厂类必须存在一个静态变量，用以保存所需的工具类对象
// 3.除构造函数外全部为共有的静态函数，无需实例化类而直接静态调用

// 工厂类使用情况
// 1.当类只能有一个实例而且客户可以从一个众所周知的访问点访问它时
// 2.当这个唯一实例应该是通过子类化可扩展的。并且用户应该无需更改代码就能使用一个扩展的实例时
require_once('mysql.class.php');
require_once('config.php');
class DB {

	public static $db = null;

	private static function __construct() {
	}

	public static function init($dbtype, $config) {
		if (is_null(self::$db)) {
			self::$db = new $dbtype;
			self::$db->connect($config);	
		}
	}

	public static function query($sql){
		self::init();
		return self::$db->query($sql);
	}

	public static function findAll($sql){
		self::init();
		$query = self::$db->query($sql);
		return self::$db->findAll($query);
	}

	public static function findOne($sql){
		self::init();
		$query = self::$db->query($sql);
		return self::$db->findOne($query);
	}

	public static function getNum($sql){
		self::init();
		$query = self::$db->query($sql);
		return self::$db->getNum($sql);
	}
	
	public static function findResult($sql, $row = 0, $filed = 0){
		self::init();
		$query = self::$db->query($sql);
		return self::$db->findResult($query, $row, $filed);
	}

	public static function insert($table,$arr){
		self::init();
		return self::$db->insert($table,$arr);
	}

	public static function update($table, $arr, $where){
		self::init();
		return self::$db->update($table, $arr, $where);
	}

	public static function del($table,$where){
		self::init();
		return self::$db->del($table,$where);
	}

}

?>