package Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;

public class MigratePass {
    public static void main(String[] args) {
        try (Connection connection = Conexion.getInstance().getConnection()) {
            String sqlSelect = "SELECT email, password FROM easy_users";
            String sqlUpdate = "UPDATE easy_users SET password = ? WHERE email = ?";

            try (PreparedStatement selectStmt = connection.prepareStatement(sqlSelect);
                 ResultSet resultSet = selectStmt.executeQuery()) {
                while (resultSet.next()) {
                    String email = resultSet.getString("email");
                    String plainPassword = resultSet.getString("password");

                    // Validar si la contraseña es NULL o ya está en formato BCrypt
                    if (plainPassword == null || plainPassword.isEmpty() || plainPassword.startsWith("$2a$")) {
                        System.out.println("Saltando usuario: " + email + " (ya migrado o inválido)");
                        continue; // Saltar usuarios con contraseñas vacías o ya encriptadas
                    }

                    // Usar gensalt(10) explícitamente para evitar problemas con la versión de GlassFish
                    String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt(10));

                    try (PreparedStatement updateStmt = connection.prepareStatement(sqlUpdate)) {
                        updateStmt.setString(1, hashedPassword);
                        updateStmt.setString(2, email);
                        updateStmt.executeUpdate();
                        System.out.println("Contraseña migrada para usuario: " + email);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
