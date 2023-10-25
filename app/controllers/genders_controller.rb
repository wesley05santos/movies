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
      flash[:notice] = 'Informações foram salvas com Sucesso'
      return redirect_to genders_path
      
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

  def destroy
    gender = Gender.find(params[:id])    
    gender.movies.empty? ? gender.destroy : flash[:alert] = 'Não é possivel remover Gẽnero com filme cadastrado.'
    redirect_to genders_path
  end
end