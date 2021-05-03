<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="usuario" scope="page" class="database.Usuario" /> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Usuario</title>
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
        String senha = request.getParameter("senha");

        conexao.conectar();
        usuario.setConexao(conexao.getConexao());
        
        if(nome.isEmpty() || senha.isEmpty())
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR USUARIO</h2></div>");
            out.println("<h2>Campo usuário e/ou senha não pode ser vazio!</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
            return;
        }
        
        
        int resultado = usuario.inserir(nome, senha);
        
        if (resultado == 0)
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR USUARIO</h2></div>");
            out.println("<h2>Usuário cadastrado com sucesso!</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
        }
        else if (resultado == 1)
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR USUARIO</h2></div>");
            out.println("<h2>Usuário já cadastrado!</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
        }
        else
        {
            out.println("<div id='cabecalho'><h2>CADASTRAR USUARIO</h2></div>");
            out.println("<h2>Erro ao cadastrar usuário.</h2>");
            out.println("<a href='index.jsp'>Voltar</a>");
            conexao.fechar();
        }
        %>
    </body>
</html>
