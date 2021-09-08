<?php namespace Models;
ini_set("display_errors","1");
error_reporting(E_ALL);
	class M_Distritos{
		// Atributos o Propiedades

		private $id_distrito;
		private $distrito;
		private $id_pais;
		private $con;


		// Metodos
		//Metodo Constructor

		
		public function __construct(){
			$this->con = new Conexion();
		}

		// Metodos SET y GET
		public function set($atributo, $valor){
			$this->$atributo = $valor;
		}

		public function get($atributo){
			return $this->$atributo;
		}

		//Metodo para probar que funciona
		public function hola(){
			echo "Hola soy el Model de la tabla Distritos";
		}

	
		// Metodos CRUDS

		
		//CREATE
		public function add(){
			$sql = "CALL distritos_insertar('{$this->id_pais}','{$this->distrito}'	)";
			$datos=$this->con->consultaSimple($sql);
			$this->con->desconectar();			
		}

		//READ all
		public function lists(){
			$sql = "CALL distritos_mostrar";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			return $datos;						
		} 
		
		//UPDATE
		public function edit(){
			$sql = "CALL distritos_renombrar('{$this->id_distrito}','{$this->distrito}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//DELETE
		public function delete(){
			$sql = "CALL distritos_eliminar('{$this->id_distrito}')";
			$this->con->consultaSimple($sql);
			$this->con->desconectar();
		}

		//SHOW
		public function view(){
			$sql = "CALL distritos_buscar('{$this->id_distrito}')";
			$datos = $this->con->consultaRetorno($sql);
			$this->con->desconectar();
			$row = mysqli_fetch_assoc($datos);			
			return $row;
		}

	}
?>