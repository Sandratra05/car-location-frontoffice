package com.carlocation.dto;

import java.util.List;

public class ApiResponse {
    private String status;
    private int code;
    private Data data;

    public ApiResponse() {}

    // Getters et setters pour status, code, data

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public int getCode() { return code; }
    public void setCode(int code) { this.code = code; }
    public Data getData() { return data; }
    public void setData(Data data) { this.data = data; }

    public static class Data {
        private List<ReservationDto> data;
        private boolean success;
        private String message;

        public Data() {}

        // Getters et setters
        public List<ReservationDto> getData() { return data; }
        public void setData(List<ReservationDto> data) { this.data = data; }
        public boolean isSuccess() { return success; }
        public void setSuccess(boolean success) { this.success = success; }
        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
    }
}