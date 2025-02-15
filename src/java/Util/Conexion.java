package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private static Conexion instance;
    private Connection connection;

    private static final String URL = "jdbc:mysql://localhost:3306/easyshopping?useSSL=false&serverTimezone=UTC";
    private static final String USER = "romerome92";
    private static final String PASSWORD = "rromero92";

    private Conexion() throws SQLException {
        try {
            // Registrar el driver manualmente
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontró el driver JDBC de MySQL.", e);
        } catch (SQLException e) {
            throw new SQLException("Error al conectar con la base de datos: " + e.getMessage(), e);
        }
    }

    public static Conexion getInstance() throws SQLException {
        if (instance == null || instance.connection == null || instance.connection.isClosed()) {
            instance = new Conexion();
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.err.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}
