Dado("que acesso a página de cadastro") do
  @signup_page.open
end

Quando("submeto o seguinte formulário de cadastro:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable

  user = table.hashes.first #Esse método transforma a tabela do arquivo .feature em um objeto do ruby

  MongoDB.new.remove_user(user[:email])

  @signup_page.create(user)
end
