<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="finalTp4.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="cuentaLabel" runat="server" Text="Cuenta"></asp:Label>
    <asp:DropDownList ID="DropDownListC" runat="server" DataSourceID="SqlDataSource" DataTextField="descripcion" DataValueField="id">
    </asp:DropDownList>
    <br />
      <asp:Label ID="montoLabel" runat="server" Text="Monto"></asp:Label>
  <asp:TextBox ID="textBosMonto" runat="server" TextMode="Number"></asp:TextBox>
  <asp:DropDownList ID="DropDownListM" runat="server">
      <asp:ListItem>D</asp:ListItem>
      <asp:ListItem>H</asp:ListItem>
  </asp:DropDownList>
    <br />
    <asp:Label ID="fechalabel" runat="server" Text="Fecha"></asp:Label>
    <asp:TextBox ID="TextBoxfecha" runat="server" TextMode="Date"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorF" runat="server" ErrorMessage="RequiredFieldValidatorF" ControlToValidate="TextBoxfecha" EnableTheming="True"></asp:RequiredFieldValidator>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:finalTp4ConnectionString %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT [id], [descripcion] FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="descripcion" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
            <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
            <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
            <asp:BoundField DataField="idCuenta" HeaderText="idCuenta" SortExpression="idCuenta" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:finalTp4ConnectionString %>" DeleteCommand="DELETE FROM [MovimientosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [MovimientosContables] ([fecha], [monto], [tipo], [idCuenta]) VALUES (@fecha, @monto, @tipo, @idCuenta)" SelectCommand="SELECT [id], [fecha], [monto], [tipo], [idCuenta] FROM [MovimientosContables]" UpdateCommand="UPDATE [MovimientosContables] SET [fecha] = @fecha, [monto] = @monto, [tipo] = @tipo, [idCuenta] = @idCuenta WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="monto" Type="Decimal" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="idCuenta" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="fecha" />
            <asp:Parameter Name="monto" Type="Decimal" />
            <asp:Parameter Name="tipo" Type="String" />
            <asp:Parameter Name="idCuenta" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Button ID="alta" runat="server" Text="alta" OnClick="alta_Click" />
        <asp:Button ID="baja" runat="server" Text="baja" OnClick="baja_Click" />
            <asp:Button ID="modificacion" runat="server" Text="modificacion" />


</asp:Content>
