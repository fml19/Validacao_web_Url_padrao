describe "Meu primeiro script", :url do

    it "visitar a pagina" do
        visit '/'
        expect(page.title).to eql "Training Wheels Protocol"
      sleep 3 # temporário
    end


end