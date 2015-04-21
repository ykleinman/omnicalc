require 'rails_helper'

RSpec.describe "Calculation", type: :feature do
  describe "Word Count simple" do
    before do
      visit '/word_count/new'
      fill_in 'user_text', with: 'roses are red, violets are blue'
      fill_in 'user_word', with: 'are'
      click_button 'Submit'
    end

    it "displays the submitted text", points: 5 do
      expect(page).to have_content 'roses are red, violets are blue'
    end

    it "displays the word count", points: 5 do
      expect(page).to have_content 6
    end

    it "displays the character count with spaces", points: 5 do
      expect(page).to have_content 31
    end

    it "displays the character count without spaces", points: 5 do
      expect(page).to have_content 26
    end

    it "displays count of the special word occurrences", points: 5 do
      expect(page).to have_content 2
    end
  end

  describe "Loan Payment simple" do
    before do
      visit '/loan_payment/new'
      fill_in 'annual_percentage_rate', with: 4.5
      fill_in 'number_of_years', with: 30
      fill_in 'principal_value', with: 50000
      click_button 'Submit'
    end

    it "displays the submitted APR", points: 5 do
      expect(page).to have_content '4.5%'
    end

    it "displays the submitted number of years", points: 5 do
      expect(page).to have_content 30
    end

    it "displays the submitted principal", points: 5 do
      expect(page).to have_content '$50,000'
    end

    it "displays the calculated monthly payments", points: 5 do
      expect(page).to have_content '$253.34'
    end
  end

  describe "Time Between simple" do
    before do
      visit '/time_between/new'
      fill_in 'starting_time', with: '04/16/2015 4:00 PM'
      fill_in 'ending_time', with: '04/17/2015 4:02 PM'
      click_button 'Submit'
    end

    it "displays the starting time", points: 5 do
      expect(page).to have_content '4:00pm'
      expect(page).to have_content 'April 16, 2015'
    end

    it "displays the ending time", points: 5 do
      expect(page).to have_content '4:02pm'
      expect(page).to have_content 'April 17, 2015'
    end

    it "displays the seconds between", points: 5 do
      expect(page).to have_content '86520'
    end

    it "displays the minutes between", points: 5 do
      expect(page).to have_content '1442'
    end

    it "displays the hours between", points: 5 do
      expect(page).to have_content '24.0333'
    end

    it "displays the days between", points: 5 do
      expect(page).to have_content '1.0013'
    end

    it "displays the weeks between", points: 5 do
      expect(page).to have_content '0.1430'
    end

    it "displays the months between", points: 5 do
      expect(page).to have_content '0.0333'
    end

    it "displays the years between", points: 5 do
      expect(page).to have_content '0.0027'
    end
  end

  describe "Descriptive Statistics simple" do
    before do
      visit '/descriptive_statistics/new'
      fill_in 'list_of_numbers', with: '1 23 23 1 82 38.6'
      click_button 'Submit'
    end

    it "displays the submitted numbers as an array", points: 5 do
      expect(page).to have_content [1.0, 23.0, 23.0, 1.0, 82.0, 38.6]
    end

    it "displays the numbers as a sorted array", points: 5 do
      expect(page).to have_content [1.0, 1.0, 23.0, 23.0, 38.6, 82.0]
    end

    it "displays the count of numbers", points: 5 do
      expect(page).to have_content 6
    end

    it "displays the lowest number", points: 5 do
      expect(page).to have_content 1.0
    end

    it "displays the highest number", points: 5 do
      expect(page).to have_content 82.0
    end

    it "displays the range between the lowest and highest numbers", points: 5 do
      expect(page).to have_content 81.0
    end

    it "displays the median of the numbers", points: 5 do
      expect(page).to have_content 23.0
    end

    it "displays the sum of the numbers", points: 5 do
      expect(page).to have_content 168.6
    end

    it "displays the mean of the numbers", points: 5 do
      expect(page).to have_content 28.09
    end

    it "displays the variance of the numbers", points: 5 do
      expect(page).to have_content 756.05
    end

    it "displays the standard deviation of the numbers", points: 5 do
      expect(page).to have_content 27.49
    end

    it "displays the mode of the numbers", points: 5 do
      expect(page).to have_content 1.0
    end
  end
end
