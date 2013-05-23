require "jrubyfx"

class HelloWorldExp < JRubyFX::Application

	def start(stage)

		with(stage,title:"JRuby FX Example",width:300,height:300) do 

			label = Label.new()
			label.text = "Click here to speak"
			label.font = Font.new("Calibri",20)
			
			b = Button.new("Click me")

			g = GridPane.new
			g.alignment = Pos::CENTER
			g.add(label, 0, 0);
			g.add(b,0,1)

			sce = Scene.new(g)			
			stage.scene = sce	

			b.set_on_action do
				label.font = Font.new("Calibri",50)
				label.text = "Hello World"
				sce.fill = Color::BLACK
				label.textFill = linear_gradient(0,0,0,1, true, :no_cycle, [stop(0, :cyan), stop(1, :dodger_blue)])
				label.set_effect(drop_shadow(color: :dodger_blue, radius: 25,spread: 0.25))
				b.opacity = 0
			end	

		end

		stage.show()
	end

end
HelloWorldExp.launch