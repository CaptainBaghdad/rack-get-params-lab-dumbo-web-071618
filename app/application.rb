class Application

  @@items = ["Apples","Carrots","Pears"]
  
  @@cart = ["Cell Phone", "Beach ball", "taco"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end
    
    if req.path.match(/cart/)
       if @@cart.empty? 
       resp.write "Your cart is empty"
     else 
        @@cart.each do |ele|
          resp.write "#{ele}\n"
          
        end 
        
     end 
   end
   
   if req.path.match(/add/)
       ans = req.params["item"]
        @@items.include?(ans) ? @@cart << ans : resp.write "Sorry, this is an error message that has been rendered beacuse you entered the wrong information  that has noting  to do  with the last tune tat has been entered into the string."
        
        
     
        
   end 

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
