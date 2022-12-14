<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Placas.aspx.cs" Inherits="Parcial3.Placas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Placas</h1>
    <table class="auto-style1">
        <tr>
            <td>Numero de placa:
                <asp:TextBox ID="tNumPlaca" runat="server"></asp:TextBox>
                <br />
                <br />
                ID del usuario:
                <asp:TextBox ID="tIDUsuario" runat="server"></asp:TextBox>
                <br />
                <br />
                Monto:
                <asp:TextBox ID="tMonto" runat="server"></asp:TextBox>
                <br />
                <br />
                ID de la placa a Borrar/Modificar:
                <asp:TextBox ID="tIDPlaca" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="bIngresar" class="button button4" runat="server" Text="Ingresar" OnClick="bIngresar_Click" />
&nbsp;&nbsp;
                <asp:Button ID="bBorrar" class="button button4" runat="server" Text="Borrar" OnClick="bBorrar_Click" />
&nbsp;&nbsp;
                <asp:Button ID="bModificar" class="button button4" runat="server" Text="Modificar" OnClick="bModificar_Click" />
            </td>
            <td>
                <asp:GridView ID="GridView1" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" runat="server">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
