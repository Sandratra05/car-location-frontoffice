package com.carlocation.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ReservationDto {

    @JsonProperty("idReservation")
    private Long idReservation;
    
    @JsonProperty("nbPassager")
    private int nbPassager;
    
    @JsonProperty("dateHeureArrivee")
    private String dateHeureArrivee;
    
    @JsonProperty("hotel")
    private HotelDto hotel;
    
    @JsonProperty("idClient")
    private String idClient;

    public ReservationDto() {
    }

    public Long getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(Long idReservation) {
        this.idReservation = idReservation;
    }

    public int getNbPassager() {
        return nbPassager;
    }

    public void setNbPassager(int nbPassager) {
        this.nbPassager = nbPassager;
    }

    public String getDateHeureArrivee() {
        return dateHeureArrivee;
    }

    public void setDateHeureArrivee(String dateHeureArrivee) {
        this.dateHeureArrivee = dateHeureArrivee;
    }

    public HotelDto getHotel() {
        return hotel;
    }

    public void setHotel(HotelDto hotel) {
        this.hotel = hotel;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }
    
    // Classe interne pour l'hôtel
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class HotelDto {
        @JsonProperty("idHotel")
        private Long idHotel;
        
        @JsonProperty("libelle")
        private String libelle;
        
        @JsonProperty("distance")
        private Double distance;

        public Long getIdHotel() {
            return idHotel;
        }

        public void setIdHotel(Long idHotel) {
            this.idHotel = idHotel;
        }

        public String getLibelle() {
            return libelle;
        }

        public void setLibelle(String libelle) {
            this.libelle = libelle;
        }

        public Double getDistance() {
            return distance;
        }

        public void setDistance(Double distance) {
            this.distance = distance;
        }
    }
}
