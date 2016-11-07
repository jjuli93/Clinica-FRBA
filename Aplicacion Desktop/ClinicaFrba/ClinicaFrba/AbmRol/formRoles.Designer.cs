namespace ClinicaFrba.AbmRol
{
    partial class formRoles
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.comboBoxRoles = new System.Windows.Forms.ComboBox();
            this.lblRoles = new System.Windows.Forms.Label();
            this.btnSeleccionarRol = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // comboBoxRoles
            // 
            this.comboBoxRoles.FormattingEnabled = true;
            this.comboBoxRoles.Location = new System.Drawing.Point(143, 121);
            this.comboBoxRoles.Name = "comboBoxRoles";
            this.comboBoxRoles.Size = new System.Drawing.Size(121, 21);
            this.comboBoxRoles.TabIndex = 0;
            // 
            // lblRoles
            // 
            this.lblRoles.AutoSize = true;
            this.lblRoles.Location = new System.Drawing.Point(50, 124);
            this.lblRoles.Name = "lblRoles";
            this.lblRoles.Size = new System.Drawing.Size(77, 13);
            this.lblRoles.TabIndex = 1;
            this.lblRoles.Text = "Ingresar como:";
            // 
            // btnSeleccionarRol
            // 
            this.btnSeleccionarRol.Location = new System.Drawing.Point(143, 163);
            this.btnSeleccionarRol.Name = "btnSeleccionarRol";
            this.btnSeleccionarRol.Size = new System.Drawing.Size(121, 29);
            this.btnSeleccionarRol.TabIndex = 2;
            this.btnSeleccionarRol.Text = "SELECCIONAR";
            this.btnSeleccionarRol.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(85, 51);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(134, 39);
            this.label1.TabIndex = 7;
            this.label1.Text = "ROLES";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // formRoles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(324, 315);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnSeleccionarRol);
            this.Controls.Add(this.lblRoles);
            this.Controls.Add(this.comboBoxRoles);
            this.Name = "formRoles";
            this.Text = "ABM ROL";
            this.Load += new System.EventHandler(this.formRoles_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox comboBoxRoles;
        private System.Windows.Forms.Label lblRoles;
        private System.Windows.Forms.Button btnSeleccionarRol;
        private System.Windows.Forms.Label label1;
    }
}