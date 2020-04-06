describe "Login com Cadastro", :login3 do 

    before(:each) do
        visit "/access"
    end

    it "login com sucesso" do

        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!' 
            click_button "Entrar"
        end

        expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
        sleep 3 #temporário
    end
    
    #ou

    it "cadastro com sucesso" do
       
        signup_form = find('#signup')
 
        signup_form.find('input[name=username]').set 'Nando'
        signup_form.find('input[name=password]').set '12345' 
       
        click_link 'Criar Conta'
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
        sleep 3 #temporário
    end
end