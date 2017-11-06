<?php
error_reporting ( E_ALL );
ini_set ( 'display_errors', 1 );
require 'Slim/Slim.php';
require_once 'db/DbOperation.php';

$app = new Slim();

$app->config('debug', true);

$app->get ( '/wines', 'getWines' );
$app->get ( '/wines/:id', 'getWine' );
$app->get ( '/wines/search/:query', 'findByName' );
$app->post ( '/wines', 'addWine' );
$app->put ( '/wines/:id', 'updateWine' );
$app->delete ( '/wines/:id', 'deleteWine' );

$app->get ( '/orders/all', 'getAllOrders' );
$app->post ( '/orders/add', 'addOrder' );
$app->get ( '/orders/upload', 'uploadFiles' );
$app->get ( '/customer/senders', 'getAllSenders' );
$app->get ( '/customer/receivers', 'getAllReceivers' );
$app->post ( '/login/:username/:pass', function ( $name, $pass ) use ( $app ) {
	try {
		// get DB connection
		$db = new DbOperation();
		$user = $db->checkUser ( $name, $pass );
		if ( $user != null ) {
			$id = $user->id;
			/**
			 * TODO:
			 * 1. implement lock after a number of failed login
			 * 2. implement timeout session as:
			 *     Ending a session in 30 minutes from the starting time.
			 *   $_SESSION['expire'] = time() + (30 * 60);
			 *
			 */
			// Update last successful login
			if ( !$db->updateLastLogin ( $id ) ) {
				echo "Can not access the DB. Maybe the system has some problems, Please try again!!!";
			} else {
				// Register $myusername, $mypassword and redirect to file "login_success.php"
				$_SESSION[ "username" ] = $name;
				$_SESSION[ "loggedIn" ] = true;
				$roles = $db->getUserRoles ( $id );
				foreach ( $roles as $role ) {
					$_SESSION[ 'role_id' ] = $role->id;
				}
			}
		} else {
			loginFailed ();
		}
		echo "true";
		return;
	} catch ( Exception $e ) {
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
} );

$app->run ();

function getAllOrders () {
	try {
		// get DB connection
		$db = new DbOperation();
		$orders = $db->getAllOrders ();
		if ( $orders != null ) {
			echo '{"orders":' . json_encode ( $orders ) . '}';
		}else {
			echo '{"error":{"text":' . "Failed to get orders data" . '}}';
		}
	} catch ( Exception $e ) {
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
}

/**
 * Get all senders
 */
function getAllSenders() {
    try {
        // get DB connection
        $db = new DbOperation();
        $customers = $db->getData ('sendcustomers');
        if ( $customers != null ) {
            echo '{"customers":' . json_encode ( $customers ) . '}';
        }else {
            echo '{"error":{"text":' . "Failed to get senders data" . '}}';
        }
    } catch ( Exception $e ) {
        echo '{"error":{"text":' . $e->getMessage () . '}}';
    }
}

/**
 * Get all senders
 */
function getAllReceivers() {
    try {
        // get DB connection
        $db = new DbOperation();
        $customers = $db->getData ('recvcustomers');
        if ( $customers != null ) {
            echo '{"customers":' . json_encode ( $customers ) . '}';
        }else {
            echo '{"error":{"text":' . "Failed to get receivers data" . '}}';
        }
    } catch ( Exception $e ) {
        echo '{"error":{"text":' . $e->getMessage () . '}}';
    }
}

/**
 * TODO: will implement later, til now, use the old one
 * Upload files
 */
function uploadFiles() {

}


function addOrder () {
//	error_log ( 'addOrder\n', 3, '/var/tmp/php.log' );
	$request = Slim::getInstance ()->request ();
	$order = json_decode ( $request->getBody () );
//	$sql = "INSERT INTO wine (name, grapes, country, region, year, description) VALUES (:name, :grapes, :country, :region, :year, :description)";
	try {
		$db = new DbOperation();
		$orderId = $db -> addOrder($order);
//		$stmt = $db->prepare ( $sql );
//		$stmt->bindParam ( "name", $order->name );
//		$stmt->bindParam ( "grapes", $order->grapes );
//		$stmt->bindParam ( "country", $order->country );
//		$stmt->bindParam ( "region", $order->region );
//		$stmt->bindParam ( "year", $order->year );
//		$stmt->bindParam ( "description", $order->description );
//		$stmt->execute ();
//		$order->id = $db->lastInsertId ();
//		$db = null;
//        print_f($order);
//        $order.push("orderId", $orderId);
//        print_f($order);
//		echo json_encode ( $order );
        echo $orderId;
	} catch ( Exception $e ) {
//		error_log ( $e->getMessage (), 3, '/var/tmp/php.log' );
//		echo '{"error":{"text":' . $e->getMessage () . $e.'}}';
        echo '{"errorText":"Add order fail with text as", "text":}' . $e->getMessage () . $e.'}';
	}
}

function getWines () {
	$sql = "select * FROM wine ORDER BY name";
	try {
		$db = getConnection ();
		$stmt = $db->query ( $sql );
		$wines = $stmt->fetchAll ( PDO::FETCH_OBJ );
		$db = null;
		echo '{"wine": ' . json_encode ( $wines ) . '}';
	} catch ( PDOException $e ) {
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
}

function getWine ( $id ) {
	$sql = "SELECT * FROM wine WHERE id=:id";
	try {
		$db = getConnection ();
		$stmt = $db->prepare ( $sql );
		$stmt->bindParam ( "id", $id );
		$stmt->execute ();
		$wine = $stmt->fetchObject ();
		$db = null;
		echo json_encode ( $wine );
	} catch ( PDOException $e ) {
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
}

function addWine () {
	error_log ( 'addWine\n', 3, '/var/tmp/php.log' );
	$request = Slim::getInstance ()->request ();
	$wine = json_decode ( $request->getBody (), true );
	$sql = "INSERT INTO wine (name, grapes, country, region, year, description) VALUES (:name, :grapes, :country, :region, :year, :description)";
	try {
		$db = getConnection ();
		$stmt = $db->prepare ( $sql );
		$stmt->bindParam ( "name", $wine->name );
		$stmt->bindParam ( "grapes", $wine->grapes );
		$stmt->bindParam ( "country", $wine->country );
		$stmt->bindParam ( "region", $wine->region );
		$stmt->bindParam ( "year", $wine->year );
		$stmt->bindParam ( "description", $wine->description );
		$stmt->execute ();
		$wine->id = $db->lastInsertId ();
		$db = null;
		echo json_encode ( $wine );
	} catch ( PDOException $e ) {
		error_log ( $e->getMessage (), 3, '/var/tmp/php.log' );
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
}

function updateWine ( $id ) {
	$request = Slim::getInstance ()->request ();
	$body = $request->getBody ();
	$wine = json_decode ( $body );
	$sql = "UPDATE wine SET name=:name, grapes=:grapes, country=:country, region=:region, year=:year, description=:description WHERE id=:id";
	try {
		$db = getConnection ();
		$stmt = $db->prepare ( $sql );
		$stmt->bindParam ( "name", $wine->name );
		$stmt->bindParam ( "grapes", $wine->grapes );
		$stmt->bindParam ( "country", $wine->country );
		$stmt->bindParam ( "region", $wine->region );
		$stmt->bindParam ( "year", $wine->year );
		$stmt->bindParam ( "description", $wine->description );
		$stmt->bindParam ( "id", $id );
		$stmt->execute ();
		$db = null;
		echo json_encode ( $wine );
	} catch ( PDOException $e ) {
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
}

function deleteWine ( $id ) {
	$sql = "DELETE FROM wine WHERE id=:id";
	try {
		$db = getConnection ();
		$stmt = $db->prepare ( $sql );
		$stmt->bindParam ( "id", $id );
		$stmt->execute ();
		$db = null;
	} catch ( PDOException $e ) {
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
}

function findByName ( $query ) {
	$sql = "SELECT * FROM wine WHERE UPPER(name) LIKE :query ORDER BY name";
	try {
		$db = getConnection ();
		$stmt = $db->prepare ( $sql );
		$query = "%" . $query . "%";
		$stmt->bindParam ( "query", $query );
		$stmt->execute ();
		$wines = $stmt->fetchAll ( PDO::FETCH_OBJ );
		$db = null;
		echo '{"wine": ' . json_encode ( $wines ) . '}';
	} catch ( PDOException $e ) {
		echo '{"error":{"text":' . $e->getMessage () . '}}';
	}
}

function getConnection () {
	$dbhost = "127.0.0.1";
	$dbuser = "root";
	$dbpass = "";
	$dbname = "cellar";
	$dbh = new PDO( "mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass );
	$dbh->setAttribute ( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	return $dbh;
}


function loginFailed () {
	$_SESSION[ "username" ] = 'Guess';
	$_SESSION[ "loggedIn" ] = false;
//	header ( "location:index" );
	echo "failed";
	exit;
}

?>