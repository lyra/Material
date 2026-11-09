Pod::Spec.new do |s|
	s.name = 'LyraMaterial'
	s.version = '1.0.12'
	s.swift_version = '5.0'
	s.license = 'BSD-3-Clause'
	s.summary = 'This library is a fork of CosmicMind Material library that fix the compilation problem with Xcode 15'
	s.homepage = 'https://github.com/lyra/Material'
	s.authors = { 'Lyra Dev Mobile' => 'dev-mobile@lyra-network.com' }
 	s.source = { :git => 'https://github.com/lyra/Material.git', :tag => s.version }


	 s.ios.deployment_target = '15.0'
         s.ios.vendored_frameworks = 'LyraMaterial.xcframework'

	 s.dependency 'LyraMotion'


end
