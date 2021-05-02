/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.taylor.javaiiifinal;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ryan
 */
@WebServlet(name = "ApplicationServlet", urlPatterns = {"/applications"})
@MultipartConfig(
        fileSizeThreshold = 5_242_880, //5MB
        maxFileSize = 20_971_520L //20MB
)
public class ApplicationServlet extends HttpServlet {

    private volatile int APPLICATION_ID_SEQUENCE = 1;
    private Map<Integer, Application> applicationDatabase = new LinkedHashMap<>();
    private static SortedSet<Application> applications;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "create":
                createAplication(request, response);
                break;
            case "list":
            default:
                listApplications(request, response);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null) {
            response.sendRedirect("login");
            return;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "create":
                createAplication(request, response);
                break;
            case "list":
            default:
                listApplications(request, response);
                break;
        }
    }
    
    private void createAplication(HttpServletRequest request, 
            HttpServletResponse response) throws ServletException, IOException {
        
        Boolean error = false;
        
        Application newApplication = new Application();
        String firstName = request.getParameter("firstName");
        if(firstName == null || firstName.equals("")){
            error = true;
            newApplication.setFirstNameError("First Name can't be emty!");
        }
        else{
            newApplication.setFirstName(firstName);
        }
        
        String lastName = request.getParameter("lastName");
        if(lastName == null || lastName.equals("")){
            error = true;
            newApplication.setLastNameError("Last Name can't be emty!");
        }
        else{
            newApplication.setLastName(lastName);
        }
        
        String email = request.getParameter("email");
        if(email == null || email.equals("")){
            error = true;
            newApplication.setEmailError("Email can't be emty!");
        }
        else{
            newApplication.setEmail(email);
        }
        
        String phone = request.getParameter("phoneNumber");
        if(phone == null || phone.equals("")){
            error = true;
            newApplication.setPhoneError("Phone Number can't be emty!");
        }
        else{
            char[] charPhone = phone.toCharArray();
            List<Character> listCharPhone = new ArrayList<Character>();
            for(int i = 0; i < charPhone.length; i++) {
                if(Character.isDigit(charPhone[i])){
                    listCharPhone.add(charPhone[i]);
//                    System.out.println("added: "+charPhone[i]);
                }
            }
            if(listCharPhone.size() != 10){
                error = true;
                newApplication.setPhoneError("A phone number has ten numbers!");
                System.out.println("error: "+newApplication.getPhoneError());
            }
            else{
                String numberPhone = listCharPhone.get(0)+""
                        +listCharPhone.get(1)+""+listCharPhone.get(2)+""
                        +listCharPhone.get(3)+""+listCharPhone.get(4)+""
                        +listCharPhone.get(5)+""+listCharPhone.get(6)+""
                        +listCharPhone.get(7)+""+listCharPhone.get(8)+""
                        +listCharPhone.get(9);
                String formated = numberPhone.replaceFirst("(\\d{3})(\\d{3})(\\d+)", "($1) $2-$3");
//                System.out.println("formated: "+formated);
                newApplication.setPhone(formated);
            }
        }
        
        Part filePart = request.getPart("file1");
        if (filePart != null && filePart.getSize() > 0) {
            Attachment attachment = processAttachment(filePart);
            if (attachment != null) {
                newApplication.setResumeUpload(attachment);
            }
            else{
                error = true;
                newApplication.setResumeError("You need to add a resume!");
            }
        }
        
        String desiredSalary = request.getParameter("desiredSalary");
        if(desiredSalary == null){
            error = true;
            newApplication.setSalaryError("Desired Salary can not be blank!");
        }
        else{
            double salary = Double.parseDouble(desiredSalary);
            newApplication.setDesiredSalary(salary);
        }
        
        String earliestStartDate = request.getParameter("earliestStartDate");
        if(earliestStartDate == null){
            error = true;
            newApplication.setStartDateError("Earlies Start Date can not be blank");
        }
        else{
            LocalDate StartDate = LocalDate.parse(earliestStartDate);
            if(StartDate.isBefore(LocalDate.now())){
                error = true;
                newApplication.setStartDateError("Earlies Start Date can not in the past");
            }
            else{
                newApplication.setEarliestStartDate(StartDate);
            }
        }
        
        String jobId = request.getParameter("jobId");
        int numberJobId = Integer.parseInt(jobId);
        newApplication.setJobId(numberJobId);
        
        newApplication.setJobTitle(request.getParameter("jobTitle"));
        
        newApplication.setDateTimeSubmitted(Instant.now());
        
        newApplication.setActive(true);
        
        String errors;
        if(error){
            errors = "Application Failed To Send.";
            request.setAttribute("PhoneError", newApplication.getPhoneError());
            request.setAttribute("DateError", newApplication.getStartDateError());
        }
        else{
            errors = "Application Sent.";
            int id;
            synchronized (this) {
                id = this.APPLICATION_ID_SEQUENCE++;
                newApplication.setId(id);
                this.applicationDatabase.put(id, newApplication);
            }
        }
        
        String jobTitle = request.getParameter("jobTitle");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String fullTime = request.getParameter("fullTime");
        String department = request.getParameter("department");
        String experience = request.getParameter("experience");
        String salary = request.getParameter("salary");
        
        Job theJob = new Job();
        theJob.setId(numberJobId);
        theJob.setCity(city);
        theJob.setState(state);
        theJob.setDepartment(department);
        theJob.setExperience(experience);
        theJob.setTitle(jobTitle);
        theJob.setActive(Boolean.parseBoolean(fullTime.toLowerCase()));
        theJob.setSalary(Double.parseDouble(salary));
        
        request.setAttribute("job", theJob);
        request.setAttribute("Error", errors);
        request.getRequestDispatcher("/WEB-INF/jsp/view/job.jsp").forward(request, response);
    }
    
    private Attachment processAttachment(Part filePart) throws IOException {
        Attachment attachment = new Attachment();
        try (InputStream inputStream = filePart.getInputStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();) {
            int read;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            attachment.setName(filePart.getSubmittedFileName());
            attachment.setContents(outputStream.toByteArray());
        }
        return attachment;
    }
    
    private void listApplications(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        for (Map.Entry<Integer, Application> application : applicationDatabase.entrySet()){
            applications.add(application.getValue());
        }
        if(request.getParameter("id") != null){
            int id = Integer.parseInt(request.getParameter("id"));
            Application application = new Application();
            
            for (Application var : applications){ 
                if(id == var.getId()){
                    application = var;
                }
            }
            
//            for (Map.Entry<Integer, Application> var : applicationDatabase.entrySet()){ 
//                if(id == var.getKey()){
//                    application = var.getValue();
//                }
//            }

            request.setAttribute("application", application);
            request.getRequestDispatcher("/WEB-INF/jsp/view/job.jsp").forward(request, response);
        }
        int page = 1;
        int jobsPerPage = 4;
        int begin = 0;
        int end = 0;
        int maxPages = applications.size() / jobsPerPage;
        if(applications.size() % jobsPerPage != 0) {
            maxPages++;
        }
        String pageStr = request.getParameter("page");
        if(pageStr != null && !pageStr.equals("")) {
            try {
                page = Integer.parseInt(pageStr);
                if(page < 1){
                    page = 1;
                } else if(page > maxPages) {
                    page = maxPages;
                }
            } catch(NumberFormatException e) {
                page = 1;
            }
        }
        begin = (page - 1) * jobsPerPage;
        end = begin + jobsPerPage - 1;
        request.setAttribute("applications", applications);
        request.setAttribute("begin", begin);
        request.setAttribute("end", end);
        request.setAttribute("maxPages", maxPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("/WEB-INF/jsp/view/jobList.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
