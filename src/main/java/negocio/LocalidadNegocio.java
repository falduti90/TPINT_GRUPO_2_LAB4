package negocio;

import java.util.List;

import entidad.Localidad;

public interface LocalidadNegocio {
	
	public boolean Insert(Localidad localidad_a_agregar);

	public boolean EliminacionLogica(Localidad localidad_a_eliminar);  // Baja lógica

	public boolean Update(Localidad localidad_a_modificar);

	public List<Localidad> BuscarTodas();
	
	public Localidad BuscarUna(int codLocalidad);
	
	public int BuscarUltima();

}
