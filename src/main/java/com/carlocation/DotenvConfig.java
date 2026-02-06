package com.carlocation;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DotenvConfig {
    @Bean
    public Dotenv dotenv() {
        try {
            return Dotenv.load();
        } catch (Exception e) {
            // Fallback si .env n'est pas trouvé, utiliser les variables d'environnement système
            return Dotenv.configure().ignoreIfMissing().load();
        }
    }
}