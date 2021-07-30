<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page import="Config.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con;
    Conexion conex = new Conexion();
    con = conex.getConnection();
    ServletContext context = request.getServletContext();
    File reporte = new File(context.getRealPath("/") + "vistas/EmpleadosList.jasper");
    Map parametro = new HashMap();
    byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametro, con);
    response.setContentType("application/PDF");
    response.setContentLength(bytes.length);
    ServletOutputStream Salida = response.getOutputStream();
    Salida.write(bytes, 0, bytes.length);
    Salida.flush();
    Salida.close();
%>