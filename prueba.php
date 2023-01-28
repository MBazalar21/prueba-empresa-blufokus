<?php 
// conectarse a la base de datos 
$mysqli = new mysqli("localhost:3306", "root", "root", "empresadb"); // manejar la ruta de búsqueda de clientes 

    if (isset($_GET['nombre']) && isset($_GET['tipodoc'])) { 

        // obtener los parámetros de búsqueda 
        $name = $_GET['nombre']; 
        $type = $_GET['tipodoc']; 

        // crear la consulta 
        $query = "SELECT * FROM cliente WHERE nom_ape LIKE '%$name%' AND idtipodoc  = '$type'";

        // ejecutar la consulta 
        $result = $mysqli->query($query); $clients = array(); 

        while($row = $result->fetch_assoc()){ 
            $clients[] = $row; 
        } 

        // devolver los resultados en formato JSON 
        echo json_encode($clients); 
    }
?>