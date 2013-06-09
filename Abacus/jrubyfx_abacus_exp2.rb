#!/usr/bin/env jruby
# Original version is here: https://github.com/Dierk/learnJavaFx/blob/master/src/solution/Abacus_2_Add_all_balls_and_onClick.java
# Modified by Prasanth <@prashanth702> and Shakeer

require "jrubyfx"

class AbacusExp1 < JRubyFX::Application

 @@ROW_COUNT = 10
 @@COL_COUNT = 10
 @@RADIUS = 20
 @@DIAMETER = 2 * @@RADIUS
 @@SCENE_WIDTH = @@COL_COUNT * @@DIAMETER
 @@SCENE_HEIGHT = @@ROW_COUNT * @@DIAMETER
 @@TRANS_DIST = 100

  def start(stage)
    with(stage,title:"JRubyFX - Abacus",width:@@SCENE_WIDTH+@@TRANS_DIST,height:@@SCENE_HEIGHT) do
      layout_scene do
        pane do

          @@ROW_COUNT.times do |x|				
            @@COL_COUNT.times do |y|
              c = circle(radius:@@RADIUS-1, centerX:(@@RADIUS + (y * @@DIAMETER)), centerY:(@@RADIUS + (x * @@DIAMETER))) do
                set_on_mouse_clicked do 
                  c.translateX = @@TRANS_DIST	
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

AbacusExp1.launch