require 'spec_helper'

module Lux
  extend self
  
  def current
    self
  end

  def request
    Struct.new(:url).new('https://lvh.me:3000/some/path?foo=bar')
  end
end

describe Url do
  context 'class' do
    it 'sets query string' do
      expect(Url.qs(:foo, :baz)).to eq('/some/path?foo=baz')
      expect(Url.qs(:bar, :baz)).to eq('/some/path?bar=baz&foo=bar')
    end

    it 'sets path query string' do
      expect(Url.pqs(:foo, :baz)).to eq('/some/path/foo:baz')
      expect(Url.pqs(:name, 'dux')).to eq("/some/path/name:dux?foo=bar")
    end
  end
end
  