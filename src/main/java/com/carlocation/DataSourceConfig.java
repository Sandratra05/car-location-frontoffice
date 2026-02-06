package com.carlocation;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.net.URI;

@Configuration
public class DataSourceConfig {

    @Value("${spring.datasource.url}")
    private String databaseUrl;
    
    @Value("${spring.datasource.username}")
    private String defaultUsername;
    
    @Value("${spring.datasource.password}")
    private String defaultPassword;

    @Bean
    public DataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        
        try {
            // Si l'URL contient déjà jdbc: (configuration locale), utiliser directement
            if (databaseUrl.startsWith("jdbc:")) {
                dataSource.setJdbcUrl(databaseUrl);
                dataSource.setUsername(defaultUsername);
                dataSource.setPassword(defaultPassword);
            } else {
                // Sinon, parser l'URL de Render (format: postgres://user:password@host:port/database)
                URI uri = new URI(databaseUrl);
                
                String host = uri.getHost();
                int port = uri.getPort() != -1 ? uri.getPort() : 5432;
                String database = uri.getPath().substring(1); // Enlever le "/"
                
                String userInfo = uri.getUserInfo();
                String[] credentials = userInfo.split(":");
                String username = credentials[0];
                String password = credentials[1];
                
                // Construire l'URL JDBC
                String jdbcUrl = "jdbc:postgresql://" + host + ":" + port + "/" + database;
                
                dataSource.setJdbcUrl(jdbcUrl);
                dataSource.setUsername(username);
                dataSource.setPassword(password);
            }
            
            dataSource.setDriverClassName("org.postgresql.Driver");
            
        } catch (Exception e) {
            throw new RuntimeException("Erreur de configuration de la base de données: " + e.getMessage(), e);
        }
        
        return dataSource;
    }
}
