require './register.rb'
require 'spec_helper'



RSpec.describe Product do     



    context "imported box of chocolates (imported, sales tax exempt)" do                                                                         

        before :all do
           @product = Product.new(name: 'imported box of chocolates', price: '2.22')  
        end

         it "coerces String price into BigDecimal (Virtus)"  do                                                                       
           expect(@product.price.class).to eq BigDecimal                                                                      
         end      

         it "considers food sales tax exempt" do
           expect(@product.is_sales_tax_exempt?).to eq true                                                                   
         end

         it "charges import tax" do
           expect(@product.import_duty_tax).to_not eq 0.0                                                                      
         end


       it "rounds tax to nearest 0.05" do
         ROUNDING = BigDecimal('0.05')
         expect(@product.total_tax % ROUNDING).to eq 0.0  
       end                                                                  



    end



    context "bottle of perfume (non-imported, not tax exempt)" do                                                                         

        before :all do
           @product = Product.new(name: 'bottle of perfume', price: '5.22')  
        end

         it "charges sales tax" do
           expect(@product.is_sales_tax_exempt?).to eq false   
           expect(@product.sales_tax).to_not eq 0.0   
                                                    
         end

         it "does not charge import tax" do
           expect(@product.import_duty_tax).to eq 0.0                                                                      
         end



    end



                                                                  

end 