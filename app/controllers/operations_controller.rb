class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[ new create edit update destroy ]

  # GET /operations or /operations.json
  def index
    # @operations = Operation.all
  end

  # GET /operations/1 or /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @operation = @group.operations.build
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    
    @operation = @group.operations.build(operation_params)
    @operation.author_id = current_user

    respond_to do |format|
      if @operation.save
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:name, :amount)
    end
end

    # @operation = current_user.operations.build(operation_params)
    # @group = current_user.groups.find(params[:group_id])
    # @operation = @group.operations.build(operation_params)