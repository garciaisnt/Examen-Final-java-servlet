<jsp:include page="../content/header.jsp" />
<%@page import="Modelo.Departamento"%>
<%@page import="ModeloDAO.DepartamentoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>


<div class="container">
    <h1 class="m-3">Departamentos</h1>
    <hr>    
    <br>
    <a href="listaRegistro.jsp" class="btn btn-primary">Reporte de Empleados</a>
    <br>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Nombre Departamento</th>                
                <th class="text-center">Acciones</th>
            </tr>
        </thead>
        
        <%
            DepartamentoDAO dao = new DepartamentoDAO();
            List<Departamento> list = dao.Listar();
            Iterator<Departamento> iter = list.iterator();
            Departamento _dep = null;
            while (iter.hasNext()) {
                _dep = (Departamento) iter.next();
        %> 
        <tbody>
            <tr>
                <td class="text-center"><%= _dep.getId()%></td>
                <td class="text-center"><%= _dep.getNomDepa()%></td>                                       
                <td class="text-center">                    
                    <a class="btn btn-outline-primary" href="ListaEmpleados.jsp?idDepa=<%= _dep.getId()%>">Seleccionar</a>                    
                </td>
            </tr>
            <%}%>
        </tbody>
    </table>
        
        
</div>
<jsp:include page="../content/footer.jsp" />