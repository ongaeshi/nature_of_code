class Vec2
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(v)
    Vec2.new(@x + v.x, @y + v.y)
  end

  def -(v)
    Vec2.new(@x - v.x, @y - v.y)
  end

  def *(s)
    Vec2.new(@x * s, @y * s)
  end

  def rotate(rad)
    s = Math.sin(rad)
    c = Math.cos(rad)
    Vec2.new(@x * c - @y * s, @x * s + @y * c)
  end

  def inspect
    "#{@x}, #{@y}"
  end
end

class KochLine
  attr_reader :first, :last

  def initialize(a, b)
    @first = a
    @last = b
    @line = Line.new(@first.x, @first.y, @last.x, @last.y)
  end

  def draw
    @line.draw(1, Palette::Black)
  end

  def koch_a
    @first
  end

  def koch_b
    @first + (@last - @first) * (1.0/3.0)
  end

  def koch_c
    v = @last - @first
    v *= (1.0/3.0)
    @first + v + v.rotate(Math.radians(-60))
  end

  def koch_d
    @first + (@last - @first) * (2.0/3.0)
  end

  def koch_e
    @last
  end
end

def generate(lines)
  next_gen = []

  lines.each do |e|
    a = e.koch_a
    b = e.koch_b
    c = e.koch_c
    d = e.koch_d
    e = e.koch_e

    next_gen << KochLine.new(a, b)
    next_gen << KochLine.new(b, c)
    next_gen << KochLine.new(c, d)
    next_gen << KochLine.new(d, e)
  end

  next_gen
end

#---
Graphics.set_background(Palette::White)

lines = []
lines << KochLine.new(Vec2.new(0, 200), Vec2.new(Window.width, 200))
lines = generate(lines)
lines = generate(lines)
lines = generate(lines)
lines = generate(lines)
lines = generate(lines)

camera = Camera2D.new

while System.update do
  camera.update
  camera.transform do
    lines.each do |e|
      e.draw
    end
  end
  camera.draw(Palette::Orange)
end
