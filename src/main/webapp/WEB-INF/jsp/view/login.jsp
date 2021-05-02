<%-- 
    Document   : login
    Created on : Apr 26, 2021, 8:26:57 PM
    Author     : Ryan
--%>
<%--@elvariable id="loginFailed" type="java.lang.Boolean"--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Jobs Ect.</title>
        <link href="styles/main.css" rel="stylesheet">
    </head>
    <body class="container">
        <a href="<c:url value="/jobs" />">View Jobs</a>
        <a href="<c:url value="/applications" />">Applications</a>
        <c:choose>
            <c:when test = "${username != null}" >
                <a href="<c:url value="/login?logout" />">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="<c:url value="/login" />">Login</a>
            </c:otherwise>
        </c:choose>
        <h2>Login</h2>
        <div class="job nonFloatPad">
            <form method="POST" action="<c:url value="/login" />">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" /><br><br>
                <label for="password">Password</label>
                <input type="password" name="password" id="password" /><br><br>
                <input type="submit" value="Log In" />
            </form>
            <c:if test="${loginFailed}">
                <p style="font-weight: bold;">The username and password you entered are not correct. Please try again.</p>
            </c:if>
        </div>
    </body>
</html>
