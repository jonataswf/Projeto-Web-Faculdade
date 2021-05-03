<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="livro" scope="page" class="database.Livro" /> 
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Livro</title>
        <style>
            #cabecalho { 
                padding: 10px 20px; 
                text-align: center; 
                background-color:#0047B2; 
                color: #E6F0FF; 
            }
            
            table{
                margin: auto;
            }
            
            body{
                margin: 0px;
            }
            
            h2{
                text-align: center;
            }
            
            img{
                max-height: 196px;
            }
        </style>
    </head>
    <body>
        <%
        Integer id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        Integer ano = Integer.parseInt(request.getParameter("ano"));
        Double preco = Double.parseDouble(request.getParameter("preco").replace(',', '.'));
        String foto = request.getParameter("foto");
        Integer idEditora = Integer.parseInt(request.getParameter("ideditora"));
        ResultSet rs;
          
        conexao.conectar();
        livro.setConexao(conexao.getConexao());

        if (livro.livroExiste(titulo)){
            out.println("<div id='cabecalho'><h2>ATUALIZAR LIVRO</h2></div>");
            out.println("<h2>Já existe um livro cadastrado com este nome, atualização negada!</h2>");
            rs = livro.pesquisar(titulo);
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
                out.println("<a href='index.jsp'>Voltar</a>");
        }
        else
        { 
            if (livro.atualizar(id, titulo, autor, ano, preco, foto, idEditora))
            {
                out.println("<div id='cabecalho'><h2>ATUALIZAR LIVRO</h2></div>");
                out.println("<h2>Livro atualizado com sucesso!</h2>");   
                rs = livro.pesquisarIdLivro(id);
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
                    out.println("<a href='index.jsp'>Voltar</a>");
            }
            else
            {
            out.println("<div id='cabecalho'><h2>ATUALIZAR LIVRO</h2></div>");
            out.println("<h2>Erro ao tentar atualizar livro!</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
            conexao.fechar();
            }
        }
        %>
    </body>
</html>
