class Library
  def initialize
    @books = []
  end

  # def books

  # end

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def borrowed_books

  end

  def available_books

  end

  def add_book(book)
    @books << book
    puts "You have added #{book.title} by #{book.author} to the Library!"
  end

  def check_out(user, book)
  if user.borrowed_books.length == 2
    return "You already have 2 books checked-out, please return a book first."
  end
  if book.status = "available"
     book.borrower = user
     book.status = "checked-out"
     return
   puts "The book #{book.title} is now checked out."
   

  end

  def check_in(book)
  end
 
end

class Borrower
  def initialize(name)
    @name = name
    puts "Welcome to the Library, #{@name}."
    @books = []
    @borrowed_books = []
  end

  def borrowed_books
    @borrowed_books
  end

  def name
  end

  def borrowed_books_count

  end

  def borrowed_books_list
  end
end

class Book
  def initialize(title, author)
    @title = title
    @author = author
    puts "I love the book #{@title}, by #{@author}!"
    @status = "available"
    @borrower = nil
  end

  def title
    @title
  end

  def author
    @author
  end

  def status
    @status
  end

  def status=(new_value)
    @status = new_value
  end

  def borrower
    @borrower
  end

  def borrower=(new_value)
    @borrower = new_value
  end
end
