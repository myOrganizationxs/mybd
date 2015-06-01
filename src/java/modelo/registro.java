/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.Vector;
import javax.swing.JOptionPane;

/**
 *
 * @author sergio
 */
public class registro 
{
    private int NoPa;
    private int NoSe;
    private String nombre;
    private String foto;
    private String Comentario;
    private InputStream imagen;
    private int ultimo;
    
    private String clasfrom = "com.mysql.jdbc.Driver";
    private String servidor = "jdbc:mysql://localhost/ejemplo1";
    private String usuarioDB="root";
    private String passwordDB="030191";
   
    private PreparedStatement pr=null;
    private ResultSet rs=null;
   
    public void insertar(int NoPa, int NoSe,String Nombre,String Foto,String Comentario)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="insert into ejemplo1 values (?,?,?,?,?)";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.setInt(1,NoPa);
            pst.setInt(2,NoSe);
            pst.setString(3,Nombre);
            pst.setString(4,"");
            pst.setString(5,Comentario);
            pst.executeUpdate();
            System.out.println("exitoso");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    public void eliminar(int NoPa)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="DELETE FROM ejemplo1 WHERE NoPa=?";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.setInt(1,NoPa);
            pst.executeUpdate();
            System.out.println("exitoso");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
    }
     public Vector<registro> buscar(){
        Vector<registro> vecPro=new Vector<registro>();
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        
        String sql="SELECT * FROM ejemplo1";
        try{
            
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                registro pro=new registro();
                pro.setNoPa(rs.getInt("NoPa"));
                pro.setNoSe(rs.getInt("NoSe"));
                pro.setNombre(rs.getString("Nombre"));
                pro.setComentario(rs.getString("Comentario"));
                vecPro.add(pro);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
     
    public void ultimo()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select NoPa from ejemplo1 order by NoPa asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                 ultimo= rs.getInt (1);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        ultimo=ultimo+1;
        System.out.println("este es el ultimo mas uno: "+ultimo);
    }

    
    
    
    
    
    
    
    
    
    public int getNoPa() {
        return NoPa;
    }

    public void setNoPa(int NoPa) {
        this.NoPa = NoPa;
    }

    public int getNoSe() {
        return NoSe;
    }

    public void setNoSe(int NoSe) {
        this.NoSe = NoSe;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }

    public InputStream getImagen() {
        return imagen;
    }

    public void setImagen(InputStream imagen) {
        this.imagen = imagen;
    } 

    public int getUltimo() {
        return ultimo;
    }

    public void setUltimo(int ultimo) {
        this.ultimo = ultimo;
    }
    
    public static void main(String args[])
    {
        registro myr = new registro();
        myr.ultimo();
    }
}
