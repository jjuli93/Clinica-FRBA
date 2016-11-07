namespace ClinicaFrba.Listados
{
    partial class formListados
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
            this.btnListado1 = new System.Windows.Forms.Button();
            this.btnListado2 = new System.Windows.Forms.Button();
            this.btnListado3 = new System.Windows.Forms.Button();
            this.btnListado4 = new System.Windows.Forms.Button();
            this.btnListado5 = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // btnListado1
            // 
            this.btnListado1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnListado1.Location = new System.Drawing.Point(12, 57);
            this.btnListado1.Name = "btnListado1";
            this.btnListado1.Size = new System.Drawing.Size(410, 40);
            this.btnListado1.TabIndex = 0;
            this.btnListado1.Text = " Especialidades que más se registraron cancelaciones";
            this.btnListado1.UseVisualStyleBackColor = true;
            // 
            // btnListado2
            // 
            this.btnListado2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnListado2.Location = new System.Drawing.Point(12, 103);
            this.btnListado2.Name = "btnListado2";
            this.btnListado2.Size = new System.Drawing.Size(410, 40);
            this.btnListado2.TabIndex = 1;
            this.btnListado2.Text = "Profesionales más consultados por Plan";
            this.btnListado2.UseVisualStyleBackColor = true;
            // 
            // btnListado3
            // 
            this.btnListado3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnListado3.Location = new System.Drawing.Point(12, 149);
            this.btnListado3.Name = "btnListado3";
            this.btnListado3.Size = new System.Drawing.Size(410, 40);
            this.btnListado3.TabIndex = 2;
            this.btnListado3.Text = " Profesionales menos horas trabajadas";
            this.btnListado3.UseVisualStyleBackColor = true;
            // 
            // btnListado4
            // 
            this.btnListado4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnListado4.Location = new System.Drawing.Point(12, 195);
            this.btnListado4.Name = "btnListado4";
            this.btnListado4.Size = new System.Drawing.Size(410, 40);
            this.btnListado4.TabIndex = 3;
            this.btnListado4.Text = " Afiliados con mas bonos comprados";
            this.btnListado4.UseVisualStyleBackColor = true;
            // 
            // btnListado5
            // 
            this.btnListado5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnListado5.Location = new System.Drawing.Point(12, 241);
            this.btnListado5.Name = "btnListado5";
            this.btnListado5.Size = new System.Drawing.Size(410, 40);
            this.btnListado5.TabIndex = 4;
            this.btnListado5.Text = " Especialidades con mas consultas";
            this.btnListado5.UseVisualStyleBackColor = true;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(448, 57);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(306, 224);
            this.dataGridView1.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 26.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(50, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(340, 39);
            this.label1.TabIndex = 8;
            this.label1.Text = "Listados estadisticos";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // formListados
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(775, 301);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.btnListado5);
            this.Controls.Add(this.btnListado4);
            this.Controls.Add(this.btnListado3);
            this.Controls.Add(this.btnListado2);
            this.Controls.Add(this.btnListado1);
            this.Name = "formListados";
            this.Text = "LISTADOS";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnListado1;
        private System.Windows.Forms.Button btnListado2;
        private System.Windows.Forms.Button btnListado3;
        private System.Windows.Forms.Button btnListado4;
        private System.Windows.Forms.Button btnListado5;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
    }
}