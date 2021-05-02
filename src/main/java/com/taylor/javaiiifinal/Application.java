/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.taylor.javaiiifinal;

import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;

/**
 *
 * @author Ryan
 */
public class Application implements Serializable, Comparable<Application>{
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private Attachment resumeUpload;
    private double desiredSalary;
    private LocalDate earliestStartDate;
    private int id;
    private int jobId;
    private Instant dateTimeSubmitted;
    private boolean active;
    private String firstNameError;
    private String lastNameError;
    private String emailError; 
    private String phoneError;
    private String resumeError;
    private String salaryError;
    private String startDateError;
    private String jobTitle;

    public Application() {
        this.jobTitle = "none";
        this.firstName = "none";
        this.lastName = "none";
        this.email = "none";
        this.phone = "none";
        this.desiredSalary = 0.00;
        this.earliestStartDate = LocalDate.now();
        this.id = 0;
        this.jobId = 0;
        this.dateTimeSubmitted = Instant.now();
        this.active = true;
        this.firstNameError = "";
        this.lastNameError = "";
        this.emailError = "";
        this.phoneError = "";
        this.resumeError = "";
        this.salaryError = "";
        this.startDateError = "";
    }
    
    public Application(String firstName, String lastName, String email, 
            String phone, Attachment resumeUpload, double desiredSalary, 
            LocalDate earliestStartDate, int id, int jobId, 
            Instant dateTimeSubmitted, boolean active, String firstNameError, 
            String lastNameError, String emailError, String phoneError, 
            String resumeError, String salaryError, String startDateError, 
            String jobTitle) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.resumeUpload = resumeUpload;
        this.desiredSalary = desiredSalary;
        this.earliestStartDate = earliestStartDate;
        this.id = id;
        this.jobId = jobId;
        this.dateTimeSubmitted = dateTimeSubmitted;
        this.active = active;
        this.firstNameError = firstNameError;
        this.lastNameError = lastNameError;
        this.emailError = emailError;
        this.phoneError = phoneError;
        this.resumeError = resumeError;
        this.salaryError = salaryError;
        this.startDateError = startDateError;
        this.jobTitle = jobTitle;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Attachment getResumeUpload() {
        return resumeUpload;
    }

    public void setResumeUpload(Attachment resumeUpload) {
        this.resumeUpload = resumeUpload;
    }

    public double getDesiredSalary() {
        return desiredSalary;
    }

    public void setDesiredSalary(double desiredSalary) {
        this.desiredSalary = desiredSalary;
    }

    public LocalDate getEarliestStartDate() {
        return earliestStartDate;
    }

    public void setEarliestStartDate(LocalDate earliestStartDate) {
        this.earliestStartDate = earliestStartDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public Instant getDateTimeSubmitted() {
        return dateTimeSubmitted;
    }

    public void setDateTimeSubmitted(Instant dateTimeSubmitted) {
        this.dateTimeSubmitted = dateTimeSubmitted;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getFirstNameError() {
        return firstNameError;
    }

    public void setFirstNameError(String firstNameError) {
        this.firstNameError = firstNameError;
    }

    public String getLastNameError() {
        return lastNameError;
    }

    public void setLastNameError(String lastNameError) {
        this.lastNameError = lastNameError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getResumeError() {
        return resumeError;
    }

    public void setResumeError(String resumeError) {
        this.resumeError = resumeError;
    }

    public String getSalaryError() {
        return salaryError;
    }

    public void setSalaryError(String salaryError) {
        this.salaryError = salaryError;
    }

    public String getStartDateError() {
        return startDateError;
    }

    public void setStartDateError(String startDateError) {
        this.startDateError = startDateError;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    
    @Override
    public String toString(){
        return jobTitle+" "+firstName+" "+lastName+" "+email+".";
    }
    
    @Override
    public int compareTo(Application other) {
        int result = dateTimeSubmitted.compareTo(other.dateTimeSubmitted);
        return result;
    }
}
