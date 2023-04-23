require 'spec_helper'

module Lux
  extend self
  
  def current
    self
  end

  def request
    Struct.new(:url).new('https://base.lvh.me:3000/fr/some/path?foo=bar')
  end
end

describe Url do
  context 'class' do
    it 'sets query string' do
      expect(Url.qs(:foo, :baz)).to eq('/fr/some/path?foo=baz')
      expect(Url.qs(:bar, :baz)).to eq('/fr/some/path?bar=baz&foo=bar')
    end

    it 'sets path query string' do
      expect(Url.pqs(:foo, :baz)).to eq('/fr/some/path/foo:baz')
      expect(Url.pqs(:name, 'dux')).to eq("/fr/some/path/name:dux?foo=bar")
    end

    it 'sets locale' do
      expect(Url.locale(:en)).to eq('/en/some/path?foo=bar')
    end

    it 'sets subdomain' do
      expect(Url.subdomain('admin')).to eq("https://admin.lvh.me:3000/fr/some/path?foo=bar")
    end

    it 'gets host' do
      expect(Url.host).to eq("base.lvh.me")
    end
  end
end
  