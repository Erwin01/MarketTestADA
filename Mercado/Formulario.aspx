<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="Mercado.Formulario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            margin-left: 40px;
        }
                
        .style7
        {
            width: 104px;
            height: 89px;
            margin-top: 4px;
        }
        .style8
        {
            width: 841px;
        }
        .style12
        {
            margin-left: 40px;
            width: 276px;
        }
        .style13
        {
            width: 280px;
        }
        .style3
        {
            font-weight: 700;
            font-family: Papyrus;
            font-size: large;
        }
        .style16
        {
            width: 280px;
            height: 37px;
        }
        .style17
        {
        }
        .style18
        {
            width: 292px;
            height: 37px;
        }
        .style19
        {
            width: 17px;
        }
        .style20
        {
            width: 17px;
            height: 37px;
        }
        .style21
        {
            text-align: center;
        }
    </style>
</head>
<body bgcolor="#FFFFFF">
    <form id="form1" runat="server">
    <div>
    
        <div>
            <h1 style="background-color: #FB8C00; font-family: Papyrus; font-size: xx-large;" 
                align="center" class="style21">
                <img align="middle" alt="" class="style7" 
                    src="Images/ic_add_shopping_cart_black_24dp_2x.png" />&nbsp; Mi Mercado</h1>
        </div>
        <table class="style8" align="center">
            <tr>
                <td class="style12">
                    <asp:Label ID="Label1" runat="server" CssClass="style3" Text="Código:"></asp:Label>
                </td>
                <td class="style17">
                    <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
                </td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                    <asp:Label ID="Label2" runat="server" CssClass="style3" 
                        style="font-weight: bold; font-size: large; font-family: Papyrus" 
                        Text="Nombre Producto:"></asp:Label>
                </td>
                <td class="style17">
                    <asp:TextBox ID="txtNombreProducto" runat="server"></asp:TextBox>
                </td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                    <asp:Label ID="Label3" runat="server" CssClass="style3" 
                        style="font-weight: bold; font-size: large; font-family: Papyrus" Text="Valor:"></asp:Label>
                </td>
                <td class="style17">
                    <asp:TextBox ID="txtValor" runat="server"></asp:TextBox>
                </td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12" rowspan="2">
                    &nbsp;</td>
                <td class="style18">
                    <asp:Button ID="btnModificar" runat="server" CssClass="style4" 
                        onclick="btnModificar_Click" 
                        style="background-color: #FFC400; font-weight: 700; font-size: medium; font-family: 'Comic Sans MS';" 
                        Text="Modificar" Width="90px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td class="style20">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="style4" 
                        onclick="btnBuscar_Click" style="background-color: #26A69A; font-weight: 700; font-size: medium; font-family: 'Comic Sans MS';" 
                        Text="Buscar" Width="90px" />
                </td>
                <td class="style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12" align="char">
                    <asp:Label ID="Label5" runat="server" 
                        style="font-weight: 700; font-family: Andalus; font-size: x-large" 
                        Text="Lista de Mercado"></asp:Label>
                </td>
                <td class="style17" align="right" colspan="2">
                    <asp:Button ID="btnAgregar" runat="server" CssClass="style4" 
                        onclick="btnAgregar_Click" 
                        style="color: #000000; background-color: #00FF00; font-weight: 700; font-size: medium; font-family: 'Comic Sans MS';" 
                        Text=" + Agregar Producto" />
                </td>
                <td class="style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style1" colspan="4">
                    <asp:GridView ID="GridViewTabla" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        onrowcommand="GridViewTabla_RowCommand" style="text-align: left" 
                        Width="605px" Height="130px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ButtonField CommandName="Editar" Text="Editar" ButtonType="Image" 
                                ImageUrl="~/Images/ic_check_black_24dp_1x.png" />
                            <asp:BoundField DataField="codigo" HeaderText="Codigo" />
                            <asp:BoundField DataField="NombreProducto" HeaderText="Nombre Producto" />
                            <asp:BoundField DataField="valor" HeaderText="Valor" />
                            <asp:ButtonField CommandName="Eliminar" Text="Eliminar" ButtonType="Image" 
                                FooterText="ELIMINAR" ImageUrl="~/Images/ic_delete_black_24dp_1x.png" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="left" class="style1" colspan="4">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
