require 'spec_helper'

describe Url do
  context 'instance' do
    it 'parses basic params' do
      url_s = 'https://lvh.me/foo/bar?baz=123'
      url = Url.new url_s

      expect(url.port).to eq(nil)
      expect(url.path).to eq('/foo/bar')
      expect(url.qs('baz')).to eq('123')
      expect(url.to_s).to eq(url_s)
    end

    it 'handles path prefix ' do
      list = %w(foo baz)
      url_s = 'https://lvh.me/:%s/some-path?baz=123' % list.join(':')
      url = Url.new url_s
      expect(url.path_prefix).to eq(list)
      expect(url.to_s).to eq(url_s)
    end

    it 'handles path params ' do
      url = Url.new 'https://lvh.me/base/foo:bar/baz:1?baz=123&boo=456'
      expect(url[:foo]).to eq('bar')
      expect(url[:baz]).to eq('123')
      expect(url['baz']).to eq('123')
      expect(url[:boo]).to eq('456')
    end

    it 'handles path params ' do
      url = Url.new 'https://lvh.me/base/foo:bar/baz:1?baz=123&boo=456'
      expect(url.path_qs).to eq({"baz"=>"1", "foo"=>"bar"})
      expect(url.path_qs(:baz)).to eq('1')
      expect(url.qs(:baz)).to eq('123')
      expect(url.pqs(:baz)).to eq('1')
    end

    it 'handles path params ' do
      url = Url.new 'https://lvh.me/base/foo:bar/baz:1?baz=123&boo=456'
      expect(url.pqs(:baz)).to eq('1')

      url.pqs(:baz, 123)
      expect(url.pqs(:baz)).to eq('123')

      url.pqs(:baz, nil)
      expect(url.to_s).to eq("https://lvh.me/base/foo:bar?baz=123&boo=456")
    end

    it 'encodes' do
      url = Url.new '/foo'
      url.qs[:foo] = 'a/b|c d'
      expect(url.to_s).to eq("/foo?foo=a%2Fb%7Cc+d")
    end

    it 'gets locale' do
      url = Url.new '/fr/foo'
      expect(url.locale).to eq('fr')

      url = Url.new '/en-UK/foo'
      expect(url.locale).to eq('en-UK')
    end
  end
end
  