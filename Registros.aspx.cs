using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuentasContables2
{
    public partial class Registros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            insert.InsertParameters["tipo"].DefaultValue = RadioButtonList1.SelectedValue;
            insert.InsertParameters["idCuenta"].DefaultValue = DropDownList1.SelectedValue;
            insert.InsertParameters["monto"].DefaultValue = txtMonto.Text;

            int result = insert.Insert();

            if (result != 0)
            {
                Label1.Text = "Se agregó 1 registro";
                txtMonto.Text = string.Empty;
                GridView1.DataBind();
               
            }
            else
            {
                Label1.Text = "No se agregaron Registros";
            }


        }
    }
    
}