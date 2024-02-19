<?php

include('connection.php');

// $sql = "CREATE TABLE student ( rno VARCHAR(255) NOT NULL , name VARCHAR(12) NOT NULL ,  dept_code VARCHAR(255) NOT NULL , PRIMARY KEY (rno),deg_prog VARCHAR(255),joining_year YEAR, coursecode VARCHAR(255))";
// $result = mysqli_query($con, $sql);

// if($result){
//     echo "Table Created Sucessfully!<br>";
// }
// else{
//     echo "Table Is Not Created Due To The Following Error ---> ". mysqli_error($conn);
// }


$sql = "CREATE TABLE course (courses VARCHAR(255),dept VARCHAR(255))";
$result = mysqli_query($con, $sql);

if($result){
    echo "Table Created Sucessfully!<br>";
}
else{
    echo "Table Is Not Created Due To The Following Error ---> ". mysqli_error($conn);
}
  
?>