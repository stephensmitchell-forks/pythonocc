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
%module Aspect

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i
%include std_list.i
%include std_string.i

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


%include Aspect_dependencies.i


%include Aspect_headers.i

typedef long unsigned int Aspect_Drawable;
typedef Aspect_Driver * Aspect_DriverPtr;
typedef Aspect_WindowDriver * Aspect_WindowDriverPtr;
typedef CALL_DEF_LAYER Aspect_CLayer2d;
typedef void * Aspect_RenderingContext;
typedef long unsigned int Aspect_Handle;
typedef void * Aspect_Display;

enum Aspect_TypeOfColorSpace {
	Aspect_TOCS_BlackAndWhite,
	Aspect_TOCS_GreyScale,
	Aspect_TOCS_RGB,
	};

enum Aspect_InteriorStyle {
	Aspect_IS_EMPTY,
	Aspect_IS_HOLLOW,
	Aspect_IS_HATCH,
	Aspect_IS_SOLID,
	Aspect_IS_HIDDENLINE,
	};

enum Aspect_TypeOfTriedronPosition {
	Aspect_TOTP_CENTER,
	Aspect_TOTP_LEFT_LOWER,
	Aspect_TOTP_LEFT_UPPER,
	Aspect_TOTP_RIGHT_LOWER,
	Aspect_TOTP_RIGHT_UPPER,
	Aspect_TOTP_01,
	Aspect_TOTP_02,
	Aspect_TOTP_03,
	Aspect_TOTP_04,
	Aspect_TOTP_05,
	Aspect_TOTP_06,
	Aspect_TOTP_07,
	Aspect_TOTP_08,
	Aspect_TOTP_09,
	Aspect_TOTP_10,
	};

enum Aspect_HatchStyle {
	Aspect_HS_HORIZONTAL,
	Aspect_HS_HORIZONTAL_WIDE,
	Aspect_HS_VERTICAL,
	Aspect_HS_VERTICAL_WIDE,
	Aspect_HS_DIAGONAL_45,
	Aspect_HS_DIAGONAL_45_WIDE,
	Aspect_HS_DIAGONAL_135,
	Aspect_HS_DIAGONAL_135_WIDE,
	Aspect_HS_GRID,
	Aspect_HS_GRID_WIDE,
	Aspect_HS_GRID_DIAGONAL,
	Aspect_HS_GRID_DIAGONAL_WIDE,
	};

enum Aspect_TypeOfLine {
	Aspect_TOL_SOLID,
	Aspect_TOL_DASH,
	Aspect_TOL_DOT,
	Aspect_TOL_DOTDASH,
	Aspect_TOL_USERDEFINED,
	};

enum Aspect_TypeOfHighlightMethod {
	Aspect_TOHM_COLOR,
	Aspect_TOHM_BLINK,
	Aspect_TOHM_BOUNDBOX,
	};

enum Aspect_TypeOfRenderingMode {
	Aspect_TORM_IMMEDIAT,
	Aspect_TORM_RETAIN,
	Aspect_TORM_CLEAR_AND_RETAIN,
	};

enum Aspect_TypeOfText {
	Aspect_TOT_SOLID,
	Aspect_TOT_OUTLINE,
	};

enum Aspect_PlotMode {
	Aspect_PM_DPLOTTER,
	Aspect_PM_FILEONLY,
	Aspect_PM_NPLOTTER,
	};

enum Aspect_TypeOfColorScaleData {
	Aspect_TOCSD_AUTO,
	Aspect_TOCSD_USER,
	};

enum Aspect_ListingType {
	Aspect_LPID_DIRPLOT,
	Aspect_LPID_DIRPARPLO,
	Aspect_LPID_ALLDIRS,
	};

enum Aspect_TypeOfResize {
	Aspect_TOR_UNKNOWN,
	Aspect_TOR_NO_BORDER,
	Aspect_TOR_TOP_BORDER,
	Aspect_TOR_RIGHT_BORDER,
	Aspect_TOR_BOTTOM_BORDER,
	Aspect_TOR_LEFT_BORDER,
	Aspect_TOR_TOP_AND_RIGHT_BORDER,
	Aspect_TOR_RIGHT_AND_BOTTOM_BORDER,
	Aspect_TOR_BOTTOM_AND_LEFT_BORDER,
	Aspect_TOR_LEFT_AND_TOP_BORDER,
	};

enum Aspect_TypeOfColorScalePosition {
	Aspect_TOCSP_NONE,
	Aspect_TOCSP_LEFT,
	Aspect_TOCSP_RIGHT,
	Aspect_TOCSP_CENTER,
	};

enum Aspect_TypeOfStyleText {
	Aspect_TOST_NORMAL,
	Aspect_TOST_ANNOTATION,
	};

enum Aspect_TypeOfUpdate {
	Aspect_TOU_ASAP,
	Aspect_TOU_WAIT,
	};

enum Aspect_PolygonOffsetMode {
	Aspect_POM_Off,
	Aspect_POM_Fill,
	Aspect_POM_Line,
	Aspect_POM_Point,
	Aspect_POM_All,
	Aspect_POM_None,
	Aspect_POM_Mask,
	};

enum Aspect_TypeOfMarker {
	Aspect_TOM_POINT,
	Aspect_TOM_PLUS,
	Aspect_TOM_STAR,
	Aspect_TOM_O,
	Aspect_TOM_X,
	Aspect_TOM_O_POINT,
	Aspect_TOM_O_PLUS,
	Aspect_TOM_O_STAR,
	Aspect_TOM_O_X,
	Aspect_TOM_BALL,
	Aspect_TOM_RING1,
	Aspect_TOM_RING2,
	Aspect_TOM_RING3,
	Aspect_TOM_USERDEFINED,
	};

enum Aspect_GridType {
	Aspect_GT_Rectangular,
	Aspect_GT_Circular,
	};

enum Aspect_CardinalPoints {
	Aspect_CP_North,
	Aspect_CP_NorthEast,
	Aspect_CP_East,
	Aspect_CP_SouthEast,
	Aspect_CP_South,
	Aspect_CP_SouthWest,
	Aspect_CP_West,
	Aspect_CP_NorthWest,
	Aspect_CP_Center,
	};

enum Aspect_TypeOfColorMap {
	Aspect_TOC_Generic,
	Aspect_TOC_ColorCube,
	Aspect_TOC_ColorRamp,
	};

enum Aspect_FormatOfSheetPaper {
	Aspect_FOSP_A0,
	Aspect_FOSP_A1,
	Aspect_FOSP_A2,
	Aspect_FOSP_A3,
	Aspect_FOSP_A4,
	Aspect_FOSP_A5,
	Aspect_FOSP_K_LONG,
	Aspect_FOSP_K_SHORT,
	Aspect_FOSP_J_LONG,
	Aspect_FOSP_J_SHORT,
	Aspect_FOSP_H_LONG,
	Aspect_FOSP_H_SHORT,
	Aspect_FOSP_G_LONG,
	Aspect_FOSP_G_SHORT,
	Aspect_FOSP_F,
	Aspect_FOSP_E,
	Aspect_FOSP_D,
	Aspect_FOSP_C,
	Aspect_FOSP_B,
	Aspect_FOSP_A,
	Aspect_FOSP_UNKNOWN,
	};

enum Aspect_GridDrawMode {
	Aspect_GDM_Lines,
	Aspect_GDM_Points,
	Aspect_GDM_None,
	};

enum Aspect_TypeOfEdge {
	Aspect_TOE_VISIBLE,
	Aspect_TOE_INVISIBLE,
	};

enum Aspect_TypeOfConstraint {
	Aspect_TOC_BOTTOM_LEFT,
	Aspect_TOC_BOTTOM_RIGHT,
	Aspect_TOC_TOP_LEFT,
	Aspect_TOC_TOP_RIGHT,
	};

enum Aspect_TypeOfDrawMode {
	Aspect_TODM_REPLACE,
	Aspect_TODM_ERASE,
	Aspect_TODM_XOR,
	Aspect_TODM_XORLIGHT,
	};

enum Aspect_PlotterOrigin {
	Aspect_PO_CENTER,
	Aspect_PO_BOTTOMLEFT,
	Aspect_PO_TOPLEFT,
	Aspect_PO_TOPRIGHT,
	Aspect_PO_BOTTOMRIGHT,
	Aspect_PO_UNKNOWN,
	};

enum Aspect_TypeOfColorScaleOrientation {
	Aspect_TOCSO_NONE,
	Aspect_TOCSO_LEFT,
	Aspect_TOCSO_RIGHT,
	Aspect_TOCSO_CENTER,
	};

enum Aspect_TypeOfLayer {
	Aspect_TOL_OVERLAY,
	Aspect_TOL_UNDERLAY,
	};

enum Aspect_WidthOfLine {
	Aspect_WOL_THIN,
	Aspect_WOL_MEDIUM,
	Aspect_WOL_THICK,
	Aspect_WOL_VERYTHICK,
	Aspect_WOL_USERDEFINED,
	};

enum Aspect_TypeOfTriedronEcho {
	Aspect_TOTE_NONE,
	Aspect_TOTE_ORIGIN,
	Aspect_TOTE_AXIS_X,
	Aspect_TOTE_AXIS_Y,
	Aspect_TOTE_AXIS_Z,
	Aspect_TOTE_TEXT_X,
	Aspect_TOTE_TEXT_Y,
	Aspect_TOTE_TEXT_Z,
	Aspect_TOTE_01,
	Aspect_TOTE_02,
	Aspect_TOTE_03,
	Aspect_TOTE_04,
	Aspect_TOTE_05,
	Aspect_TOTE_06,
	Aspect_TOTE_07,
	Aspect_TOTE_08,
	Aspect_TOTE_09,
	Aspect_TOTE_10,
	};

enum Aspect_TypeOfDegenerateModel {
	Aspect_TDM_NONE,
	Aspect_TDM_TINY,
	Aspect_TDM_WIREFRAME,
	Aspect_TDM_MARKER,
	Aspect_TDM_BBOX,
	Aspect_TDM_AUTO,
	};

enum Aspect_TypeOfFont {
	Aspect_TOF_DEFAULT,
	Aspect_TOF_COURIER,
	Aspect_TOF_HELVETICA,
	Aspect_TOF_TIMES,
	Aspect_TOF_USERDEFINED,
	};

enum Aspect_TypeOfDisplayText {
	Aspect_TODT_NORMAL,
	Aspect_TODT_SUBTITLE,
	Aspect_TODT_DEKALE,
	Aspect_TODT_BLEND,
	};

enum Aspect_TypeOfFacingModel {
	Aspect_TOFM_BOTH_SIDE,
	Aspect_TOFM_BACK_SIDE,
	Aspect_TOFM_FRONT_SIDE,
	};

enum Aspect_TypeOfPrimitive {
	Aspect_TOP_UNKNOWN,
	Aspect_TOP_POLYLINE,
	Aspect_TOP_POLYGON,
	Aspect_TOP_SEGMENTS,
	Aspect_TOP_ARCS,
	Aspect_TOP_POLYARCS,
	Aspect_TOP_POINTS,
	Aspect_TOP_MARKERS,
	};

enum Aspect_TypeOfDeflection {
	Aspect_TOD_RELATIVE,
	Aspect_TOD_ABSOLUTE,
	};

enum Aspect_FillMethod {
	Aspect_FM_NONE,
	Aspect_FM_CENTERED,
	Aspect_FM_TILED,
	Aspect_FM_STRETCH,
	};



%nodefaultctor Handle_Aspect_Grid;
class Handle_Aspect_Grid : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_Grid();
		%feature("autodoc", "1");
		Handle_Aspect_Grid(const Handle_Aspect_Grid &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_Grid(const Aspect_Grid *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_Grid const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_Grid {
	Aspect_Grid* GetObject() {
	return (Aspect_Grid*)$self->Access();
	}
};
%extend Handle_Aspect_Grid {
	~Handle_Aspect_Grid() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_Grid\n");}
	}
};

%nodefaultctor Handle_Aspect_RectangularGrid;
class Handle_Aspect_RectangularGrid : public Handle_Aspect_Grid {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_RectangularGrid();
		%feature("autodoc", "1");
		Handle_Aspect_RectangularGrid(const Handle_Aspect_RectangularGrid &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_RectangularGrid(const Aspect_RectangularGrid *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_RectangularGrid const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_RectangularGrid {
	Aspect_RectangularGrid* GetObject() {
	return (Aspect_RectangularGrid*)$self->Access();
	}
};
%extend Handle_Aspect_RectangularGrid {
	~Handle_Aspect_RectangularGrid() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_RectangularGrid\n");}
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry();
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry(const Aspect_SequenceNodeOfSequenceOfWidthMapEntry *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
	Aspect_SequenceNodeOfSequenceOfWidthMapEntry* GetObject() {
	return (Aspect_SequenceNodeOfSequenceOfWidthMapEntry*)$self->Access();
	}
};
%extend Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
	~Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry\n");}
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry();
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry(const Aspect_SequenceNodeOfSequenceOfColorMapEntry *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry {
	Aspect_SequenceNodeOfSequenceOfColorMapEntry* GetObject() {
	return (Aspect_SequenceNodeOfSequenceOfColorMapEntry*)$self->Access();
	}
};
%extend Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry {
	~Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry\n");}
	}
};

%nodefaultctor Handle_Aspect_MarkerStyleDefinitionError;
class Handle_Aspect_MarkerStyleDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_MarkerStyleDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_MarkerStyleDefinitionError(const Handle_Aspect_MarkerStyleDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_MarkerStyleDefinitionError(const Aspect_MarkerStyleDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_MarkerStyleDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_MarkerStyleDefinitionError {
	Aspect_MarkerStyleDefinitionError* GetObject() {
	return (Aspect_MarkerStyleDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_MarkerStyleDefinitionError {
	~Handle_Aspect_MarkerStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_MarkerStyleDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_FontMapDefinitionError;
class Handle_Aspect_FontMapDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_FontMapDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_FontMapDefinitionError(const Handle_Aspect_FontMapDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_FontMapDefinitionError(const Aspect_FontMapDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_FontMapDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_FontMapDefinitionError {
	Aspect_FontMapDefinitionError* GetObject() {
	return (Aspect_FontMapDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_FontMapDefinitionError {
	~Handle_Aspect_FontMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_FontMapDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_Driver;
class Handle_Aspect_Driver : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_Driver();
		%feature("autodoc", "1");
		Handle_Aspect_Driver(const Handle_Aspect_Driver &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_Driver(const Aspect_Driver *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_Driver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_Driver {
	Aspect_Driver* GetObject() {
	return (Aspect_Driver*)$self->Access();
	}
};
%extend Handle_Aspect_Driver {
	~Handle_Aspect_Driver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_Driver\n");}
	}
};

%nodefaultctor Handle_Aspect_WindowDriver;
class Handle_Aspect_WindowDriver : public Handle_Aspect_Driver {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_WindowDriver();
		%feature("autodoc", "1");
		Handle_Aspect_WindowDriver(const Handle_Aspect_WindowDriver &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_WindowDriver(const Aspect_WindowDriver *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_WindowDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_WindowDriver {
	Aspect_WindowDriver* GetObject() {
	return (Aspect_WindowDriver*)$self->Access();
	}
};
%extend Handle_Aspect_WindowDriver {
	~Handle_Aspect_WindowDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_WindowDriver\n");}
	}
};

%nodefaultctor Handle_Aspect_UndefinedMap;
class Handle_Aspect_UndefinedMap : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_UndefinedMap();
		%feature("autodoc", "1");
		Handle_Aspect_UndefinedMap(const Handle_Aspect_UndefinedMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_UndefinedMap(const Aspect_UndefinedMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_UndefinedMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_UndefinedMap {
	Aspect_UndefinedMap* GetObject() {
	return (Aspect_UndefinedMap*)$self->Access();
	}
};
%extend Handle_Aspect_UndefinedMap {
	~Handle_Aspect_UndefinedMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_UndefinedMap\n");}
	}
};

%nodefaultctor Handle_Aspect_GraphicDeviceDefinitionError;
class Handle_Aspect_GraphicDeviceDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDeviceDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDeviceDefinitionError(const Handle_Aspect_GraphicDeviceDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDeviceDefinitionError(const Aspect_GraphicDeviceDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDeviceDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_GraphicDeviceDefinitionError {
	Aspect_GraphicDeviceDefinitionError* GetObject() {
	return (Aspect_GraphicDeviceDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_GraphicDeviceDefinitionError {
	~Handle_Aspect_GraphicDeviceDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_GraphicDeviceDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_AspectLineDefinitionError;
class Handle_Aspect_AspectLineDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_AspectLineDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_AspectLineDefinitionError(const Handle_Aspect_AspectLineDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_AspectLineDefinitionError(const Aspect_AspectLineDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_AspectLineDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectLineDefinitionError {
	Aspect_AspectLineDefinitionError* GetObject() {
	return (Aspect_AspectLineDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_AspectLineDefinitionError {
	~Handle_Aspect_AspectLineDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_AspectLineDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry();
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry(const Aspect_SequenceNodeOfSequenceOfMarkMapEntry *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
	Aspect_SequenceNodeOfSequenceOfMarkMapEntry* GetObject() {
	return (Aspect_SequenceNodeOfSequenceOfMarkMapEntry*)$self->Access();
	}
};
%extend Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
	~Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry\n");}
	}
};

%nodefaultctor Handle_Aspect_PixmapError;
class Handle_Aspect_PixmapError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_PixmapError();
		%feature("autodoc", "1");
		Handle_Aspect_PixmapError(const Handle_Aspect_PixmapError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_PixmapError(const Aspect_PixmapError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_PixmapError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_PixmapError {
	Aspect_PixmapError* GetObject() {
	return (Aspect_PixmapError*)$self->Access();
	}
};
%extend Handle_Aspect_PixmapError {
	~Handle_Aspect_PixmapError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_PixmapError\n");}
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfColor;
class Handle_Aspect_SequenceNodeOfSequenceOfColor : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColor();
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColor(const Handle_Aspect_SequenceNodeOfSequenceOfColor &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColor(const Aspect_SequenceNodeOfSequenceOfColor *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfColor const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfColor {
	Aspect_SequenceNodeOfSequenceOfColor* GetObject() {
	return (Aspect_SequenceNodeOfSequenceOfColor*)$self->Access();
	}
};
%extend Handle_Aspect_SequenceNodeOfSequenceOfColor {
	~Handle_Aspect_SequenceNodeOfSequenceOfColor() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_SequenceNodeOfSequenceOfColor\n");}
	}
};

%nodefaultctor Handle_Aspect_Window;
class Handle_Aspect_Window : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_Window();
		%feature("autodoc", "1");
		Handle_Aspect_Window(const Handle_Aspect_Window &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_Window(const Aspect_Window *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_Window const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_Window {
	Aspect_Window* GetObject() {
	return (Aspect_Window*)$self->Access();
	}
};
%extend Handle_Aspect_Window {
	~Handle_Aspect_Window() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_Window\n");}
	}
};

%nodefaultctor Handle_Aspect_CircularGrid;
class Handle_Aspect_CircularGrid : public Handle_Aspect_Grid {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_CircularGrid();
		%feature("autodoc", "1");
		Handle_Aspect_CircularGrid(const Handle_Aspect_CircularGrid &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_CircularGrid(const Aspect_CircularGrid *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_CircularGrid const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_CircularGrid {
	Aspect_CircularGrid* GetObject() {
	return (Aspect_CircularGrid*)$self->Access();
	}
};
%extend Handle_Aspect_CircularGrid {
	~Handle_Aspect_CircularGrid() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_CircularGrid\n");}
	}
};

%nodefaultctor Handle_Aspect_TypeMap;
class Handle_Aspect_TypeMap : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_TypeMap();
		%feature("autodoc", "1");
		Handle_Aspect_TypeMap(const Handle_Aspect_TypeMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_TypeMap(const Aspect_TypeMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_TypeMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_TypeMap {
	Aspect_TypeMap* GetObject() {
	return (Aspect_TypeMap*)$self->Access();
	}
};
%extend Handle_Aspect_TypeMap {
	~Handle_Aspect_TypeMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_TypeMap\n");}
	}
};

%nodefaultctor Handle_Aspect_WidthMap;
class Handle_Aspect_WidthMap : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_WidthMap();
		%feature("autodoc", "1");
		Handle_Aspect_WidthMap(const Handle_Aspect_WidthMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_WidthMap(const Aspect_WidthMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_WidthMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_WidthMap {
	Aspect_WidthMap* GetObject() {
	return (Aspect_WidthMap*)$self->Access();
	}
};
%extend Handle_Aspect_WidthMap {
	~Handle_Aspect_WidthMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_WidthMap\n");}
	}
};

%nodefaultctor Handle_Aspect_AspectFillArea;
class Handle_Aspect_AspectFillArea : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillArea();
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillArea(const Handle_Aspect_AspectFillArea &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillArea(const Aspect_AspectFillArea *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillArea const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectFillArea {
	Aspect_AspectFillArea* GetObject() {
	return (Aspect_AspectFillArea*)$self->Access();
	}
};
%extend Handle_Aspect_AspectFillArea {
	~Handle_Aspect_AspectFillArea() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_AspectFillArea\n");}
	}
};

%nodefaultctor Handle_Aspect_DriverDefinitionError;
class Handle_Aspect_DriverDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_DriverDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_DriverDefinitionError(const Handle_Aspect_DriverDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_DriverDefinitionError(const Aspect_DriverDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_DriverDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_DriverDefinitionError {
	Aspect_DriverDefinitionError* GetObject() {
	return (Aspect_DriverDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_DriverDefinitionError {
	~Handle_Aspect_DriverDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_DriverDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_IdentDefinitionError;
class Handle_Aspect_IdentDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_IdentDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_IdentDefinitionError(const Handle_Aspect_IdentDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_IdentDefinitionError(const Aspect_IdentDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_IdentDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_IdentDefinitionError {
	Aspect_IdentDefinitionError* GetObject() {
	return (Aspect_IdentDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_IdentDefinitionError {
	~Handle_Aspect_IdentDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_IdentDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_ColorMap;
class Handle_Aspect_ColorMap : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_ColorMap();
		%feature("autodoc", "1");
		Handle_Aspect_ColorMap(const Handle_Aspect_ColorMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_ColorMap(const Aspect_ColorMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_ColorMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorMap {
	Aspect_ColorMap* GetObject() {
	return (Aspect_ColorMap*)$self->Access();
	}
};
%extend Handle_Aspect_ColorMap {
	~Handle_Aspect_ColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_ColorMap\n");}
	}
};

%nodefaultctor Handle_Aspect_ColorRampColorMap;
class Handle_Aspect_ColorRampColorMap : public Handle_Aspect_ColorMap {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_ColorRampColorMap();
		%feature("autodoc", "1");
		Handle_Aspect_ColorRampColorMap(const Handle_Aspect_ColorRampColorMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_ColorRampColorMap(const Aspect_ColorRampColorMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_ColorRampColorMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorRampColorMap {
	Aspect_ColorRampColorMap* GetObject() {
	return (Aspect_ColorRampColorMap*)$self->Access();
	}
};
%extend Handle_Aspect_ColorRampColorMap {
	~Handle_Aspect_ColorRampColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_ColorRampColorMap\n");}
	}
};

%nodefaultctor Handle_Aspect_MarkMap;
class Handle_Aspect_MarkMap : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_MarkMap();
		%feature("autodoc", "1");
		Handle_Aspect_MarkMap(const Handle_Aspect_MarkMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_MarkMap(const Aspect_MarkMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_MarkMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_MarkMap {
	Aspect_MarkMap* GetObject() {
	return (Aspect_MarkMap*)$self->Access();
	}
};
%extend Handle_Aspect_MarkMap {
	~Handle_Aspect_MarkMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_MarkMap\n");}
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry();
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry(const Aspect_SequenceNodeOfSequenceOfTypeMapEntry *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
	Aspect_SequenceNodeOfSequenceOfTypeMapEntry* GetObject() {
	return (Aspect_SequenceNodeOfSequenceOfTypeMapEntry*)$self->Access();
	}
};
%extend Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
	~Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry\n");}
	}
};

%nodefaultctor Handle_Aspect_FontStyleDefinitionError;
class Handle_Aspect_FontStyleDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_FontStyleDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_FontStyleDefinitionError(const Handle_Aspect_FontStyleDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_FontStyleDefinitionError(const Aspect_FontStyleDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_FontStyleDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_FontStyleDefinitionError {
	Aspect_FontStyleDefinitionError* GetObject() {
	return (Aspect_FontStyleDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_FontStyleDefinitionError {
	~Handle_Aspect_FontStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_FontStyleDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_AspectMarker;
class Handle_Aspect_AspectMarker : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarker();
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarker(const Handle_Aspect_AspectMarker &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarker(const Aspect_AspectMarker *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarker const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectMarker {
	Aspect_AspectMarker* GetObject() {
	return (Aspect_AspectMarker*)$self->Access();
	}
};
%extend Handle_Aspect_AspectMarker {
	~Handle_Aspect_AspectMarker() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_AspectMarker\n");}
	}
};

%nodefaultctor Handle_Aspect_PixMap;
class Handle_Aspect_PixMap : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_PixMap();
		%feature("autodoc", "1");
		Handle_Aspect_PixMap(const Handle_Aspect_PixMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_PixMap(const Aspect_PixMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_PixMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_PixMap {
	Aspect_PixMap* GetObject() {
	return (Aspect_PixMap*)$self->Access();
	}
};
%extend Handle_Aspect_PixMap {
	~Handle_Aspect_PixMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_PixMap\n");}
	}
};

%nodefaultctor Handle_Aspect_FontMap;
class Handle_Aspect_FontMap : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_FontMap();
		%feature("autodoc", "1");
		Handle_Aspect_FontMap(const Handle_Aspect_FontMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_FontMap(const Aspect_FontMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_FontMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_FontMap {
	Aspect_FontMap* GetObject() {
	return (Aspect_FontMap*)$self->Access();
	}
};
%extend Handle_Aspect_FontMap {
	~Handle_Aspect_FontMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_FontMap\n");}
	}
};

%nodefaultctor Handle_Aspect_LineStyleDefinitionError;
class Handle_Aspect_LineStyleDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_LineStyleDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_LineStyleDefinitionError(const Handle_Aspect_LineStyleDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_LineStyleDefinitionError(const Aspect_LineStyleDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_LineStyleDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_LineStyleDefinitionError {
	Aspect_LineStyleDefinitionError* GetObject() {
	return (Aspect_LineStyleDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_LineStyleDefinitionError {
	~Handle_Aspect_LineStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_LineStyleDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_GenericColorMap;
class Handle_Aspect_GenericColorMap : public Handle_Aspect_ColorMap {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_GenericColorMap();
		%feature("autodoc", "1");
		Handle_Aspect_GenericColorMap(const Handle_Aspect_GenericColorMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_GenericColorMap(const Aspect_GenericColorMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_GenericColorMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_GenericColorMap {
	Aspect_GenericColorMap* GetObject() {
	return (Aspect_GenericColorMap*)$self->Access();
	}
};
%extend Handle_Aspect_GenericColorMap {
	~Handle_Aspect_GenericColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_GenericColorMap\n");}
	}
};

%nodefaultctor Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry;
class Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry();
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry(const Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry(const Aspect_SequenceNodeOfSequenceOfFontMapEntry *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry {
	Aspect_SequenceNodeOfSequenceOfFontMapEntry* GetObject() {
	return (Aspect_SequenceNodeOfSequenceOfFontMapEntry*)$self->Access();
	}
};
%extend Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry {
	~Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry\n");}
	}
};

%nodefaultctor Handle_Aspect_GraphicDriver;
class Handle_Aspect_GraphicDriver : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDriver();
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDriver(const Handle_Aspect_GraphicDriver &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDriver(const Aspect_GraphicDriver *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDriver const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_GraphicDriver {
	Aspect_GraphicDriver* GetObject() {
	return (Aspect_GraphicDriver*)$self->Access();
	}
};
%extend Handle_Aspect_GraphicDriver {
	~Handle_Aspect_GraphicDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_GraphicDriver\n");}
	}
};

%nodefaultctor Handle_Aspect_AspectMarkerDefinitionError;
class Handle_Aspect_AspectMarkerDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarkerDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarkerDefinitionError(const Handle_Aspect_AspectMarkerDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarkerDefinitionError(const Aspect_AspectMarkerDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarkerDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectMarkerDefinitionError {
	Aspect_AspectMarkerDefinitionError* GetObject() {
	return (Aspect_AspectMarkerDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_AspectMarkerDefinitionError {
	~Handle_Aspect_AspectMarkerDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_AspectMarkerDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_TypeMapDefinitionError;
class Handle_Aspect_TypeMapDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_TypeMapDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_TypeMapDefinitionError(const Handle_Aspect_TypeMapDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_TypeMapDefinitionError(const Aspect_TypeMapDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_TypeMapDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_TypeMapDefinitionError {
	Aspect_TypeMapDefinitionError* GetObject() {
	return (Aspect_TypeMapDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_TypeMapDefinitionError {
	~Handle_Aspect_TypeMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_TypeMapDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_BadAccess;
class Handle_Aspect_BadAccess : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_BadAccess();
		%feature("autodoc", "1");
		Handle_Aspect_BadAccess(const Handle_Aspect_BadAccess &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_BadAccess(const Aspect_BadAccess *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_BadAccess const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_BadAccess {
	Aspect_BadAccess* GetObject() {
	return (Aspect_BadAccess*)$self->Access();
	}
};
%extend Handle_Aspect_BadAccess {
	~Handle_Aspect_BadAccess() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_BadAccess\n");}
	}
};

%nodefaultctor Handle_Aspect_LineWidthDefinitionError;
class Handle_Aspect_LineWidthDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_LineWidthDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_LineWidthDefinitionError(const Handle_Aspect_LineWidthDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_LineWidthDefinitionError(const Aspect_LineWidthDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_LineWidthDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_LineWidthDefinitionError {
	Aspect_LineWidthDefinitionError* GetObject() {
	return (Aspect_LineWidthDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_LineWidthDefinitionError {
	~Handle_Aspect_LineWidthDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_LineWidthDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_AspectLine;
class Handle_Aspect_AspectLine : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_AspectLine();
		%feature("autodoc", "1");
		Handle_Aspect_AspectLine(const Handle_Aspect_AspectLine &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_AspectLine(const Aspect_AspectLine *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_AspectLine const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectLine {
	Aspect_AspectLine* GetObject() {
	return (Aspect_AspectLine*)$self->Access();
	}
};
%extend Handle_Aspect_AspectLine {
	~Handle_Aspect_AspectLine() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_AspectLine\n");}
	}
};

%nodefaultctor Handle_Aspect_ColorCubeColorMap;
class Handle_Aspect_ColorCubeColorMap : public Handle_Aspect_ColorMap {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_ColorCubeColorMap();
		%feature("autodoc", "1");
		Handle_Aspect_ColorCubeColorMap(const Handle_Aspect_ColorCubeColorMap &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_ColorCubeColorMap(const Aspect_ColorCubeColorMap *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_ColorCubeColorMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorCubeColorMap {
	Aspect_ColorCubeColorMap* GetObject() {
	return (Aspect_ColorCubeColorMap*)$self->Access();
	}
};
%extend Handle_Aspect_ColorCubeColorMap {
	~Handle_Aspect_ColorCubeColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_ColorCubeColorMap\n");}
	}
};

%nodefaultctor Handle_Aspect_PixmapDefinitionError;
class Handle_Aspect_PixmapDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_PixmapDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_PixmapDefinitionError(const Handle_Aspect_PixmapDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_PixmapDefinitionError(const Aspect_PixmapDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_PixmapDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_PixmapDefinitionError {
	Aspect_PixmapDefinitionError* GetObject() {
	return (Aspect_PixmapDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_PixmapDefinitionError {
	~Handle_Aspect_PixmapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_PixmapDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_ColorScale;
class Handle_Aspect_ColorScale : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_ColorScale();
		%feature("autodoc", "1");
		Handle_Aspect_ColorScale(const Handle_Aspect_ColorScale &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_ColorScale(const Aspect_ColorScale *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_ColorScale const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorScale {
	Aspect_ColorScale* GetObject() {
	return (Aspect_ColorScale*)$self->Access();
	}
};
%extend Handle_Aspect_ColorScale {
	~Handle_Aspect_ColorScale() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_ColorScale\n");}
	}
};

%nodefaultctor Handle_Aspect_MarkMapDefinitionError;
class Handle_Aspect_MarkMapDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_MarkMapDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_MarkMapDefinitionError(const Handle_Aspect_MarkMapDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_MarkMapDefinitionError(const Aspect_MarkMapDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_MarkMapDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_MarkMapDefinitionError {
	Aspect_MarkMapDefinitionError* GetObject() {
	return (Aspect_MarkMapDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_MarkMapDefinitionError {
	~Handle_Aspect_MarkMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_MarkMapDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_DriverError;
class Handle_Aspect_DriverError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_DriverError();
		%feature("autodoc", "1");
		Handle_Aspect_DriverError(const Handle_Aspect_DriverError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_DriverError(const Aspect_DriverError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_DriverError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_DriverError {
	Aspect_DriverError* GetObject() {
	return (Aspect_DriverError*)$self->Access();
	}
};
%extend Handle_Aspect_DriverError {
	~Handle_Aspect_DriverError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_DriverError\n");}
	}
};

%nodefaultctor Handle_Aspect_WidthMapDefinitionError;
class Handle_Aspect_WidthMapDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_WidthMapDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_WidthMapDefinitionError(const Handle_Aspect_WidthMapDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_WidthMapDefinitionError(const Aspect_WidthMapDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_WidthMapDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_WidthMapDefinitionError {
	Aspect_WidthMapDefinitionError* GetObject() {
	return (Aspect_WidthMapDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_WidthMapDefinitionError {
	~Handle_Aspect_WidthMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_WidthMapDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_WindowError;
class Handle_Aspect_WindowError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_WindowError();
		%feature("autodoc", "1");
		Handle_Aspect_WindowError(const Handle_Aspect_WindowError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_WindowError(const Aspect_WindowError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_WindowError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_WindowError {
	Aspect_WindowError* GetObject() {
	return (Aspect_WindowError*)$self->Access();
	}
};
%extend Handle_Aspect_WindowError {
	~Handle_Aspect_WindowError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_WindowError\n");}
	}
};

%nodefaultctor Handle_Aspect_WindowDefinitionError;
class Handle_Aspect_WindowDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_WindowDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_WindowDefinitionError(const Handle_Aspect_WindowDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_WindowDefinitionError(const Aspect_WindowDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_WindowDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_WindowDefinitionError {
	Aspect_WindowDefinitionError* GetObject() {
	return (Aspect_WindowDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_WindowDefinitionError {
	~Handle_Aspect_WindowDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_WindowDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_AspectFillAreaDefinitionError;
class Handle_Aspect_AspectFillAreaDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillAreaDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillAreaDefinitionError(const Handle_Aspect_AspectFillAreaDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillAreaDefinitionError(const Aspect_AspectFillAreaDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillAreaDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_AspectFillAreaDefinitionError {
	Aspect_AspectFillAreaDefinitionError* GetObject() {
	return (Aspect_AspectFillAreaDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_AspectFillAreaDefinitionError {
	~Handle_Aspect_AspectFillAreaDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_AspectFillAreaDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_ColorMapDefinitionError;
class Handle_Aspect_ColorMapDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_ColorMapDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_ColorMapDefinitionError(const Handle_Aspect_ColorMapDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_ColorMapDefinitionError(const Aspect_ColorMapDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_ColorMapDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_ColorMapDefinitionError {
	Aspect_ColorMapDefinitionError* GetObject() {
	return (Aspect_ColorMapDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_ColorMapDefinitionError {
	~Handle_Aspect_ColorMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_ColorMapDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_GraphicDevice;
class Handle_Aspect_GraphicDevice : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDevice();
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDevice(const Handle_Aspect_GraphicDevice &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDevice(const Aspect_GraphicDevice *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDevice const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_GraphicDevice {
	Aspect_GraphicDevice* GetObject() {
	return (Aspect_GraphicDevice*)$self->Access();
	}
};
%extend Handle_Aspect_GraphicDevice {
	~Handle_Aspect_GraphicDevice() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_GraphicDevice\n");}
	}
};

%nodefaultctor Handle_Aspect_PolyStyleDefinitionError;
class Handle_Aspect_PolyStyleDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_PolyStyleDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_PolyStyleDefinitionError(const Handle_Aspect_PolyStyleDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_PolyStyleDefinitionError(const Aspect_PolyStyleDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_PolyStyleDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_PolyStyleDefinitionError {
	Aspect_PolyStyleDefinitionError* GetObject() {
	return (Aspect_PolyStyleDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_PolyStyleDefinitionError {
	~Handle_Aspect_PolyStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_PolyStyleDefinitionError\n");}
	}
};

%nodefaultctor Handle_Aspect_EdgeDefinitionError;
class Handle_Aspect_EdgeDefinitionError : public Handle_Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Handle_Aspect_EdgeDefinitionError();
		%feature("autodoc", "1");
		Handle_Aspect_EdgeDefinitionError(const Handle_Aspect_EdgeDefinitionError &aHandle);
		%feature("autodoc", "1");
		Handle_Aspect_EdgeDefinitionError(const Aspect_EdgeDefinitionError *anItem);
		%feature("autodoc", "1");
		Handle_Aspect_EdgeDefinitionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Aspect_EdgeDefinitionError {
	Aspect_EdgeDefinitionError* GetObject() {
	return (Aspect_EdgeDefinitionError*)$self->Access();
	}
};
%extend Handle_Aspect_EdgeDefinitionError {
	~Handle_Aspect_EdgeDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Aspect_EdgeDefinitionError\n");}
	}
};

%nodefaultctor Aspect_Edge;
class Aspect_Edge {
	public:
		%feature("autodoc", "1");
		Aspect_Edge();
		%feature("autodoc", "1");
		Aspect_Edge(const Standard_Integer AIndex1, const Standard_Integer AIndex2, const Aspect_TypeOfEdge AType);
		%feature("autodoc", "1");
		void SetValues(const Standard_Integer AIndex1, const Standard_Integer AIndex2, const Aspect_TypeOfEdge AType);
		%feature("autodoc", "1");
		void Values(Standard_Integer &OutValue, Standard_Integer &OutValue, Aspect_TypeOfEdge & AType) const;
		%feature("autodoc", "1");
		Standard_Integer FirstIndex() const;
		%feature("autodoc", "1");
		Standard_Integer LastIndex() const;
		%feature("autodoc", "1");
		Aspect_TypeOfEdge Type() const;

};
%extend Aspect_Edge {
	~Aspect_Edge() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_Edge\n");}
	}
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfFontMapEntry;
class Aspect_SequenceNodeOfSequenceOfFontMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceNodeOfSequenceOfFontMapEntry(const Aspect_FontMapEntry &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Aspect_FontMapEntry & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_SequenceNodeOfSequenceOfFontMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry*) &$self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfFontMapEntry {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_SequenceNodeOfSequenceOfFontMapEntry {
	~Aspect_SequenceNodeOfSequenceOfFontMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceNodeOfSequenceOfFontMapEntry\n");}
	}
};

%nodefaultctor Aspect_GraphicCallbackStruct;
class Aspect_GraphicCallbackStruct {
	public:
		%feature("autodoc", "1");
		Aspect_GraphicCallbackStruct();

};
%extend Aspect_GraphicCallbackStruct {
	~Aspect_GraphicCallbackStruct() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_GraphicCallbackStruct\n");}
	}
};

%nodefaultctor Aspect_AspectFillAreaDefinitionError;
class Aspect_AspectFillAreaDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_AspectFillAreaDefinitionError();
		%feature("autodoc", "1");
		Aspect_AspectFillAreaDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_AspectFillAreaDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_AspectFillAreaDefinitionError {
	Handle_Aspect_AspectFillAreaDefinitionError GetHandle() {
	return *(Handle_Aspect_AspectFillAreaDefinitionError*) &$self;
	}
};
%extend Aspect_AspectFillAreaDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_AspectFillAreaDefinitionError {
	~Aspect_AspectFillAreaDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_AspectFillAreaDefinitionError\n");}
	}
};

%nodefaultctor Aspect_ColorMapDefinitionError;
class Aspect_ColorMapDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_ColorMapDefinitionError();
		%feature("autodoc", "1");
		Aspect_ColorMapDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_ColorMapDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_ColorMapDefinitionError {
	Handle_Aspect_ColorMapDefinitionError GetHandle() {
	return *(Handle_Aspect_ColorMapDefinitionError*) &$self;
	}
};
%extend Aspect_ColorMapDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_ColorMapDefinitionError {
	~Aspect_ColorMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_ColorMapDefinitionError\n");}
	}
};

%nodefaultctor Aspect_PixMap;
class Aspect_PixMap : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		void Destroy();
		%feature("autodoc", "1");
		virtual		Standard_Boolean Dump(const char * aFilename, const Standard_Real aGammaValue=1.0e+0) const;
		%feature("autodoc", "1");
		virtual		Aspect_Handle PixmapID() const;
		%feature("autodoc", "1");
		void Size(Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		Standard_Integer Depth() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_PixMap {
	Handle_Aspect_PixMap GetHandle() {
	return *(Handle_Aspect_PixMap*) &$self;
	}
};
%extend Aspect_PixMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_PixMap {
	~Aspect_PixMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_PixMap\n");}
	}
};

%nodefaultctor Aspect_Pixel;
class Aspect_Pixel {
	public:
		%feature("autodoc", "1");
		virtual		void Print(Standard_OStream & s) const;

};
%extend Aspect_Pixel {
	~Aspect_Pixel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_Pixel\n");}
	}
};

%nodefaultctor Aspect_ColorPixel;
class Aspect_ColorPixel : public Aspect_Pixel {
	public:
		%feature("autodoc", "1");
		Aspect_ColorPixel();
		%feature("autodoc", "1");
		Aspect_ColorPixel(const Quantity_Color &aColor);
		%feature("autodoc", "1");
		const Quantity_Color & Value() const;
		%feature("autodoc", "1");
		void SetValue(const Quantity_Color &aColor);
		%feature("autodoc", "1");
		Standard_Integer HashCode(const Standard_Integer Upper) const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const Aspect_ColorPixel &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator==(const Aspect_ColorPixel &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean IsNotEqual(const Aspect_ColorPixel &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const Aspect_ColorPixel &Other) const;
		%feature("autodoc", "1");
		const Quantity_Color & _CSFDB_GetAspect_ColorPixelmyColor() const;

};
%extend Aspect_ColorPixel {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_ColorPixel {
	~Aspect_ColorPixel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_ColorPixel\n");}
	}
};

%nodefaultctor Aspect_UndefinedMap;
class Aspect_UndefinedMap : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_UndefinedMap();
		%feature("autodoc", "1");
		Aspect_UndefinedMap(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_UndefinedMap NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_UndefinedMap {
	Handle_Aspect_UndefinedMap GetHandle() {
	return *(Handle_Aspect_UndefinedMap*) &$self;
	}
};
%extend Aspect_UndefinedMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_UndefinedMap {
	~Aspect_UndefinedMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_UndefinedMap\n");}
	}
};

%nodefaultctor Aspect_AspectMarker;
class Aspect_AspectMarker : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void SetColor(const Quantity_Color &AColor);
		%feature("autodoc", "1");
		void SetScale(const Standard_Real AScale);
		%feature("autodoc", "1");
		void SetType(const Aspect_TypeOfMarker AType);
		%feature("autodoc", "1");
		void Values(Quantity_Color & AColor, Aspect_TypeOfMarker & AType, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_AspectMarker {
	Handle_Aspect_AspectMarker GetHandle() {
	return *(Handle_Aspect_AspectMarker*) &$self;
	}
};
%extend Aspect_AspectMarker {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_AspectMarker {
	~Aspect_AspectMarker() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_AspectMarker\n");}
	}
};

%nodefaultctor Aspect_IndexPixel;
class Aspect_IndexPixel : public Aspect_Pixel {
	public:
		%feature("autodoc", "1");
		Aspect_IndexPixel();
		%feature("autodoc", "1");
		Aspect_IndexPixel(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		Standard_Integer Value() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		Standard_Integer HashCode(const Standard_Integer Upper) const;
		%feature("autodoc", "1");
		virtual		void Print(Standard_OStream & s) const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const Aspect_IndexPixel &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator==(const Aspect_IndexPixel &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean IsNotEqual(const Aspect_IndexPixel &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const Aspect_IndexPixel &Other) const;
		%feature("autodoc", "1");
		Standard_Integer _CSFDB_GetAspect_IndexPixelmyIndex() const;
		%feature("autodoc", "1");
		void _CSFDB_SetAspect_IndexPixelmyIndex(const Standard_Integer p);

};
%extend Aspect_IndexPixel {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_IndexPixel {
	~Aspect_IndexPixel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_IndexPixel\n");}
	}
};

%nodefaultctor Aspect_RGBPixel;
class Aspect_RGBPixel {
	public:
		%feature("autodoc", "1");
		Aspect_RGBPixel();

};
%extend Aspect_RGBPixel {
	~Aspect_RGBPixel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_RGBPixel\n");}
	}
};

%nodefaultctor Aspect_SequenceOfTypeMapEntry;
class Aspect_SequenceOfTypeMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceOfTypeMapEntry();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const Aspect_SequenceOfTypeMapEntry & Assign(const Aspect_SequenceOfTypeMapEntry &Other);
		%feature("autodoc", "1");
		void Append(const Aspect_TypeMapEntry &T);
		%feature("autodoc", "1");
		void Append(Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "1");
		void Prepend(const Aspect_TypeMapEntry &T);
		%feature("autodoc", "1");
		void Prepend(Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Aspect_TypeMapEntry &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Aspect_TypeMapEntry &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_TypeMapEntry & First() const;
		%feature("autodoc", "1");
		const Aspect_TypeMapEntry & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Aspect_SequenceOfTypeMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_TypeMapEntry & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Aspect_TypeMapEntry & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Aspect_TypeMapEntry &I);
		%feature("autodoc", "1");
		Aspect_TypeMapEntry & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Aspect_TypeMapEntry & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend Aspect_SequenceOfTypeMapEntry {
	~Aspect_SequenceOfTypeMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceOfTypeMapEntry\n");}
	}
};

%nodefaultctor Aspect_WindowError;
class Aspect_WindowError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_WindowError();
		%feature("autodoc", "1");
		Aspect_WindowError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_WindowError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_WindowError {
	Handle_Aspect_WindowError GetHandle() {
	return *(Handle_Aspect_WindowError*) &$self;
	}
};
%extend Aspect_WindowError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_WindowError {
	~Aspect_WindowError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_WindowError\n");}
	}
};

%nodefaultctor Aspect_Driver;
class Aspect_Driver : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		void EndDraw(const Standard_Boolean Synchronize=0);
		%feature("autodoc", "1");
		void SetColorMap(const Handle_Aspect_ColorMap &aColorMap);
		%feature("autodoc", "1");
		void SetTypeMap(const Handle_Aspect_TypeMap &aTypeMap);
		%feature("autodoc", "1");
		void SetWidthMap(const Handle_Aspect_WidthMap &aWidthMap);
		%feature("autodoc", "1");
		void SetFontMap(const Handle_Aspect_FontMap &aFontMap, const Standard_Boolean useMFT=1);
		%feature("autodoc", "1");
		void SetMarkMap(const Handle_Aspect_MarkMap &aMarkMap);
		%feature("autodoc", "1");
		virtual		void SetLineAttrib(const Standard_Integer ColorIndex, const Standard_Integer TypeIndex, const Standard_Integer WidthIndex);
		%feature("autodoc", "1");
		virtual		void SetTextAttrib(const Standard_Integer ColorIndex, const Standard_Integer FontIndex);
		%feature("autodoc", "1");
		virtual		void SetTextAttrib(const Standard_Integer ColorIndex, const Standard_Integer FontIndex, const Quantity_PlaneAngle aSlant, const Quantity_Factor aHScale, const Quantity_Factor aWScale, const Standard_Boolean isUnderlined=0);
		%feature("autodoc", "1");
		virtual		void SetPolyAttrib(const Standard_Integer ColorIndex, const Standard_Integer TileIndex, const Standard_Boolean DrawEdge=0);
		%feature("autodoc", "1");
		virtual		void SetMarkerAttrib(const Standard_Integer ColorIndex, const Standard_Integer WidthIndex, const Standard_Boolean FillMarker=0);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsKnownImage(const Handle_Standard_Transient &anImage);
		%feature("autodoc", "1");
		virtual		Standard_Boolean SizeOfImageFile(const char * anImageFile, Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		void ClearImage(const Handle_Standard_Transient &anImageId);
		%feature("autodoc", "1");
		virtual		void ClearImageFile(const char * anImageFile);
		%feature("autodoc", "1");
		virtual		void DrawImage(const Handle_Standard_Transient &anImageId, const Standard_ShortReal aX, const Standard_ShortReal aY);
		%feature("autodoc", "1");
		virtual		void DrawImageFile(const char * anImageFile, const Standard_ShortReal aX, const Standard_ShortReal aY, const Quantity_Factor aScale=1.0e+0);
		%feature("autodoc", "1");
		virtual		void FillAndDrawImage(const Handle_Standard_Transient &anImageId, const Standard_ShortReal aX, const Standard_ShortReal aY, const Standard_Integer aWidth, const Standard_Integer aHeight, const Standard_Address anArrayOfPixels);
		%feature("autodoc", "1");
		virtual		void FillAndDrawImage(const Handle_Standard_Transient &anImageId, const Standard_ShortReal aX, const Standard_ShortReal aY, const Standard_Integer anIndexOfLine, const Standard_Integer aWidth, const Standard_Integer aHeight, const Standard_Address anArrayOfPixels);
		%feature("autodoc", "1");
		virtual		void DrawPolyline(const TShort_Array1OfShortReal &aListX, const TShort_Array1OfShortReal &aListY);
		%feature("autodoc", "1");
		virtual		void DrawPolygon(const TShort_Array1OfShortReal &aListX, const TShort_Array1OfShortReal &aListY);
		%feature("autodoc", "1");
		virtual		void DrawSegment(const Standard_ShortReal X1, const Standard_ShortReal Y1, const Standard_ShortReal X2, const Standard_ShortReal Y2);
		%feature("autodoc", "1");
		virtual		void DrawText(const TCollection_ExtendedString &aText, const Standard_ShortReal Xpos, const Standard_ShortReal Ypos, const Standard_ShortReal anAngle=0.0, const Aspect_TypeOfText aType=Aspect_TOT_SOLID);
		%feature("autodoc", "1");
		virtual		void DrawPolyText(const TCollection_ExtendedString &aText, const Standard_ShortReal Xpos, const Standard_ShortReal Ypos, const Quantity_Ratio aMarge=1.00000000000000005551115123125782702118158340454e-1, const Standard_ShortReal anAngle=0.0, const Aspect_TypeOfText aType=Aspect_TOT_SOLID);
		%feature("autodoc", "1");
		virtual		void DrawPoint(const Standard_ShortReal X, const Standard_ShortReal Y);
		%feature("autodoc", "1");
		virtual		void DrawMarker(const Standard_Integer aMarker, const Standard_ShortReal Xpos, const Standard_ShortReal Ypos, const Standard_ShortReal Width, const Standard_ShortReal Height, const Standard_ShortReal Angle=0.0);
		%feature("autodoc", "1");
		virtual		Standard_Boolean DrawArc(const Standard_ShortReal X, const Standard_ShortReal Y, const Standard_ShortReal anXradius, const Standard_ShortReal anYradius, const Standard_ShortReal aStartAngle=0.0, const Standard_ShortReal anOpenAngle=6.28318499999999957594809529837220907211303710938e+0);
		%feature("autodoc", "1");
		virtual		Standard_Boolean DrawPolyArc(const Standard_ShortReal X, const Standard_ShortReal Y, const Standard_ShortReal anXradius, const Standard_ShortReal anYradius, const Standard_ShortReal aStartAngle=0.0, const Standard_ShortReal anOpenAngle=6.28318499999999957594809529837220907211303710938e+0);
		%feature("autodoc", "1");
		virtual		void BeginPolyline(const Standard_Integer aNumber);
		%feature("autodoc", "1");
		virtual		void BeginPolygon(const Standard_Integer aNumber);
		%feature("autodoc", "1");
		virtual		void BeginSegments();
		%feature("autodoc", "1");
		virtual		void BeginArcs();
		%feature("autodoc", "1");
		virtual		void BeginPolyArcs();
		%feature("autodoc", "1");
		virtual		void BeginMarkers();
		%feature("autodoc", "1");
		virtual		void BeginPoints();
		%feature("autodoc", "1");
		virtual		void ClosePrimitive();
		%feature("autodoc", "1");
		Handle_Aspect_ColorMap ColorMap() const;
		%feature("autodoc", "1");
		Handle_Aspect_TypeMap TypeMap() const;
		%feature("autodoc", "1");
		Handle_Aspect_WidthMap WidthMap() const;
		%feature("autodoc", "1");
		Handle_Aspect_FontMap FontMap() const;
		%feature("autodoc", "1");
		Handle_Aspect_MarkMap MarkMap() const;
		%feature("autodoc", "1");
		virtual		void WorkSpace(Quantity_Length & Width, Quantity_Length & Heigth) const;
		%feature("autodoc", "1");
		virtual		Quantity_Length Convert(const Standard_Integer PV) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer Convert(const Quantity_Length DV) const;
		%feature("autodoc", "1");
		virtual		void Convert(const Standard_Integer PX, const Standard_Integer PY, Quantity_Length & DX, Quantity_Length & DY) const;
		%feature("autodoc", "1");
		virtual		void Convert(const Quantity_Length DX, const Quantity_Length DY, Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		Standard_Boolean UseMFT() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_Driver {
	Handle_Aspect_Driver GetHandle() {
	return *(Handle_Aspect_Driver*) &$self;
	}
};
%extend Aspect_Driver {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_Driver {
	~Aspect_Driver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_Driver\n");}
	}
};

%nodefaultctor Aspect_AspectMarkerDefinitionError;
class Aspect_AspectMarkerDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_AspectMarkerDefinitionError();
		%feature("autodoc", "1");
		Aspect_AspectMarkerDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_AspectMarkerDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_AspectMarkerDefinitionError {
	Handle_Aspect_AspectMarkerDefinitionError GetHandle() {
	return *(Handle_Aspect_AspectMarkerDefinitionError*) &$self;
	}
};
%extend Aspect_AspectMarkerDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_AspectMarkerDefinitionError {
	~Aspect_AspectMarkerDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_AspectMarkerDefinitionError\n");}
	}
};

%nodefaultctor Aspect_ColorMap;
class Aspect_ColorMap : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Aspect_TypeOfColorMap Type() const;
		%feature("autodoc", "1");
		Standard_Integer Size() const;
		%feature("autodoc", "1");
		Standard_Integer Index(const Standard_Integer aColormapIndex) const;
		%feature("autodoc", "1");
		void Dump() const;
		%feature("autodoc", "1");
		const Aspect_ColorMapEntry & Entry(const Standard_Integer AColorMapIndex) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer FindColorMapIndex(const Standard_Integer AColorMapEntryIndex) const;
		%feature("autodoc", "1");
		virtual		const Aspect_ColorMapEntry & FindEntry(const Standard_Integer AColorMapEntryIndex) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NearestColorMapIndex(const Quantity_Color &aColor) const;
		%feature("autodoc", "1");
		virtual		const Aspect_ColorMapEntry & NearestEntry(const Quantity_Color &aColor) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer AddEntry(const Quantity_Color &aColor);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_ColorMap {
	Handle_Aspect_ColorMap GetHandle() {
	return *(Handle_Aspect_ColorMap*) &$self;
	}
};
%extend Aspect_ColorMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_ColorMap {
	~Aspect_ColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_ColorMap\n");}
	}
};

%nodefaultctor Aspect_ColorRampColorMap;
class Aspect_ColorRampColorMap : public Aspect_ColorMap {
	public:
		%feature("autodoc", "1");
		Aspect_ColorRampColorMap(const Standard_Integer basepixel, const Standard_Integer dimension, const Quantity_Color &color);
		%feature("autodoc", "1");
		Aspect_ColorRampColorMap(const Standard_Integer basepixel, const Standard_Integer dimension, const Quantity_NameOfColor colorName);
		%feature("autodoc", "1");
		void ColorRampDefinition(Standard_Integer &OutValue, Standard_Integer &OutValue, Quantity_Color & color) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer FindColorMapIndex(const Standard_Integer ColorMapEntryIndex) const;

};
%extend Aspect_ColorRampColorMap {
	Handle_Aspect_ColorRampColorMap GetHandle() {
	return *(Handle_Aspect_ColorRampColorMap*) &$self;
	}
};
%extend Aspect_ColorRampColorMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_ColorRampColorMap {
	~Aspect_ColorRampColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_ColorRampColorMap\n");}
	}
};

%nodefaultctor Aspect_Grid;
class Aspect_Grid : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void SetXOrigin(const Quantity_Length anOrigin);
		%feature("autodoc", "1");
		void SetYOrigin(const Quantity_Length anOrigin);
		%feature("autodoc", "1");
		void SetRotationAngle(const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "1");
		void Rotate(const Quantity_PlaneAngle anAngle);
		%feature("autodoc", "1");
		void Translate(const Quantity_Length aDx, const Quantity_Length aDy);
		%feature("autodoc", "1");
		virtual		void SetColors(const Quantity_Color &aColor, const Quantity_Color &aTenthColor);
		%feature("autodoc", "1");
		void Hit(const Quantity_Length X, const Quantity_Length Y, Quantity_Length & gridX, Quantity_Length & gridY) const;
		%feature("autodoc", "1");
		virtual		void Compute(const Quantity_Length X, const Quantity_Length Y, Quantity_Length & gridX, Quantity_Length & gridY) const;
		%feature("autodoc", "1");
		void Activate();
		%feature("autodoc", "1");
		void Deactivate();
		%feature("autodoc", "1");
		Quantity_Length XOrigin() const;
		%feature("autodoc", "1");
		Quantity_Length YOrigin() const;
		%feature("autodoc", "1");
		Quantity_PlaneAngle RotationAngle() const;
		%feature("autodoc", "1");
		Standard_Boolean IsActive() const;
		%feature("autodoc", "1");
		void Colors(Quantity_Color & aColor, Quantity_Color & aTenthColor) const;
		%feature("autodoc", "1");
		void SetDrawMode(const Aspect_GridDrawMode aDrawMode);
		%feature("autodoc", "1");
		Aspect_GridDrawMode DrawMode() const;
		%feature("autodoc", "1");
		virtual		void Display();
		%feature("autodoc", "1");
		virtual		void Erase() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsDisplayed() const;
		%feature("autodoc", "1");
		virtual		void Init();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_Grid {
	Handle_Aspect_Grid GetHandle() {
	return *(Handle_Aspect_Grid*) &$self;
	}
};
%extend Aspect_Grid {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_Grid {
	~Aspect_Grid() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_Grid\n");}
	}
};

%nodefaultctor Aspect_RectangularGrid;
class Aspect_RectangularGrid : public Aspect_Grid {
	public:
		%feature("autodoc", "1");
		Aspect_RectangularGrid(const Quantity_Length aXStep, const Quantity_Length aYStep, const Quantity_Length anXOrigin=0, const Quantity_Length anYOrigin=0, const Quantity_PlaneAngle aFirstAngle=0, const Quantity_PlaneAngle aSecondAngle=0, const Quantity_PlaneAngle aRotationAngle=0);
		%feature("autodoc", "1");
		void SetXStep(const Quantity_Length aStep);
		%feature("autodoc", "1");
		void SetYStep(const Quantity_Length aStep);
		%feature("autodoc", "1");
		void SetAngle(const Quantity_PlaneAngle anAngle1, const Quantity_PlaneAngle anAngle2);
		%feature("autodoc", "1");
		void SetGridValues(const Quantity_Length XOrigin, const Quantity_Length YOrigin, const Quantity_Length XStep, const Quantity_Length YStep, const Quantity_PlaneAngle RotationAngle);
		%feature("autodoc", "1");
		Quantity_Length XStep() const;
		%feature("autodoc", "1");
		Quantity_Length YStep() const;
		%feature("autodoc", "1");
		Quantity_PlaneAngle FirstAngle() const;
		%feature("autodoc", "1");
		Quantity_PlaneAngle SecondAngle() const;

};
%extend Aspect_RectangularGrid {
	Handle_Aspect_RectangularGrid GetHandle() {
	return *(Handle_Aspect_RectangularGrid*) &$self;
	}
};
%extend Aspect_RectangularGrid {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_RectangularGrid {
	~Aspect_RectangularGrid() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_RectangularGrid\n");}
	}
};

%nodefaultctor Aspect_GenericColorMap;
class Aspect_GenericColorMap : public Aspect_ColorMap {
	public:
		%feature("autodoc", "1");
		Aspect_GenericColorMap();
		%feature("autodoc", "1");
		void AddEntry(const Aspect_ColorMapEntry &AnEntry);
		%feature("autodoc", "1");
		virtual		Standard_Integer AddEntry(const Quantity_Color &aColor);
		%feature("autodoc", "1");
		void RemoveEntry(const Standard_Integer AColorMapEntryIndex);
		%feature("autodoc", "1");
		virtual		Standard_Integer FindColorMapIndex(const Standard_Integer AColorMapEntryIndex) const;
		%feature("autodoc", "1");
		virtual		const Aspect_ColorMapEntry & FindEntry(const Standard_Integer AColorMapEntryIndex) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NearestColorMapIndex(const Quantity_Color &aColor) const;
		%feature("autodoc", "1");
		virtual		const Aspect_ColorMapEntry & NearestEntry(const Quantity_Color &aColor) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_GenericColorMap {
	Handle_Aspect_GenericColorMap GetHandle() {
	return *(Handle_Aspect_GenericColorMap*) &$self;
	}
};
%extend Aspect_GenericColorMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_GenericColorMap {
	~Aspect_GenericColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_GenericColorMap\n");}
	}
};

%nodefaultctor Aspect_TypeMap;
class Aspect_TypeMap : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Aspect_TypeMap();
		%feature("autodoc", "1");
		void AddEntry(const Aspect_TypeMapEntry &AnEntry);
		%feature("autodoc", "1");
		Standard_Integer AddEntry(const Aspect_LineStyle &aStyle);
		%feature("autodoc", "1");
		Standard_Integer Size() const;
		%feature("autodoc", "1");
		Standard_Integer Index(const Standard_Integer aTypemapIndex) const;
		%feature("autodoc", "1");
		void Dump() const;
		%feature("autodoc", "1");
		const Aspect_TypeMapEntry & Entry(const Standard_Integer AnIndex) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_TypeMap {
	Handle_Aspect_TypeMap GetHandle() {
	return *(Handle_Aspect_TypeMap*) &$self;
	}
};
%extend Aspect_TypeMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_TypeMap {
	~Aspect_TypeMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_TypeMap\n");}
	}
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfMarkMapEntry;
class Aspect_SequenceNodeOfSequenceOfMarkMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceNodeOfSequenceOfMarkMapEntry(const Aspect_MarkMapEntry &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Aspect_MarkMapEntry & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry*) &$self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_SequenceNodeOfSequenceOfMarkMapEntry {
	~Aspect_SequenceNodeOfSequenceOfMarkMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceNodeOfSequenceOfMarkMapEntry\n");}
	}
};

%nodefaultctor Aspect_MarkMap;
class Aspect_MarkMap : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Aspect_MarkMap();
		%feature("autodoc", "1");
		void AddEntry(const Aspect_MarkMapEntry &AnEntry);
		%feature("autodoc", "1");
		Standard_Integer AddEntry(const Aspect_MarkerStyle &aStyle);
		%feature("autodoc", "1");
		Standard_Integer Size() const;
		%feature("autodoc", "1");
		Standard_Integer Index(const Standard_Integer aMarkmapIndex) const;
		%feature("autodoc", "1");
		void Dump() const;
		%feature("autodoc", "1");
		Aspect_MarkMapEntry Entry(const Standard_Integer AnIndex) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_MarkMap {
	Handle_Aspect_MarkMap GetHandle() {
	return *(Handle_Aspect_MarkMap*) &$self;
	}
};
%extend Aspect_MarkMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_MarkMap {
	~Aspect_MarkMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_MarkMap\n");}
	}
};

%nodefaultctor Aspect_WindowDefinitionError;
class Aspect_WindowDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_WindowDefinitionError();
		%feature("autodoc", "1");
		Aspect_WindowDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_WindowDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_WindowDefinitionError {
	Handle_Aspect_WindowDefinitionError GetHandle() {
	return *(Handle_Aspect_WindowDefinitionError*) &$self;
	}
};
%extend Aspect_WindowDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_WindowDefinitionError {
	~Aspect_WindowDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_WindowDefinitionError\n");}
	}
};

%nodefaultctor Aspect_PixmapError;
class Aspect_PixmapError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_PixmapError();
		%feature("autodoc", "1");
		Aspect_PixmapError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_PixmapError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_PixmapError {
	Handle_Aspect_PixmapError GetHandle() {
	return *(Handle_Aspect_PixmapError*) &$self;
	}
};
%extend Aspect_PixmapError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_PixmapError {
	~Aspect_PixmapError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_PixmapError\n");}
	}
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfTypeMapEntry;
class Aspect_SequenceNodeOfSequenceOfTypeMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceNodeOfSequenceOfTypeMapEntry(const Aspect_TypeMapEntry &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Aspect_TypeMapEntry & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry*) &$self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_SequenceNodeOfSequenceOfTypeMapEntry {
	~Aspect_SequenceNodeOfSequenceOfTypeMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceNodeOfSequenceOfTypeMapEntry\n");}
	}
};

%nodefaultctor Aspect_SequenceOfColor;
class Aspect_SequenceOfColor : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceOfColor();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const Aspect_SequenceOfColor & Assign(const Aspect_SequenceOfColor &Other);
		%feature("autodoc", "1");
		void Append(const Quantity_Color &T);
		%feature("autodoc", "1");
		void Append(Aspect_SequenceOfColor & S);
		%feature("autodoc", "1");
		void Prepend(const Quantity_Color &T);
		%feature("autodoc", "1");
		void Prepend(Aspect_SequenceOfColor & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Quantity_Color &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Aspect_SequenceOfColor & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Quantity_Color &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Aspect_SequenceOfColor & S);
		%feature("autodoc", "1");
		const Quantity_Color & First() const;
		%feature("autodoc", "1");
		const Quantity_Color & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Aspect_SequenceOfColor & S);
		%feature("autodoc", "1");
		const Quantity_Color & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Quantity_Color & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Quantity_Color &I);
		%feature("autodoc", "1");
		Quantity_Color & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Quantity_Color & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend Aspect_SequenceOfColor {
	~Aspect_SequenceOfColor() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceOfColor\n");}
	}
};

%nodefaultctor Aspect_GraphicDeviceDefinitionError;
class Aspect_GraphicDeviceDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_GraphicDeviceDefinitionError();
		%feature("autodoc", "1");
		Aspect_GraphicDeviceDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDeviceDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_GraphicDeviceDefinitionError {
	Handle_Aspect_GraphicDeviceDefinitionError GetHandle() {
	return *(Handle_Aspect_GraphicDeviceDefinitionError*) &$self;
	}
};
%extend Aspect_GraphicDeviceDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_GraphicDeviceDefinitionError {
	~Aspect_GraphicDeviceDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_GraphicDeviceDefinitionError\n");}
	}
};

%nodefaultctor Aspect_WidthMap;
class Aspect_WidthMap : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Aspect_WidthMap();
		%feature("autodoc", "1");
		void AddEntry(const Aspect_WidthMapEntry &AnEntry);
		%feature("autodoc", "1");
		Standard_Integer AddEntry(const Aspect_WidthOfLine aStyle);
		%feature("autodoc", "1");
		Standard_Integer AddEntry(const Quantity_Length aStyle);
		%feature("autodoc", "1");
		Standard_Integer Size() const;
		%feature("autodoc", "1");
		Standard_Integer Index(const Standard_Integer aWidthmapIndex) const;
		%feature("autodoc", "1");
		Aspect_WidthMapEntry Entry(const Standard_Integer AnIndex) const;
		%feature("autodoc", "1");
		void Dump() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_WidthMap {
	Handle_Aspect_WidthMap GetHandle() {
	return *(Handle_Aspect_WidthMap*) &$self;
	}
};
%extend Aspect_WidthMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_WidthMap {
	~Aspect_WidthMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_WidthMap\n");}
	}
};

%nodefaultctor Aspect_EdgeDefinitionError;
class Aspect_EdgeDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_EdgeDefinitionError();
		%feature("autodoc", "1");
		Aspect_EdgeDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_EdgeDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_EdgeDefinitionError {
	Handle_Aspect_EdgeDefinitionError GetHandle() {
	return *(Handle_Aspect_EdgeDefinitionError*) &$self;
	}
};
%extend Aspect_EdgeDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_EdgeDefinitionError {
	~Aspect_EdgeDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_EdgeDefinitionError\n");}
	}
};

%nodefaultctor Aspect_AspectFillArea;
class Aspect_AspectFillArea : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void SetEdgeColor(const Quantity_Color &AColor);
		%feature("autodoc", "1");
		void SetEdgeLineType(const Aspect_TypeOfLine AType);
		%feature("autodoc", "1");
		void SetEdgeWidth(const Standard_Real AWidth);
		%feature("autodoc", "1");
		void SetHatchStyle(const Aspect_HatchStyle AStyle);
		%feature("autodoc", "1");
		void SetInteriorColor(const Quantity_Color &AColor);
		%feature("autodoc", "1");
		void SetBackInteriorColor(const Quantity_Color &color);
		%feature("autodoc", "1");
		void SetInteriorStyle(const Aspect_InteriorStyle AStyle);
		%feature("autodoc", "1");
		Aspect_HatchStyle HatchStyle() const;
		%feature("autodoc", "1");
		void Values(Aspect_InteriorStyle & AStyle, Quantity_Color & AIntColor, Quantity_Color & AEdgeColor, Aspect_TypeOfLine & AType, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void Values(Aspect_InteriorStyle & AStyle, Quantity_Color & AIntColor, Quantity_Color & BackIntColor, Quantity_Color & AEdgeColor, Aspect_TypeOfLine & AType, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_AspectFillArea {
	Handle_Aspect_AspectFillArea GetHandle() {
	return *(Handle_Aspect_AspectFillArea*) &$self;
	}
};
%extend Aspect_AspectFillArea {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_AspectFillArea {
	~Aspect_AspectFillArea() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_AspectFillArea\n");}
	}
};

%nodefaultctor Aspect_MarkMapDefinitionError;
class Aspect_MarkMapDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_MarkMapDefinitionError();
		%feature("autodoc", "1");
		Aspect_MarkMapDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_MarkMapDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_MarkMapDefinitionError {
	Handle_Aspect_MarkMapDefinitionError GetHandle() {
	return *(Handle_Aspect_MarkMapDefinitionError*) &$self;
	}
};
%extend Aspect_MarkMapDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_MarkMapDefinitionError {
	~Aspect_MarkMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_MarkMapDefinitionError\n");}
	}
};

%nodefaultctor Aspect_MarkerStyleDefinitionError;
class Aspect_MarkerStyleDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_MarkerStyleDefinitionError();
		%feature("autodoc", "1");
		Aspect_MarkerStyleDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_MarkerStyleDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_MarkerStyleDefinitionError {
	Handle_Aspect_MarkerStyleDefinitionError GetHandle() {
	return *(Handle_Aspect_MarkerStyleDefinitionError*) &$self;
	}
};
%extend Aspect_MarkerStyleDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_MarkerStyleDefinitionError {
	~Aspect_MarkerStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_MarkerStyleDefinitionError\n");}
	}
};

%nodefaultctor Aspect_MarkMapEntry;
class Aspect_MarkMapEntry {
	public:
		%feature("autodoc", "1");
		Aspect_MarkMapEntry();
		%feature("autodoc", "1");
		Aspect_MarkMapEntry(const Standard_Integer index, const Aspect_MarkerStyle &style);
		%feature("autodoc", "1");
		Aspect_MarkMapEntry(const Aspect_MarkMapEntry &entry);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer index, const Aspect_MarkerStyle &style);
		%feature("autodoc", "1");
		void SetValue(const Aspect_MarkMapEntry &entry);
		%feature("autodoc", "1");
		void SetStyle(const Aspect_MarkerStyle &Style);
		%feature("autodoc", "1");
		const Aspect_MarkerStyle & Style() const;
		%feature("autodoc", "1");
		void SetIndex(const Standard_Integer index);
		%feature("autodoc", "1");
		Standard_Integer Index() const;
		%feature("autodoc", "1");
		void Free();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		void Dump() const;

};
%extend Aspect_MarkMapEntry {
	~Aspect_MarkMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_MarkMapEntry\n");}
	}
};

%nodefaultctor Aspect_ColorCubeColorMap;
class Aspect_ColorCubeColorMap : public Aspect_ColorMap {
	public:
		%feature("autodoc", "1");
		Aspect_ColorCubeColorMap(const Standard_Integer base_pixel, const Standard_Integer redmax, const Standard_Integer redmult, const Standard_Integer greenmax, const Standard_Integer greenmult, const Standard_Integer bluemax, const Standard_Integer bluemult);
		%feature("autodoc", "1");
		void ColorCubeDefinition(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer FindColorMapIndex(const Standard_Integer AColorMapEntryIndex) const;
		%feature("autodoc", "1");
		virtual		const Aspect_ColorMapEntry & FindEntry(const Standard_Integer AColorMapEntryIndex) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NearestColorMapIndex(const Quantity_Color &aColor) const;
		%feature("autodoc", "1");
		virtual		const Aspect_ColorMapEntry & NearestEntry(const Quantity_Color &aColor) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer AddEntry(const Quantity_Color &aColor);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_ColorCubeColorMap {
	Handle_Aspect_ColorCubeColorMap GetHandle() {
	return *(Handle_Aspect_ColorCubeColorMap*) &$self;
	}
};
%extend Aspect_ColorCubeColorMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_ColorCubeColorMap {
	~Aspect_ColorCubeColorMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_ColorCubeColorMap\n");}
	}
};

%nodefaultctor Aspect_TypeMapDefinitionError;
class Aspect_TypeMapDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_TypeMapDefinitionError();
		%feature("autodoc", "1");
		Aspect_TypeMapDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_TypeMapDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_TypeMapDefinitionError {
	Handle_Aspect_TypeMapDefinitionError GetHandle() {
	return *(Handle_Aspect_TypeMapDefinitionError*) &$self;
	}
};
%extend Aspect_TypeMapDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_TypeMapDefinitionError {
	~Aspect_TypeMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_TypeMapDefinitionError\n");}
	}
};

%nodefaultctor Aspect_WidthMapEntry;
class Aspect_WidthMapEntry {
	public:
		%feature("autodoc", "1");
		Aspect_WidthMapEntry();
		%feature("autodoc", "1");
		Aspect_WidthMapEntry(const Standard_Integer index, const Aspect_WidthOfLine style);
		%feature("autodoc", "1");
		Aspect_WidthMapEntry(const Standard_Integer index, const Quantity_Length width);
		%feature("autodoc", "1");
		Aspect_WidthMapEntry(const Aspect_WidthMapEntry &entry);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer index, const Aspect_WidthOfLine style);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer index, const Quantity_Length width);
		%feature("autodoc", "1");
		void SetValue(const Aspect_WidthMapEntry &entry);
		%feature("autodoc", "1");
		void SetIndex(const Standard_Integer index);
		%feature("autodoc", "1");
		void SetType(const Aspect_WidthOfLine Style);
		%feature("autodoc", "1");
		void SetWidth(const Quantity_Length Width);
		%feature("autodoc", "1");
		Aspect_WidthOfLine Type() const;
		%feature("autodoc", "1");
		Quantity_Length Width() const;
		%feature("autodoc", "1");
		Standard_Integer Index() const;
		%feature("autodoc", "1");
		void Free();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		void Dump() const;

};
%extend Aspect_WidthMapEntry {
	~Aspect_WidthMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_WidthMapEntry\n");}
	}
};

%nodefaultctor Aspect_GenId;
class Aspect_GenId {
	public:
		%feature("autodoc", "1");
		Aspect_GenId();
		%feature("autodoc", "1");
		Aspect_GenId(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Free();
		%feature("autodoc", "1");
		void Free(const Standard_Integer Id);
		%feature("autodoc", "1");
		Standard_Integer Available() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Next();
		%feature("autodoc", "1");
		Standard_Integer Upper() const;

};
%extend Aspect_GenId {
	~Aspect_GenId() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_GenId\n");}
	}
};

%nodefaultctor Aspect_LineWidthDefinitionError;
class Aspect_LineWidthDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_LineWidthDefinitionError();
		%feature("autodoc", "1");
		Aspect_LineWidthDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_LineWidthDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_LineWidthDefinitionError {
	Handle_Aspect_LineWidthDefinitionError GetHandle() {
	return *(Handle_Aspect_LineWidthDefinitionError*) &$self;
	}
};
%extend Aspect_LineWidthDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_LineWidthDefinitionError {
	~Aspect_LineWidthDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_LineWidthDefinitionError\n");}
	}
};

%nodefaultctor Aspect_FontMapEntry;
class Aspect_FontMapEntry {
	public:
		%feature("autodoc", "1");
		Aspect_FontMapEntry();
		%feature("autodoc", "1");
		Aspect_FontMapEntry(const Standard_Integer index, const Aspect_FontStyle &style);
		%feature("autodoc", "1");
		Aspect_FontMapEntry(const Aspect_FontMapEntry &entry);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer index, const Aspect_FontStyle &style);
		%feature("autodoc", "1");
		void SetValue(const Aspect_FontMapEntry &entry);
		%feature("autodoc", "1");
		void SetType(const Aspect_FontStyle &Style);
		%feature("autodoc", "1");
		const Aspect_FontStyle & Type() const;
		%feature("autodoc", "1");
		void SetIndex(const Standard_Integer index);
		%feature("autodoc", "1");
		Standard_Integer Index() const;
		%feature("autodoc", "1");
		void Free();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		void Dump() const;

};
%extend Aspect_FontMapEntry {
	~Aspect_FontMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_FontMapEntry\n");}
	}
};

%nodefaultctor Aspect_Window;
class Aspect_Window : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		void SetBackground(const Aspect_Background &ABack);
		%feature("autodoc", "1");
		virtual		void SetBackground(const Quantity_NameOfColor BackColor);
		%feature("autodoc", "1");
		virtual		void SetBackground(const Quantity_Color &color);
		%feature("autodoc", "1");
		virtual		Standard_Boolean SetBackground(const char * aName, const Aspect_FillMethod aMethod=Aspect_FM_CENTERED);
		%feature("autodoc", "1");
		virtual		void SetBackground(const Aspect_Handle aBitmap);
		%feature("autodoc", "1");
		virtual		void SetDoubleBuffer(const Standard_Boolean DBmode);
		%feature("autodoc", "1");
		virtual		void Flush() const;
		%feature("autodoc", "1");
		virtual		void Map() const;
		%feature("autodoc", "1");
		virtual		void Unmap() const;
		%feature("autodoc", "1");
		virtual		Aspect_TypeOfResize DoResize() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean DoMapping() const;
		%feature("autodoc", "1");
		virtual		void Destroy();
		%feature("autodoc", "1");
		virtual		void Clear() const;
		%feature("autodoc", "1");
		virtual		void ClearArea(const Standard_Integer XCenter, const Standard_Integer YCenter, const Standard_Integer Width, const Standard_Integer Height) const;
		%feature("autodoc", "1");
		virtual		void Restore() const;
		%feature("autodoc", "1");
		virtual		void RestoreArea(const Standard_Integer XCenter, const Standard_Integer YCenter, const Standard_Integer Width, const Standard_Integer Height) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Dump(const char * aFilename, const Standard_Real aGammaValue=1.0e+0) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean DumpArea(const char * aFilename, const Standard_Integer Xc, const Standard_Integer Yc, const Standard_Integer Width, const Standard_Integer Height, const Standard_Real aGammaValue=1.0e+0) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Load(const char * aFilename) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean LoadArea(const char * aFilename, const Standard_Integer Xc, const Standard_Integer Yc, const Standard_Integer Width, const Standard_Integer Height) const;
		%feature("autodoc", "1");
		Aspect_Background Background() const;
		%feature("autodoc", "1");
		Standard_CString BackgroundImage() const;
		%feature("autodoc", "1");
		Aspect_FillMethod BackgroundFillMethod() const;
		%feature("autodoc", "1");
		Aspect_Handle HBackground() const;
		%feature("autodoc", "1");
		Handle_Aspect_GraphicDevice GraphicDevice() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsMapped() const;
		%feature("autodoc", "1");
		virtual		Quantity_Ratio Ratio() const;
		%feature("autodoc", "1");
		virtual		void Position(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		virtual		void Position(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		void Size(Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		virtual		void Size(Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		void MMSize(Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		virtual		Quantity_Parameter Convert(const Standard_Integer PV) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer Convert(const Quantity_Parameter DV) const;
		%feature("autodoc", "1");
		virtual		void Convert(const Standard_Integer PX, const Standard_Integer PY, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		virtual		void Convert(const Quantity_Parameter DX, const Quantity_Parameter DY, Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean BackingStore() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean DoubleBuffer() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_Window {
	Handle_Aspect_Window GetHandle() {
	return *(Handle_Aspect_Window*) &$self;
	}
};
%extend Aspect_Window {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_Window {
	~Aspect_Window() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_Window\n");}
	}
};

%nodefaultctor Aspect_PolyStyleDefinitionError;
class Aspect_PolyStyleDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_PolyStyleDefinitionError();
		%feature("autodoc", "1");
		Aspect_PolyStyleDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_PolyStyleDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_PolyStyleDefinitionError {
	Handle_Aspect_PolyStyleDefinitionError GetHandle() {
	return *(Handle_Aspect_PolyStyleDefinitionError*) &$self;
	}
};
%extend Aspect_PolyStyleDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_PolyStyleDefinitionError {
	~Aspect_PolyStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_PolyStyleDefinitionError\n");}
	}
};

%nodefaultctor Aspect_FontStyleDefinitionError;
class Aspect_FontStyleDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_FontStyleDefinitionError();
		%feature("autodoc", "1");
		Aspect_FontStyleDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_FontStyleDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_FontStyleDefinitionError {
	Handle_Aspect_FontStyleDefinitionError GetHandle() {
	return *(Handle_Aspect_FontStyleDefinitionError*) &$self;
	}
};
%extend Aspect_FontStyleDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_FontStyleDefinitionError {
	~Aspect_FontStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_FontStyleDefinitionError\n");}
	}
};

%nodefaultctor Aspect_DriverError;
class Aspect_DriverError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_DriverError();
		%feature("autodoc", "1");
		Aspect_DriverError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_DriverError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_DriverError {
	Handle_Aspect_DriverError GetHandle() {
	return *(Handle_Aspect_DriverError*) &$self;
	}
};
%extend Aspect_DriverError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_DriverError {
	~Aspect_DriverError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_DriverError\n");}
	}
};

%nodefaultctor Aspect_SequenceOfFontMapEntry;
class Aspect_SequenceOfFontMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceOfFontMapEntry();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const Aspect_SequenceOfFontMapEntry & Assign(const Aspect_SequenceOfFontMapEntry &Other);
		%feature("autodoc", "1");
		void Append(const Aspect_FontMapEntry &T);
		%feature("autodoc", "1");
		void Append(Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "1");
		void Prepend(const Aspect_FontMapEntry &T);
		%feature("autodoc", "1");
		void Prepend(Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Aspect_FontMapEntry &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Aspect_FontMapEntry &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_FontMapEntry & First() const;
		%feature("autodoc", "1");
		const Aspect_FontMapEntry & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Aspect_SequenceOfFontMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_FontMapEntry & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Aspect_FontMapEntry & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Aspect_FontMapEntry &I);
		%feature("autodoc", "1");
		Aspect_FontMapEntry & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Aspect_FontMapEntry & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend Aspect_SequenceOfFontMapEntry {
	~Aspect_SequenceOfFontMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceOfFontMapEntry\n");}
	}
};

%nodefaultctor Aspect_Array1OfEdge;
class Aspect_Array1OfEdge {
	public:
		%feature("autodoc", "1");
		Aspect_Array1OfEdge(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		Aspect_Array1OfEdge(const Aspect_Edge &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Aspect_Edge &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const Aspect_Array1OfEdge & Assign(const Aspect_Array1OfEdge &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Aspect_Edge &Value);
		%feature("autodoc", "1");
		const Aspect_Edge & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Aspect_Edge & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Aspect_Edge & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Aspect_Edge & operator()(const Standard_Integer Index);

};
%extend Aspect_Array1OfEdge {
	~Aspect_Array1OfEdge() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_Array1OfEdge\n");}
	}
};

%nodefaultctor Aspect_FontStyle;
class Aspect_FontStyle {
	public:
		%feature("autodoc", "1");
		Aspect_FontStyle();
		%feature("autodoc", "1");
		Aspect_FontStyle(const Aspect_TypeOfFont Type, const Quantity_Length Size, const Quantity_PlaneAngle Slant=0.0, const Standard_Boolean CapsHeight=0);
		%feature("autodoc", "1");
		Aspect_FontStyle(const char * Style, const Quantity_Length Size, const Quantity_PlaneAngle Slant=0.0, const Standard_Boolean CapsHeight=0);
		%feature("autodoc", "1");
		Aspect_FontStyle(const char * Style);
		%feature("autodoc", "1");
		Aspect_FontStyle & Assign(const Aspect_FontStyle &Other);
		%feature("autodoc", "1");
		void SetValues(const Aspect_TypeOfFont Type, const Quantity_Length Size, const Quantity_PlaneAngle Slant=0.0, const Standard_Boolean CapsHeight=0);
		%feature("autodoc", "1");
		void SetValues(const char * Style, const Quantity_Length Size, const Quantity_PlaneAngle Slant=0.0, const Standard_Boolean CapsHeight=0);
		%feature("autodoc", "1");
		void SetValues(const char * Style);
		%feature("autodoc", "1");
		void SetFamily(const char * aName);
		%feature("autodoc", "1");
		void SetWeight(const char * aName);
		%feature("autodoc", "1");
		void SetRegistry(const char * aName);
		%feature("autodoc", "1");
		void SetEncoding(const char * aName);
		%feature("autodoc", "1");
		Aspect_TypeOfFont Style() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_CString Value() const;
		%feature("autodoc", "1");
		Quantity_Length Size() const;
		%feature("autodoc", "1");
		Quantity_PlaneAngle Slant() const;
		%feature("autodoc", "1");
		Standard_Boolean CapsHeight() const;
		%feature("autodoc", "1");
		Standard_CString AliasName() const;
		%feature("autodoc", "1");
		Standard_CString FullName() const;
		%feature("autodoc", "1");
		Standard_CString Foundry() const;
		%feature("autodoc", "1");
		Standard_CString Family() const;
		%feature("autodoc", "1");
		Standard_CString Weight() const;
		%feature("autodoc", "1");
		Standard_CString Registry() const;
		%feature("autodoc", "1");
		Standard_CString Encoding() const;
		%feature("autodoc", "1");
		Standard_CString SSlant() const;
		%feature("autodoc", "1");
		Standard_CString SWidth() const;
		%feature("autodoc", "1");
		Standard_CString SStyle() const;
		%feature("autodoc", "1");
		Standard_CString SPixelSize() const;
		%feature("autodoc", "1");
		Standard_CString SPointSize() const;
		%feature("autodoc", "1");
		Standard_CString SResolutionX() const;
		%feature("autodoc", "1");
		Standard_CString SResolutionY() const;
		%feature("autodoc", "1");
		Standard_CString SSpacing() const;
		%feature("autodoc", "1");
		Standard_CString SAverageWidth() const;
		%feature("autodoc", "1");
		void Dump() const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const Aspect_FontStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator==(const Aspect_FontStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean IsNotEqual(const Aspect_FontStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const Aspect_FontStyle &Other) const;

};
%extend Aspect_FontStyle {
	~Aspect_FontStyle() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_FontStyle\n");}
	}
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfColorMapEntry;
class Aspect_SequenceNodeOfSequenceOfColorMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceNodeOfSequenceOfColorMapEntry(const Aspect_ColorMapEntry &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Aspect_ColorMapEntry & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_SequenceNodeOfSequenceOfColorMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry*) &$self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfColorMapEntry {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_SequenceNodeOfSequenceOfColorMapEntry {
	~Aspect_SequenceNodeOfSequenceOfColorMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceNodeOfSequenceOfColorMapEntry\n");}
	}
};

%nodefaultctor Aspect_ColorMapEntry;
class Aspect_ColorMapEntry {
	public:
		%feature("autodoc", "1");
		Aspect_ColorMapEntry();
		%feature("autodoc", "1");
		Aspect_ColorMapEntry(const Standard_Integer index, const Quantity_Color &rgb);
		%feature("autodoc", "1");
		Aspect_ColorMapEntry(const Aspect_ColorMapEntry &entry);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer index, const Quantity_Color &rgb);
		%feature("autodoc", "1");
		void SetValue(const Aspect_ColorMapEntry &entry);
		%feature("autodoc", "1");
		void SetColor(const Quantity_Color &rgb);
		%feature("autodoc", "1");
		const Quantity_Color & Color() const;
		%feature("autodoc", "1");
		void SetIndex(const Standard_Integer index);
		%feature("autodoc", "1");
		Standard_Integer Index() const;
		%feature("autodoc", "1");
		void Free();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		void Dump() const;
		%feature("autodoc", "1");
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntryallocated() const;
		%feature("autodoc", "1");
		void _CSFDB_SetAspect_ColorMapEntryallocated(const Standard_Boolean p);
		%feature("autodoc", "1");
		const Quantity_Color & _CSFDB_GetAspect_ColorMapEntrymycolor() const;
		%feature("autodoc", "1");
		Standard_Integer _CSFDB_GetAspect_ColorMapEntrymyindex() const;
		%feature("autodoc", "1");
		void _CSFDB_SetAspect_ColorMapEntrymyindex(const Standard_Integer p);
		%feature("autodoc", "1");
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntrymyColorIsDef() const;
		%feature("autodoc", "1");
		void _CSFDB_SetAspect_ColorMapEntrymyColorIsDef(const Standard_Boolean p);
		%feature("autodoc", "1");
		Standard_Boolean _CSFDB_GetAspect_ColorMapEntrymyIndexIsDef() const;
		%feature("autodoc", "1");
		void _CSFDB_SetAspect_ColorMapEntrymyIndexIsDef(const Standard_Boolean p);

};
%extend Aspect_ColorMapEntry {
	~Aspect_ColorMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_ColorMapEntry\n");}
	}
};

%nodefaultctor Aspect;
class Aspect {
	public:
		%feature("autodoc", "1");
		Aspect();
		%feature("autodoc", "1");
		char * ValuesOfFOSP(const Aspect_FormatOfSheetPaper aFOSP, Quantity_Length & aWidth, Quantity_Length & aHeight);
		%feature("autodoc", "1");
		char * ToCString(const TCollection_ExtendedString &aString);
		%feature("autodoc", "1");
		Standard_Boolean Inverse(const TColStd_Array2OfReal &aMat, TColStd_Array2OfReal & Inv);

};
%extend Aspect {
	~Aspect() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect\n");}
	}
};

%nodefaultctor Aspect_AspectLine;
class Aspect_AspectLine : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void SetColor(const Quantity_Color &AColor);
		%feature("autodoc", "1");
		void SetType(const Aspect_TypeOfLine AType);
		%feature("autodoc", "1");
		void SetWidth(const Standard_Real AWidth);
		%feature("autodoc", "1");
		void Values(Quantity_Color & AColor, Aspect_TypeOfLine & AType, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_AspectLine {
	Handle_Aspect_AspectLine GetHandle() {
	return *(Handle_Aspect_AspectLine*) &$self;
	}
};
%extend Aspect_AspectLine {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_AspectLine {
	~Aspect_AspectLine() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_AspectLine\n");}
	}
};

%nodefaultctor Aspect_AspectLineDefinitionError;
class Aspect_AspectLineDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_AspectLineDefinitionError();
		%feature("autodoc", "1");
		Aspect_AspectLineDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_AspectLineDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_AspectLineDefinitionError {
	Handle_Aspect_AspectLineDefinitionError GetHandle() {
	return *(Handle_Aspect_AspectLineDefinitionError*) &$self;
	}
};
%extend Aspect_AspectLineDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_AspectLineDefinitionError {
	~Aspect_AspectLineDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_AspectLineDefinitionError\n");}
	}
};

%nodefaultctor Aspect_SequenceOfColorMapEntry;
class Aspect_SequenceOfColorMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceOfColorMapEntry();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const Aspect_SequenceOfColorMapEntry & Assign(const Aspect_SequenceOfColorMapEntry &Other);
		%feature("autodoc", "1");
		void Append(const Aspect_ColorMapEntry &T);
		%feature("autodoc", "1");
		void Append(Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "1");
		void Prepend(const Aspect_ColorMapEntry &T);
		%feature("autodoc", "1");
		void Prepend(Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Aspect_ColorMapEntry &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Aspect_ColorMapEntry &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_ColorMapEntry & First() const;
		%feature("autodoc", "1");
		const Aspect_ColorMapEntry & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Aspect_SequenceOfColorMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_ColorMapEntry & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Aspect_ColorMapEntry & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Aspect_ColorMapEntry &I);
		%feature("autodoc", "1");
		Aspect_ColorMapEntry & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Aspect_ColorMapEntry & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend Aspect_SequenceOfColorMapEntry {
	~Aspect_SequenceOfColorMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceOfColorMapEntry\n");}
	}
};

%nodefaultctor Aspect_CircularGrid;
class Aspect_CircularGrid : public Aspect_Grid {
	public:
		%feature("autodoc", "1");
		Aspect_CircularGrid(const Quantity_Length aRadiusStep, const Standard_Integer aDivisionNumber, const Quantity_Length XOrigin=0, const Quantity_Length anYOrigin=0, const Quantity_PlaneAngle aRotationAngle=0);
		%feature("autodoc", "1");
		void SetRadiusStep(const Quantity_Length aStep);
		%feature("autodoc", "1");
		void SetDivisionNumber(const Standard_Integer aNumber);
		%feature("autodoc", "1");
		void SetGridValues(const Quantity_Length XOrigin, const Quantity_Length YOrigin, const Quantity_Length RadiusStep, const Standard_Integer DivisionNumber, const Quantity_PlaneAngle RotationAngle);
		%feature("autodoc", "1");
		virtual		void Compute(const Quantity_Length X, const Quantity_Length Y, Quantity_Length & gridX, Quantity_Length & gridY) const;
		%feature("autodoc", "1");
		Quantity_Length RadiusStep() const;
		%feature("autodoc", "1");
		Standard_Integer DivisionNumber() const;
		%feature("autodoc", "1");
		virtual		void Init();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_CircularGrid {
	Handle_Aspect_CircularGrid GetHandle() {
	return *(Handle_Aspect_CircularGrid*) &$self;
	}
};
%extend Aspect_CircularGrid {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_CircularGrid {
	~Aspect_CircularGrid() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_CircularGrid\n");}
	}
};

%nodefaultctor Aspect_FontMap;
class Aspect_FontMap : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Aspect_FontMap();
		%feature("autodoc", "1");
		void AddEntry(const Aspect_FontMapEntry &AnEntry);
		%feature("autodoc", "1");
		Standard_Integer AddEntry(const Aspect_FontStyle &aStyle);
		%feature("autodoc", "1");
		Standard_Integer Size() const;
		%feature("autodoc", "1");
		Standard_Integer Index(const Standard_Integer aFontmapIndex) const;
		%feature("autodoc", "1");
		void Dump() const;
		%feature("autodoc", "1");
		Aspect_FontMapEntry Entry(const Standard_Integer AnIndex) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_FontMap {
	Handle_Aspect_FontMap GetHandle() {
	return *(Handle_Aspect_FontMap*) &$self;
	}
};
%extend Aspect_FontMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_FontMap {
	~Aspect_FontMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_FontMap\n");}
	}
};

%nodefaultctor Aspect_LineStyle;
class Aspect_LineStyle {
	public:
		%feature("autodoc", "1");
		Aspect_LineStyle();
		%feature("autodoc", "1");
		Aspect_LineStyle(const Aspect_TypeOfLine Type);
		%feature("autodoc", "1");
		Aspect_LineStyle(const TColQuantity_Array1OfLength &Style);
		%feature("autodoc", "1");
		Aspect_LineStyle & Assign(const Aspect_LineStyle &Other);
		%feature("autodoc", "1");
		void SetValues(const Aspect_TypeOfLine Type);
		%feature("autodoc", "1");
		void SetValues(const TColQuantity_Array1OfLength &Style);
		%feature("autodoc", "1");
		Aspect_TypeOfLine Style() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		const TColQuantity_Array1OfLength & Values() const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const Aspect_LineStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator==(const Aspect_LineStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean IsNotEqual(const Aspect_LineStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const Aspect_LineStyle &Other) const;

};
%extend Aspect_LineStyle {
	~Aspect_LineStyle() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_LineStyle\n");}
	}
};

%nodefaultctor Aspect_TypeMapEntry;
class Aspect_TypeMapEntry {
	public:
		%feature("autodoc", "1");
		Aspect_TypeMapEntry();
		%feature("autodoc", "1");
		Aspect_TypeMapEntry(const Standard_Integer index, const Aspect_LineStyle &style);
		%feature("autodoc", "1");
		Aspect_TypeMapEntry(const Aspect_TypeMapEntry &entry);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer index, const Aspect_LineStyle &style);
		%feature("autodoc", "1");
		void SetValue(const Aspect_TypeMapEntry &entry);
		%feature("autodoc", "1");
		void SetType(const Aspect_LineStyle &Style);
		%feature("autodoc", "1");
		const Aspect_LineStyle & Type() const;
		%feature("autodoc", "1");
		void SetIndex(const Standard_Integer index);
		%feature("autodoc", "1");
		Standard_Integer Index() const;
		%feature("autodoc", "1");
		void Free();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		void Dump() const;

};
%extend Aspect_TypeMapEntry {
	~Aspect_TypeMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_TypeMapEntry\n");}
	}
};

%nodefaultctor Aspect_MarkerStyle;
class Aspect_MarkerStyle {
	public:
		%feature("autodoc", "1");
		Aspect_MarkerStyle();
		%feature("autodoc", "1");
		Aspect_MarkerStyle(const Aspect_TypeOfMarker aType);
		%feature("autodoc", "1");
		Aspect_MarkerStyle(const TColStd_Array1OfReal &aXpoint, const TColStd_Array1OfReal &aYpoint);
		%feature("autodoc", "1");
		Aspect_MarkerStyle(const TColStd_Array1OfReal &aXpoint, const TColStd_Array1OfReal &aYpoint, const TColStd_Array1OfBoolean &aSpoint);
		%feature("autodoc", "1");
		Aspect_MarkerStyle & Assign(const Aspect_MarkerStyle &Other);
		%feature("autodoc", "1");
		Aspect_TypeOfMarker Type() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Boolean Values(const Standard_Integer aRank, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		const TShort_Array1OfShortReal & XValues() const;
		%feature("autodoc", "1");
		const TShort_Array1OfShortReal & YValues() const;
		%feature("autodoc", "1");
		const TColStd_Array1OfBoolean & SValues() const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const Aspect_MarkerStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator==(const Aspect_MarkerStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean IsNotEqual(const Aspect_MarkerStyle &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const Aspect_MarkerStyle &Other) const;

};
%extend Aspect_MarkerStyle {
	~Aspect_MarkerStyle() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_MarkerStyle\n");}
	}
};

%nodefaultctor Aspect_DriverDefinitionError;
class Aspect_DriverDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_DriverDefinitionError();
		%feature("autodoc", "1");
		Aspect_DriverDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_DriverDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_DriverDefinitionError {
	Handle_Aspect_DriverDefinitionError GetHandle() {
	return *(Handle_Aspect_DriverDefinitionError*) &$self;
	}
};
%extend Aspect_DriverDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_DriverDefinitionError {
	~Aspect_DriverDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_DriverDefinitionError\n");}
	}
};

%nodefaultctor Aspect_IdentDefinitionError;
class Aspect_IdentDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_IdentDefinitionError();
		%feature("autodoc", "1");
		Aspect_IdentDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_IdentDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_IdentDefinitionError {
	Handle_Aspect_IdentDefinitionError GetHandle() {
	return *(Handle_Aspect_IdentDefinitionError*) &$self;
	}
};
%extend Aspect_IdentDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_IdentDefinitionError {
	~Aspect_IdentDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_IdentDefinitionError\n");}
	}
};

%nodefaultctor Aspect_SequenceOfMarkMapEntry;
class Aspect_SequenceOfMarkMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceOfMarkMapEntry();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const Aspect_SequenceOfMarkMapEntry & Assign(const Aspect_SequenceOfMarkMapEntry &Other);
		%feature("autodoc", "1");
		void Append(const Aspect_MarkMapEntry &T);
		%feature("autodoc", "1");
		void Append(Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "1");
		void Prepend(const Aspect_MarkMapEntry &T);
		%feature("autodoc", "1");
		void Prepend(Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Aspect_MarkMapEntry &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Aspect_MarkMapEntry &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_MarkMapEntry & First() const;
		%feature("autodoc", "1");
		const Aspect_MarkMapEntry & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Aspect_SequenceOfMarkMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_MarkMapEntry & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Aspect_MarkMapEntry & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Aspect_MarkMapEntry &I);
		%feature("autodoc", "1");
		Aspect_MarkMapEntry & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Aspect_MarkMapEntry & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend Aspect_SequenceOfMarkMapEntry {
	~Aspect_SequenceOfMarkMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceOfMarkMapEntry\n");}
	}
};

%nodefaultctor Aspect_BadAccess;
class Aspect_BadAccess : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Aspect_BadAccess();
		%feature("autodoc", "1");
		Aspect_BadAccess(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_BadAccess NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_BadAccess {
	Handle_Aspect_BadAccess GetHandle() {
	return *(Handle_Aspect_BadAccess*) &$self;
	}
};
%extend Aspect_BadAccess {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_BadAccess {
	~Aspect_BadAccess() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_BadAccess\n");}
	}
};

%nodefaultctor Aspect_WindowDriver;
class Aspect_WindowDriver : public Aspect_Driver {
	public:
		%feature("autodoc", "1");
		virtual		void BeginDraw(const Standard_Boolean DoubleBuffer=1, const Standard_Integer aRetainBuffer=0);
		%feature("autodoc", "1");
		virtual		Aspect_TypeOfResize ResizeSpace();
		%feature("autodoc", "1");
		Handle_Aspect_Window Window() const;
		%feature("autodoc", "1");
		virtual		void SetDrawMode(const Aspect_TypeOfDrawMode aMode);
		%feature("autodoc", "1");
		virtual		Standard_Boolean OpenBuffer(const Standard_Integer aRetainBuffer, const Standard_ShortReal aPivotX=0.0, const Standard_ShortReal aPivotY=0.0, const Standard_Integer aWidthIndex=0, const Standard_Integer aColorIndex=0, const Standard_Integer aFontIndex=0, const Aspect_TypeOfDrawMode aDrawMode=Aspect_TODM_REPLACE);
		%feature("autodoc", "1");
		virtual		void CloseBuffer(const Standard_Integer aRetainBuffer) const;
		%feature("autodoc", "1");
		virtual		void ClearBuffer(const Standard_Integer aRetainBuffer) const;
		%feature("autodoc", "1");
		virtual		void DrawBuffer(const Standard_Integer aRetainBuffer) const;
		%feature("autodoc", "1");
		virtual		void EraseBuffer(const Standard_Integer aRetainBuffer) const;
		%feature("autodoc", "1");
		virtual		void MoveBuffer(const Standard_Integer aRetainBuffer, const Standard_ShortReal aPivotX=0.0, const Standard_ShortReal aPivotY=0.0) const;
		%feature("autodoc", "1");
		virtual		void ScaleBuffer(const Standard_Integer aRetainBuffer, const Quantity_Factor aScaleX=1.0e+0, const Quantity_Factor aScaleY=1.0e+0) const;
		%feature("autodoc", "1");
		virtual		void RotateBuffer(const Standard_Integer aRetainBuffer, const Quantity_PlaneAngle anAngle=0.0) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean BufferIsOpen(const Standard_Integer aRetainBuffer) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean BufferIsEmpty(const Standard_Integer aRetainBuffer) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean BufferIsDrawn(const Standard_Integer aRetainBuffer) const;
		%feature("autodoc", "1");
		virtual		void AngleOfBuffer(const Standard_Integer aRetainBuffer, Quantity_PlaneAngle & anAngle) const;
		%feature("autodoc", "1");
		virtual		void ScaleOfBuffer(const Standard_Integer aRetainBuffer, Quantity_Factor & aScaleX, Quantity_Factor & aScaleY) const;
		%feature("autodoc", "1");
		virtual		void PositionOfBuffer(const Standard_Integer aRetainBuffer, Standard_ShortReal & aPivotX, Standard_ShortReal & aPivotY) const;
		%feature("autodoc", "1");
		virtual		void TextSize(const TCollection_ExtendedString &aText, Standard_ShortReal & aWidth, Standard_ShortReal & aHeight, const Standard_Integer aFontIndex=-0x000000001) const;
		%feature("autodoc", "1");
		virtual		void TextSize(const TCollection_ExtendedString &aText, Standard_ShortReal & aWidth, Standard_ShortReal & aHeight, Standard_ShortReal & anXoffset, Standard_ShortReal & anYoffset, const Standard_Integer aFontIndex=-0x000000001) const;
		%feature("autodoc", "1");
		virtual		char * FontSize(Quantity_PlaneAngle & aSlant, Standard_ShortReal & aSize, Standard_ShortReal & aBheight, const Standard_Integer aFontIndex=-0x000000001) const;
		%feature("autodoc", "1");
		virtual		void ColorBoundIndexs(Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer LocalColorIndex(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		virtual		void FontBoundIndexs(Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer LocalFontIndex(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		virtual		void TypeBoundIndexs(Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer LocalTypeIndex(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		virtual		void WidthBoundIndexs(Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer LocalWidthIndex(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		virtual		void MarkBoundIndexs(Standard_Integer &OutValue, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer LocalMarkIndex(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_WindowDriver {
	Handle_Aspect_WindowDriver GetHandle() {
	return *(Handle_Aspect_WindowDriver*) &$self;
	}
};
%extend Aspect_WindowDriver {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_WindowDriver {
	~Aspect_WindowDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_WindowDriver\n");}
	}
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfWidthMapEntry;
class Aspect_SequenceNodeOfSequenceOfWidthMapEntry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceNodeOfSequenceOfWidthMapEntry(const Aspect_WidthMapEntry &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Aspect_WidthMapEntry & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
	Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry*) &$self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_SequenceNodeOfSequenceOfWidthMapEntry {
	~Aspect_SequenceNodeOfSequenceOfWidthMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceNodeOfSequenceOfWidthMapEntry\n");}
	}
};

%nodefaultctor Aspect_SequenceOfWidthMapEntry;
class Aspect_SequenceOfWidthMapEntry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceOfWidthMapEntry();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const Aspect_SequenceOfWidthMapEntry & Assign(const Aspect_SequenceOfWidthMapEntry &Other);
		%feature("autodoc", "1");
		void Append(const Aspect_WidthMapEntry &T);
		%feature("autodoc", "1");
		void Append(Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "1");
		void Prepend(const Aspect_WidthMapEntry &T);
		%feature("autodoc", "1");
		void Prepend(Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Aspect_WidthMapEntry &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Aspect_WidthMapEntry &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_WidthMapEntry & First() const;
		%feature("autodoc", "1");
		const Aspect_WidthMapEntry & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Aspect_SequenceOfWidthMapEntry & S);
		%feature("autodoc", "1");
		const Aspect_WidthMapEntry & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Aspect_WidthMapEntry & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Aspect_WidthMapEntry &I);
		%feature("autodoc", "1");
		Aspect_WidthMapEntry & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Aspect_WidthMapEntry & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend Aspect_SequenceOfWidthMapEntry {
	~Aspect_SequenceOfWidthMapEntry() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceOfWidthMapEntry\n");}
	}
};

%nodefaultctor Aspect_PixmapDefinitionError;
class Aspect_PixmapDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_PixmapDefinitionError();
		%feature("autodoc", "1");
		Aspect_PixmapDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_PixmapDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_PixmapDefinitionError {
	Handle_Aspect_PixmapDefinitionError GetHandle() {
	return *(Handle_Aspect_PixmapDefinitionError*) &$self;
	}
};
%extend Aspect_PixmapDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_PixmapDefinitionError {
	~Aspect_PixmapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_PixmapDefinitionError\n");}
	}
};

%nodefaultctor Aspect_GraphicDriver;
class Aspect_GraphicDriver : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_GraphicDriver {
	Handle_Aspect_GraphicDriver GetHandle() {
	return *(Handle_Aspect_GraphicDriver*) &$self;
	}
};
%extend Aspect_GraphicDriver {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_GraphicDriver {
	~Aspect_GraphicDriver() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_GraphicDriver\n");}
	}
};

%nodefaultctor Aspect_WidthMapDefinitionError;
class Aspect_WidthMapDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_WidthMapDefinitionError();
		%feature("autodoc", "1");
		Aspect_WidthMapDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_WidthMapDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_WidthMapDefinitionError {
	Handle_Aspect_WidthMapDefinitionError GetHandle() {
	return *(Handle_Aspect_WidthMapDefinitionError*) &$self;
	}
};
%extend Aspect_WidthMapDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_WidthMapDefinitionError {
	~Aspect_WidthMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_WidthMapDefinitionError\n");}
	}
};

%nodefaultctor Aspect_ColorScale;
class Aspect_ColorScale : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Standard_Boolean FindColor(const Standard_Real Value, Quantity_Color & Color) const;
		%feature("autodoc", "1");
		Standard_Boolean FindColor(const Standard_Real Value, const Standard_Real Min, const Standard_Real Max, const Standard_Integer ColorsCount, Quantity_Color & Color);
		%feature("autodoc", "1");
		Standard_Real GetMin() const;
		%feature("autodoc", "1");
		Standard_Real GetMax() const;
		%feature("autodoc", "1");
		void GetRange(Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		Aspect_TypeOfColorScaleData GetLabelType() const;
		%feature("autodoc", "1");
		Aspect_TypeOfColorScaleData GetColorType() const;
		%feature("autodoc", "1");
		Standard_Integer GetNumberOfIntervals() const;
		%feature("autodoc", "1");
		TCollection_ExtendedString GetTitle() const;
		%feature("autodoc", "1");
		TCollection_AsciiString GetFormat() const;
		%feature("autodoc", "1");
		TCollection_ExtendedString GetLabel(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Quantity_Color GetColor(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		void GetLabels(TColStd_SequenceOfExtendedString & aLabels) const;
		%feature("autodoc", "1");
		void GetColors(Aspect_SequenceOfColor & aColors) const;
		%feature("autodoc", "1");
		Aspect_TypeOfColorScalePosition GetLabelPosition() const;
		%feature("autodoc", "1");
		Aspect_TypeOfColorScalePosition GetTitlePosition() const;
		%feature("autodoc", "1");
		Standard_Boolean IsReversed() const;
		%feature("autodoc", "1");
		Standard_Boolean IsLabelAtBorder() const;
		%feature("autodoc", "1");
		void SetMin(const Standard_Real aMin);
		%feature("autodoc", "1");
		void SetMax(const Standard_Real aMax);
		%feature("autodoc", "1");
		void SetRange(const Standard_Real aMin, const Standard_Real aMax);
		%feature("autodoc", "1");
		void SetLabelType(const Aspect_TypeOfColorScaleData aType);
		%feature("autodoc", "1");
		void SetColorType(const Aspect_TypeOfColorScaleData aType);
		%feature("autodoc", "1");
		void SetNumberOfIntervals(const Standard_Integer aNum);
		%feature("autodoc", "1");
		void SetTitle(const TCollection_ExtendedString &aTitle);
		%feature("autodoc", "1");
		void SetFormat(const TCollection_AsciiString &aFormat);
		%feature("autodoc", "1");
		void SetLabel(const TCollection_ExtendedString &aLabel, const Standard_Integer anIndex=-0x000000001);
		%feature("autodoc", "1");
		void SetColor(const Quantity_Color &aColor, const Standard_Integer anIndex=-0x000000001);
		%feature("autodoc", "1");
		void SetLabels(const TColStd_SequenceOfExtendedString &aSeq);
		%feature("autodoc", "1");
		void SetColors(const Handle_Aspect_ColorMap &aMap);
		%feature("autodoc", "1");
		void SetColors(const Aspect_SequenceOfColor &aSeq);
		%feature("autodoc", "1");
		void SetLabelPosition(const Aspect_TypeOfColorScalePosition aPos);
		%feature("autodoc", "1");
		void SetTitlePosition(const Aspect_TypeOfColorScalePosition aPos);
		%feature("autodoc", "1");
		void SetReversed(const Standard_Boolean aReverse);
		%feature("autodoc", "1");
		void SetLabelAtBorder(const Standard_Boolean anOn);
		%feature("autodoc", "1");
		void GetSize(Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		Standard_Real GetWidth() const;
		%feature("autodoc", "1");
		Standard_Real GetHeight() const;
		%feature("autodoc", "1");
		void SetSize(const Standard_Real aWidth, const Standard_Real aHeight);
		%feature("autodoc", "1");
		void SetWidth(const Standard_Real aWidth);
		%feature("autodoc", "1");
		void SetHeight(const Standard_Real aHeight);
		%feature("autodoc", "1");
		void GetPosition(Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		Standard_Real GetXPosition() const;
		%feature("autodoc", "1");
		Standard_Real GetYPosition() const;
		%feature("autodoc", "1");
		void SetPosition(const Standard_Real aX, const Standard_Real aY);
		%feature("autodoc", "1");
		void SetXPosition(const Standard_Real aX);
		%feature("autodoc", "1");
		void SetYPosition(const Standard_Real aY);
		%feature("autodoc", "1");
		Standard_Integer GetTextHeight() const;
		%feature("autodoc", "1");
		void SetTextHeight(const Standard_Integer aHeigh);
		%feature("autodoc", "1");
		virtual		void PaintRect(const Standard_Integer X, const Standard_Integer Y, const Standard_Integer W, const Standard_Integer H, const Quantity_Color &aColor, const Standard_Boolean aFilled=0);
		%feature("autodoc", "1");
		virtual		void PaintText(const TCollection_ExtendedString &aText, const Standard_Integer X, const Standard_Integer Y, const Quantity_Color &aColor);
		%feature("autodoc", "1");
		virtual		Standard_Integer TextWidth(const TCollection_ExtendedString &aText) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer TextHeight(const TCollection_ExtendedString &aText) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_ColorScale {
	Handle_Aspect_ColorScale GetHandle() {
	return *(Handle_Aspect_ColorScale*) &$self;
	}
};
%extend Aspect_ColorScale {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_ColorScale {
	~Aspect_ColorScale() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_ColorScale\n");}
	}
};

%nodefaultctor Aspect_GraphicDevice;
class Aspect_GraphicDevice : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		Handle_Aspect_GraphicDriver GraphicDriver() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_GraphicDevice {
	Handle_Aspect_GraphicDevice GetHandle() {
	return *(Handle_Aspect_GraphicDevice*) &$self;
	}
};
%extend Aspect_GraphicDevice {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_GraphicDevice {
	~Aspect_GraphicDevice() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_GraphicDevice\n");}
	}
};

%nodefaultctor Aspect_FontMapDefinitionError;
class Aspect_FontMapDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_FontMapDefinitionError();
		%feature("autodoc", "1");
		Aspect_FontMapDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_FontMapDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_FontMapDefinitionError {
	Handle_Aspect_FontMapDefinitionError GetHandle() {
	return *(Handle_Aspect_FontMapDefinitionError*) &$self;
	}
};
%extend Aspect_FontMapDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_FontMapDefinitionError {
	~Aspect_FontMapDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_FontMapDefinitionError\n");}
	}
};

%nodefaultctor Aspect_SequenceNodeOfSequenceOfColor;
class Aspect_SequenceNodeOfSequenceOfColor : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Aspect_SequenceNodeOfSequenceOfColor(const Quantity_Color &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Quantity_Color & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_SequenceNodeOfSequenceOfColor {
	Handle_Aspect_SequenceNodeOfSequenceOfColor GetHandle() {
	return *(Handle_Aspect_SequenceNodeOfSequenceOfColor*) &$self;
	}
};
%extend Aspect_SequenceNodeOfSequenceOfColor {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_SequenceNodeOfSequenceOfColor {
	~Aspect_SequenceNodeOfSequenceOfColor() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_SequenceNodeOfSequenceOfColor\n");}
	}
};

%nodefaultctor Aspect_LineStyleDefinitionError;
class Aspect_LineStyleDefinitionError : public Standard_OutOfRange {
	public:
		%feature("autodoc", "1");
		Aspect_LineStyleDefinitionError();
		%feature("autodoc", "1");
		Aspect_LineStyleDefinitionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Aspect_LineStyleDefinitionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Aspect_LineStyleDefinitionError {
	Handle_Aspect_LineStyleDefinitionError GetHandle() {
	return *(Handle_Aspect_LineStyleDefinitionError*) &$self;
	}
};
%extend Aspect_LineStyleDefinitionError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Aspect_LineStyleDefinitionError {
	~Aspect_LineStyleDefinitionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_LineStyleDefinitionError\n");}
	}
};

%nodefaultctor Aspect_Background;
class Aspect_Background {
	public:
		%feature("autodoc", "1");
		Aspect_Background();
		%feature("autodoc", "1");
		Aspect_Background(const Quantity_Color &AColor);
		%feature("autodoc", "1");
		void SetColor(const Quantity_Color &AColor);
		%feature("autodoc", "1");
		Quantity_Color Color() const;

};
%extend Aspect_Background {
	~Aspect_Background() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Aspect_Background\n");}
	}
};