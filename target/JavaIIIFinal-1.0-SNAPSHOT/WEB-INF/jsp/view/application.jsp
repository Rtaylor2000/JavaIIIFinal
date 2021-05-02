<%-- 
    Document   : application
    Created on : May 1, 2021, 8:47:47 PM
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
        <h2>Application</h2>
        <div class="job description">
            <p>
                Job Title: <c:out value="${aplication.jobTitle}" /><br/>
                Name: <c:out value="${aplication.firstName}" />, <c:out value="${aplication.lastName}" /><br/>
                Email: <c:out value="${aplication.email}" /><br/>
                Resume: <c:out value="${aplication.resumeUpload}" /><br/>
                Desired Salary: <fmt:formatNumber maxFractionDigits="0" value="${aplication.desiredSalary}"  
                                  type="currency" currencyCode="USD"  />
                Earliest Start Date: <fmt:formatNumber maxFractionDigits="0" value="${aplication.earliestStartDate}"  
                                  type="currency" currencyCode="USD"  />
            </p>
        </div>
        <div class="job application">
            <form method="POST" action="<c:url value="/applications" />" enctype="multipart/form-data">
                <input type="hidden" name="jobTitle" value="${aplication.jobTitle}" />
                <input type="hidden" name="firstName" value="${aplication.firstName}" />
                <input type="hidden" name="lastName" value="${aplication.lastName}" />
                <input type="hidden" name="email" value="${aplication.email}"/>
                <input type="hidden" name="resume" value="${aplication.resumeUpload}"/>
                <input type="hidden" name="desiredSalary" value="${aplication.desiredSalary}"/>
                <input type="hidden" name="startDate" value="${aplication.earliestStartDate}"/>
                <input type="hidden" name="id" value="${aplication.id}"/>

                <input type="hidden" name="action" value="deactivate" />
                <input type="submit" value="Submit"/>
            </form>
        </div>
    </body>
</html>
