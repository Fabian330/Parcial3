<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="Parcial3.Reporte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Reportes</h1>
    <p>
        Ingrese su numero de placa:
        <asp:TextBox ID="tNumPlaca" runat="server" Width="76px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="bReporte" class="button button4" runat="server" Text="Ver reporte" OnClick="bReporte_Click" />
    </p>
    <p>
        <asp:GridView ID="GridView1" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" runat="server">
        </asp:GridView>
    </p>
</asp:Content>
