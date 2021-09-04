Gem::Specification.new do |s|
    s.name = "homogeneous_descendant_linking_nestable"
    s.version = "0.0.1"
    s.summary = "Allows a class to have a reference by means of instance variable to an object of the same class."
    s.description = "Provides the HomogeneousDescendantLinkingNestable module which allows creation of a single instance of the same class object and access it via the @child instance variable. Other helper methods for descendancy are afforded as well."
    s.authors = ["Jacob Barnard"]
    s.email = "jmbarnardg1@gmail.com"
    s.files = Dir.glob("lib/**/*", File::FNM_DOTMATCH)
    s.homepage = "https://rubygems.org/gems/homoegeneous_descendant_linking_nestable"
    s.license = "Apache-2.0"
  end
  