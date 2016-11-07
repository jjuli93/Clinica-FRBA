using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Windows.Forms;
namespace ClinicaFrba
{
    class Conexion
    {
        SqlConnection cn;
        SqlCommand cmd;
        SqlDataReader dr;



        public Conexion() {
            try {
                cn = new SqlConnection("Data Source=DESKTOP-51NQJVF\\SQLSERVER2012;Initial Catalog=GD2C2016;User ID=gd;Password=gd2016");
                cn.Open();
            }catch(Exception ex){
                MessageBox.Show("no se conecto con la base de datos:" + ex.ToString());
            }
        }

        public int select(string query){
            int contador = 0;
            try {
                cmd = new SqlCommand(query, cn);
                dr = cmd.ExecuteReader();
                while (dr.Read()) {
                    contador++;
                }
                dr.Close();
                return contador;
            }
            catch(Exception ex) {
                MessageBox.Show("No se puedo consultar:" + ex.ToString());
                return -1;
            }
        }
    }
}
