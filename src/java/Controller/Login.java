package Controller;

import Model.EasyUser;
import Util.Conexion;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    private static final Logger logger = Logger.getLogger(Login.class.getName()); // Definir el logger correctamente

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Por favor, ingrese usuario y contraseña.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;// Se agrega esta línea para evitar continuar con la validación
        }

        EasyUser usuario = validateUser(email, password);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario); // // Guarda el objeto EasyUser en la sesión           
            request.getRequestDispatcher("View/home.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("View/home.jsp"); // O la página donde quieres que inicie
    }

    public static String getUsernameFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        EasyUser usuario = (EasyUser) session.getAttribute("usuario");

        if (usuario != null) {
            return usuario.getName(); // Retorna el nombre del usuario
        } else {
            return "Invitado"; // Manejo en caso de que no haya sesión activa
        }
    }

    private EasyUser validateUser(String email, String password) {
        EasyUser usuario = null; // Inicializa la variable como null

        try (Connection connection = Conexion.getInstance().getConnection()) {
            if (connection == null) {
                logger.severe("No se pudo establecer conexión con la base de datos.");
                return null;
            }

            String sql = "SELECT id, document, name, surnames, email, email_verified_at, password, image, telefono, remember_token, device_ip, created_at, updated_at FROM easy_users WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String storedPassword = resultSet.getString("password");

                        // Comparar con BCrypt
                        if (BCrypt.checkpw(password, storedPassword)) {
                            usuario = new EasyUser(
                                    resultSet.getInt("id"),
                                    resultSet.getInt("document"),
                                    resultSet.getString("name"),
                                    resultSet.getString("surnames"),
                                    resultSet.getString("email"),
                                    resultSet.getString("email_verified_at"),
                                    resultSet.getString("password"),
                                    resultSet.getString("image"),
                                    resultSet.getString("telefono"),
                                    resultSet.getString("remember_token"),
                                    resultSet.getString("device_ip"),
                                    resultSet.getTimestamp("created_at"),
                                    resultSet.getTimestamp("updated_at")
                            );
                        }
                    }
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error en la base de datos", e);
            //request.setAttribute("error", "Error en el sistema, intente más tarde.");
            //request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
        return usuario; // Devuelve un EasyUser o null si el usuario no existe.
    }
}
