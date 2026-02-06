package com.carlocation.controller;

import com.carlocation.dto.ApiResponse;
import com.carlocation.dto.ReservationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.RestClientException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

    @Autowired
    private RestTemplate restTemplate;

    @Value("${backoffice.api.url}")
    private String backofficeApiUrl;

    @Value("${backoffice.api.reservations}")
    private String reservationsEndpoint;

    @GetMapping
    public String listReservations(
            @RequestParam(value = "date", required = false) String date,
            Model model
    ) {
        try {
            // Construire l'URL de l'API
            String apiUrl = backofficeApiUrl + reservationsEndpoint;

            if (date != null && !date.isBlank()) {
                apiUrl += "?date=" + date;
            }

            logger.info("Appel API: {}", apiUrl);

            // Appeler l'API du BackOffice et récupérer la réponse
            ApiResponse response = restTemplate.getForObject(apiUrl, ApiResponse.class);

            // Extraire les réservations depuis la réponse
            List<ReservationDto> reservations = (response != null && response.getData() != null)
                    ? response.getData()
                    : new ArrayList<>();

            logger.info("Nombre de réservations reçues: {}", reservations.size());

            model.addAttribute("reservations", reservations);
            model.addAttribute("date", date);
            model.addAttribute("success", true);

        } catch (RestClientException e) {
            logger.error("Erreur lors de l'appel à l'API BackOffice", e);
            model.addAttribute("reservations", new ArrayList<>());
            model.addAttribute("date", date);
            model.addAttribute("success", false);
            model.addAttribute("errorMessage", "Impossible de charger les réservations. Veuillez réessayer plus tard.");
        } catch (Exception e) {
            logger.error("Erreur inattendue", e);
            model.addAttribute("reservations", new ArrayList<>());
            model.addAttribute("date", date);
            model.addAttribute("success", false);
            model.addAttribute("errorMessage", "Une erreur inattendue s'est produite.");
        }

        return "reservation/list";
    }
}

