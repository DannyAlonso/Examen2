<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmVentas.aspx.cs" Inherits="Examen_2.FrmVentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            color: #FFFFFF;
            background-color: #660066;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" colspan="2"><strong><h1 class="auto-style3">Ventas en las maquinas </h1></strong></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <br />
                Nombre del Cajero:&nbsp;
                <asp:Label ID="Lnombrec" runat="server"></asp:Label>
                <br />
                <br />
                Apellidos del Cajero:&nbsp;
                <asp:Label ID="Lapellidos" runat="server"></asp:Label>
                <br />
                <br />
                Nombre del preducto:&nbsp;
                <asp:Label ID="Lproducto" runat="server"></asp:Label>
                <br />
                <br />
                Precio:&nbsp;
                <asp:Label ID="Lprecio" runat="server"></asp:Label>
                <br />
                <br />
                Piso:<asp:DropDownList ID="Dpiso" runat="server" DataSourceID="SqlPiso" DataTextField="Descripcion" DataValueField="Piso">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlPiso" runat="server" ConnectionString="<%$ ConnectionStrings:MAQUINASConnectionString %>" SelectCommand="SELECT * FROM [Piso]"></asp:SqlDataSource>
                <br />
                Fecha:
                <asp:Label ID="Lfecha" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Bingresar" runat="server" BackColor="#CC00CC" Height="68px" OnClick="Bingresar_Click" Text="Ingresar" Width="150px" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="Bactualizar" runat="server" BackColor="#CC00CC" Height="68px" OnClick="Button2_Click" Text="Actualisar" Width="148px" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
