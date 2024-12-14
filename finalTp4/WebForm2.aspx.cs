using System;
using System.Collections.Generic;
using System.Deployment.Internal;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalTp4
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void alta_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                var tipoMonto=DropDownListM.SelectedValue;
                var cuenta =DropDownListC.SelectedValue;

                var fecha=TextBoxfecha.Text;
                var monto= textBosMonto.Text;

                SqlDataSource2.InsertParameters["tipo"].DefaultValue = tipoMonto;
                SqlDataSource2.InsertParameters["idCuenta "].DefaultValue= cuenta;
                SqlDataSource2.InsertParameters["fecha"].DefaultValue= fecha;
                SqlDataSource2.InsertParameters["monto"].DefaultValue= monto;

                SqlDataSource2.Insert();

            }
        }

        protected void baja_Click(object sender, EventArgs e)
        {
            string id  =   GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
            SqlDataSource2.DeleteParameters["id"].DefaultValue = id;
            SqlDataSource2.Delete();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownListM.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;
            DropDownListC.SelectedValue = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
            textBosMonto.Text= GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
            TextBoxfecha.Text= GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;

        }
    }
}