package com.carlocation.dto;

import java.util.List;

public class ApiResponse {
    private String status;
    private int code;
    private int count;
    private List<ReservationDto> data;

    public ApiResponse() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<ReservationDto> getData() {
        return data;
    }

    public void setData(List<ReservationDto> data) {
        this.data = data;
    }
}
