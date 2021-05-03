<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="usuario" scope="page" class="database.Usuario" />
<%@ page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administração</title>
        <style>

            body{
                margin: 0px;
            }

            #cabecalho { 
                padding: 10px 20px; 
                text-align: center; 
                background-color:#0047B2; 

                color: #E6F0FF; 
            }
            
            h2{
                text-align: center;
            }

            h1{
                text-align: center;
            }

            form{
                text-align: center;
                border-style: groove;
                float: left;
                background-color: beige;
                margin: 59px;
            }
            #tit{
                margin-left: 26px;
            }

            #au{
                margin-left: 27px;
            }

            #an{
                margin-left: 37px;
            }

            #pre{
                margin-left: 28px;
            }

            #fot{
                margin-left: 35px;
            }

            #cid{
                margin-left: 61px;
            }

            #senha{
                margin-left: 70px;
            }

            #idatu{
                margin-left: 51px;
            }

            #titatu{
                margin-left: 26px;
            }

            #autatu{
                margin-left: 27px;
            }

            #anoatu{
                margin-left: 37px;
            }

            #precoatu{
                margin-left: 28px;
            }

            #fotoatu{
                margin-left: 35px;
            }
        </style>
    </head>
    <body>
        <%
      
         String nome = request.getParameter("nome");
         String senha = request.getParameter("senha");

         conexao.conectar();
         usuario.setConexao(conexao.getConexao());

         int resultado = usuario.autenticar(nome, senha);

         if (resultado == 0)
         {
            out.println("<div id='cabecalho'><h2>ADMINISTRAÇÃO</h2></div>"); 
            out.println("<h2>Nome de usuário e/ou senha inválidos</h2>");
         }
         else if (resultado == 1)
         {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("nome", usuario.getNome());
            
            out.println("<div id='cabecalho'><h2>BEM-VINDO " + nome.toUpperCase() + "</h2></div>");
            
            out.println("<form action='cadastrar_livro.jsp' method='post'>"); 
            out.println("<h2>Cadastrar Livro:</h2>");            
            out.println("<span id='tit'>Titulo: </span><input type='text' name='titulo'> <br>");
            out.println("<span id='au'>Autor: </span><input type='text' name='autor'> <br>");
            out.println("<span id='an'>Ano: </span><input type='text' name='ano'> <br>");
            out.println("<span id='pre'>Preço: </span><input type='text' name='preco'> <br>");
            out.println("<span id='fot'>Foto: </span><input type='text' name='foto'> <br>");
            out.println("Id Editora: <input type='text' name='ideditora'> <br>");
            out.println("<input type='submit' value='Cadastrar'>");
            out.println("</form>");
            
            out.println("<form action='atualizar_livro.jsp' method='post'>");
            out.println("<h2>Atualizar Livro:</h2>");
            out.println("<span id='idatu'>Id: </span><input type='text' name='id'> <br>");
            out.println("<span id='titatu'>Titulo: </span><input type='text' name='titulo'> <br>");
            out.println("<span id='autatu'>Autor: </span><input type='text' name='autor'> <br>");
            out.println("<span id='anoatu'>Ano: </span><input type='text' name='ano'> <br>");
            out.println("<span id='precoatu'>Preço: </span><input type='text' name='preco'> <br>");
            out.println("<span id='fotoatu'>Foto: </span><input type='text' name='foto'> <br>");
            out.println("Id Editora: <input type='text' name='ideditora'> <br>");
            out.println("<input type='submit' value='Atualizar'>");
            out.println("</form>");
            
            out.println("<form action='cadastrar_editora.jsp' method='post'>"); 
            out.println("<h2>Cadastrar Editora:</h2>");
            out.println("Nome da editora: <input type='text' name='nome'> <br>");
            out.println("<span id='cid'>Cidade: </span><input type='text' name='cidade'> <br>");
            out.println("<input type='submit' value='Cadastrar'>");
            out.println("</form>");
            
            out.println("<form action='cadastrar_usuario.jsp' method='post'>"); 
            out.println("<h2>Cadastrar Usuario:</h2>");
            out.println("Nome de usuário: <input type='text' name='nome'> <br>");
            out.println("<span id='senha'>Senha: </span><input type='password' name='senha'> <br>");
            out.println("<input type='submit' value='Cadastrar'>");
            out.println("</form>");
         }else
         {
            out.println("<div id='cabecalho'><h2>ADMINISTRAÇÃO</h2></div>"); 
            out.println("<h2>Erro ao logar.</h2>");
            conexao.fechar();
         }
        %>
    </body>
</html>
