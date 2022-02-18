#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado na Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizá-los para locação

    Contexto: Login

        * Login com "jose@gmail.com" e "123456"

    Cenario: Novo equipo

        Dado que acesso o formulario de cadastro de anuncios
            E que eu tenha o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard

    @semfoto
    Esquema do Cenario: Tentativa de cadastro de anuncios

        Dado que acesso o formulario de cadastro de anuncios
            E que eu tenha o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto         | nome        | categoria          | preco | saida                                |
            |              | Clarinete   | Outros             | 200   | Adicione uma foto no seu anúncio!    |
            | baixo.jpg    |             | Cordas             | 250   | Informe a descrição do anúncio!      |
            | trompete.jpg | Trompete    |                    | 300   | Informe a categoria                  |
            | violino.jpg  | Violino     | Cordas             |       | Informe o valor da diária            |
            | amp.jpg      | Aplificador | Áudio e Tecnologia | abc   | O valor da diária deve ser numérico! |
            | conga.jpg    | Conga       | Outros             | 100a  | O valor da diária deve ser numérico! |



