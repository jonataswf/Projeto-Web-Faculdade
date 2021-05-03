package database;

import java.sql.*;

public class Livro {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    private Integer id;
    private String titulo;
    private String autor;
    private Integer ano;
    private Double preco;
    private String foto;
    private Integer idEditora;

    public void setConexao(Connection con) {
        this.con = con;
    }

    public ResultSet listar() {
        try {
            ps = con.prepareStatement("select a.*, b.* "
                    + "from livro as a "
                    + "inner join editora as b "
                    + "on a.id_editora = b.id;"
            );
            rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet pesquisar(String title) {
        try {
            ps = con.prepareStatement("select a.*, b.* "
                    + "from livro as a "
                    + "inner join editora as b "
                    + "on a.id_editora = b.id "
                    + "where a.titulo ='" + title + "'"
            );
            rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean livroExiste(String titulo) {
        int qtde;
        try {
            ps = con.prepareStatement("SELECT COUNT(*) as qtde "
                    + "FROM livro "
                    + "WHERE titulo = ?");
            ps.setString(1, titulo);
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

    public int inserir(String titulo, String autor, Integer ano, Double preco, String foto, Integer idEditora) {
        try {
            if (livroExiste(titulo)) {
                return 1;
            } else {
                ps = con.prepareStatement("INSERT INTO livro(titulo, autor, ano, preco, foto, id_editora) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, titulo);
                ps.setString(2, autor);
                ps.setInt(3, ano);
                ps.setDouble(4, preco);
                ps.setString(5, foto);
                ps.setInt(6, idEditora);
                ps.executeUpdate();
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean atualizar(Integer id, String titulo, String autor, Integer ano, Double preco, String foto, Integer idEditora) {
        try {
            ps = con.prepareStatement("UPDATE livro "
                    + "SET titulo = ?, "
                    + " autor = ?, "
                    + " ano = ?, "
                    + " preco = ?, "
                    + " foto = ?, "
                    + " id_editora = ? "
                    + "WHERE id = ?");
            ps.setString(1, titulo);
            ps.setString(2, autor);
            ps.setInt(3, ano);
            ps.setDouble(4, preco);
            ps.setString(5, foto);
            ps.setInt(6, idEditora);
            ps.setInt(7, id);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ResultSet pesquisarIdLivro(Integer id) {
        try {
            ps = con.prepareStatement("select a.*, b.* "
                    + "from livro as a "
                    + "inner join editora as b "
                    + "on a.id_editora = b.id "
                    + "where a.id = " + id
            );
            rs = ps.executeQuery();
            return rs;
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Integer getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    public Integer getAno() {
        return ano;
    }

    public Double getPreco() {
        return preco;
    }

    public String getFoto() {
        return foto;
    }

    public Integer getIdEditora() {
        return idEditora;
    }
}
