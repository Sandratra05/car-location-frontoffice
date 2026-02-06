<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Location - FrontOffice</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            padding: 60px 40px;
            text-align: center;
            max-width: 600px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 2.5em;
        }

        p {
            color: #666;
            margin-bottom: 40px;
            font-size: 1.1em;
            line-height: 1.6;
        }

        .btn {
            display: inline-block;
            padding: 15px 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1em;
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 50px;
            text-align: left;
        }

        .feature {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }

        .feature-title {
            font-weight: 600;
            color: #667eea;
            margin-bottom: 8px;
        }

        .feature-desc {
            font-size: 0.9em;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚗 Car Location</h1>
        <p>Bienvenue dans notre système de gestion des réservations de voitures.</p>
        
        <a href="/reservations" class="btn">📋 Voir les réservations</a>

        <!-- <div class="features">
            <div class="feature">
                <div class="feature-title">✅ Consulter</div>
                <div class="feature-desc">Accédez à la liste complète des réservations</div>
            </div>
            <div class="feature">
                <div class="feature-title">🔍 Filtrer</div>
                <div class="feature-desc">Filtrez les réservations par date</div>
            </div>
            <div class="feature">
                <div class="feature-title">🔄 Synchronisation</div>
                <div class="feature-desc">Données en temps réel du BackOffice</div>
            </div>
        </div> -->
    </div>
</body>
</html>
