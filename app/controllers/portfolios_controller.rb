class PortfoliosController < ApplicationController

  ## added following b/c I was getting error: ruby ActionController::InvalidAuthenticityToken
  ## after adding default image values to portfolio create action.
  skip_before_action :verify_authenticity_token
  ####################
  
  def index
    @portfolio_items = Portfolio.all
  end

# for practice only
  def angular_items
    @angular_items = Portfolio.angular
  end
  def ruby
    @ruby_items = Portfolio.ruby_on_rails_portfolio_items
  end
  #################

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Porfolio item was successfully destroyed.' }
    end
  end

end
