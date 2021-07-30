package Interface;

import Modelo.Empleado;
import java.util.List;

public interface EmpleadoInterface {
    
    public List<Empleado> ListarPorIdDepartamento(int Id);
    public Empleado EmpleadoPorId(int Id);
    public int Agregar(Empleado _emp);
    public int Editar(Empleado _emp);
    public int Eliminar(int id);
    
}
