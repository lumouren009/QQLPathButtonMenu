Pod::Spec.new do |s|
  s.name         = "QQLPathButtonMenu"
  s.version      = "0.0.1"
  s.summary      = "A short description of QQLPathButtonMenu LOL."

  s.description  = <<-DESC
                      A short summary of QQLPathButtonMenu LOL
                   DESC

  s.homepage     = "https://github.com/lumouren009/QQLPathButtonMenu"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "lumouren009" => "luzheng1208@163.com" }

  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/lumouren009/QQLPathButtonMenu.git", :tag => s.version.to_s }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.resource  = "icon.png"
  s.resources = "Assets/**/*"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
