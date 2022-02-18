class LoginPage
  include Capybara::DSL #Isso é um recurso parecido com o herança, que fala para o Ruby que essa classe (LoginPage) precisa conhecer todos os recursos do CAPYBARA

  def open
    visit "/"
  end

  def with(email, password)
    find("input[placeholder='Seu email']").set email
    find("input[type='password']").set password
    click_button "Entrar"
  end
end
