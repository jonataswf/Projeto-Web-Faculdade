package database;

import java.sql.*;

public class ConexaoBd {

    Connection con;

    public boolean conectar() {
        String url;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            url = "jdbc:mysql://localhost/livros?user=root&password=livros.123";

            con = DriverManager.getConnection(url);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void fechar() {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConexao() {
        return con;
    }
}
