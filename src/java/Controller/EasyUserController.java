package Controller;

import Model.EasyUser;
import Util.Conexion;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UserController")
public class EasyUserController extends HttpServlet {

    /**
     * Método que maneja las solicitudes GET.
     * Dependiendo de la acción, puede listar los usuarios o mostrar los detalles de un usuario.
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (!"list".equals(action)) if ("view".equals(action)) {
            // Llamada para ver los detalles de un usuario específico
            int id = Integer.parseInt(request.getParameter("id"));
            viewUser(request, response, id);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        } else {
            // Llamada para listar todos los usuarios
            listUsers(request, response);
        }
    }

    /**
     * Método que maneja las solicitudes POST.
     * Dependiendo de la acción, puede crear, actualizar o eliminar un usuario.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (null == action) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        } else switch (action) {
            case "create":
                // Llamada para crear un nuevo usuario
                createUser(request, response);
                break;
            case "update":
                // Llamada para actualizar un usuario existente
                updateUser(request, response);
                break;
            case "delete":
                // Llamada para eliminar un usuario
                deleteUser(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
                break;
        }
    }

    /**
     * Método que lista todos los usuarios desde la base de datos.
     * Obtiene todos los usuarios y los coloca como atributo en la solicitud para mostrar en una vista.
     */
    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = Conexion.getInstance().getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM easy_users")) {

            // Extrae los datos de cada usuario y los agrega como atributo
            while (rs.next()) {
                EasyUser user = new EasyUser(
                    rs.getInt("id"),
                    rs.getInt("document"),
                    rs.getString("name"),
                    rs.getString("surnames"),
                    rs.getString("email"),
                    rs.getString("email_verified_at"),
                    rs.getString("password"),
                    rs.getString("image"),
                    rs.getString("telefono"),
                    rs.getString("remember_token"),
                    rs.getString("device_ip"),
                    rs.getDate("created_at"),
                    rs.getDate("updated_at")
                );
                request.setAttribute("users", user);  // Asigna el usuario a la solicitud
            }
        } catch (SQLException e) {
        }
        // Redirige a la vista que muestra la lista de usuarios
        request.getRequestDispatcher("/userList.jsp").forward(request, response);
    }

    /**
     * Método que muestra los detalles de un usuario específico.
     * Recibe el ID del usuario y obtiene sus datos desde la base de datos.
     */
    private void viewUser(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException {
        try (Connection conn = Conexion.getInstance().getConnection()) {
            String query = "SELECT * FROM easy_users WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, id);  // Establece el parámetro para el ID del usuario
                ResultSet rs = stmt.executeQuery();

                // Si se encuentra el usuario, lo asigna como atributo para la vista
                if (rs.next()) {
                    EasyUser user = new EasyUser(
                        rs.getInt("id"),
                        rs.getInt("document"),
                        rs.getString("name"),
                        rs.getString("surnames"),
                        rs.getString("email"),
                        rs.getString("email_verified_at"),
                        rs.getString("password"),
                        rs.getString("image"),
                        rs.getString("telefono"),
                        rs.getString("remember_token"),
                        rs.getString("device_ip"),
                        rs.getDate("created_at"),
                        rs.getDate("updated_at")
                    );
                    request.setAttribute("user", user);  // Asigna el usuario a la solicitud
                    request.getRequestDispatcher("/userDetail.jsp").forward(request, response);  // Redirige a la vista de detalles del usuario
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Método que maneja la creación de un nuevo usuario.
     * Recibe los datos desde el formulario y los inserta en la base de datos.
     */
    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EasyUser user = new EasyUser();
        // Establece los valores del nuevo usuario
        user.setDocument(Integer.parseInt(request.getParameter("document")));
        user.setName(request.getParameter("name"));
        user.setSurnames(request.getParameter("surnames"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setTelefono(request.getParameter("telefono"));

        try (Connection conn = Conexion.getInstance().getConnection()) {
            String query = "INSERT INTO easy_users (document, name, surnames, email, password, telefono) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                // Establece los parámetros para la consulta
                stmt.setInt(1, user.getDocument());
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getSurnames());
                stmt.setString(3, user.getEmail());
                stmt.setString(4, user.getPassword());
                stmt.setString(5, user.getTelefono());
                stmt.executeUpdate();  // Ejecuta la inserción en la base de datos
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Redirige a la acción de listar usuarios después de la creación
        response.sendRedirect("UserController?action=list");
    }

    /**
     * Método que maneja la actualización de un usuario existente.
     * Recibe el ID del usuario y los nuevos valores desde el formulario para actualizarlo en la base de datos.
     */
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        EasyUser user = new EasyUser();
        // Establece los valores del usuario para actualizar
        user.setName(request.getParameter("name"));
        user.setSurnames(request.getParameter("surnames"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setTelefono(request.getParameter("telefono"));

        try (Connection conn = Conexion.getInstance().getConnection()) {
            String query = "UPDATE easy_users SET name = ?, surnames = ?, email = ?, password = ?, telefono = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                // Establece los parámetros para la consulta
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getSurnames());
                stmt.setString(3, user.getEmail());
                stmt.setString(4, user.getPassword());
                stmt.setString(5, user.getTelefono());
                stmt.setInt(6, id);  // Establece el ID del usuario a actualizar
                stmt.executeUpdate();  // Ejecuta la actualización en la base de datos
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Redirige a la acción de listar usuarios después de la actualización
        response.sendRedirect("UserController?action=list");
    }

    /**
     * Método que maneja la eliminación de un usuario.
     * Recibe el ID del usuario y lo elimina de la base de datos.
     */
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = Conexion.getInstance().getConnection()) {
            String query = "DELETE FROM easy_users WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                // Establece el ID del usuario a eliminar
                stmt.setInt(1, id);
                stmt.executeUpdate();  // Ejecuta la eliminación en la base de datos
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Redirige a la acción de listar usuarios después de la eliminación
        response.sendRedirect("UserController?action=list");
    }
}
