using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ClinicaFrba.AbmRol;
namespace ClinicaFrba
{
    public partial class formLogin : Form
    {
        Conexion c = new Conexion();        
        public formLogin()
        {
            InitializeComponent();
        }

        private void cmdProbarConexion_Click(object sender, EventArgs e)
        {

        }

        int loginFallidos = 0;
        private void btnIngresar_Click(object sender, EventArgs e)
        {
            if (loginFallidos < 3)
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;
                string query = "SELECT Usu_id FROM Usuario U WHERE U.Usu_username = '" + username + "' AND U.Usu_password = '" + password + "' AND U.Usu_habilitado = 1";
                int resultados = c.select(query);
                if (resultados == 1)
                {
                    loginFallidos = 0;      
                    DialogResult = DialogResult.OK;
              
                }
                else
                {
                    loginFallidos++;
                    MessageBox.Show("Usuario y/o password incorrecto");
                }
            }
            else {
                //update inhabilitando al usuario
                MessageBox.Show("El usuario esta inhabilitado");
            }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void formLogin_Load(object sender, EventArgs e)
        {

        }
    }
}
