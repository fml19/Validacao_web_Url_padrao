
describe "Upload", :upload do

    before(:each) do
    visit "/upload"
    @arquivo = Dir.pwd + "/spec/fixtures/teste.txt"
    @imagem = Dir.pwd + "/spec/fixtures/Hiei.png"
    end

    it "upload com arquivo texto" do
        attach_file("file-upload", @arquivo)
        click_button "Upload"

        div_arquivo = find("#uploaded-file")
        expect(div_arquivo.text).to eql "teste.txt"

    end

        
        it "upload de imagem" do
            attach_file("file-upload", @imagem)
            click_button "Upload"
    
        
        img = find("#new-image")
        expect(img[:src]).to include "/uploads/Hiei.png"
        end

        after(:each) do
        sleep 2 # temporário
        end

end
