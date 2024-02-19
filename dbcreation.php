<?php
$host="localhost";
$user="root";
$password="";
$con=mysqli_connect($host,$user,$password);
$sql = "CREATE DATABASE universityy";
$result = mysqli_query($con,$sql);

if($result){
    echo "the db is created";
}
else{
    echo "Db not created succesfully";
}
echo var_dump($result);
?>