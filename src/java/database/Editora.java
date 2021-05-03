package database;

import java.sql.*;

public class Editora {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public void setConexao(Connection con) {
        this.con = con;
    }

    public boolean editoraExiste(String nome) {
        int qtde;
        try {
            ps = con.prepareStatement("SELECT COUNT(*) as qtde "
                    + "FROM editora "
                    + "WHERE nome = ?");
            ps.setString(1, nome);
            rs = ps.executeQuery();
            rs.next();

            qtde = rs.getInt("qtde");

            if (qtde == 0) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int inserir(String nome, String cidade) {
        try {
            if (editoraExiste(nome)) {
                return 1;
            } else {
                ps = con.prepareStatement("INSERT INTO editora(nome, cidade) VALUES (?, ?)");
                ps.setString(1, nome);
                ps.setString(2, cidade);
                ps.executeUpdate();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
