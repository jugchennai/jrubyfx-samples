require "jrubyfx"

class AbacusExp6 < JRubyFX::Application

	@@ROW_COUNT = 10
	@@COL_COUNT = 10
	@@RADIUS = 20
	@@DIAMETER = 2 * @@RADIUS
	@@SCENE_WIDTH = @@COL_COUNT * @@DIAMETER 
	@@SCENE_HEIGHT = @@ROW_COUNT * @@DIAMETER
	@@TRANS_DIST = 100
	@@PADDING = 20
	@@OFFSET = @@PADDING + @@RADIUS
	@@PADDED_WIDTH = @@SCENE_WIDTH + 2 * @@PADDING
	@@PADDED_HEIGHT = @@SCENE_HEIGHT + 2 * @@PADDING
	@@RECT_HEIGHT = 6

	def create_rect(row,column)

		r = rectangle(x:column,y:row,width:@@SCENE_WIDTH+@@TRANS_DIST,height:@@RECT_HEIGHT) do

			get_style_class.add "rail"

		end

	end

	def create_text(circle,column)

		t = text( circle.getCenterX-3 , circle.getCenterY+4,((@@COL_COUNT - column) % @@COL_COUNT).to_s) do

			translateXProperty.bind(circle.translateXProperty)

			set_on_mouse_clicked circle.get_on_mouse_clicked

			get_style_class.add "text"

		end

	end

	def create_circle(row,column)

		c = circle(radius:@@RADIUS-1, centerX:column, centerY:row) do

			set_on_mouse_clicked do |event|

				translate_x = translateXProperty

				timeline(cycle_count: 1, auto_reverse: false) do

					a = c.translateX == @@TRANS_DIST ? @@TRANS_DIST : 0

				    animate translate_x, 0.sec => 250.ms, a => a == 0 ? @@TRANS_DIST : 0					

				end.play

			end

		end		

	end

	def start(stage)

		with(stage,title:"JRubyFX Abacus Experiment 6", width:@@PADDED_WIDTH + @@TRANS_DIST + @@RADIUS, height:@@PADDED_HEIGHT + @@OFFSET) do

			p = Pane.new

			@@ROW_COUNT.times do |x|

				p.add(AbacusExp6.new.create_rect(@@OFFSET + (x * @@DIAMETER)-(@@RECT_HEIGHT/2),@@PADDING))

				last = nil

				@@COL_COUNT.times do |y|

					c = AbacusExp6.new.create_circle(@@OFFSET + (x * @@DIAMETER),@@OFFSET + (y * @@DIAMETER))

					c.get_style_class.add y < @@COL_COUNT / 2 ? "left" : "right"

					p.add(c)

					p.add(AbacusExp6.new.create_text(c,y))

					if(last != nil)

						last.translateXProperty.add_change_listener do | obr, oval, nval |

							c.setTranslateX nval if(nval > c.getTranslateX)

						end

						final_last = last

						c.translateXProperty.add_change_listener do | obr, oval, nval |

							final_last.setTranslateX nval if(nval < final_last.getTranslateX)

						end

					end

					last = c

				end

			end

			sce = Scene.new(p)

			sce.get_stylesheets.add "abacus.css"

			stage.scene = sce

		end

		stage.show()

	end

end

AbacusExp6.launch