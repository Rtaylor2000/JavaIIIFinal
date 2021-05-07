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
            <h2>Job</h2>
            <div class="job description">
                <p>
                    Title: <c:out value="${job.title}" /><br/>
                    Location: <c:out value="${job.city}" />, <c:out value="${job.state}" /><br/>
                    Full Time: <c:if test="${job.fullTime}">Full-Time</c:if>
                    <c:if test="${!job.fullTime}">Part-Time</c:if><br/>
                    Department: <c:out value="${job.department}" /><br/>
                    Experience: <c:out value="${job.experience}" /><br/>
                    Pay: <fmt:formatNumber maxFractionDigits="0" value="${job.salary}"  
                                      type="currency" currencyCode="USD"  />
                    <c:choose>
                        <c:when test="${job.wageCategory == 'Salaried'}">
                            per year
                        </c:when>
                        <c:otherwise>
                            per hour
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
            <div class="job application">
                <p class="error">${Error}</p>
                <form method="POST" action="<c:url value="/applications" />" enctype="multipart/form-data">
                    <input type="hidden" name="jobId" value="${fn:escapeXml(job.id)}" />
                    <input type="hidden" name="jobTitle" value="${fn:escapeXml(job.title)}" />
                    
                    <input type="hidden" name="city" value="${fn:escapeXml(job.city)}"/>
                    <input type="hidden" name="state" value="${fn:escapeXml(job.state)}"/>
                    <input type="hidden" name="fullTime" value="${fn:escapeXml(job.fullTime)}"/>
                    <input type="hidden" name="department" value="${fn:escapeXml(job.department)}"/>
                    <input type="hidden" name="experience" value="${fn:escapeXml(job.experience)}"/>
                    <input type="hidden" name="salary" value="${fn:escapeXml(job.salary)}"/>
                    
                    <input type="hidden" name="action" value="create" />

                    <label for="firstName">First Name</label><br>
                    <input type="text" name="firstName" id="firstName" 
                           value="${fn:escapeXml(application.firstName)}" required/><br>
                    <p class="error">${(application.firstNameError)}</p><br>
                    
                    <label for="lastName">Last Name</label><br>
                    <input type="text" name="lastName" id="firstName" 
                           value="${fn:escapeXml(application.lastName)}" required/><br>
                    <p class="error">${application.lastNameError}</p><br>
                    
                    <label for="email">Email</label><br>
                    <input type="email" name="email" id="email" 
                           value="${fn:escapeXml(application.email)}" required/><br>
                    <p class="error">${application.emailError}</p><br>
                    
                    <label for="phoneNumber">Phone Number</label><br>
                    <input type="text" name="phoneNumber" id="phoneNumber" 
                           value="${fn:escapeXml(application.phone)}" required/><br>
                    <p class="error">${application.phoneError}</p><br>
                    
                    <label for="file1">Resume</label><br>
                    <input type="file" name="file1" id="file1" 
                           value="${fn:escapeXml(application.resumeUpload)}" required/><br>
                    <p class="error">${application.resumeError}</p><br>
                    
                    <label for="desiredSalary">Desired Salary</label><br>
                    <input type="number" name="desiredSalary" id="desiredSalary" 
                           value="${fn:escapeXml(application.desiredSalary)}" required min="1"/><br>
                    <p class="error">${application.salaryError}</p><br>
                    
                    <label for="earliestStartDate">Earliest Start Date</label><br>
                    <input type="date" name="earliestStartDate" 
                           value="${fn:escapeXml(application.earliestStartDate)}" id="earliestStartDate" required/><br>
                    <p class="error">${application.startDateError}</p><br>
                    <input type="submit" value="Submit"/>
                </form>
            </div>
        </div>
    </body>
</html>
