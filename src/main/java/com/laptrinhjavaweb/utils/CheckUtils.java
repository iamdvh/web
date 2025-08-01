package com.laptrinhjavaweb.utils;

public class CheckUtils {
    public static Boolean isNullOrEmpty(String value) {
        return value == null || value.equals("");
    }
    public static Boolean isNull(Integer value) {
        return value == null;
    }
    public static Boolean isNull(Long value) {
        return value == null;
    }
}
