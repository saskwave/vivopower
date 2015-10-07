using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

class LoggingHelper {

	static var _log = new [20];
	static var _status = "Not Initialised";
	
	static function setStatus (message) {
    	_status = message;
    	Ui.requestUpdate();
    }
    
	static function getStatus () {
    	return _status;
    }
    
	static function log(message) {
		Sys.println(message);
		write(message);
	} 
	
	static function write(message) {
		for (var i = _log.size()-1; i > 0; i--) {
			_log[i] = _log[i-1];
		}
		_log[0] = message;
		Ui.requestUpdate();
	}
	
	static function read() {
		return _log;
	}

	static function getLatest() {
		return _log[0];
	}

}