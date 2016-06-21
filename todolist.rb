class TodoList
  attr_accessor :title, :items
  
  #methods and stuff go here
  def initialize(list_title)
    @title = list_title
    @items = Array.new
  end
  
  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end
  
  def delete_item(new_item)
    @items.delete(item)
  end
  
  def print_items
    puts "-" * 20
    puts @title
    puts "-" * 20
    @items.each_with_index do |item, index|
      puts "#{index + 1} - #{@items[index].description}"  
    end
  end 
#   def print_items
#     print_list_title
#     @items.each_with_index do |task, index|
#       puts "#{index +1} - #{task.print_task}"   
#     end
#   end
end

class Item
  attr_reader :description, :completed_status
  
  #Initialize item with a description and marked as not complete
  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end
end 
#  def print_items #(item_description)
#    puts "test"  #item_description
#    puts "Completed: " @complated_status
#  end
  
