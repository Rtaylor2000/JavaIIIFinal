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
                Job Title: <c:out value="${fn:escapeXml(application.jobTitle)}" /><br/>
                Name: <c:out value="${fn:escapeXml(application.firstName)}" />, <c:out value="${fn:escapeXml(application.lastName)}" /><br/>
                Email: <c:out value="${fn:escapeXml(application.email)}" /><br/>
                Resume: 
                
                <a href="<c:url value="/applications">
                    <c:param name="action" value="download" />
                    <c:param name="applicationId" value="${fn:escapeXml(application.id)}" />
                    <c:param name="attachment" value="${fn:escapeXml(application.resumeUpload)}" />
                </c:url>">Download</a><br/>
                
                Desired Salary: <fmt:formatNumber maxFractionDigits="0" value="${fn:escapeXml(application.desiredSalary)}"  
                                  type="currency" currencyCode="USD"  /><br/>
                Earliest Start Date: <fmt:formatDate type="date" dateStyle="medium" value="${application.newStartDate}"/>
            </p>
        </div>
        <div class="job application">
            <form method="POST" action="<c:url value="/applications" />" enctype="multipart/form-data">
                <input type="hidden" name="jobTitle" value="${fn:escapeXml(application.jobTitle)}" />
                <input type="hidden" name="firstName" value="${fn:escapeXml(application.firstName)}" />
                <input type="hidden" name="lastName" value="${fn:escapeXml(application.lastName)}" />
                <input type="hidden" name="email" value="${fn:escapeXml(application.email)}"/>
                <input type="hidden" name="resume" value="${fn:escapeXml(application.resumeUpload)}"/>
                <input type="hidden" name="desiredSalary" value="${fn:escapeXml(application.desiredSalary)}"/>
                <input type="hidden" name="startDate" value="${fn:escapeXml(application.newStartDate)}"/>
                <input type="hidden" name="id" value="${fn:escapeXml(application.id)}"/>

                <h3>Deactivate applications</h3>
                <input type="hidden" name="action" value="deactivate" />
                <input type="submit" value="Deactivate"/>
            </form>
        </div>
    </body>
</html>
