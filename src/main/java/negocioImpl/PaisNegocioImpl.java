package negocioImpl;

import java.util.List;

import dao.PaisDao;
import daoImpl.PaisDaoImpl;
import entidad.Pais;
import negocio.PaisNegocio;

public class PaisNegocioImpl implements PaisNegocio {

	PaisDao pDao = new PaisDaoImpl();

	public boolean insert(Pais pais) {

		boolean estado = false;
		estado = pDao.Insert(pais);
		
		return estado;
	}
	
	public boolean update(Pais pais) {

		boolean estado = false;
		estado = pDao.Update(pais);
		
		return estado;
	}

	public boolean logicalDeletion(Pais pais_a_eliminar) {
		boolean estado = false;
		try {
			if (pais_a_eliminar.getCodPais() > 0) {
				estado = pDao.EliminacionLogica(pais_a_eliminar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return estado;
	}


	public List<Pais> readAll() {

		List<Pais> lPaises;
		lPaises = pDao.BuscarTodos();
		return lPaises;
	}


	public int readLast() {
		System.out.print(pDao.Buscarultimo());
		return pDao.Buscarultimo();
	}


}