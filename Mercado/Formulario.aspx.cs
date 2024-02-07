using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mercado
{
    public partial class Formulario : System.Web.UI.Page
    {
        List<Producto> lstProducto = new List<Producto>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {
                lstProducto.Add(new Producto() { Codigo = 1, Valor = 6800, NombreProducto = "Una Caja de Huevos" });
                lstProducto.Add(new Producto() { Codigo = 2, Valor = 15000, NombreProducto = "Cereales" });
                lstProducto.Add(new Producto() { Codigo = 3, Valor = 12000, NombreProducto = "Yogourt" });

                Session["Ingresar"] = lstProducto;

                GridViewTabla.DataSource = lstProducto;
                GridViewTabla.DataKeyNames = new string[] { "codigo" };
                GridViewTabla.DataBind();
            }
        }

        protected void GridViewTabla_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Session["Ingresar"] != null)
            {
                lstProducto = ((List<Producto>)Session["Ingresar"]);
            }

            string codigo = GridViewTabla.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
            Producto MatriculaEncontrada = lstProducto.SingleOrDefault(s => s.Codigo == Convert.ToInt32(codigo));

            if (e.CommandName == "Editar")
            {
                txtCodigo.Text = MatriculaEncontrada.Codigo.ToString();
                txtNombreProducto.Text = MatriculaEncontrada.NombreProducto;
                txtValor.Text = MatriculaEncontrada.Valor.ToString();
            }

            if (e.CommandName == "Eliminar")
            {
                lstProducto.Remove(MatriculaEncontrada);
            }

            GridViewTabla.DataSource = lstProducto;
            GridViewTabla.DataKeyNames = new string[] { "codigo" };
            GridViewTabla.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            if (Session["Ingresar"] != null)
            {
                lstProducto = ((List<Producto>)Session["Ingresar"]);
            }
 

            lstProducto.Add(new Producto() { Codigo = Convert.ToInt32(txtCodigo.Text), Valor = Convert.ToInt32(txtValor.Text), NombreProducto = txtNombreProducto.Text });
            GridViewTabla.DataSource = lstProducto;
            GridViewTabla.DataKeyNames = new string[] { "codigo" };
            GridViewTabla.DataBind();

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

            if (Session["Ingresar"] != null)
            {
                lstProducto = ((List<Producto>)Session["Ingresar"]);
            }

            Producto MatriculaEditada = lstProducto.SingleOrDefault(s => s.Codigo == Convert.ToInt32(txtCodigo.Text));
            int indice = lstProducto.IndexOf(MatriculaEditada);

            MatriculaEditada.NombreProducto = txtNombreProducto.Text;
            MatriculaEditada.Valor = Convert.ToInt32(txtValor.Text);

            lstProducto[indice] = MatriculaEditada;

            GridViewTabla.DataSource = lstProducto;
            GridViewTabla.DataKeyNames = new string[] { "codigo" };
            GridViewTabla.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            if (Session["Ingresar"] != null)
            {
                lstProducto = ((List<Producto>)Session["Ingresar"]);
            }

            if (txtCodigo.Text != "")
            {
                List<Producto> ResultadoCodigo = lstProducto.Where(p => p.Codigo.Equals(Convert.ToInt32(txtCodigo.Text))).ToList();

                GridViewTabla.DataSource = ResultadoCodigo;
                GridViewTabla.DataKeyNames = new string[] { "codigo" };
                GridViewTabla.DataBind();
            }

            if (txtNombreProducto.Text != "")
            {
                List<Producto> ResultadoNombre = lstProducto.Where(p => p.NombreProducto.Contains(txtNombreProducto.Text)).ToList();

                GridViewTabla.DataSource = ResultadoNombre;
                GridViewTabla.DataKeyNames = new string[] { "codigo" };
                GridViewTabla.DataBind();
            }

            if (txtValor.Text != "")
            {
                List<Producto> ResultadoValor = lstProducto.Where(p => p.Codigo.Equals(Convert.ToInt32(txtValor.Text))).ToList();
                GridViewTabla.DataSource = ResultadoValor;
                GridViewTabla.DataKeyNames = new string[] { "codigo" };
                GridViewTabla.DataBind();
            }
        }

    }

}

