<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.docker.DbConnection" %><%--
  Created by IntelliJ IDEA.
  User: vaibhavgole
  Date: 1/1/22
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<?php--%>
<%--session_start();--%>

<%--//If already login redirect to welcome page--%>
<%--if (isset($_SESSION['status'])) {--%>
<%--header("Location: welcome.php");--%>
<%--}--%>

<%
    HttpSession sesss = request.getSession();
    sesss.invalidate();
    Boolean showError = false;
    if (request.getMethod().matches("POST")) {
        String email = request.getParameter("Email");
        String password = request.getParameter("password");
        String sql = "Select * from signup where EmailID='" + email + "' ";
        Connection connect = DbConnection.Connectiontodatabase();
        Statement stmt = connect.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        if (!rs.next()) {
// Give Waring Wrong username or password
            showError = true;
        } else {
            if (rs.getString(2).matches(password)) {
                HttpSession ses = request.getSession();
                ses.setAttribute("email",email);
                ses.setAttribute("password",password);

                response.sendRedirect("home.jsp");
            } else {
// Give Waring Wrong username or password
                showError = true;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Registration & Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">


</head>
<style>
    .bob {
        dispaly: block;
        margin-top: 120px;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
    }

</style>


<body>
<jsp:include page="nav.jsp"></jsp:include>
<%--<?php--%>
<%
  if (showError) {
    out.println("<div" +
            " class='alert alert-danger alert-dismissible fade show' role='alert'> " +
            "<strong>Wrong Username or Password</strong> " +
            "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> " +
            "</div>");
  }
%>

<div class="bob shadow">
    <div class="container my-3">
        <h3 class="text-center">Log in </h3>
        <form action="login.jsp" method="POST">
            <div class="mb-3">
                <label for="Email" class="form-label">Email</label>
                <input type="text" name="Email" class="form-control" id="Email" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password">
            </div>
            <button type="submit" name="log" class="btn btn-success mb-5">Log in</button>

            <br>
            <span>Don't have account,<a href="signup.jsp">Signup</a>
</span>

        </form>
    </div>
</div>


</form>

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
