class ItemAdvancesController < ApplicationController
  before_action :authenticate_user!
  #respond_to :html

  def index
    if current_user.admin?
      @item_advances = ItemAdvance.joins(:advance).includes(:client).where("DATE(item_advances.due_date) = ? and advances.status = ?", Date.today.to_s, Advance::TypeStatus::ABERTO)
    else
      @item_advances = ItemAdvance.items_user(current_user) 
    end
  end

  def edit
    @item_advance = ItemAdvance.find(params[:id])
  end

  def update
    if params[:value_payment].blank?
      redirect_to item_advances_path, :flash => { :danger => "Informe o valor da parcela" } 
      return
    end 
    @item_advance = ItemAdvance.find(params[:id])
    respond_to do |format|
      if @item_advance.update(date_payment: Date.current.to_s, value_payment: params[:value_payment], note: params[:note])
        @item_advance.baixa_parcela(Date.current.to_s, params[:value_payment].to_f)
        flash[:success] = "Parcela foi atualizada com sucesso."
        #format.html { redirect_to item_advances_path, success: 'ItemAdvance was successfully updated.' }
        #format.html { redirect_to select_client_path }
        format.html { redirect_to item_advances_path }
      else
        format.html { render action: 'edit' }
      end
    end
  end  

  # def destroy
  #   @item_advance = ItemAdvance.find(params[:id])
  #   advance = @item_advance.advance
  #   @item_advance.destroy
  #   respond_to do |format|
  #     format.html { redirect_to advance, notice: 'ItemAdvance destroyed was successfully.' }
  #     format.json { head :no_content }
  #   end
  # end  

  #private
    # def advance_params
    #   #params.require(:advance).permit(:date_advance, :client_id, :price, :balance, :number_parts, :percent)
    #   params.require(:item_advance).permit(:value_payment, :date_payment, :note)
    # end

end
