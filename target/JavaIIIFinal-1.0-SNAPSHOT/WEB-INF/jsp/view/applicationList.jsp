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
        <c:if test="${fn:length(applicationDatabase) > 0}">
            <c:forEach items="${applicationDatabase}" var="entry">
                <c:if test="${entry.value.active}">
                    <div class="job fullwidth">
                        Application ${entry.key}<br /> <a href="<c:url value="/applications">
                            <c:param name="action" value="view" />
                            <c:param name="applicationId" value="${entry.key}" />
                        </c:url>"><c:out value="${entry.value.jobTitle}" /></a>
                        <p>
                            <c:out value="${entry.value.firstName}" />
                            &nbsp; <c:out value="${entry.value.lastName}" />
                            ,&nbsp; <c:out value="${entry.value.email}" />
                        </p>
                    </div>
                </c:if>
            </c:forEach>
        </c:if>
    </body>
</html>
