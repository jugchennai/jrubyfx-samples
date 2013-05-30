require "jrubyfx"

class AbacusExp1 < JRubyFX::Application

	@@ROW_COUNT = 10
	@@COL_COUNT = 10
	@@RADIUS = 20
	@@DIAMETER = 2 * @@RADIUS
	@@SCENE_WIDTH = @@COL_COUNT * @@DIAMETER
	@@SCENE_HEIGHT = @@ROW_COUNT * @@DIAMETER
	@@TRANS_DIST = 100

	def create_circle(row,column)

		c = circle(radius:@@RADIUS-1, centerX:(@@RADIUS + (column * @@DIAMETER)), centerY:(@@RADIUS + (row * @@DIAMETER))) do

			set_on_mouse_clicked do |event|

					c.translateX = @@TRANS_DIST				

			end

		end

	end

	def start(stage)

		with(stage,title:"JRubyFX Abacus Experiment 2", width:@@SCENE_WIDTH + @@TRANS_DIST + @@RADIUS, height:@@SCENE_HEIGHT) do

			p = Pane.new

			@@ROW_COUNT.times do |x|
				
				@@COL_COUNT.times do |y|

					p.add(AbacusExp1.new().create_circle(x,y))

				end

			end
			
			stage.scene = Scene.new(p)
			
		end

		stage.show()

	end

end

AbacusExp1.launch