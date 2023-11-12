package entidad;

public class Usuario {
	
	private String usuario;
	private Cliente cliente;
	private TipoUsuario tipoUsuario;
	private String contrase�a;
	private boolean estado;

	public Usuario() { 
		this.cliente = new Cliente();
		this.tipoUsuario = new TipoUsuario();
	}

	public Usuario(String usuario, Cliente cliente, TipoUsuario tipoUsuario, String contrase�a, boolean estado) {
		this.cliente = new Cliente();
		this.tipoUsuario = new TipoUsuario();
		this.usuario = usuario;
		this.cliente = cliente;
		this.tipoUsuario = tipoUsuario;
		this.contrase�a = contrase�a;
		this.estado = estado;
	}
	
	public Usuario(String usuario, String dni, String contrase�a) {
		this.cliente = new Cliente();
		this.tipoUsuario = new TipoUsuario();
		this.usuario = usuario;
		this.cliente.setDni(dni);
		this.contrase�a = contrase�a;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public Cliente getcliente() {
		return cliente;
	}
	
	public String getDni() {
		return this.cliente.getDni();
	}
	
	public void setDNI(String dni) {
		this.cliente.setDni(dni);
	}

	public void setcliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario =  tipoUsuario;
	}

	public String getContrase�a() {
		return contrase�a;
	}

	public void setContrase�a(String contrase�a) {
		this.contrase�a = contrase�a;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Usuario [usuario=" + usuario + ", cliente=" + cliente.toString() + ", tipoUsuario=" + tipoUsuario + ", contrase�a="
				+ contrase�a + ", estado=" + estado + "]";
	}
	
}
