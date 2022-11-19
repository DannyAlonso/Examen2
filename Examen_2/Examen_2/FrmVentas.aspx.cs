using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_2
{
    public partial class FrmVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenarGrid();
            }
        }

        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["MAQUINASConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select c.nombre, c.apellidos, Venta.Cajero, Venta.Maquina, Venta.Producto, Venta.Fecha from Cajeros c inner join Venta on c.Codigo_Cajero = Venta.Codigo_Venta"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();// refrescar el grid 
                        }
                    }
                }
            }
        }
     

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["MAQUINASConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("insert into Cajeros values ('" + Venta.nombreC.Trim() + "','" + Venta.apellidos.Trim() + "')", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();

            conexion.Open();
            comando = new SqlCommand("insert into Productos values ('" + Venta.preoducto.Trim() + "'," + Venta.precio +")", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();

            conexion.Open();
            comando = new SqlCommand("insert into Maquinas_Registradoras values (" + Venta.piso + ")", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();

            conexion.Open();
            comando = new SqlCommand("insert into Ventas values (" + Venta.fecha + ")", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();

            Lnombrec.Text="";
            Lapellidos.Text = "";
            Lproducto.Text = "";
            Lprecio.Text = "";
            Lfecha.Text = "";
            

        }
    }


}