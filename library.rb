class Library
  
  attr_reader :books

  def initialize
    @books = []
  end

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author}, status: #{book.status}"
    end
  end

  def borrowed_books
    @books.each do |book|
      if book.status == 'checked-out'
        puts "The book #{book.title} is currently checked-out by #{book.borrower.name}."
      end
    end
  end

  def available_books
    puts "These books are available:"
    @books.each do |book|
      if book.status == "available"
        puts "#{book.title} by #{book.author}"
      end
    end
  end

  def add_book(book)
    @books << book
    puts "You have added #{book.title} by #{book.author} to the Library!"
  end

  def check_out(user, book)

    if user.borrowed_books.length == 2
      puts "You, #{user.name}, already have 2 books checked-out, please return a book."
      return "Failed request."
    end

    if book.status == "available"
      book.borrower = user
      book.status = "checked-out"
      user.borrow_book(book)
      puts "You, #{user.name}, have successfully checked-out #{book.title}."
    else
      puts "The book, #{book.title}, is not available."
    end

  end

  def check_in(book)
    
  end
 
end

class Borrower

  attr_accessor :name

  def initialize(name)
    @name = name
    puts "Welcome to the Library, #{@name}."
    @books = []
  end

  def borrowed_books
    @books
  end

  def borrow_book(book)
    @books << book
  end

  def borrowed_books_count
    @books.length
  end

  def borrowed_books_list
    @books.each {|book| puts "#{book.title} by #{book.title}"}
  end

end

class Book
  
  attr_reader :title, :author

  attr_accessor :edition, :year_published, :status, :borrower

  def initialize(title, author)
    @title = title
    @author = author
    puts "I love the book #{@title}, by #{@author}!"
    @status = "available"
    @borrower = nil
  end

end
