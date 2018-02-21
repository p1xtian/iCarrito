class InvoicedetailsController < ApplicationController
  before_action :set_invoicedetail, only: [:show, :edit, :update, :destroy]

  # GET /invoicedetails
  # GET /invoicedetails.json
  def index
    @invoicedetails = Invoicedetail.all
    @invoices = Invoice.where(void:false)
  end

  # GET /invoicedetails/1
  # GET /invoicedetails/1.json
  def show
  end

  # GET /invoicedetails/new
  def new
    @invoicedetail = Invoicedetail.new
  end

  # GET /invoicedetails/1/edit
  def edit
  end

  # POST /invoicedetails
  # POST /invoicedetails.json
  def create
    @invoicedetail = Invoicedetail.new(invoicedetail_params)
    
    respond_to do |format|
      if @invoicedetail.save
        updateinvoice(@invoicedetail.invoice_id)
        
        @producto = Product.where("sku =  ?",@invoicedetail.sku).first
        
        @producto.stock = @producto.stock - @invoicedetail.quantity
        @producto.save

        format.html { redirect_to @invoicedetail, notice: 'Invoicedetail was successfully created.' }
        #format.json { render :show, status: :created, location: @invoicedetail }
        format.json { render json: { gst: @invoicedetail } }
        #format.json { render :json, status: 200 }
    
      else
        format.html { render :new }
        format.json { render json: @invoicedetail.errors, status: :unprocessable_entity }
      end
   

    end
  end


def text2int(string)
  string.to_i + 1
end

  def updateinvoice(id)
@invoice = Invoice.find(id)
@boleta = (Invoice.where(typedoc: 1).select("correlative").order('correlative desc').first).correlative
@factura = (Invoice.where(typedoc: 2).select("correlative").order('correlative desc').first).correlative


if @invoice.typedoc == 1 then 
  @invoice.folio = "B001"
  @invoice.correlative = text2int(@boleta)
else 
  @invoice.folio = "F001"
  @invoice.correlative = text2int(@factura)
end
    subtotal = 0 
    igv = 0
    total = 0

    Invoicedetail.where(invoice: @invoice.id).each do |invoicedetail|
  subtotal = subtotal + invoicedetail.total/1.18
  igv = igv + invoicedetail.total/1.18*0.18
  total = total + invoicedetail.total

     end 

   @invoice.netsales = subtotal
   @invoice.taxes = igv
   @invoice.grosssales = total
   if total != 0 then @invoice.void = false else @invoice.void = true end
   @invoice.save
      
  end

  # PATCH/PUT /invoicedetails/1
  # PATCH/PUT /invoicedetails/1.json
  def update
    respond_to do |format|
      if @invoicedetail.update(invoicedetail_params)
        format.html { redirect_to @invoicedetail, notice: 'Invoicedetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoicedetail }
      else
        format.html { render :edit }
        format.json { render json: @invoicedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoicedetails/1
  # DELETE /invoicedetails/1.json
  def destroy
    id = @invoicedetail.invoice_id

        @producto = Product.where("sku =  ?",@invoicedetail.sku).first      
        @producto.stock = @producto.stock + @invoicedetail.quantity
        @producto.save

        @comprobante = Invoice.where(id:  @invoicedetail.invoice_id).first
        @comprobante.netsales = @comprobante.netsales - (@invoicedetail.total/1.18)
        @comprobante.taxes = @comprobante.taxes - (@invoicedetail.price/1.18*0.18)
        @comprobante.grosssales = @comprobante.grosssales - (@invoicedetail.total)
        @comprobante.save


    @invoicedetail.destroy
    respond_to do |format|
      #format.html { redirect_to invoicedetails_url, notice: 'Invoicedetail was successfully destroyed.' }
     format.json { head :no_content }
     format.html { 
          redirect_to :controller => 'invoicedetails', :action => 'new', :invoice_id => id }
     #format.html { redirect_to @invoicedetail, notice: 'Invoicedetail was successfully created.' }
 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoicedetail
      @invoicedetail = Invoicedetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoicedetail_params
      params.require(:invoicedetail).permit(:invoice_id, :sku, :name, :quantity, :price, :total)
    end
end
