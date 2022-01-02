<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.example.docker.DbConnection" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: vaibhavgole
  Date: 1/1/22
  Time: 8:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    if(request.getMethod().matches("POST")) {
        String text = request.getParameter("text");
        HttpSession sess = request.getSession();
        String email = (String) sess.getAttribute("email");
        String password = (String) sess.getAttribute("password");
        String spassword = request.getParameter("password");
//        Process process = Runtime.getRuntime().exec("sudo docker run -dit -p 8001:4200 -e SIAB_PASSWORD="+ password +" -e SIAB_USER="+ text +" -e SIAB_SUDO=true sspreitzer/shellinabox:latest");
//        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
//        String line = reader.readLine();
//        line = line.substring(0,11);
//        out.println(line);
        String line="1234567891011";
        line = line.substring(0,11);
        String sql="INSERT INTO `server_info` VALUES ('" + line+ "', '" + text+ "','" + text+ "','" + password+ "','" + email + "')";
        Connection connect = DbConnection.Connectiontodatabase();
        Statement stmt=connect.createStatement();
        stmt.executeUpdate(sql);
    }
 %>
<%--%>--%>
<%--<?php--%>
<%--session_start();--%>
<%--include "db_connect.php";--%>

<%--?>--%>
<%--<?php--%>
<%--    if($_SERVER["REQUEST_METHOD"]=='POST') {--%>

<%--        // Store the provide data by user--%>
<%--        $email=$_SESSION['email'];--%>
<%--        $text=$_POST["text"];--%>
<%--        $password=$_POST["password"];--%>

<%--        //Launching Server:--%>

<%--        echo "It is running";--%>
<%--        $output = "";--%>
<%--        $result = "";--%>
<%--        exec("sudo docker run -dit -p 8001:4200 -e SIAB_PASSWORD=$password -e SIAB_USER=$text -e SIAB_SUDO=true sspreitzer/shellinabox:latest 2>&1", $output, $result);--%>
<%--        $temp = substr($output[0], 0, 11);--%>
<%--        echo var_dump($output[0]);--%>
<%--        echo $password;--%>
<%--        echo $text;--%>



<%--        mysqli_close($conn);--%>
<%--        header('Location:/server.php');--%>
<%--        }--%>
<%--?>--%>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Welcome</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

</head>
<style>
    .god{
        /* width:50%; */
        /* margin-left:150px; */
    }
    .form-control{
        background-color : #96d3ec;
    }
    #myvideo{
        position:fixed;
        /* right:0;
        bottom:0; */
        min-width:100%;
        min-height:100%;
        z-index:-100;
    }
    .bob{
        dispaly:block;
        background:black;
        opacity:0.7;
        margin-top:120px;
        margin-left:400px;
        width:30%;
    }
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="admin.php">PLUSgetWAY</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Index.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.php">About</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contact.php">Contact US</a>
                </li>
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-fill"></i>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="login.php">Login</a></li>
                        <li><a class="dropdown-item" href="signup.php">Sign UP</a></li>
                        </li>
                    </ul>
                <li class="nav-item">
                    <a class="nav-link" href="Logout.php">Logout</a>
                </li>
            </ul>

        </div>
    </div>
</nav>

<div id="myvideo">
    <video autoplay muted loop >
        <source src="bgvideo.mp4" type="video/mp4">
    </video>
</div>


<div class="bob shadow">
    <div class="container mt-10">
        <form action="welcome.jsp" method="POST">
            <h3 class=" text-center  text-white ">Launch Your Server</h3>
            <form action="signup.php" method="POST">
                <div class="god ">
                    <div class="form-group mb-3">
                        <label for="text" class="form-label text-white">Server Name</label>
                        <input type="text" class="form-control " id="text" name="text" aria-describedby="emailHelp" autocomplete="off" >
                    </div>

                    <div class="form-group mb-3">
                        <label for="password" class="form-label text-white ">Server Password</label>
                        <input type="password" class="form-control " name="password" id="password">

                    </div>


                    <button  type="submit" name="submit" class="btn btn-success mb-3">Launch</button>
                </div>
            </form>
    </div>
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

