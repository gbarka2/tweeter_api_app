class MetaController < ApplicationController

  def about
    render json: {author: "Gary Barkauski"}
  end

end