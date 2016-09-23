using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient; //provveddor de ado.net
using System.Configuration; //para utitlizar web config
using System.Data; //para poder utilizar dataset s

public class ClaseConexionBD
{
    public SqlConnection conexion; //atributos publicos para crear cadena de conexion
    public SqlCommand comando; //atributos publicos para ejecutar insert,udate,delete
    //public SqlDataReader dr; //atributos publicos para leer datos de bd
    public SqlDataAdapter da;//atributos publicos para Select
    public DataSet dset;

	public ClaseConexionBD()
	{
        conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["ejemploConnectionString1"].ConnectionString);
	}

    public void guardar(String rutt, String nomm, String tell, int ciuu) //metodo insertar
    {
        //agrgar un try
        String insert = "insert into usuario(rut,nombre,telefono,ciudad) values('" + rutt + "','" + nomm + "','" + tell + "'," + ciuu + ")";
        ejecutar(insert);
    }

    public void actualizar(String rut,String nombre, String telefono, int ciudad) //metodo Actualizar
    {
        String update = "update usuario set rut='"+rut+"',nombre='"+nombre+"', telefono='" + telefono + "',ciudad=" + ciudad + " where rut='" + rut + "' ";
        ejecutar(update);
    }

    public void eliminar(String rut) //Metodo Eliminar
    {
        String delete = "delete from usuario where rut='" + rut + "' ";
        ejecutar(delete);
    }

    public DataSet BuscarxRut(String rut) // metodo Select el mas dficil
    {
        dset = new DataSet();
        ClaseConexionBD con = new ClaseConexionBD();
        con.conexion.Open();
        String select = "select * from usuario where rut='" + rut + "'";
        da = new SqlDataAdapter(select, con.conexion);
        da.Fill(dset);
        con.conexion.Close();
        return dset;
    }

    private void ejecutar(String cadenaSQL) //metodo ejecutar comun para insert,udate,delete
    {
        //agrgar un try
        ClaseConexionBD con = new ClaseConexionBD();
        con.conexion.Open();
        con.comando = new SqlCommand(cadenaSQL, con.conexion);
        con.comando.ExecuteNonQuery();
        con.conexion.Close();
    }

}