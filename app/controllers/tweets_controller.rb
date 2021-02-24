class TweetsController < ApplicationController

  before_action :get_tweet, only: [:show, :update, :destroy]

  def index
    render json: {status: 200, tweets: Tweet.all}
  end

  def show
    render json: {status: 200, tweet: @tweet}
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      render json: {tweet: tweet}
    else
      render status: 422, json: {tweet: tweet, errors: tweet.errors}
    end
  end

  def update
    @tweet.update(tweet_params)
    render json: {tweet: @tweet}
  end

  private

  def tweet_params
    params.required(:tweet).permit(:title, :content, :author)
  end

  def get_tweet
    @tweet = Tweet.find(params[:id])
  end

end