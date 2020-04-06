
describe 'iframer' do

    describe 'bom', :iframer do
    
        before(:each) do
            visit '/nice_iframe'
        end

        it 'adicione ao carrinho' do

            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click 
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 2 #temporário
            end
        end
    end  

    describe 'ruim', :iframer2 do
        
        before(:each) do
            visit '/bad_iframe'
        end

        
        it' carrinho deve estar vazio' do
            #criando um id_temporário na pagina
            script = '$(".box-iframe").attr("id","tempId");'
            page.execute_script(script)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
                sleep 2 #temporário
            end

        end

    end
end