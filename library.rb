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

  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
    @name = name
    puts "Welcome to the Library, #{@name}."
  end

  def borrowed_books
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
  end

  def title
    @title
  end

  def author
    @author
  end
end
