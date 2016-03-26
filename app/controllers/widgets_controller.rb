class WidgetsController < ApplicationController
  def index
    render 'index', locals: { widgets: Widget.all }
  end

  def show
    render 'show', locals: { widget: find_widget }
  end

  def new
    render 'new', locals: { widget: Widget.new }
  end

  def edit
    render 'edit', locals: { widget: find_widget }
  end

  def create
    widget = Widget.new(widget_params)

    if widget.save
      redirect_to widget, notice: t('.notice')
    else
      render 'new', locals: { widget: widget }
    end
  end

  def update
    widget = find_widget

    if widget.update(widget_params)
      redirect_to widget, notice: t('.notice')
    else
      render 'edit', locals: { widget: widget }
    end
  end

  def destroy
    find_widget.destroy
    redirect_to widgets_url, notice: t('.notice')
  end

  private

  def find_widget
    Widget.find(params[:id])
  end

  def widget_params
    params.require(:widget).permit(:name)
  end
end
