class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @word_count = "Replace this string with your answer"

    @character_count_with_spaces = "Replace this string with your answer"

    @character_count_without_spaces = "Replace this string with your answer"

    @occurrences = "Replace this string with your answer"
  end

  def loan_payment
  end

  def time_between
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @count = "Replace this string with your answer"

    @minimum = "Replace this string with your answer"

    @maximum = "Replace this string with your answer"

    @range = "Replace this string with your answer"

    @median = "Replace this string with your answer"

    @sum = "Replace this string with your answer"

    @mean = "Replace this string with your answer"

    @variance = "Replace this string with your answer"

    @standard_deviation = "Replace this string with your answer"

    @mode = "Replace this string with your answer"
  end
end
