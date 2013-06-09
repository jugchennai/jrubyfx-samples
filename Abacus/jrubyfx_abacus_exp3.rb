#!/usr/bin/env jruby
# Original version is here: https://github.com/Dierk/learnJavaFx/blob/master/src/solution/Abacus_3_Ball_transition.java
# Modified by Prasanth <@prashanth702> and Shakeer

require "jrubyfx"

class AbacusExp3 < JRubyFX::Application

 @@ROW_COUNT = 10
 @@COL_COUNT = 10
 @@RADIUS = 20
 @@DIAMETER = 2 * @@RADIUS
 @@TRANS_DIST = 8 * @@DIAMETER
 @@PADDING = 20
 @@OFFSET = @@PADDING + @@RADIUS	
 @@SCENE_WIDTH = @@COL_COUNT * @@DIAMETER + @@TRANS_DIST 
 @@SCENE_HEIGHT = @@ROW_COUNT * @@DIAMETER	

  def start(stage)
    with(stage,title:"JRubyFX - Abacus",width:@@SCENE_WIDTH + 3 * @@PADDING,height:@@SCENE_HEIGHT + 4 * @@PADDING ) do
      layout_scene do
        pane do

          @@ROW_COUNT.times do |x|				
            @@COL_COUNT.times do |y|
              c = circle(radius:@@RADIUS-1, centerX:@@OFFSET + (y * @@DIAMETER), centerY:@@OFFSET + (x * @@DIAMETER)) do
                set_on_mouse_clicked do 
                  translate_x = translateXProperty
                  timeline(cycle_count: 1, auto_reverse: false) do
                    animate translate_x, 0.sec => 250.ms, c.translateX == @@TRANS_DIST ? @@TRANS_DIST : 0 => c.translateX == 0 ? @@TRANS_DIST : 0
                  end.play	
                end
              end
            end
          end

        end				
      end			
      show		
    end	
  end
end

AbacusExp3.launch