<%@ page import="java.io.PrintWriter" %>
<%@page import="com.example.docker.DbConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    // Collect the user data
    String email = null;
    String password = null;
    String cpassword = null;

    //For showing error messages
    boolean showalert = false;
    boolean showerror = false;
    boolean exits = false;

    //Collect data if request is post
    if (request.getMethod().matches("POST")) {
        email = request.getParameter("Email");
        password = request.getParameter("password");
        cpassword = request.getParameter("cpassword");

        if (!password.matches(cpassword)) {
            showerror = true;
        } else if (password.matches(cpassword))
            showalert = false;

        try {
            String query = String.format("SELECT * FROM signup WHERE EmailID = \"%s\"", email);
            Connection connect = DbConnection.Connectiontodatabase();
            Statement stmt=connect.createStatement();
            ResultSet rs=stmt.executeQuery(query);

            // Check the user if already exist
            if (rs.next()) {
                exits = true;
            }  else {
                query = String.format("INSERT  INTO signup VALUES( \"%s\",\"%s\");",email,password);
                stmt.executeUpdate(query);
            }
            // Close database connection;
            connect.close();
            response.sendRedirect("login.jsp");

        }
        catch (Exception e) {
            out.println(e);
        }
    }





%>


<!DOCTYPE html>
<html lang='en'>
<head>
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'
          integrity='sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3' crossorigin='anonymous'>

    <title>SIGN UP</title>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css'>

</head>
<style>
    .board {
        dispaly: block;
        margin-top: 120px;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
    }

    .god {
        width: 50%;
    }
</style>
<body>
<jsp:include page="nav.jsp"></jsp:include>


<%
  if(exits){
    out.println("<div class='alert alert-primary alert-dismissible fade show' role='alert'> " +
            "<strong>'User Already Exists'  </strong> " +
            "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>" +
            "</div>");
}
%>
<%
    if (showalert && !exits) {
        response.sendRedirect("login.jsp");
    }

    if (showerror) {
        out.println("<div" +
                " class='alert alert-danger alert-dismissible fade show' role='alert'> " +
                "<strong>Password doesn't match</strong> " +
                "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> " +
                "</div>");
    }
%>


<div class="board shadow">
    <div class="container mt-10">
        <h3 class="text-center ">Sign UP to SEMASY</h3>
        <form action="/docker_war_exploded/signup.jsp" method="post">
            <div class="god">
                <div class="form-group mb-3">
                    <label for="Email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="Email" name="Email" aria-describedby="emailHelp"
                           autocomplete="off">
                </div>

                <div class="form-group mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="password">
                </div>
                <div class="form-group mb-3">
                    <label for="cpassword" class="form-label">Conform Password</label>
                    <input type="password" name="cpassword" class="form-control" id="cpassword">
                </div>

                <button type="submit" class="btn btn-success mb-3">Sign UP</button>
            </div>
        </form>
    </div>
</div>


<!-- Optional JavaScript; cfhoose one of the two! -->

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
