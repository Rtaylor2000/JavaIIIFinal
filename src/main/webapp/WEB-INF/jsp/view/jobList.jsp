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
        <title>Jobs</title>
        <link href="styles/main.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <a href="<c:url value="/jobs" />">View Jobs</a>
            <a href="<c:url value="/applications" />">Applications</a>
            <a href="<c:url value="/login" />">Login</a>
            <h2>Jobs!</h2>
            <div class="numberNav">
                <c:forEach var="i" begin="1" end="${maxPages}">
                    <a <c:if test="${currentPage == i}">class="active"</c:if> href="<c:url value="/jobs"><c:param name="page" value="${i}" /></c:url>">${i}</a>
                </c:forEach>
            </div>
            <div class="jobs">
                <c:forEach items="${jobs}" var="jobs" begin="${begin}" end="${end}">
                    <div class="job">
                        <p>
                            <a href="
                               <c:url value="/jobs">
                                   <c:param name="id" value="${jobs.id}" />
                               </c:url>"><c:out value="${jobs.title}" />
                            </a>&nbsp;
                            <c:out value="${jobs.state}" />&nbsp;
                            <c:out value="${jobs.city}" />&nbsp;
                            <c:out value="${jobs.department}" />
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
