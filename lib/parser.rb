require 'treetop'

# Find out what our base path is
BASE_PATH = File.expand_path(File.dirname(__FILE__))

# Load our custom syntax node classes so the parser can use them
require File.join(BASE_PATH, 'node_extensions.rb')

class Parser
  
  # Load the Treetop grammar from the 'sexp_parser' file, and 
  # create a new instance of that parser as a class variable 
  # so we don't have to re-create it every time we need to 
  # parse a string
  Treetop.load(File.join(BASE_PATH, 'lisputin.treetop'))
  @@parser = SexpParser.new
  
  def self.parse(data)
    # Pass the data over to the parser instance
    tree = @@parser.parse(data)
    
    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end
    
    return tree
  end
end