class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
  end

  def show
    set_widget
  end

  def new
    @widget = Widget.new
  end

  def edit
    set_widget
  end

  def create
    @widget = Widget.new(widget_params)

    if @widget.save
      redirect_to @widget, notice: 'Widget was successfully created.'
    else
      render :new
    end
  end

  def update
    set_widget

    if @widget.update(widget_params)
      redirect_to @widget, notice: 'Widget was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    set_widget
    @widget.destroy
    redirect_to widgets_url, notice: 'Widget was successfully destroyed.'
  end

  private

  def set_widget
    @widget = Widget.find(params[:id])
  end

  def widget_params
    params.require(:widget).permit(:name)
  end
end
