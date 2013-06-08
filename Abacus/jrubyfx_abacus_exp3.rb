require "jrubyfx"

class AbacusExp3 < JRubyFX::Application

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

	def create_circle(row,column)

		c = circle(radius:@@RADIUS-1, centerX:row, centerY:column) do

			set_on_mouse_clicked do |event|

				translate_x = translateXProperty

				timeline(cycle_count: 1, auto_reverse: false) do

					animate translate_x, 0.sec => 250.ms, c.translateX == @@TRANS_DIST ? @@TRANS_DIST : 0 => c.translateX == 0 ? @@TRANS_DIST : 0			

				end.play				

			end

		end

	end

	def start(stage)

		with(stage,title:"JRubyFX Abacus Experiment 3", width:@@PADDED_WIDTH + @@TRANS_DIST + @@RADIUS, height:@@PADDED_HEIGHT + @@OFFSET) do

			p = Pane.new

			@@ROW_COUNT.times do |x|

				@@COL_COUNT.times do |y|

					p.add(AbacusExp3.new().create_circle(@@OFFSET + (x * @@DIAMETER),@@OFFSET + (y * @@DIAMETER)))

				end

			end

			stage.scene = Scene.new(p)

		end

		stage.show()

	end

end

AbacusExp3.launch