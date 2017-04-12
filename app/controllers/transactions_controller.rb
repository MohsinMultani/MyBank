class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]


  def withdraw
    @account = Account.find(params[:account_id])
  end

  def do_withdraw  

    @account = Account.find(params[:account_id])

    respond_to do |format|
      if @account.withdrawal(params[:withdraw_amount])
        format.html { redirect_to @account, notice: 'Transaction successfull..' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :withdraw }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end


  def deposit 
    @account = Account.find(params[:account_id])
  end


  def do_deposit
    @account = Account.find(params[:account_id])

    respond_to do |format|
      if @account.deposit(params[:deposit_amount])
        format.html { redirect_to @account, notice: 'Ammount credited successfull..' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :deposit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /transactions
  # GET /transactions.json
  def index
    @account = current_user.account
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show

  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.fetch(:transaction, {})
      params.fetch(:account, {})
    end
end
