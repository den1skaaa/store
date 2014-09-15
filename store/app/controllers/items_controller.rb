class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	# /items/new GET
	def new
		@item = Item.new
	end

	# /items/id GET
	def show
	  	if 	@item = Item.where(id: params[:id]).first
	  		render "items/show"
	 	 else
	  		render text: "Page not found", status: 404
	  	end
	end

	# /items/id PUT
	def update
		@item = Item.find(params[:id])
		@item.update_attributes(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end

	# /items/id DELETE
	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to action: "index"

	end

	# items/id/edit GET
	def edit
		@item = Item.find(params[:id])
	
	end

	# /items POST
	def create
		@item = Item.create(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end

end
