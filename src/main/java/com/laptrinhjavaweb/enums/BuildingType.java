package com.laptrinhjavaweb.enums;

public enum BuildingType {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất");


    BuildingType(String name) {
        this.name = name;
    }

    private final String name;

    public String getName() {
        return name;
    }
}
