class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
    render 'index', locals: { widgets: @widgets }
  end

  def show
    set_widget
    render 'show', locals: { widget: @widget }
  end

  def new
    @widget = Widget.new
    render 'new', locals: { widget: @widget }
  end

  def edit
    set_widget
    render 'edit', locals: { widget: @widget }
  end

  def create
    @widget = Widget.new(widget_params)

    if @widget.save
      redirect_to @widget, notice: 'Widget was successfully created.'
    else
      render 'new', locals: { widget: @widget }
    end
  end

  def update
    set_widget

    if @widget.update(widget_params)
      redirect_to @widget, notice: 'Widget was successfully updated.'
    else
      render 'edit', locals: { widget: @widget }
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
