
package Config;

import java.sql.*;

public class Conexion {
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Empleados;","sa","123");
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: \n"+e.getClass()+"\n"+e.getMessage());
        }
    }
    public Connection getConnection(){
        return con;
    }
}
