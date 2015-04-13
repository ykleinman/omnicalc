class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ", "").length

    normalized_text = @text.downcase.gsub(/[^a-z0-9\s]/i, '')

    @occurrences = normalized_text.split.count(@special_word)
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    rate = @apr / 100 / 12
    nper = @years * 12

    @monthly_payment = (rate * @principal)/(1 - (1 + rate)**-nper)
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds / 1.minute
    @hours = @seconds / 1.hour
    @days = @seconds / 1.day
    @weeks = @seconds / 1.week
    @months = @seconds / 1.month
    @years = @seconds / 1.year
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    if @count.odd?
      @median = @sorted_numbers[@count / 2]
    else
      @median = (@sorted_numbers[(@count / 2) - 1] + @sorted_numbers[(@count / 2)]) / 2
    end

    @sum = @numbers.sum

    @mean = @sum / @count

    squared_differences = []

    @numbers.each do |num|
      difference = num - @mean
      squared_difference = difference ** 2
      squared_differences.push(squared_difference)
    end

    @variance = squared_differences.sum / @count

    @standard_deviation = Math.sqrt(@variance)

    occurrences = Hash.new(0)

    @numbers.each do |num|
      occurrences[num] = occurrences[num] + 1
    end

    sorted_occurrences = occurrences.sort_by { |k, v| v }

    @mode = sorted_occurrences.last.first
  end
end
