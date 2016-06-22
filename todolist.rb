class TodoList
  attr_accessor :title, :items
  
  #methods and stuff go here
  def initialize(list_title)
    @title = list_title
    @items = Array.new
  end
  
  #Add new item to array
  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end
  
  #Delete items from the array using the index value
  def delete_item(index)
    @items.delete_at(index)
  end

  #Update the status of an item (completed or not completed) using index and 
  #true for completed and false for not completed  
  def update_item_status(index, status)
    @items[index].change_completed_status(status)
  end

  #Rename title of list
  def rename_list_title(new_list_title)
    @title = new_list_title
  end
  
  #Print the header for the To Do List  
  def print_list_header
    puts "-" * 30
    puts @title
    puts "-" * 30
    puts "TO DOs".ljust(45) + "Completed?"
  end

  #Print the tasks in the list in a numbered fashion 
  def print_items
    print_list_header
    @items.each_with_index do |task, index|
      puts "#{index + 1} - " + "#{task.print_task}"
    end
    puts ""
  end
end  

class Item
  attr_accessor :description, :completed_status
  
  #Initialize item with a description and marked as not complete
  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end

  #changes status of list  
  def change_completed_status(status)
    @completed_status = status
  end

  #will return false if not completed and true if completed  
  def completed?
    @completed_status
  end
 
  def print_task
    "#{@description.ljust(42)} #{completed? ? "[X]" : "[ ]"}" 
  end 
end  

