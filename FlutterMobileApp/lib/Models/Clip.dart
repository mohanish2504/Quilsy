class Clip {
  String _title,_clipdata;
  DateTime _dateTime;

  Clip(this._title, this._clipdata,this._dateTime);


  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  get clipdata => _clipdata;

  set clipdata(value) {
    _clipdata = value;
  }
}