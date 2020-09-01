/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inmobiliaria;

import static inmobiliaria.Login.SQL;
import static inmobiliaria.Login.conn;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Inmobiliaria {

    public static int generarNombre() {
        return (int) (10000 * Math.random());
    }

    public static void main(String[] args) throws SQLException {
        
        System.out.println(generarNombre());
        System.out.println(generarNombre());
    }

}
