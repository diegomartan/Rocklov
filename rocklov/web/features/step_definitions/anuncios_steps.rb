Dado("Login com {string} e {string}") do |email, password|
  @email = email

  @login_page = LoginPage.new
  @login_page.open
  @login_page.with(email, password)
end

Dado("que acesso o formulario de cadastro de anuncios") do
  @dash_page.goto_equipo_form
end

Dado("que eu tenha o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash #rows_hash é o método que pega uma tabela de chave e valor e converte para um objeto do Ruby

  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)
end

Então("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então("deve conter a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end
