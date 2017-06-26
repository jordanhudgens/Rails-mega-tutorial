class PortfoliosController < ApplicationController
  ## added following b/c I was getting error: ruby ActionController::InvalidAuthenticityToken
  ## after adding default image values to portfolio create action.
  skip_before_action :verify_authenticity_token
  layout "portfolio"

  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
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
    3.times { @portfolio_item.technologies.build } #instantiates 3 versions...
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    # strong params ^

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
    3.times { @portfolio_item.technologies.build } #instantiates 3 versions...
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
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

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end
end
