
describe "Caixa de seleção", :checkbox do

    before(:each) do
    visit "/checkboxes"
    end

    it "marcando uma opção" do
        check("thor")
    end

    it "desmarcar uma opção" do
        uncheck("antman")
    end

    it "marcando com find set true" do
        find("input[value=cap]").set(true)
    end

    it "desmarcar com find set false" do
        find("input[value=guardians]").set(false)
    end

    after(:each) do
        sleep 2 # temporário
    end

end