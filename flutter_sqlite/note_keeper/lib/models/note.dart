class Note {
  int? _id;
  String? _title;
  String? _description;
  String? _date;
  int? _priority;

  factory Note.defaultNote() {
    return Note(
        '', '', 2); // Provide default values for title, date, and priority
  }

  Note(this._title, this._date, this._priority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int get id => _id!;

  String get title => _title!;

  String get description => _description!;

  int get priority => _priority!;

  String get date => _date!;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title!;
    map['description'] = _description!;
    map['priority'] = _priority!;
    map['date'] = _date!;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    _priority = map['priority'];
    _date = map['date'];
  }
}

// class Note {
//   int? _id;
//   String? _title;
//   String? _description;
//   String? _date;
//   int? _priority;
//
//   Note(this._title, this._date, this._priority, [this._description]);
//
//   Note.withId(this._id, this._title, this._date, this._priority,
//       [this._description]);
//
//   int get id => _id ?? 0; // Default value if _id is null
//
//   String get title => _title ?? ''; // Default value if _title is null
//
//   String get description =>
//       _description ?? ''; // Default value if _description is null
//
//   int get priority => _priority ?? 0; // Default value if _priority is null
//
//   String get date => _date ?? ''; // Default value if _date is null
//
//   set title(String newTitle) {
//     if (newTitle.length <= 255) {
//       _title = newTitle;
//     }
//   }
//
//   set description(String newDescription) {
//     if (newDescription.length <= 255) {
//       _description = newDescription;
//     }
//   }
//
//   set priority(int newPriority) {
//     if (newPriority >= 1 && newPriority <= 2) {
//       _priority = newPriority;
//     }
//   }
//
//   set date(String newDate) {
//     _date = newDate;
//   }
//
//   // Convert a Note object into a Map object
//   Map<String, dynamic> toMap() {
//     var map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = _id;
//     }
//     map['title'] = _title;
//     map['description'] = _description;
//     map['priority'] = _priority;
//     map['date'] = _date;
//
//     return map;
//   }
//
//   // Extract a Note object from a Map object
//   Note.fromMapObject(Map<String, dynamic> map) {
//     _id = map['id'];
//     _title = map['title'];
//     _description = map['description'];
//     _priority = map['priority'];
//     _date = map['date'];
//   }
// }
