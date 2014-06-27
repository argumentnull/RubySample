#coding: utf-8

class HelloController < ApplicationController
  def index
    render text: 'こんにちは、世界！'
  end
  def view
    @msg = 'こんにちは、世界！'
  end
  def app_var
    # ender text: MY_APP['source']
  end
end
