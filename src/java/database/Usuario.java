package database;

import java.sql.*;

public class Usuario {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String nome;

    public void setConexao(Connection con) {
        this.con = con;
    }

    public boolean usuarioExiste(String nome) {
        int qtde;
        try {
            ps = con.prepareStatement("SELECT COUNT(*) as qtde "
                    + "FROM usuario "
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

    public int inserir(String nome, String senha) {
        try {
            if (usuarioExiste(nome)) {
                return 1;
            } else {
                ps = con.prepareStatement("INSERT INTO usuario(nome, senha) VALUES (?, ?)");
                ps.setString(1, nome);
                ps.setString(2, senha);
                ps.executeUpdate();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int autenticar(String nome, String senha) {
        int qtde;
        try {
            ps = con.prepareStatement("SELECT nome, "
                    + "COUNT(*) as qtde FROM usuario "
                    + "WHERE nome = ? and senha = ?");
            ps.setString(1, nome);
            ps.setString(2, senha);
            rs = ps.executeQuery();
            rs.next();
            qtde = rs.getInt("qtde");
            if (qtde == 1) {
                this.nome = rs.getString("nome");
            }
            return qtde;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public String getNome() {
        return nome;
    }
}
