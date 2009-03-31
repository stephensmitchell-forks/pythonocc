/*

Copyright 2008-2009 Thomas Paviot (thomas.paviot@free.fr)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%module BinMDF

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}

/*
Standard_Integer & function transformation
*/
%typemap(argout) Standard_Integer &OutValue {
    PyObject *o, *o2, *o3;
    o = PyInt_FromLong(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Integer &OutValue(Standard_Integer temp) {
    $1 = &temp;
}


%include BinMDF_dependencies.i


%include BinMDF_headers.i




%nodefaultctor Handle_BinMDF_ADriver;
class Handle_BinMDF_ADriver : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver();
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver(const Handle_BinMDF_ADriver &aHandle);
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver(const BinMDF_ADriver *anItem);
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_ADriver {
	BinMDF_ADriver* GetObject() {
	return (BinMDF_ADriver*)$self->Access();
	}
};
%extend Handle_BinMDF_ADriver {
	~Handle_BinMDF_ADriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_BinMDF_ADriver\n");}
	}
};

%nodefaultctor Handle_BinMDF_TagSourceDriver;
class Handle_BinMDF_TagSourceDriver : public Handle_BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		Handle_BinMDF_TagSourceDriver();
		%feature("autodoc", "1");
		Handle_BinMDF_TagSourceDriver(const Handle_BinMDF_TagSourceDriver &aHandle);
		%feature("autodoc", "1");
		Handle_BinMDF_TagSourceDriver(const BinMDF_TagSourceDriver *anItem);
		%feature("autodoc", "1");
		Handle_BinMDF_TagSourceDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_TagSourceDriver {
	BinMDF_TagSourceDriver* GetObject() {
	return (BinMDF_TagSourceDriver*)$self->Access();
	}
};
%extend Handle_BinMDF_TagSourceDriver {
	~Handle_BinMDF_TagSourceDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_BinMDF_TagSourceDriver\n");}
	}
};

%nodefaultctor Handle_BinMDF_DataMapNodeOfTypeADriverMap;
class Handle_BinMDF_DataMapNodeOfTypeADriverMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfTypeADriverMap();
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfTypeADriverMap(const Handle_BinMDF_DataMapNodeOfTypeADriverMap &aHandle);
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfTypeADriverMap(const BinMDF_DataMapNodeOfTypeADriverMap *anItem);
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfTypeADriverMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_DataMapNodeOfTypeADriverMap {
	BinMDF_DataMapNodeOfTypeADriverMap* GetObject() {
	return (BinMDF_DataMapNodeOfTypeADriverMap*)$self->Access();
	}
};
%extend Handle_BinMDF_DataMapNodeOfTypeADriverMap {
	~Handle_BinMDF_DataMapNodeOfTypeADriverMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_BinMDF_DataMapNodeOfTypeADriverMap\n");}
	}
};

%nodefaultctor Handle_BinMDF_ReferenceDriver;
class Handle_BinMDF_ReferenceDriver : public Handle_BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		Handle_BinMDF_ReferenceDriver();
		%feature("autodoc", "1");
		Handle_BinMDF_ReferenceDriver(const Handle_BinMDF_ReferenceDriver &aHandle);
		%feature("autodoc", "1");
		Handle_BinMDF_ReferenceDriver(const BinMDF_ReferenceDriver *anItem);
		%feature("autodoc", "1");
		Handle_BinMDF_ReferenceDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_ReferenceDriver {
	BinMDF_ReferenceDriver* GetObject() {
	return (BinMDF_ReferenceDriver*)$self->Access();
	}
};
%extend Handle_BinMDF_ReferenceDriver {
	~Handle_BinMDF_ReferenceDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_BinMDF_ReferenceDriver\n");}
	}
};

%nodefaultctor Handle_BinMDF_DoubleMapNodeOfTypeIdMap;
class Handle_BinMDF_DoubleMapNodeOfTypeIdMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Handle_BinMDF_DoubleMapNodeOfTypeIdMap();
		%feature("autodoc", "1");
		Handle_BinMDF_DoubleMapNodeOfTypeIdMap(const Handle_BinMDF_DoubleMapNodeOfTypeIdMap &aHandle);
		%feature("autodoc", "1");
		Handle_BinMDF_DoubleMapNodeOfTypeIdMap(const BinMDF_DoubleMapNodeOfTypeIdMap *anItem);
		%feature("autodoc", "1");
		Handle_BinMDF_DoubleMapNodeOfTypeIdMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_DoubleMapNodeOfTypeIdMap {
	BinMDF_DoubleMapNodeOfTypeIdMap* GetObject() {
	return (BinMDF_DoubleMapNodeOfTypeIdMap*)$self->Access();
	}
};
%extend Handle_BinMDF_DoubleMapNodeOfTypeIdMap {
	~Handle_BinMDF_DoubleMapNodeOfTypeIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_BinMDF_DoubleMapNodeOfTypeIdMap\n");}
	}
};

%nodefaultctor Handle_BinMDF_DataMapNodeOfStringIdMap;
class Handle_BinMDF_DataMapNodeOfStringIdMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfStringIdMap();
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfStringIdMap(const Handle_BinMDF_DataMapNodeOfStringIdMap &aHandle);
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfStringIdMap(const BinMDF_DataMapNodeOfStringIdMap *anItem);
		%feature("autodoc", "1");
		Handle_BinMDF_DataMapNodeOfStringIdMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_DataMapNodeOfStringIdMap {
	BinMDF_DataMapNodeOfStringIdMap* GetObject() {
	return (BinMDF_DataMapNodeOfStringIdMap*)$self->Access();
	}
};
%extend Handle_BinMDF_DataMapNodeOfStringIdMap {
	~Handle_BinMDF_DataMapNodeOfStringIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_BinMDF_DataMapNodeOfStringIdMap\n");}
	}
};

%nodefaultctor Handle_BinMDF_ADriverTable;
class Handle_BinMDF_ADriverTable : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_BinMDF_ADriverTable();
		%feature("autodoc", "1");
		Handle_BinMDF_ADriverTable(const Handle_BinMDF_ADriverTable &aHandle);
		%feature("autodoc", "1");
		Handle_BinMDF_ADriverTable(const BinMDF_ADriverTable *anItem);
		%feature("autodoc", "1");
		Handle_BinMDF_ADriverTable const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDF_ADriverTable {
	BinMDF_ADriverTable* GetObject() {
	return (BinMDF_ADriverTable*)$self->Access();
	}
};
%extend Handle_BinMDF_ADriverTable {
	~Handle_BinMDF_ADriverTable() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_BinMDF_ADriverTable\n");}
	}
};

%nodefaultctor BinMDF_ADriverTable;
class BinMDF_ADriverTable : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		BinMDF_ADriverTable();
		%feature("autodoc", "1");
		void AddDriver(const Handle_BinMDF_ADriver &theDriver);
		%feature("autodoc", "1");
		void AssignIds(const TColStd_IndexedMapOfTransient &theTypes);
		%feature("autodoc", "1");
		void AssignIds(const TColStd_SequenceOfAsciiString &theTypeNames);
		%feature("autodoc", "1");
		Standard_Integer GetDriver(const Handle_Standard_Type &theType, Handle_BinMDF_ADriver & theDriver) const;
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver GetDriver(const Standard_Integer theTypeId) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BinMDF_ADriverTable {
	Handle_BinMDF_ADriverTable GetHandle() {
	return *(Handle_BinMDF_ADriverTable*) &$self;
	}
};
%extend BinMDF_ADriverTable {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend BinMDF_ADriverTable {
	~BinMDF_ADriverTable() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_ADriverTable\n");}
	}
};

%nodefaultctor BinMDF_ADriver;
class BinMDF_ADriver : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		const Handle_Standard_Type & SourceType() const;
		%feature("autodoc", "1");
		const TCollection_AsciiString & TypeName() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Paste(const BinObjMgt_Persistent &aSource, const Handle_TDF_Attribute &aTarget, BinObjMgt_RRelocationTable & aRelocTable) const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &aSource, BinObjMgt_Persistent & aTarget, BinObjMgt_SRelocationTable & aRelocTable) const;
		%feature("autodoc", "1");
		void WriteMessage(const TCollection_ExtendedString &theMessage) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BinMDF_ADriver {
	Handle_BinMDF_ADriver GetHandle() {
	return *(Handle_BinMDF_ADriver*) &$self;
	}
};
%extend BinMDF_ADriver {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend BinMDF_ADriver {
	~BinMDF_ADriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_ADriver\n");}
	}
};

%nodefaultctor BinMDF_DataMapIteratorOfStringIdMap;
class BinMDF_DataMapIteratorOfStringIdMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		BinMDF_DataMapIteratorOfStringIdMap();
		%feature("autodoc", "1");
		BinMDF_DataMapIteratorOfStringIdMap(const BinMDF_StringIdMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const BinMDF_StringIdMap &aMap);
		%feature("autodoc", "1");
		const TCollection_AsciiString & Key() const;
		%feature("autodoc", "1");
		const Standard_Integer & Value() const;

};
%extend BinMDF_DataMapIteratorOfStringIdMap {
	~BinMDF_DataMapIteratorOfStringIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_DataMapIteratorOfStringIdMap\n");}
	}
};

%nodefaultctor BinMDF_DataMapNodeOfTypeADriverMap;
class BinMDF_DataMapNodeOfTypeADriverMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		BinMDF_DataMapNodeOfTypeADriverMap(const Handle_Standard_Type &K, const Handle_BinMDF_ADriver &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_Standard_Type & Key() const;
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BinMDF_DataMapNodeOfTypeADriverMap {
	Handle_BinMDF_DataMapNodeOfTypeADriverMap GetHandle() {
	return *(Handle_BinMDF_DataMapNodeOfTypeADriverMap*) &$self;
	}
};
%extend BinMDF_DataMapNodeOfTypeADriverMap {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend BinMDF_DataMapNodeOfTypeADriverMap {
	~BinMDF_DataMapNodeOfTypeADriverMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_DataMapNodeOfTypeADriverMap\n");}
	}
};

%nodefaultctor BinMDF_DoubleMapNodeOfTypeIdMap;
class BinMDF_DoubleMapNodeOfTypeIdMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		BinMDF_DoubleMapNodeOfTypeIdMap(const Handle_Standard_Type &K1, const Standard_Integer &K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		Handle_Standard_Type & Key1() const;
		%feature("autodoc", "1");
		Standard_Integer & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BinMDF_DoubleMapNodeOfTypeIdMap {
	Handle_BinMDF_DoubleMapNodeOfTypeIdMap GetHandle() {
	return *(Handle_BinMDF_DoubleMapNodeOfTypeIdMap*) &$self;
	}
};
%extend BinMDF_DoubleMapNodeOfTypeIdMap {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend BinMDF_DoubleMapNodeOfTypeIdMap {
	~BinMDF_DoubleMapNodeOfTypeIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_DoubleMapNodeOfTypeIdMap\n");}
	}
};

%nodefaultctor BinMDF_DataMapNodeOfStringIdMap;
class BinMDF_DataMapNodeOfStringIdMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		BinMDF_DataMapNodeOfStringIdMap(const TCollection_AsciiString &K, const Standard_Integer &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TCollection_AsciiString & Key() const;
		%feature("autodoc", "1");
		Standard_Integer & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BinMDF_DataMapNodeOfStringIdMap {
	Handle_BinMDF_DataMapNodeOfStringIdMap GetHandle() {
	return *(Handle_BinMDF_DataMapNodeOfStringIdMap*) &$self;
	}
};
%extend BinMDF_DataMapNodeOfStringIdMap {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend BinMDF_DataMapNodeOfStringIdMap {
	~BinMDF_DataMapNodeOfStringIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_DataMapNodeOfStringIdMap\n");}
	}
};

%nodefaultctor BinMDF_TagSourceDriver;
class BinMDF_TagSourceDriver : public BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		BinMDF_TagSourceDriver(const Handle_CDM_MessageDriver &theMessageDriver);
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Paste(const BinObjMgt_Persistent &Source, const Handle_TDF_Attribute &Target, BinObjMgt_RRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BinMDF_TagSourceDriver {
	Handle_BinMDF_TagSourceDriver GetHandle() {
	return *(Handle_BinMDF_TagSourceDriver*) &$self;
	}
};
%extend BinMDF_TagSourceDriver {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend BinMDF_TagSourceDriver {
	~BinMDF_TagSourceDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_TagSourceDriver\n");}
	}
};

%nodefaultctor BinMDF_StringIdMap;
class BinMDF_StringIdMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		BinMDF_StringIdMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		BinMDF_StringIdMap & Assign(const BinMDF_StringIdMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TCollection_AsciiString &K, const Standard_Integer &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TCollection_AsciiString &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TCollection_AsciiString &K);
		%feature("autodoc", "1");
		const Standard_Integer & Find(const TCollection_AsciiString &K) const;
		%feature("autodoc", "1");
		const Standard_Integer & operator()(const TCollection_AsciiString &K) const;
		%feature("autodoc", "1");
		Standard_Integer & ChangeFind(const TCollection_AsciiString &K);
		%feature("autodoc", "1");
		Standard_Integer & operator()(const TCollection_AsciiString &K);

};
%extend BinMDF_StringIdMap {
	~BinMDF_StringIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_StringIdMap\n");}
	}
};

%nodefaultctor BinMDF_DoubleMapIteratorOfTypeIdMap;
class BinMDF_DoubleMapIteratorOfTypeIdMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		BinMDF_DoubleMapIteratorOfTypeIdMap();
		%feature("autodoc", "1");
		BinMDF_DoubleMapIteratorOfTypeIdMap(const BinMDF_TypeIdMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const BinMDF_TypeIdMap &aMap);
		%feature("autodoc", "1");
		const Handle_Standard_Type & Key1() const;
		%feature("autodoc", "1");
		const Standard_Integer & Key2() const;

};
%extend BinMDF_DoubleMapIteratorOfTypeIdMap {
	~BinMDF_DoubleMapIteratorOfTypeIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_DoubleMapIteratorOfTypeIdMap\n");}
	}
};

%nodefaultctor BinMDF_ReferenceDriver;
class BinMDF_ReferenceDriver : public BinMDF_ADriver {
	public:
		%feature("autodoc", "1");
		BinMDF_ReferenceDriver(const Handle_CDM_MessageDriver &theMessageDriver);
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Paste(const BinObjMgt_Persistent &Source, const Handle_TDF_Attribute &Target, BinObjMgt_RRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BinMDF_ReferenceDriver {
	Handle_BinMDF_ReferenceDriver GetHandle() {
	return *(Handle_BinMDF_ReferenceDriver*) &$self;
	}
};
%extend BinMDF_ReferenceDriver {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend BinMDF_ReferenceDriver {
	~BinMDF_ReferenceDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_ReferenceDriver\n");}
	}
};

%nodefaultctor BinMDF_TypeADriverMap;
class BinMDF_TypeADriverMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		BinMDF_TypeADriverMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		BinMDF_TypeADriverMap & Assign(const BinMDF_TypeADriverMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const Handle_Standard_Type &K, const Handle_BinMDF_ADriver &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const Handle_Standard_Type &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const Handle_Standard_Type &K);
		%feature("autodoc", "1");
		const Handle_BinMDF_ADriver & Find(const Handle_Standard_Type &K) const;
		%feature("autodoc", "1");
		const Handle_BinMDF_ADriver & operator()(const Handle_Standard_Type &K) const;
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver & ChangeFind(const Handle_Standard_Type &K);
		%feature("autodoc", "1");
		Handle_BinMDF_ADriver & operator()(const Handle_Standard_Type &K);

};
%extend BinMDF_TypeADriverMap {
	~BinMDF_TypeADriverMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_TypeADriverMap\n");}
	}
};

%nodefaultctor BinMDF_DataMapIteratorOfTypeADriverMap;
class BinMDF_DataMapIteratorOfTypeADriverMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		BinMDF_DataMapIteratorOfTypeADriverMap();
		%feature("autodoc", "1");
		BinMDF_DataMapIteratorOfTypeADriverMap(const BinMDF_TypeADriverMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const BinMDF_TypeADriverMap &aMap);
		%feature("autodoc", "1");
		const Handle_Standard_Type & Key() const;
		%feature("autodoc", "1");
		const Handle_BinMDF_ADriver & Value() const;

};
%extend BinMDF_DataMapIteratorOfTypeADriverMap {
	~BinMDF_DataMapIteratorOfTypeADriverMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_DataMapIteratorOfTypeADriverMap\n");}
	}
};

%nodefaultctor BinMDF_TypeIdMap;
class BinMDF_TypeIdMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		BinMDF_TypeIdMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		BinMDF_TypeIdMap & Assign(const BinMDF_TypeIdMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Bind(const Handle_Standard_Type &K1, const Standard_Integer &K2);
		%feature("autodoc", "1");
		Standard_Boolean AreBound(const Handle_Standard_Type &K1, const Standard_Integer &K2) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound1(const Handle_Standard_Type &K) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound2(const Standard_Integer &K) const;
		%feature("autodoc", "1");
		const Standard_Integer & Find1(const Handle_Standard_Type &K) const;
		%feature("autodoc", "1");
		const Handle_Standard_Type & Find2(const Standard_Integer &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind1(const Handle_Standard_Type &K);
		%feature("autodoc", "1");
		Standard_Boolean UnBind2(const Standard_Integer &K);

};
%extend BinMDF_TypeIdMap {
	~BinMDF_TypeIdMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF_TypeIdMap\n");}
	}
};

%nodefaultctor BinMDF;
class BinMDF {
	public:
		%feature("autodoc", "1");
		BinMDF();
		%feature("autodoc", "1");
		void AddDrivers(const Handle_BinMDF_ADriverTable &aDriverTable, const Handle_CDM_MessageDriver &aMsgDrv);

};
%extend BinMDF {
	~BinMDF() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of BinMDF\n");}
	}
};