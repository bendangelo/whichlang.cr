module Whichlang
  VERSION = {{ `shards version "#{__DIR__}"`.stringify.chomp }}

  {% if flag?(:darwin) %}
    @[Link(ldflags: "#{__DIR__}/../target/release/libwhichlang.dylib")]
  {% else %}
    @[Link(ldflags: "#{__DIR__}/../target/release/libwhichlang.so")]
  {% end %}
  lib LibWhichlang
    fun detect(UInt8*) : Int32
  end

  enum Lang
    Ara
    Cmn
    Deu
    Eng
    Fra
    Hin
    Ita
    Jpn
    Kor
    Nld
    Por
    Rus
    Spa
    Swe
    Tur
    Vie
    Unknown
  end

  def self.detect(text : String) : Lang
    return Lang::Unknown if text.blank?

    result = LibWhichlang.detect(text.to_unsafe)

    return Lang::Unknown if result.nil?

    Lang.from_value result
  end

  def self.detect?(text : String) : Lang | Nil
    return nil if text.blank?

    result = LibWhichlang.detect(text.to_unsafe)

    return nil if result.nil?

    Lang.from_value? result
  end

end
