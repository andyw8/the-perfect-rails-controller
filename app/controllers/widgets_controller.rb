class WidgetsController < ApplicationController
  def index
    widgets = Widget.all
    render 'index', locals: { widgets: widgets }
  end

  def show
    widget = find_widget
    render 'show', locals: { widget: widget }
  end

  def new
    widget = Widget.new
    render 'new', locals: { widget: widget }
  end

  def edit
    widget = find_widget
    render 'edit', locals: { widget: widget }
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
