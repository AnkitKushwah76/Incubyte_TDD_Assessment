class StringCalculatorsController < ApplicationController
  def new
    @result = params[:result]
    @error = params[:error]
  end

  def create
    result = StringCalculator.add(calculator_params[:numbers])
    redirect_to new_string_calculator_path(result: result)
  rescue => e
    redirect_to new_string_calculator_path(error: e.message)
  end

  private

  def calculator_params
    params.require(:calculator).permit(:numbers)
  end
end
