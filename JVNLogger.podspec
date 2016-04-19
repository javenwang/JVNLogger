#
# Be sure to run `pod lib lint JVNLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JVNLogger"
  s.version          = "0.1.0"
  s.summary          = "A logger uses CocoaLumberjack with runtime dependency."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "This Logger can use CocoaLumberjack if it exists and fallback to NSLog."

  s.homepage         = "https://github.com/javenwang/JVNLogger"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Javen Wang" => "jiaxwang@gmail.com" }
  s.source           = { :git => "https://github.com/javenwang/JVNLogger.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'JVNLogger/Classes/**/*'
#  s.resource_bundles = {
#    'JVNLogger' => ['JVNLogger/Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
