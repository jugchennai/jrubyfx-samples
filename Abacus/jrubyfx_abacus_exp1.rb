require "jrubyfx"

class AbacusExp1 < JRubyFX::Application

	def start(stage)

		with(stage,title:"JRubyFX Abacus Experiment 1",width:400,height:400) do

			p = Pane.new

			c = Circle.new()	
			c.radius = 20
			c.centerX = 20
			c.centerY = 20

			p.add(c);

			sce = Scene.new(p)	
			stage.scene = sce
			
		end
		
		stage.show()

	end

end

AbacusExp1.launch