#!/usr/bin/env jruby
# Original version is here: https://github.com/Dierk/learnJavaFx/blob/master/src/solution/Abacus_1_Hello_World.java
# Modified by Prasanth <@prashanth702> and Shakeer

require "jrubyfx"

class AbacusExp1 < JRubyFX::Application

  def start(stage)
    with(stage,title:"JRubyFX - Abacus",width:400,height:400) do
    	layout_scene do
        pane do
          circle(radius:20,centerX:20,centerY:20)
        end				
      end			
      show		
    end
  end
end

AbacusExp1.launch