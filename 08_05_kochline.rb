class KochLine
  def initialize(a, b)
    @start = a
    @end = b
    @line = Line.new(@start.x, @start.y, @end.x, @end.y)
  end

  def draw
    @line.draw(1, Palette::Black)
  end
end

#---
Graphics.set_background(Palette::White)

lines = []
lines << KochLine.new(Vec2.new(0, 200), Vec2.new(Window.width, 200))

while System.update do
  lines.each do |e|
    e.draw
  end
end
