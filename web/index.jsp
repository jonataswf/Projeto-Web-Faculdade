<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd"/>
<jsp:useBean id="livro" scope="page" class="database.Livro"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogo Livros</title>
        <style>
            
            body{
                margin: 0px;
            }
            
            img{
                max-height: 196px;
            }
            
            h2{
                text-align: center;
            }

            #cabecalho { 
                padding: 10px 20px; 
                text-align: center; 
                background-color:#0047B2; 
                color: #E6F0FF; 
            }

            table{
                margin: auto;
            }

            #form_login{
                text-align: center;
                border-style: groove;   
                margin-left: 600px;
                margin-right: 600px;
                margin-top: 20px;
                background-color: beige;
            }

            #senha{
                margin-left: 12.5px;
            }

            #form_pesquisar{
                text-align: center;
                margin-left: 500px;
                margin-right: 500px;
                margin-top: 15px;
                margin-bottom: 15px;
            }
            
            #pesquisar{
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <div id="cabecalho">
            <h2>CATÁLOGO DE LIVROS</h2>
        </div>
        <% 
        ResultSet rs;
        
        out.print(
                "<form id='form_pesquisar' action='index.jsp' method='post'>" +
                "<span id='pesquisar'><b>Pesquisar Livro: </span></b> <input type='search' oninput='titulo' name='titu' placeholder='Digite o titulo'>" +
                "<input type='submit' name='titu' value='Pesquisar'>" +
                "</form>"
        );

        String titulo = request.getParameter("titu");

        conexao.conectar();
        livro.setConexao(conexao.getConexao());
        
        if(titulo != null){
            
            rs = livro.pesquisar(titulo);
            
            if (rs != null){
            out.println("<table>");
            out.print("<tr>");
            while (rs.next())
            {
                out.print("<td><img src='imagens/" + rs.getString("foto") + "'" + "><br>"
                        + "<b>Id: </b>" + rs.getString("id") + "<br>"
                        + "<b>Titulo: </b>" + rs.getString("titulo") + "<br>"
                        + "<b>Autor: </b>" + rs.getString("autor") + "<br>"
                        + "<b>Ano: </b>" + rs.getString("ano") + "<br>"
                        + "<b>Preço:</b> R$ " + rs.getString("preco") + "<br>"
                        + "<b>Editora</b> " + rs.getString("b.nome") + "<br>"
                        + "<b>Cidade</b> " + rs.getString("b.cidade") + "<br>"
                        + "</td>");
            }
                out.print("</tr>");
                out.println("</table>");    
            }else{
                out.println("<div id='cabecalho'><h2>CATÁLOGO DE LIVROS</h2></div>");
                out.println("<h2>Erro ao tentar listar o catalogo de livros!</h2>");
                conexao.fechar();
            }
        }else{

        rs = livro.listar();
        
        if (rs != null){
            out.println("<table>");
            out.print("<tr>");
            while (rs.next())
            {
                out.print("<td><img src='imagens/" + rs.getString("foto") + "'" + "><br>"
                        + "<b>Id: </b>" + rs.getString("id") + "<br>"
                        + "<b>Titulo: </b>" + rs.getString("titulo") + "<br>"
                        + "<b>Autor: </b>" + rs.getString("autor") + "<br>"
                        + "<b>Ano: </b>" + rs.getString("ano") + "<br>"
                        + "<b>Preço:</b> R$ " + rs.getString("preco") + "<br>"
                        + "<b>Editora</b> " + rs.getString("b.nome") + "<br>"
                        + "<b>Cidade</b> " + rs.getString("b.cidade") + "<br>"
                        + "</td>");
            }
            out.print("</tr>");
            out.println("</table>");    
        }else{
            out.println("<div id='cabecalho'><h2>CATÁLOGO DE LIVROS</h2></div>");
            out.println("<h2>Erro ao tentar listar o catalogo de livros!</h2>");
            conexao.fechar();
        }
        }
        %>
        <form id="form_login" action="administracao.jsp" method="post">
            <h2>Login</h2>
            <b>Usuário: </b><input type="text" name="nome"><br>
            <span id="senha"><b>Senha: </b></span><input type="password" name="senha"><br>
            <input type="submit" value="Entrar">
        </form>
    </body>
</html>
