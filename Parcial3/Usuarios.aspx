<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Parcial3.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Usuarios</h1>
    <table class="auto-style1">
        <tr>
            <td>
                <p>
                    Correo:
                    <asp:TextBox ID="tCorreo" runat="server"></asp:TextBox>
                </p>
                <p>
                    Contraseña:<asp:TextBox ID="tClave" runat="server" TextMode="Password"></asp:TextBox>
                </p>
                <p>
                    Nombre:<asp:TextBox ID="tNombre" runat="server"></asp:TextBox>
                </p>
                <p>
                    Apellido:<asp:TextBox ID="tApellido" runat="server"></asp:TextBox>
                </p>
                <p>
                    ID del usuario a Borrar:
                    <asp:TextBox ID="tIDUsuario" runat="server"></asp:TextBox>
                </p>
                <p>
                    <asp:Button ID="bIngresar" class="button button4" runat="server" Text="Ingresar" OnClick="bIngresar_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="bBorrar" class="button button4" runat="server" Text="Borrar" OnClick="bBorrar_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="bModificar" class="button button4" runat="server" Text="Modificar" OnClick="bModificar_Click" />
                </p>
            </td>
            <td>
                <asp:GridView ID="GridView1" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" runat="server">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
