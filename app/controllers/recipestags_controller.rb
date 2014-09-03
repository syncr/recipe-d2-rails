class RecipestagsController < ApplicationController

  def create
  @recipe = Recipe.find(params[:id])
  @tag = Tag.find(params[:tag])
  @recipe.tags << @tag
  flash[:notice] = "Updated Successfully."
  redirect_to("/recipes/#{@recipe.id}")
end

def delete
  @tag = Tag.find(params[:tag_id])
  @recipe = Recipe.find(params[:id])
  @recipe.tags.delete(@tag)
  flash[:notice] = "Removed Successfully."
  redirect_to("/recipes/#{@recipe.id}")
end

end