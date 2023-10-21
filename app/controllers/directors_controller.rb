class DirectorsController < ApplicationController
  def index
    @directors = Director.all.order(name: :asc)
  end
  
  def show
    @director = Director.all
  end
  
  def new
    @director = Director.new
  end

  def create
    @director = Director.new(name: params[:director][:name])

    if @director.save
      flash[:notice] = 'Informações foram salvas com Sucesso'
      return redirect_to directors_path

    end

    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(name: params[:director][:name])
      return redirect_to directors_path
      
    end

    render :new
  end
end