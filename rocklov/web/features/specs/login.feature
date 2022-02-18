#language: pt

Funcionalidade: login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "martin@gmail.com" e "123456"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input      | senha_input | mensagem_output                  |
            | martin@gmail.com | 654321      | Usuário e/ou senha inválidos.    |
            | martin@404.com   | 123456      | Usuário e/ou senha inválidos.    |
            | martin#mail.com  | 654321      | Oops. Informe um email válido!   |
            |                  | 654321      | Oops. Informe um email válido!   |
            | martin@gmail.com |             | Oops. Informe sua senha secreta! |

