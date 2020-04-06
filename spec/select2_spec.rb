
describe 'Select2', :select2 do
    
    describe('single', :single) do
        before(:each) do
            visit '/apps/select2/single.html'
        end

        it 'seliciona ator por nome' do
            find('.select2-selection--single').click
            sleep 0.5 # temporário
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 1 # temporário
        end

        it 'busca e clica no nome do ator' do
            find('.select2-selection--single').click
            sleep 0.5 # temporário
            find('.select2-search__field').set 'Chris Rock'
            sleep 1 # temporário
            find('.select2-results__option').click
            sleep 1 # temporário
        end
        
    end


    describe('multiple', :mult) do

        before(:each) do
            visit '/apps/select2/multi.html'
        end

        def seleciona(ator) 
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end  

        it 'seleciona atores' do

            atores = ['Jim Carrey','Kevin James','Owen wilson']
            atores.each do |a|
                seleciona(a)
            end
        end
        sleep 1 #temporário

    end


end