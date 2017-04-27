Pod::Spec.new do |spec|
  spec.name = "PandaMobile_SideBar_IOS"
  spec.version = "0.0.1"
  spec.summary = "A SideBar UI View For IOS (OC)."
  spec.homepage = "https://github.com/lingen/PandaMobile_SideBar_IOS.git"
  spec.license = { type: 'ALV2', file: 'LICENSE' }
  spec.authors = { "lingen.liu" => 'lingen.liu@gmail.com' }
  spec.social_media_url = "http://openpanda.org"

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/lingen/PandaMobile_SideBar_IOS.git", tag: "#{spec.version}", submodules: true }
  spec.source_files = "PandaMobile_SideBar_IOS/**/*.{h,m}"

end
