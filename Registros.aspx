<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="CuentasContables2.Registros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuenta">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtMonto" runat="server" TextMode="Number">monto</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="agregar" runat="server" OnClick="agregar_Click" Text="Agregar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
            <asp:ListItem Value="False">Debe</asp:ListItem>
            <asp:ListItem Value="True">Haber</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" Width="520px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                <asp:CheckBoxField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                <asp:BoundField DataField="idCuenta" HeaderText="idCuenta" SortExpression="idCuenta" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([monto], [tipo], [idCuenta]) VALUES (@monto, @tipo, @idCuenta)" SelectCommand="SELECT RegistrosContables.id, RegistrosContables.monto, RegistrosContables.tipo, RegistrosContables.idCuenta, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.idCuenta" UpdateCommand="UPDATE [RegistrosContables] SET [monto] = @monto, [tipo] = @tipo, [idCuenta] = @idCuenta WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
                <asp:Parameter Name="idCuenta" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="insert" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([monto], [tipo], [idCuenta]) VALUES (@monto, @tipo, @idCuenta)" SelectCommand="SELECT * FROM [RegistrosContables]" UpdateCommand="UPDATE [RegistrosContables] SET [monto] = @monto, [tipo] = @tipo, [idCuenta] = @idCuenta WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtMonto" Name="monto" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="RadioButtonList1" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
                <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="monto" Type="Int32" />
                <asp:Parameter Name="tipo" Type="Boolean" />
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
