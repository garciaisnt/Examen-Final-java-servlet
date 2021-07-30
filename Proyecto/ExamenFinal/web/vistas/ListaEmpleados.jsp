<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<%@page import="Modelo.Empleado"%>
<jsp:include page="../content/header.jsp" />



<div class="container">
    <br>

    <div class="row">

        <h1 class="h1"><a class="btn btn-outline-danger btn-lg" href="javascript: history.go(-1)" ><</a>&nbsp;Empleados</h1>
        <div>
            <a class="btn btn-primary" href="add.jsp?idDepa=<%= request.getParameter("idDepa")%>">
                Agregar
            </a>
        </div>

    </div>


    <hr>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Nombres </th> 
                <th class="text-center">Apellidos </th>  
                <th class="text-center">Acciones</th>
            </tr>
        </thead>

        <%
            EmpleadoDAO dao = new EmpleadoDAO();
            List<Empleado> list = dao.ListarPorIdDepartamento(Integer.parseInt(request.getParameter("idDepa"))); //Aqui se selecciona el Id de la url
            Iterator<Empleado> iter = list.iterator();
            Empleado _emp = null;
            while (iter.hasNext()) {
                _emp = (Empleado) iter.next();
        %> 
        <tbody>
            <tr>
                <td class="text-center"><%= _emp.getId()%></td>
                <td class="text-center"><%= _emp.getNombres()%></td>
                <td class="text-center"><%= _emp.getApellidos()%></td> 
                <td class="text-center">                    
                    <a class="btn btn-outline-primary" href="edit.jsp?idDepa=<%= request.getParameter("idDepa")%>&id=<%= _emp.getId()%>"><Seleccionar>Editar</Seleccionar></a>
                    <a class="btn btn-outline-danger" href="../EmpleadoControlador?accion=Eliminar&idDepa=<%= request.getParameter("idDepa")%>&id=<%= _emp.getId()%>">Eliminar</a>
                </td>
            </tr>
            <%}%>
        </tbody>
    </table>





</div>




<jsp:include page="../content/footer.jsp" />
