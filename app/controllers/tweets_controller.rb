class TweetsController < ApplicationController

  before_action :get_tweet, only: [:show, :update, :destroy]

  def index
    render json: {status: 200, tweets: Tweet.all}
  end

  def show
    render json: {status: 200, tweet: @tweet}
  end

  private

  def tweet_params
    params.required(:tweet).permit(:title, :content, :author)
  end

  def get_tweet
    @tweet = Tweet.find(params[:id])
  end

  
end