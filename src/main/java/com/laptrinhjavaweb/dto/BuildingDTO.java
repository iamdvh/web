package com.laptrinhjavaweb.dto;

import java.math.BigDecimal;
import java.security.Timestamp;
import java.time.LocalDate;

public class BuildingDTO {
    private LocalDate createdDate;
    private String name;
    private String address;
    private String managerFullname;
    private String managerPhoneNumber;
    private Integer floorArea;
    private Integer rentPrice;
    private String serviceFee;
    private BigDecimal brokerageTee;

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getManagerFullname() {
        return managerFullname;
    }

    public void setManagerFullname(String managerFullname) {
        this.managerFullname = managerFullname;
    }

    public String getManagerPhoneNumber() {
        return managerPhoneNumber;
    }

    public void setManagerPhoneNumber(String managerPhoneNumber) {
        this.managerPhoneNumber = managerPhoneNumber;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public Integer getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(Integer rentPrice) {
        this.rentPrice = rentPrice;
    }

    public String getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }

    public BigDecimal getBrokerageTee() {
        return brokerageTee;
    }

    public void setBrokerageTee(BigDecimal brokerageTee) {
        this.brokerageTee = brokerageTee;
    }
}
