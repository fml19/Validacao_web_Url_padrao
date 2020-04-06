
describe 'id dinamico', :login4 do
    
    before(:each) do
        visit '/access'
    end
    
    # $ => termina com..
    # ^ => começa com..
    # * => contem...

    it 'cadastro' do
        find('input[id$=UsernameInput]').set 'Nando'
        find('input[id^=PasswordInput]').set '12345'
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'

        sleep 2 #temporário
     
    end   
end