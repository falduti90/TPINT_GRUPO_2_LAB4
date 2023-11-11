package negocioImpl;

import java.util.List;

import daoImpl.PrestamosDaoImpl;
import entidad.Cuota;
import entidad.Prestamo;
import negocio.PrestamosNegocio;

public class PrestamosNegocioImpl implements PrestamosNegocio{
	PrestamosDaoImpl prestamos = new PrestamosDaoImpl();
	public List<Prestamo> readAllDni(String dni){
		return prestamos.BuscarDni(dni);
	}
	
	public List<Cuota> getCuotas(int codPrestamo){
		return prestamos.ObtenerCuota(codPrestamo);
	}
}
