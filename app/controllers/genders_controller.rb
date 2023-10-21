class GendersController < ApplicationController
  def index
    @genders = Gender.all.order(description: :asc)
  end
  
  def new
    @gender = Gender.new
  end

  def create
    @gender = Gender.new(description: params[:gender][:description])

    if @gender.save
      return redirect_to new_gender_path
      
    end

    render :new
  end

  def edit
    @gender = Gender.find(params[:id])
  end

  def update
    @gender = Gender.find(params[:id])

    if @gender.update(description: params[:gender][:description])
      return redirect_to genders_path

    else
      render :edit
    end  
  end
end