class ItemsController < ApplicationController

	def index
		@items = Item.all
		render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>")
	end

	def create
		@item = Item.create(params[:item]) # В строке передається таким образом item][name]= імя і так далі...
		render text: " #{@item.id}, #{@item.name} "
		
	end
end
