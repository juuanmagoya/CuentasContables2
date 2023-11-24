<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="CuentasContables2.Cuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
&nbsp;&nbsp;&nbsp;<asp:Button ID="agregar" runat="server" OnClick="agregar_Click1" style="height: 26px" Text="Agregar" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" Height="97px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="121px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuenta"></asp:ListBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="eliminar" runat="server" OnClick="eliminar_Click" Text="Eliminar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Modificar" runat="server" OnClick="Modificar_Click" Text="Modificar" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [idCuenta] = @idCuenta" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [idCuenta] = @idCuenta">
            <DeleteParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="idCuenta" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([idCuenta] = @idCuenta)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
