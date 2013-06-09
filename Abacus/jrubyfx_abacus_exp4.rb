#!/usr/bin/env jruby
# Original version is here: https://github.com/Dierk/learnJavaFx/blob/master/src/solution/Abacus_4_Rail_and_Text_binding.java
# Modified by Prasanth <@prashanth702> and Shakeer

require "jrubyfx"

class AbacusExp4 < JRubyFX::Application

 @@ROW_COUNT = 10
 @@COL_COUNT = 10
 @@RADIUS = 20
 @@DIAMETER = 2 * @@RADIUS
 @@TRANS_DIST = 8 * @@DIAMETER
 @@PADDING = 20
 @@OFFSET = @@PADDING + @@RADIUS	
 @@SCENE_WIDTH = @@COL_COUNT * @@DIAMETER + @@TRANS_DIST 
 @@SCENE_HEIGHT = @@ROW_COUNT * @@DIAMETER	
 @@RECT_HEIGHT = 6	

  def start(stage)
    with(stage,title:"JRubyFX - Abacus",width:@@SCENE_WIDTH + 3 * @@PADDING,height:@@SCENE_HEIGHT + 4 * @@PADDING ) do
      layout_scene do
        pane do

          @@ROW_COUNT.times do |x|						
            rectangle(x:@@PADDING,y:@@OFFSET + (x * @@DIAMETER)-(@@RECT_HEIGHT/2),width:@@SCENE_WIDTH,height:@@RECT_HEIGHT)

            @@COL_COUNT.times do |y|
              c = circle(radius:@@RADIUS-1, centerX:@@OFFSET + (y * @@DIAMETER), centerY:@@OFFSET + (x * @@DIAMETER)) do
                set_on_mouse_clicked do 
                  translate_x = translateXProperty
                  timeline(cycle_count: 1, auto_reverse: false) do
                    animate translate_x, 0.sec => 250.ms, c.translateX == @@TRANS_DIST ? @@TRANS_DIST : 0 => c.translateX == 0 ? @@TRANS_DIST : 0
                  end.play	
                end
              end

              text( c.getCenterX-3 , c.getCenterY+4,((@@COL_COUNT - y) % @@COL_COUNT).to_s) do
                translateXProperty.bind c.translateXProperty
                set_on_mouse_clicked c.get_on_mouse_clicked
                set_fill Color::WHITE		
              end

            end
          end
        end				
      end			
      show		
    end	
  end
end

AbacusExp4.launch