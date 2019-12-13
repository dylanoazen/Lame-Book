require 'faker'
namespace :dev do

DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configurando ambiente de desevolvimento ..."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") {%x(rails db:drop)}
      show_spinner("Criando BD...") {%x(rails db:create)}
      show_spinner("Migrando BD...") {%x(rails db:migrate)}
      show_spinner("Cadastrando o Usúario Padrão...") {%x(rails dev:add_default_user)}
     
    else 
    	p "você não está no ambiente de desevolvimento"
    end
  end

 desc "Adiciona o usuário padrão"
	task add_default_user: :environment do
 	User.create!(
    nick_name: 'yIcarusFalls',
    first_name: 'Dylan',
    last_name: 'Oazen',
 		email: 'dylanoazen@gmail.com',
 		password: 'Killerdylan1',
 		password_confirmation: 'Killerdylan1'
 )
 end

  private
   
  def show_spinner(msg_start, msg_end = "concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}") 
    spinner.auto_spin
    yield
    spinner.stop("(#{msg_end})")
  end
end
