require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe "#add" do
    context "with empty input" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "with a single number string" do
      it "returns 1" do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end

    it "returns the sum for two numbers separated by a comma" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "handles new lines between numbers instead of commas" do
      expect(StringCalculator.add('1\n2,3')).to eq(6)
    end
  
    it "supports different delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end
  
    it "throws an exception for negative numbers" do
      expect { StringCalculator.add("1,-2,3") }.to raise_error(RuntimeError, "Negative numbers not allowed: -2")
    end
  end
end