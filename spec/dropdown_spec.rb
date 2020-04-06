
describe "Caixa de opções", :dropdown do

    it "Item especifico simples" do
        visit '/'
        select ("Loki"), from: "dropdown"
        
    end
    
    it "Item especifico com find" do
        visit '/'
        drop = find('.avenger-list')
        drop.find("option", text: "Scott Lang").select_option
      
    end

    it "Qualquer item", :sample do
        visit "/dropdown"
        drop = find('.avenger-list')
        drop.all("option").sample.select_option 
        
    end
end