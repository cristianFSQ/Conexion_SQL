<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>formulario registro con bd</title>
    <style type="text/css">
        .auto-style1 {
            width: 277px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table bgcolor="#99CCFF">
        <tr>
            <td>Rut</td>
            <td class="auto-style1">
                <asp:TextBox ID="txt_rut" runat="server"></asp:TextBox>
                <asp:Button ID="btn_buscar" runat="server" Text="buscar" OnClick="btn_buscar_Click" />
            </td>
        </tr>
        <tr>
            <td>Nombre</td>
            <td class="auto-style1">
                <asp:TextBox ID="txt_nom" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>fono</td>
            <td class="auto-style1">
                <asp:TextBox ID="txt_fono" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>ciudad</td>
            <td class="auto-style1">
                <asp:DropDownList ID="cbo_ciudad" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nom_ciudad" DataValueField="cod_ciudad"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString1 %>" SelectCommand="SELECT * FROM [ciudades]"></asp:SqlDataSource>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_enviar" runat="server" Text="guardar" OnClick="btn_enviar_Click" /></td>
            <td class="auto-style1">
                <asp:Button ID="btn_limpiar" runat="server" Text="limpiar" OnClick="btn_limpiar_Click" />
                <asp:Button ID="btn_actualizar" runat="server" Text="Actualizar" OnClick="btn_actualizar_Click" />
                <asp:Button ID="btn_delete" runat="server" Text="eliminar" OnClick="btn_delete_Click" />
            </td>
        </tr>
    </table>
    </div>
        <asp:Label ID="mensaje" runat="server" Text="Label" BackColor="White" ForeColor="Red"></asp:Label>
        <h2>
            <asp:Button ID="ver_gw" runat="server" OnClick="ver_gw_Click" Text="Visualizar Gridview" />
        </h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="rut" DataSourceID="SqlDataSource2" GridLines="Vertical" Visible="False">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="rut" HeaderText="rut" ReadOnly="True" SortExpression="rut" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:BoundField DataField="nom_ciudad" HeaderText="nom_ciudad" SortExpression="nom_ciudad" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString1 %>" SelectCommand="SELECT usuario.rut, usuario.nombre, ciudades.nom_ciudad FROM ciudades INNER JOIN usuario ON ciudades.cod_ciudad = usuario.ciudad"></asp:SqlDataSource>
        <br />
        <br />
         <h2>DetailsView</h2>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString1 %>" SelectCommand="SELECT [telefono] FROM [usuario] WHERE ([rut] = @rut)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="rut" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <asp:Button ID="btn_chart" runat="server" Text="Ver Chart" OnClick="btn_chart_Click" />

        <br />
         <p>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource_Chart" Visible="False">
                <Series>
                    <asp:Series Name="Series1" XValueMember="nom_ciudad" YValueMembers="ciudad" ChartType="Pie">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource_Chart" runat="server" ConnectionString="<%$ ConnectionStrings:ejemploConnectionString1 %>" SelectCommand="SELECT usuario.*, ciudades.nom_ciudad FROM usuario INNER JOIN ciudades ON usuario.ciudad = ciudades.cod_ciudad"></asp:SqlDataSource>
        </p>
        
    </form>
</body>
</html>
