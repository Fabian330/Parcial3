using Parcial3.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bIngresar_Click(object sender, EventArgs e)
        {
            ClsUsuario.email = tCorreo.Text;
            ClsUsuario.clave = tClave.Text;

            if (ClsUsuario.ValidarLogin(ClsUsuario.email, ClsUsuario.clave) > 0)
            {
                    Response.Redirect("Inicio.aspx");
            }
            else
            {
                lMensaje.Text = "Usuario o contraseña incorrecto";
            }
        }
    }
}