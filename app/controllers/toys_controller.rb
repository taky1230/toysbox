class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.toys.ransack(params[:q])
    @toys = @q.result(distinct: true).page(params[:page]).per(5)
    # @toys = current_user.toys.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv  { send_data @toys.generate_csv, filename: "toys-#{Time.zone.now}.csv" }
      # format.csv  { send_data @toys.generate_csv, filename: "toys-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end

  end

  def show
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = current_user.toys.new(toy_params)
    
    if @toy.save
      ToyMailer.creation_email(@toy).deliver_now
      redirect_to @toy, notice: "おもちゃ『#{@toy.name}』を入れたよ！"
    else
      render :new
    end

  end

  def edit
  end

  def update
    @toy.update!(toy_params)
    redirect_to toys_url, notice: "おもちゃ『#{@toy.name}』を更新したよ！"
  end

  def destroy
    @toy.destroy
    redirect_to toys_url, notice: "おもちゃ『#{@toy.name}』をバイバイしたよ！"
  end

  private

  def toy_params
    params.require(:toy).permit(:name, :description, :image)
  end

  def set_toy
    @toy = current_user.toys.find(params[:id])
  end

  def import
    current_user.toys.import(params[:file])
    redirect_to toys_url, notice: "おもちゃを入れたよ！"
  end

end
