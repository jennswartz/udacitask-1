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
  
  def delete_item(index)
    @items.delete_at(index)
  end
  
  def print_list_header
    puts "-" * 20
    puts @title
    puts "-" * 20
    puts "All My 'To Dos' ".ljust(25) + "Completed?"
  end
  
  def print_items
    print_list_header
    @items.each_with_index do |task, index|
      puts "#{index + 1} - " + "#{task.print_task}"
    end
  end


  
#  def print_list_with_items
#    print_list
#    print_each_item
#  end
end  

class Item
  attr_accessor :description, :completed_status
  
  #Initialize item with a description and marked as not complete
  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end
 
  def print_task
    "#{@description.ljust(20)} {@completed_status}?"
  end 
end  

