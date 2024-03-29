class RecipesController < ApplicationController

  def index
    @recipe = Recipe.new
    @recipes = Recipe.all
    @tags = Tag.all
    @ingredients = Ingredient.all
  end

  def create
    @ingredients = Ingredient.all
    @recipes = Recipe.all
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Created Successfully."
      redirect_to recipes_path
    else
      render "index"
    end
  end

  def show
    @ingredients = Ingredient.all
    @recipes = Recipe.all
    @tags = Tag.all
    @recipe = Recipe.find(params[:id])
    @tag = @recipe.tags.new
  end

  def edit
    @ingredients = Ingredient.all
    @recipes = Recipe.all
    @tags = Tag.all
    @recipe = Recipe.find(params[:id])
  end

  def update
    @ingredients = Ingredient.all
    @recipes = Recipe.all
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params[:recipe])
      flash[:notice] = "Updated Successfully."
      redirect_to recipes_path(@recipe)
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Removed Successfully."
    redirect_to recipes_path
  end
end
