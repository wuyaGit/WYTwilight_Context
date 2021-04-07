#
#  Be sure to run `pod spec lint WYTwilight_Context.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "WYTwilight_Context"
  spec.version      = "0.0.1"
  spec.summary      = "项目上下文."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
项目上下文
                   DESC

  spec.homepage     = "https://github.com/wuyaGit/WYTwilight_Context"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  spec.license      = { :type => "MIT", :file => "LICENSE" }



  spec.author		= { "wuyagit" => "407671883@qq.com" }
  spec.source       = { :git => "https://github.com/wuyaGit/WYTwilight_Context.git", :tag => spec.version.to_s }


  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5.0"

  spec.source_files  = "Context", "Context/**/*.{h,swift}"
  spec.resource_bundles = {
      'Context' => ['Context/**/*.{xcassets,storyboard}']
  }


	spec.dependency 'WYUtilCore'
  spec.dependency 'WYNetworkCore'

end
