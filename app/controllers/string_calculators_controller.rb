class StringCalculatorsController < ApplicationController
  def new
    @result = params[:result]
  end

  def create
    result = StringCalculator.add(calculator_params[:numbers])
    redirect_to new_string_calculator_path(result: result)
  end

  private

  def calculator_params
    params.require(:calculator).permit(:numbers)
  end
end
