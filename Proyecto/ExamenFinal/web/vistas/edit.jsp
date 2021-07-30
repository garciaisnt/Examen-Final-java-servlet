<%@page import="Modelo.Empleado"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<jsp:include page="../content/header.jsp" />
<div class="container">
    
   

    <br>
    <h1>Editar Empleado</h1>
    <hr>
    
    <form action="../EmpleadoControlador" method="GET">
        <input type="hidden" id="txtIdDepartamento" name="txtIdDepartamento" value = "<%=request.getParameter("idDepa")%>"> <!--Al departamento que se va agregar-->
        
        <input type="hidden" id="txtId" name="txtId" value = "<%=request.getParameter("id")%>">
        
        <%
            EmpleadoDAO dao = new EmpleadoDAO();
            
            Empleado _emp = dao.EmpleadoPorId(Integer.parseInt(request.getParameter("id")));
        %>
        
        <div class="mb-3">
    <label for="txtNombres" class="form-label">Nombres: </label>
            <input type="text" class="form-control" id="txtNombres" required autocomplete="off" name="txtNombres" value="<%=_emp.getNombres()%>">            
        </div>
        <div class="mb-3">
            <label for="txtApellidos" class="form-label">Apellidos:</label>
            <input type="text" class="form-control" id="txtApellidos" required autocomplete="off" name="txtApellidos" value="<%=_emp.getApellidos()%>">            
        </div>
        <div class="mb-3">
            <label for="txtDireccion" class="form-label">Direccion: </label><br>
            <input type="text" class="form-control" id="txtDireccion" required autocomplete="off" name="txtDireccion" value="<%=_emp.getDireccion()%>">
        </div>
        
        <input type="submit" value="Editar" name="accion" class="btn btn-success">
        <a class="btn btn-outline-danger" href="javascript: history.go(-1)" >Regresar</a>        
        
    </form>

</div>

<jsp:include page="../content/footer.jsp" />