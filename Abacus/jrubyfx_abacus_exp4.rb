require "jrubyfx"

class AbacusExp4 < JRubyFX::Application

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
		
		r = rectangle(x:column,y:row,width:@@SCENE_WIDTH+@@TRANS_DIST,height:@@RECT_HEIGHT)

	end

	def create_text(circle,column)

		t = text( circle.getCenterX-3 , circle.getCenterY+4,((@@COL_COUNT - column) % @@COL_COUNT).to_s) do

			translateXProperty.bind(circle.translateXProperty)

			set_on_mouse_clicked circle.get_on_mouse_clicked

			set_fill Color::WHITE			

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

		with(stage,title:"JRubyFX Abacus Experiment 4", width:@@PADDED_WIDTH + @@TRANS_DIST + @@RADIUS, height:@@PADDED_HEIGHT + @@OFFSET) do

			p = Pane.new

			@@ROW_COUNT.times do |x|

				p.add(AbacusExp4.new.create_rect(@@OFFSET + (x * @@DIAMETER)-(@@RECT_HEIGHT/2),@@PADDING))

				@@COL_COUNT.times do |y|

					c = AbacusExp4.new.create_circle(@@OFFSET + (x * @@DIAMETER),@@OFFSET + (y * @@DIAMETER))

					p.add(c)

					p.add(AbacusExp4.new.create_text(c,y))					

				end

			end

			stage.scene = Scene.new(p)

		end

		stage.show()

	end

end

AbacusExp4.launch