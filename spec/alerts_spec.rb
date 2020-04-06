
describe 'Alerta de JavaScript', :alert do
    
    before(:each) do
        visit '/javascript_alerts'
    end

    it 'alerta' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 1 #temporário
    end

    it 'sim confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        sleep 1 #temporário

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
        sleep 1 #temporário
    end

    it 'não confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        sleep 1 #temporário
        
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
        sleep 1 #temporário
    end

    it 'accept prompt', :acp do
        
        accept_prompt(with: 'Fernando') do
            click_button 'Prompt'
            sleep 1
        end

        expect(page).to have_content 'Olá, Fernando'
        sleep 2
    end
        
    it 'dismiss prompt', :disp do

        click_button 'Prompt'
        dismiss_prompt 
        sleep 1 #temporário
        
        expect(page).to have_content 'Olá, null'
        sleep 2 #temporário
    end

end