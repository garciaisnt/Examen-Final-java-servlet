package ModeloDAO;

import Config.Conexion;
import Interface.EmpleadoInterface;
import Modelo.Departamento;
import Modelo.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO implements EmpleadoInterface{

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;  
    int filaInsertada;
    
    @Override
    public List<Empleado> ListarPorIdDepartamento(int Id) {
        ArrayList<Empleado> List = new ArrayList<>();
        String sql = "SELECT * FROM Empleados WHERE IdDepartamento = ?;";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, Id);
            rs = ps.executeQuery();            

            while (rs.next()) {
                Empleado _emp = new Empleado();
                _emp.setId(rs.getInt("Id"));
                _emp.setNombres(rs.getString("Nombres"));
                _emp.setApellidos(rs.getString("Apellidos"));
                _emp.setDireccion(rs.getString("Direccion"));
                _emp.setIdDepartamento(rs.getInt("IdDepartamento"));
                List.add(_emp);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return List;
    }

    @Override
    public Empleado EmpleadoPorId(int Id) {
        Empleado _empleado = new Empleado();
        String sql = "SELECT * FROM Empleados WHERE Id = ?;";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, Id);
            rs = ps.executeQuery();            

            while (rs.next()) {                
                _empleado.setId(rs.getInt("Id"));
                _empleado.setNombres(rs.getString("Nombres"));
                _empleado.setApellidos(rs.getString("Apellidos"));
                _empleado.setDireccion(rs.getString("Direccion"));
                _empleado.setIdDepartamento(rs.getInt("IdDepartamento"));
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return _empleado;
    }

    @Override
    public int Agregar(Empleado _emp) {
        
        try {                        
            String sql = "INSERT INTO Empleados(Nombres, Apellidos, Direccion, IdDepartamento) VALUES( ?, ?, ?, ?);";
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, _emp.getNombres());
            ps.setString(2, _emp.getApellidos());
            ps.setString(3, _emp.getDireccion());
            ps.setInt(4, _emp.getIdDepartamento());
            filaInsertada = ps.executeUpdate();    
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return filaInsertada;
    }

    @Override
    public int Editar(Empleado _emp) {
        try {                        
            String sql = "UPDATE Empleados SET Nombres = ?, Apellidos = ?, Direccion = ?, IdDepartamento = ? WHERE Id = ?;";
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, _emp.getNombres());
            ps.setString(2, _emp.getApellidos());
            ps.setString(3, _emp.getDireccion());
            ps.setInt(4, _emp.getIdDepartamento());
            ps.setInt(5, _emp.getId());
            filaInsertada = ps.executeUpdate();   
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return filaInsertada;
    }

    @Override
    public int Eliminar(int Id) {
        try {                        
            String sql = "DELETE FROM Empleados WHERE Id = ?;";
            con = cn.getConnection();
            ps = con.prepareStatement(sql);         
            ps.setInt(1, Id);
            filaInsertada = ps.executeUpdate();   
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return filaInsertada;
    }
    
    
    
}
