
describe 'Tabelas', :tabs do

    before(:each) do
        visit '/tables'
    end
    
    it 'deve exibir o salario do stark' do
        atores = all('table tbody tr') 
        stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr')}
        expect(stark.text).to include '10.000.000'
    end

    it 'deve exibir o salario do vin diesel' do
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.000'
    end

    it 'deve exibir o salario do vin diesel' do
        diesel = find('table tbody tr', text: '@vindiesel')
        movie = diesel.all('td')[2].text
        expect(movie).to eql 'Velozes e Furiosos'
    end

    it 'deve exibir insta do Chris Evans' do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text
        expect(insta).to eql '@teamcevans'
    end

    it 'deve selecionar Chris Evans para remoção' do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
        sleep 2 #temporário
    end

    it 'deve selecionar Chris Evans para edição' do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
        sleep 2 #temporário
    end
    
end