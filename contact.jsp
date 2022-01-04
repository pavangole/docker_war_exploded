<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.docker.DbConnection" %>
<%@ page import="java.sql.Statement" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Contact US</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">


</head>
<style>
    .clas{padding-left:100px; padding-right:100px; padding-top:30px}
    .ce{margin-left:100px}
</style>


<body>
<jsp:include page="nav.jsp"></jsp:include>
<%


    if (request.getMethod().matches("POST")) {
        Connection connection = DbConnection.Connectiontodatabase();

        Statement stmt = connection.createStatement();

        String email = request.getParameter("Email");
        String description = request.getParameter("Text");

        String query = "insert into contact values ('" + email +  "', '" + description  + "')";
        stmt.executeUpdate(query);

        out.println("<div class='alert alert-success alert-dismissible fade show' role='alert''><strong>'Thank you for your Feedback.'</strong><button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");

    }

//<?php
//   $servername = "localhost";
//   $username = "soham";
//   $password = "soham";
//   $dbname = "website";
//
//   // Create Connection //
//   $con = mysqli_connect($servername,$username,$password,$dbname);
//
//   if(!$con){
//     die("Connection failed : " . mysqli_connect_error());
//   }
//
//    if (isset($_POST['Submit'])) {
//
//      $showError=true;
//
//     $email = $_POST['Email'];
//     $text = $_POST['Text'];
//
//   $sql = "INSERT INTO `contact`(`Email`, `Description`) VALUES ('$email','$text')";
//
//   if(mysqli_query($con,$sql)){
//   }
//   else{
//     echo "Error : ".$sql."<br>".mysqli_error($con);
//}
//
//mysqli_close($con);
//}
//
//if($showError){
//echo "<div class='alert alert-danger alert-dismissible fade show' role='alert''><strong>'Thank you for your Feedback.'</strong><button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>";
//}
//
//?>
%>

<div class="container  my-4">
    <h3 class="text-center">Please enter your Feedback</h3>
    <form action="contact.jsp" method="post">

        <div class="clas" >
            <label  for="Email" class="form-label">Enter your email address</label>
            <input type="email" name="Email" class="form-control" id="Email" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>
        <div class="mb-3 clas">
            <label for="Text" class="form-label">Describe your Experience/ Feedback/ Problem.</label>
            <textarea class="form-control" name="Text" id="Text" rows="3"></textarea>
        </div>

        <button type="submit" name="Submit" class="ce btn btn-primary">Submit</button>

    </form>
</div>


<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>

</html>