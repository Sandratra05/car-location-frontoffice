<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Réservations - Car Location</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2em;
        }

        .filter-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 4px solid #667eea;
        }

        .filter-form {
            display: flex;
            gap: 15px;
            align-items: flex-end;
            flex-wrap: wrap;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            flex: 1;
            min-width: 200px;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
            font-size: 0.95em;
        }

        .form-group input {
            padding: 10px 15px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        button {
            padding: 10px 30px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #764ba2;
        }

        .reset-btn {
            background: #6c757d;
        }

        .reset-btn:hover {
            background: #5a6268;
        }

        .alert {
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .alert-danger {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .results-info {
            color: #666;
            margin-bottom: 20px;
            font-size: 0.95em;
            padding: 10px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table thead {
            background: #667eea;
            color: white;
            font-weight: 600;
        }

        table th {
            padding: 15px;
            text-align: left;
            font-size: 0.95em;
        }

        table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        table tbody tr {
            transition: background 0.2s;
        }

        table tbody tr:hover {
            background: #f8f9fa;
        }

        table tbody tr:nth-child(even) {
            background: #f9f9f9;
        }

        .no-data {
            text-align: center;
            padding: 40px 20px;
            color: #999;
            font-size: 1.1em;
        }

        .button-group {
            display: flex;
            gap: 10px;
        }

        a.reset-link {
            text-decoration: none;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.5em;
            }

            .filter-form {
                flex-direction: column;
            }

            .form-group {
                min-width: auto;
            }

            table {
                font-size: 0.9em;
            }

            table th, table td {
                padding: 8px 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📋 Liste des Réservations</h1>

        <!-- Affichage des messages d'erreur -->
        <c:if test="${not success}">
            <div class="alert alert-danger">
                <strong>Erreur !</strong> ${errorMessage}
            </div>
        </c:if>

        <!-- Section de filtre -->
        <div class="filter-section">
            <form method="get" action="/reservations" class="filter-form">
                <div class="form-group" style="flex: 1; min-width: 250px;">
                    <label for="dateFilter">Filtrer par date :</label>
                    <input type="date" id="dateFilter" name="date" value="${date}">
                </div>
                <div class="button-group">
                    <button type="submit">🔍 Filtrer</button>
                    <a href="/reservations" class="reset-link">
                        <button type="button" class="reset-btn">🔄 Réinitialiser</button>
                    </a>
                </div>
            </form>
        </div>

        <!-- Informations sur les résultats -->
        <c:if test="${success}">
            <div class="results-info">
                <c:choose>
                    <c:when test="${not empty date}">
                        Affichage des réservations pour le <strong>${date}</strong>
                    </c:when>
                    <c:otherwise>
                        Affichage de <strong>toutes les réservations</strong>
                    </c:otherwise>
                </c:choose>
                • Total : <strong>${reservations.size()} réservation(s)</strong>
            </div>
        </c:if>

        <!-- Tableau des réservations -->
        <c:choose>
            <c:when test="${not empty reservations}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date et Heure d'Arrivée</th>
                            <th>Client</th>
                            <th>Hôtel</th>
                            <th>Distance (km)</th>
                            <th>Passagers</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="reservation" items="${reservations}">
                            <tr>
                                <td>#${reservation.idReservation}</td>
                                <td>${reservation.dateHeureArrivee}</td>
                                <td>${reservation.idClient}</td>
                                <td>${reservation.hotel.libelle}</td>
                                <td>${reservation.hotel.distance}</td>
                                <td>${reservation.nbPassager}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-data">
                    <p>📭 Aucune réservation trouvée</p>
                    <c:if test="${not empty date}">
                        <p style="font-size: 0.9em; color: #bbb; margin-top: 10px;">
                            Essayez de modifier votre filtre de date
                        </p>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
