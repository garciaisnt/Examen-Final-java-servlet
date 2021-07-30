package ModeloDAO;

import Config.Conexion;
import Interface.DepartamentoInterface;
import Modelo.Departamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartamentoDAO implements DepartamentoInterface {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;    
    
    @Override
    public List<Departamento> Listar() {
        ArrayList<Departamento> List = new ArrayList<>();
        String sql = "SELECT * FROM Departamentos;";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Departamento _dep = new Departamento();
                _dep.setId(rs.getInt("Id"));
                _dep.setNomDepa(rs.getString("NomDepa"));
                List.add(_dep);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return List;
    }
    
}
