Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "SwiftyFileExplorer"
s.summary = "SwiftyFileExplorer is an embeddable file explorer for app specific files."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4
s.author = { "Matt Pileggi" => "matthew.pileggi@gmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/mvpileg/SwiftyFileExplorer"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/mvpileg/SwiftyFileExplorer.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "SwiftyFileExplorer/**/*.{swift}"

# 9
s.resources = "SwiftyFileExplorer/**/*.{png,jpeg,jpg,storyboard,xib}"
end
