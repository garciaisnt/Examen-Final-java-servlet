package Controlador;

import Modelo.Empleado;
import ModeloDAO.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmpleadoControlador extends HttpServlet {

    EmpleadoDAO dao = new EmpleadoDAO();
    Empleado _emp = new Empleado();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String acceso = "";
        String action = request.getParameter("accion");

        String nombres, apellidos, direccion;
        int id, idDepartamento;

        switch (action) {
            case "Agregar": {
                nombres = request.getParameter("txtNombres");
                apellidos = request.getParameter("txtApellidos");
                direccion = request.getParameter("txtDireccion");
                idDepartamento = Integer.parseInt(request.getParameter("txtIdDepartamento"));

                _emp.setNombres(nombres);
                _emp.setApellidos(apellidos);
                _emp.setDireccion(direccion);
                _emp.setIdDepartamento(idDepartamento);
                try {
                    dao.Agregar(_emp);
                } catch (Exception e) {
                    System.out.println(e);
                }
                response.sendRedirect(request.getContextPath() + "/vistas/listar.jsp?idDepa=" + idDepartamento);
            }
            break;
            case "Eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                idDepartamento = Integer.parseInt(request.getParameter("idDepa"));
                dao.Eliminar(id);
                response.sendRedirect(request.getContextPath() + "/vistas/listar.jsp?idDepa=" + idDepartamento);
                break;
            case "Editar": {
                id = Integer.parseInt(request.getParameter("txtId"));
                nombres = request.getParameter("txtNombres");
                apellidos = request.getParameter("txtApellidos");
                direccion = request.getParameter("txtDireccion");
                idDepartamento = Integer.parseInt(request.getParameter("txtIdDepartamento"));

                _emp.setId(id);
                _emp.setNombres(nombres);
                _emp.setApellidos(apellidos);
                _emp.setDireccion(direccion);
                _emp.setIdDepartamento(idDepartamento);
                dao.Editar(_emp);
                response.sendRedirect(request.getContextPath() + "/vistas/listar.jsp?idDepa=" + idDepartamento);
            }
            break;
        }

        //RequestDispatcher vista = request.getRequestDispatcher(acceso);
        //vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String acceso = "";
        String action = request.getParameter("accion");

        String nombres, apellidos, direccion;
        int id, idDepartamento;

        switch (action) {
            case "listar":
                acceso = "vistas/listar.jsp";
                break;
            case "add":
                acceso = "vistas/add.jsp";
                break;
            case "editar":
                request.setAttribute("id", request.getParameter("id"));
                acceso = "vistas/edit.jsp";
                break;

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
