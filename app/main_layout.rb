class MainLayout < MK::Layout
  def layout
    root :root_view do
      add UIScrollView, :scroll_view do
        add UIView, :content_view do
          add UIView, :red_view
          add UIView, :blue_view
          add UIView, :green_view
        end
      end
    end
  end

  def root_view_style
    background_color UIColor.whiteColor
  end

  def red_view_style
    background_color UIColor.redColor
  end

  def blue_view_style
    background_color UIColor.blueColor
  end

  def green_view_style
    background_color UIColor.greenColor
  end

  def add_constraints
    unless @layout_constraints_added
      @layout_constraints_added = true

      constraints(:scroll_view) do
        top_left x: 0, y: 0
        bottom_right x: 0, y: 0
      end

      constraints(:content_view) do
        top_left x: 0, y: 0
        bottom_right x: 0, y: 0

        width.equals(:root_view) # .priority(:low)
        height.equals(:root_view).priority(:low)
      end

      constraints(:red_view) do
        left 20
        width.is('50%').of(:root_view, :width).minus(30)
        height 500
        top 20
      end

      constraints(:blue_view) do
        left.equals(:red_view, :right).plus(20)
        width.is('50%').of(:root_view, :width).minus(30)
        right -20
        height 500
        top 20
      end

      constraints(:green_view) do
        left 20
        right -20
        height 500
        top.equals(:red_view, :bottom).plus(20)
        bottom -20
      end
    end
  end
end
