using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Parcial3.Clases;

namespace Parcial3
{
    public partial class Placas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }
        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["VehiculosConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ConsultaPlaca"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            ClsPlaca.idPlaca = tIDPlaca.Text;

            ClsPlaca.Borrar(ClsPlaca.idPlaca);

            LlenarGrid();

            tNumPlaca.Text = "";
            tIDUsuario.Text = "";
            tMonto.Text = "";
            tIDPlaca.Text = "";
        }

        protected void bIngresar_Click(object sender, EventArgs e)
        {
            ClsPlaca.numPlaca = tNumPlaca.Text;
            ClsPlaca.idUsuario  = tIDUsuario.Text;
            ClsPlaca.monto = int.Parse(tMonto.Text);

            ClsPlaca.Agregar(ClsPlaca.numPlaca, ClsPlaca.idUsuario, ClsPlaca.monto);

            LlenarGrid();

            tNumPlaca.Text = "";
            tIDUsuario.Text = "";
            tMonto.Text = "";
            tIDPlaca.Text = "";
        }

        protected void bModificar_Click(object sender, EventArgs e)
        {
            ClsPlaca.numPlaca = tNumPlaca.Text;
            ClsPlaca.idUsuario = tIDUsuario.Text;
            ClsPlaca.monto = int.Parse(tMonto.Text);
            ClsPlaca.idPlaca= tIDPlaca.Text;

            ClsPlaca.Modificar(ClsPlaca.numPlaca, ClsPlaca.idUsuario, ClsPlaca.monto, ClsPlaca.idPlaca);

            LlenarGrid();

            tNumPlaca.Text = "";
            tIDUsuario.Text = "";
            tMonto.Text = "";
            tIDPlaca.Text = "";
        }
    }
}