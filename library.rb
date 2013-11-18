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
    user = book.borrower
    user.return_book(book)
    book.status = "available"
    book.borrower = nil
    puts "Thank you for returning #{book.title}. Please give this book a rating of 10 for 'loved it', 5 for 'it was okay', or 0 for 'hated it'"
    book.add_rating(gets.chomp)
    puts "If you would like to write a review, please do so now, otherwise write 'nope'."
    user_input = gets.chomp
      if user_input.downcase == 'nope'
        return "opt-out"
      else
        book.add_review(user_input)
      end
    puts "Thank you, #{user.name}, you now have #{user.borrowed_books_count} book(s) checked-out."
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

# Internal: Borrow a book.
#
# book - An instance of the Book class.
#
# Examples
#
#   borrow_book(mockingbird)
#   # => @books == [mockingbird]
#   borrow_book(blue)
#   # => @books == [mockingbird, blue]
#
# Returns nothing
  def borrow_book(book)
    @books << book
  end

  def borrowed_books_count
    @books.length
  end

  def borrowed_books_list
    @books.each {|book| puts "#{book.title} by #{book.title}"}
  end

  def return_book(book)
    @books.delete(book)
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
    @ratings = []
    @reviews = []
  end

# Internal: Add a rating for this book.
#
# rating - string
#
# Examples
#
#   mockingbird.add_rating("6")
#   # => @ratings == [6]
#   mockingbird.add_rating("7")
#   # => @ ratings == [6, 7]
# 
# Returns @ratings
  def add_rating(rating)
    @ratings << rating.to_i
  end

# Public: Print this books ratings.
#
# Examples
#
#   mockingbird.ratings_list
#   # => 5
#        10
#
# Returns nothing
  def ratings_list 
    @ratings.each {|rating| puts rating}
  end

# Public: Print a statement telling the user this book's average rating.
#
# Examples
#
#   mockingbird.add_rating(5)
#   mockingbird.avg_rating
#   # => "The book To Kill a Mockingbird has an average rating of 5."
#
# Returns nothing
  def avg_rating
    sum = 0
    @ratings.each {|rating| sum += rating}
    avg_rating = sum / @ratings.length
    puts "The book #{@title} has an average rating of #{avg_rating}."
  end

# Internal: Add a review for this book.
#
# review - string
#
# Examples
#
#   add_review("Great book.")
#   # => @reviews == ["Great book."]
#   add_review("Not worth reading.")
#   # => @reviews == ["Great book.", "Not worth reading."]
#
# Returns nothing
  def add_review(review)
    @reviews << review
  end

# Public: Prints the reviews for this book.
#
# Examples
#
#   mockingbird.reviews_list
#   # => "Great book."
#        "Not worth reading."
#
# Returns nothing
  def reviews_list
    @reviews.each {|review| puts "#{review}"}
  end

end
