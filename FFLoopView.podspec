Pod::Spec.new do |s|
  s.name         = "FFLoopView"
  s.version      = "1.0.2"
  s.summary      = "Simple images loop view in Swift with custom paging view"
  s.homepage     = "https://github.com/liufan321/FFLoopView"
  s.license      = "MIT"
  s.author       = { "Fan Liu" => "liufan321@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/liufan321/FFLoopView.git", :tag => s.version }
  s.source_files  = "FFLoopView", "FFLoopView/Source/*.swift"
  s.requires_arc = true
  s.dependency "SDWebImage"
end
