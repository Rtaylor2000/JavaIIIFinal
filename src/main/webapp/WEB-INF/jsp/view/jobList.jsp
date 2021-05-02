<%-- 
    Document   : jobList
    Created on : Apr 13, 2021, 7:15:18 PM
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
    <body>
        <div class="container">
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
            <h2>Jobs!</h2>
            <div class="numberNav">
                <c:forEach var="i" begin="1" end="${maxPages}">
                    <a <c:if test="${currentPage == i}">class="active"</c:if> href="<c:url value="/jobs"><c:param name="page" value="${i}" /></c:url>">${i}</a>
                </c:forEach>
            </div>
            <c:forEach items="${jobs}" var="jobs" begin="${begin}" end="${end}">
                <div class="job fullwidth">
                    <p>
                        <a href="
                           <c:url value="/jobs">
                               <c:param name="id" value="${jobs.id}" />
                           </c:url>"><c:out value="${jobs.title}" />
                        </a>&nbsp;
                    </p>
                    <p><c:out value="${jobs.city}" />, <c:out value="${jobs.state}" /></p>
                    <p><c:out value="${jobs.department}" /></p>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
