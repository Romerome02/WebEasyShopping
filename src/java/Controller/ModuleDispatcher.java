package Controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ModuleDispatcher")
public class ModuleDispatcher extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        redirectModule(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        redirectModule(request, response);
    }

    public static void redirectModule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String module = request.getParameter("modulo");

        // Handle null or empty module gracefully
        if (module == null || module.isEmpty()) {
            module = "home";
        }

        String page = getPage(module);

        if (page == null) {
            response.sendRedirect(request.getContextPath() + "/View/error.jsp");
            return;
        }

        request.setAttribute("modulo", module);
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }

    private static String getPage(String module) {
        switch (module) {
            case "estantes":
                return "/View/shelves.jsp";
            case "categorias":
                return "/View/categorias.jsp";
            case "productos":
                return "/View/productos.jsp";
            case "home":
                return "/View/home.jsp";
            default:
                return null;  // Si el módulo no es válido, devolvemos null
        }
    }
}
