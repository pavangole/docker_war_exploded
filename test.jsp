<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %><%--
  Created by IntelliJ IDEA.
  User: vaibhavgole
  Date: 1/2/22
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%


        Process process = Runtime.getRuntime().exec("/usr/bin/docker run test");
        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        BufferedReader errorr = new BufferedReader(new InputStreamReader(process.getErrorStream()));
        out.println(reader.readLine());
        out.println(reader.readLine());
        out.println(reader.readLine());
        out.println(errorr.readLine());
//        String line = reader.readLine();
//        out.println(line);
%>
</body>
</html>
