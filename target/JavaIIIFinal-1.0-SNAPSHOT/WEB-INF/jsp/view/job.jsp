<%-- 
    Document   : job
    Created on : Apr 15, 2021, 2:51:54 PM
    Author     : Ryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specific Job</title>
        <link href="styles/main.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <a href="<c:url value="/jobs" />">View Jobs</a>
            <a href="<c:url value="/applications" />">Applications</a>
            <a href="<c:url value="/login" />">Login</a>
            <h2>Job</h2>
            <div class="job description">
                <p>
                    Title: <c:out value="${job.title}" /><br/>
                    Location: <c:out value="${job.state}" /> 
                    <c:out value="${job.city}" /><br/>
                    Full Time: <c:if test="${job.fullTime}">Full-Time</c:if>
                    <c:if test="${!job.fullTime}">Part-Time</c:if><br/>
                    Department: <c:out value="${job.department}" /><br/>
                    Experience: <c:out value="${job.experience}" /><br/>
                    Salary: <fmt:formatNumber value="${job.salary}" 
                                      type="currency" currencyCode="USD" />
                    <c:if test="${job.wageCategory == 'Salaried'} ">
                        per hour</c:if>
                    <c:if test="${job.wageCategory ==  'Hourly'} ">
                        per year</c:if>
                </p>
            </div>
            <div class="job application">
                <form method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="jobId" value="${job.id}" />
                    <input type="hidden" name="jobTitel" value="${job.title}" />

                    <label for="firstName">First Name</label><br>
                    <input type="text" name="firstName" id="firstName" 
                           required/><br><br>
                    <label for="lastName">Last Name</label><br>
                    <input type="text" name="lastName" id="firstName" 
                           required/><br><br>
                    <label for="email">Email</label><br>
                    <input type="email" name="email" id="email" 
                           required/><br><br>
                    <label for="phoneNumber">Phone Number</label><br>
                    <input type="text" name="phoneNumber" id="phoneNumber" 
                           required/><br><br>
                    <label for="file1">Resume</label><br>
                    <input type="file" name="file1" id="file1"/><br><br>

                    <label for="desiredSalary">Desired Salary</label><br>
                    <input type="number" name="desiredSalary" id="desiredSalary" 
                           required/><br><br>

                    <label for="earliestStartDate">Earliest Start Date</label><br>
                    <input type="date" name="earliestStartDate" 
                           id="earliestStartDate" required/><br><br>

                    <input type="submit" value="Submit"/>
                </form>
            </div>
        </div>
    </body>
</html>
