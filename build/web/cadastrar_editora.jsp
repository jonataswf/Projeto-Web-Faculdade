<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="editora" scope="page" class="database.Editora" /> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Editora</title>
        <style>   
            #cabecalho { 
                padding: 10px 20px; 
                text-align: center; 
                background-color:#0047B2; 
                color: #E6F0FF; 
            }
            
            h2{
                text-align: center;
            }
            
            body{
                margin: 0px;
            }
            
        </style>
    </head>
    <body>
        <%
        String nome = request.getParameter("nome");
        String cidade = request.getParameter("cidade");

        conexao.conectar();
        editora.setConexao(conexao.getConexao());
        
        if(nome.isEmpty() || cidade.isEmpty())
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR EDITORA</h2></div>");
            out.println("<h2>Campo nome e/ou cidade não pode ser vazio!</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
            return;
        }
        
        
        int resultado = editora.inserir(nome, cidade);
        
        if (resultado == 0)
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR EDITORA</h2></div>");
            out.println("<h2>Editora cadastrada com sucesso!</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
        }
        else if (resultado == 1)
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR EDITORA</h2></div>");
            out.println("<h2>Editora já cadastrado!</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
        }
        else
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR EDITORA</h2></div>");
            out.println("<h2>Erro ao cadastrar editora.</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
            conexao.fechar();
        }
        %>
    </body>
</html>
