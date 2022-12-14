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
    public partial class Usuarios : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("ConsultaUsuarios"))
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

        protected void bIngresar_Click(object sender, EventArgs e)
        {
            ClsUsuario.email = tCorreo.Text;
            ClsUsuario.clave = tClave.Text;
            ClsUsuario.nombreU = tNombre.Text;
            ClsUsuario.apellido = tApellido.Text;

            ClsUsuario.Agregar(ClsUsuario.email, ClsUsuario.clave, ClsUsuario.nombreU, ClsUsuario.apellido);

            LlenarGrid();

            tNombre.Text = "";
            tApellido.Text = "";
            tCorreo.Text = "";
            tIDUsuario.Text = "";
        }

        protected void bBorrar_Click(object sender, EventArgs e)
        {
            ClsUsuario.idUsuario= tIDUsuario.Text;

            ClsUsuario.Borrar(ClsUsuario.idUsuario);

            LlenarGrid();

            tNombre.Text = "";
            tApellido.Text = "";
            tCorreo.Text = "";
            tIDUsuario.Text = "";
        }

        protected void bModificar_Click(object sender, EventArgs e)
        {
            ClsUsuario.email = tCorreo.Text;
            ClsUsuario.clave = tClave.Text;
            ClsUsuario.nombreU = tNombre.Text;
            ClsUsuario.apellido = tApellido.Text;

            ClsUsuario.Modificar(ClsUsuario.email, ClsUsuario.clave, ClsUsuario.nombreU, ClsUsuario.apellido);

            LlenarGrid();

            tNombre.Text = "";
            tApellido.Text = "";
            tCorreo.Text = "";
            tIDUsuario.Text = "";
        }
    }
}