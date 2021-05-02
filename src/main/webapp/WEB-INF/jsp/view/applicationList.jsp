<%-- 
    Document   : applicationList
    Created on : Apr 29, 2021, 7:47:23 PM
    Author     : Ryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <h2>Applications!</h2>
        <div class="numberNav">
            <c:forEach var="i" begin="1" end="${maxPages}">
                <a <c:if test="${currentPage == i}">class="active"</c:if> href="<c:url value="/jobs"><c:param name="page" value="${i}" /></c:url>">${i}</a>
            </c:forEach>
        </div>
        <c:forEach items="${aplications}" var="aplications">
            <div class="job fullwidth">
                <p>
                    <a href="
                       <c:url value="/application">
                           <c:param name="id" value="${aplications.id}" />
                       </c:url>"><c:out value="${aplications.jobTitle}" />
                    </a>&nbsp;
                </p>
                <p><c:out value="${aplications.firstName}" />, <c:out value="${aplications.lastName}" /></p>
                <p><c:out value="${aplications.email}" /></p>
            </div>
        </c:forEach>
    </body>
</html>
