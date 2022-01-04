<%--
  Created by IntelliJ IDEA.
  User: vaibhavgole
  Date: 1/3/22
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String url = request.getRequestURL().toString();
    String queryString = request.getQueryString();
    out.println(url);
    out.println(queryString);

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
