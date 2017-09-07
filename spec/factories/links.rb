FactoryGirl.define do
  factory :valid_urls, class: Array do
    initialize_with { [

      "http://foo.com/blah_blah",
      "http://foo.com/blah_blah/",
      "http://foo.com/blah_blah_(wikipedia)",
      "http://foo.com/blah_blah_(wikipedia)_(again)",
      "http://www.example.com/wpstyle/?p=364",
      "https://www.example.com/foo/?bar=baz&inga=42&quux",
      "http://✪df.ws/123",
      "http://userid:password@example.com:8080",
      "http://userid:password@example.com:8080/",
      "http://userid@example.com",
      "http://userid@example.com:8080",
      "http://userid@example.com/",
      "http://userid@example.com:8080/",
      "http://userid:password@example.com",
      "http://userid:password@example.com/",
      "http://142.42.1.1/",
      "http://142.42.1.1:8080/",
      "http://➡.ws/䨹",
      "http://⌘.ws",
      "http://⌘.ws/",
      "http://foo.com/blah_(wikipedia)#cite-1",
      "   http://foo.com/blah_(wikipedia)_blah#cite-1  ",
      "http://foo.com/unicode_(✪)_in_parens  ",
      "http://☺.damowmow.com/",
      "   http://foo.com/(something)?after=parens",
      "http://code.google.com/events/#&product=browser",
      "http://j.mp",
      "ftp://foo.bar/baz	",
      "http://foo.bar/?q=Test%20URL-encoded%20stuff",
      "http://مثال.إختبار",
      "http://例子.测试",
      "http://उदाहरण.परीक्षा",
      "http://-.~_!$&'()*+,;=:%40:80%2f::::::@example.com",
      "http://1337.net",
      "http://a.b-c.de",
      "http://223.255.255.254",
      "http://",
      "h"

      ] }
  end


  factory :invalid_urls, class: Array do
    initialize_with { [
      "", "      ", "  \n  ", "  \t "
      ] }
  end


end