using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; //permite usar tablas dataset

public partial class _Default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
    

    }



    private void limpiar()
    {
        txt_rut.Text = "";
        txt_rut.Enabled = true;
        txt_nom.Enabled = true;
        txt_nom.Text = "";
        txt_fono.Text = "";
        cbo_ciudad.SelectedIndex = -1;
    }
    protected void btn_limpiar_Click(object sender, EventArgs e)
    {
        limpiar();
    }

    protected void btn_enviar_Click(object sender, EventArgs e)
    {
        ClaseConexionBD en = new ClaseConexionBD();
        int ciuu;

        ciuu = int.Parse(cbo_ciudad.SelectedValue.ToString());
        en.guardar(txt_rut.Text, txt_nom.Text, txt_fono.Text, ciuu);
        GridView1.DataBind();//actualizar
        mensaje.Text = "Registrado OK";
        limpiar();
    }

    protected void btn_actualizar_Click(object sender, EventArgs e)
    {
        ClaseConexionBD actualiza = new ClaseConexionBD();
        int ciu;
        ciu = int.Parse(cbo_ciudad.SelectedValue.ToString());
        actualiza.actualizar(txt_rut.Text,txt_nom.Text, txt_fono.Text, ciu);
        GridView1.DataBind();//actualizar
        mensaje.Text = "Registro Actualizado";
        limpiar();
    }

    protected void btn_delete_Click(object sender, EventArgs e)
    {
        ClaseConexionBD borra = new ClaseConexionBD();

        borra.eliminar(txt_rut.Text);
        mensaje.Text = "Elemento Borrado";
        GridView1.DataBind();
        limpiar();
    }


    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        ClaseConexionBD busca = new ClaseConexionBD();

        DataSet dset;
        dset = busca.BuscarxRut(txt_rut.Text);
        if (dset.Tables.Count > 0)
        {
            if (dset.Tables[0].Rows.Count > 0)
            {
                txt_rut.Text = dset.Tables[0].Rows[0][0].ToString();
                txt_nom.Text = dset.Tables[0].Rows[0][1].ToString();
                txt_fono.Text = dset.Tables[0].Rows[0][2].ToString();
                cbo_ciudad.Text = dset.Tables[0].Rows[0][3].ToString();
                //cbo_ciudad.DataBind();
                txt_rut.Enabled = false;
                txt_nom.Enabled = false;
                mensaje.Text = "Registro encontrado";
            }
            else
            {
                mensaje.Text = "Registro no encontrado";
            }
        }
        //mensaje.Text
    }

    protected void ver_gw_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }


    protected void btn_chart_Click(object sender, EventArgs e)
    {
        Chart1.Visible = true;
    }
}