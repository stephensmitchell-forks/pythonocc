/*

Copyright 2008-2011 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

$Revision$
$Date$
$Author$
$HeaderURL$

*/
%{
#include <Aspect_Array1OfEdge.hxx>
#include <Aspect_AspectFillArea.hxx>
#include <Aspect_AspectFillAreaDefinitionError.hxx>
#include <Aspect_AspectLine.hxx>
#include <Aspect_AspectLineDefinitionError.hxx>
#include <Aspect_AspectMarker.hxx>
#include <Aspect_AspectMarkerDefinitionError.hxx>
#include <Aspect_Background.hxx>
#include <Aspect_BadAccess.hxx>
#include <Aspect_CLayer2d.hxx>
#include <Aspect_CardinalPoints.hxx>
#include <Aspect_CircularGrid.hxx>
#include <Aspect_ColorCubeColorMap.hxx>
#include <Aspect_ColorMap.hxx>
#include <Aspect_ColorMapDefinitionError.hxx>
#include <Aspect_ColorMapEntry.hxx>
#include <Aspect_ColorPixel.hxx>
#include <Aspect_ColorRampColorMap.hxx>
#include <Aspect_ColorScale.hxx>
#include <Aspect_Display.hxx>
#include <Aspect_Drawable.hxx>
#include <Aspect_Driver.hxx>
#include <Aspect_DriverDefinitionError.hxx>
#include <Aspect_DriverError.hxx>
#include <Aspect_DriverPtr.hxx>
#include <Aspect_Edge.hxx>
#include <Aspect_EdgeDefinitionError.hxx>
#include <Aspect_FStream.hxx>
#include <Aspect_FillMethod.hxx>
#include <Aspect_FontMap.hxx>
#include <Aspect_FontMapDefinitionError.hxx>
#include <Aspect_FontMapEntry.hxx>
#include <Aspect_FontStyle.hxx>
#include <Aspect_FontStyleDefinitionError.hxx>
#include <Aspect_FormatOfSheetPaper.hxx>
#include <Aspect_GenId.hxx>
#include <Aspect_GenericColorMap.hxx>
#include <Aspect_GraphicCallbackProc.hxx>
#include <Aspect_GraphicDevice.hxx>
#include <Aspect_GraphicDeviceDefinitionError.hxx>
#include <Aspect_GraphicDriver.hxx>
#include <Aspect_Grid.hxx>
#include <Aspect_GridDrawMode.hxx>
#include <Aspect_GridType.hxx>
#include <Aspect_Handle.hxx>
#include <Aspect_HatchStyle.hxx>
#include <Aspect_IFStream.hxx>
#include <Aspect_IdentDefinitionError.hxx>
#include <Aspect_IndexPixel.hxx>
#include <Aspect_InteriorStyle.hxx>
#include <Aspect_LineStyle.hxx>
#include <Aspect_LineStyleDefinitionError.hxx>
#include <Aspect_LineWidthDefinitionError.hxx>
#include <Aspect_ListingType.hxx>
#include <Aspect_MarkMap.hxx>
#include <Aspect_MarkMapDefinitionError.hxx>
#include <Aspect_MarkMapEntry.hxx>
#include <Aspect_MarkerStyle.hxx>
#include <Aspect_MarkerStyleDefinitionError.hxx>
#include <Aspect_PixMap.hxx>
#include <Aspect_Pixel.hxx>
#include <Aspect_PixmapDefinitionError.hxx>
#include <Aspect_PixmapError.hxx>
#include <Aspect_PlotMode.hxx>
#include <Aspect_PlotterOrigin.hxx>
#include <Aspect_PolyStyleDefinitionError.hxx>
#include <Aspect_PolygonOffsetMode.hxx>
#include <Aspect_RGBPixel.hxx>
#include <Aspect_RectangularGrid.hxx>
#include <Aspect_RenderingContext.hxx>
#include <Aspect_SequenceNodeOfSequenceOfColor.hxx>
#include <Aspect_SequenceNodeOfSequenceOfColorMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfFontMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfMarkMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfTypeMapEntry.hxx>
#include <Aspect_SequenceNodeOfSequenceOfWidthMapEntry.hxx>
#include <Aspect_SequenceOfColor.hxx>
#include <Aspect_SequenceOfColorMapEntry.hxx>
#include <Aspect_SequenceOfFontMapEntry.hxx>
#include <Aspect_SequenceOfMarkMapEntry.hxx>
#include <Aspect_SequenceOfTypeMapEntry.hxx>
#include <Aspect_SequenceOfWidthMapEntry.hxx>
#include <Aspect_TypeMap.hxx>
#include <Aspect_TypeMapDefinitionError.hxx>
#include <Aspect_TypeMapEntry.hxx>
#include <Aspect_TypeOfColorMap.hxx>
#include <Aspect_TypeOfColorScaleData.hxx>
#include <Aspect_TypeOfColorScaleOrientation.hxx>
#include <Aspect_TypeOfColorScalePosition.hxx>
#include <Aspect_TypeOfColorSpace.hxx>
#include <Aspect_TypeOfConstraint.hxx>
#include <Aspect_TypeOfDeflection.hxx>
#include <Aspect_TypeOfDegenerateModel.hxx>
#include <Aspect_TypeOfDisplayText.hxx>
#include <Aspect_TypeOfDrawMode.hxx>
#include <Aspect_TypeOfEdge.hxx>
#include <Aspect_TypeOfFacingModel.hxx>
#include <Aspect_TypeOfFont.hxx>
#include <Aspect_TypeOfHighlightMethod.hxx>
#include <Aspect_TypeOfLayer.hxx>
#include <Aspect_TypeOfLine.hxx>
#include <Aspect_TypeOfMarker.hxx>
#include <Aspect_TypeOfPrimitive.hxx>
#include <Aspect_TypeOfRenderingMode.hxx>
#include <Aspect_TypeOfResize.hxx>
#include <Aspect_TypeOfStyleText.hxx>
#include <Aspect_TypeOfText.hxx>
#include <Aspect_TypeOfTriedronEcho.hxx>
#include <Aspect_TypeOfTriedronPosition.hxx>
#include <Aspect_TypeOfUpdate.hxx>
#include <Aspect_UndefinedMap.hxx>
#include <Aspect_Units.hxx>
#include <Aspect_WidthMap.hxx>
#include <Aspect_WidthMapDefinitionError.hxx>
#include <Aspect_WidthMapEntry.hxx>
#include <Aspect_WidthOfLine.hxx>
#include <Aspect_Window.hxx>
#include <Aspect_WindowDefinitionError.hxx>
#include <Aspect_WindowDriver.hxx>
#include <Aspect_WindowDriverPtr.hxx>
#include <Aspect_WindowError.hxx>
#include <Aspect_XWD.hxx>
#include <Graphic3d_Array1OfBytes.hxx>
#include <Graphic3d_Array1OfVector.hxx>
#include <Graphic3d_Array1OfVertex.hxx>
#include <Graphic3d_Array1OfVertexC.hxx>
#include <Graphic3d_Array1OfVertexN.hxx>
#include <Graphic3d_Array1OfVertexNC.hxx>
#include <Graphic3d_Array1OfVertexNT.hxx>
#include <Graphic3d_Array2OfVertex.hxx>
#include <Graphic3d_Array2OfVertexC.hxx>
#include <Graphic3d_Array2OfVertexN.hxx>
#include <Graphic3d_Array2OfVertexNC.hxx>
#include <Graphic3d_Array2OfVertexNT.hxx>
#include <Graphic3d_ArrayOfPoints.hxx>
#include <Graphic3d_ArrayOfPolygons.hxx>
#include <Graphic3d_ArrayOfPolylines.hxx>
#include <Graphic3d_ArrayOfPrimitives.hxx>
#include <Graphic3d_ArrayOfQuadrangleStrips.hxx>
#include <Graphic3d_ArrayOfQuadrangles.hxx>
#include <Graphic3d_ArrayOfSegments.hxx>
#include <Graphic3d_ArrayOfTriangleFans.hxx>
#include <Graphic3d_ArrayOfTriangleStrips.hxx>
#include <Graphic3d_ArrayOfTriangles.hxx>
#include <Graphic3d_AspectFillArea3d.hxx>
#include <Graphic3d_AspectLine3d.hxx>
#include <Graphic3d_AspectMarker3d.hxx>
#include <Graphic3d_AspectText3d.hxx>
#include <Graphic3d_AspectTextDefinitionError.hxx>
#include <Graphic3d_CBitFields16.hxx>
#include <Graphic3d_CBitFields20.hxx>
#include <Graphic3d_CBitFields4.hxx>
#include <Graphic3d_CBitFields8.hxx>
#include <Graphic3d_CBounds.hxx>
#include <Graphic3d_CGroup.hxx>
#include <Graphic3d_CInitTexture.hxx>
#include <Graphic3d_CLight.hxx>
#include <Graphic3d_CPick.hxx>
#include <Graphic3d_CPlane.hxx>
#include <Graphic3d_CStructure.hxx>
#include <Graphic3d_CTexture.hxx>
#include <Graphic3d_CTransPersStruct.hxx>
#include <Graphic3d_CUserDraw.hxx>
#include <Graphic3d_CView.hxx>
#include <Graphic3d_CycleError.hxx>
#include <Graphic3d_DataStructureManager.hxx>
#include <Graphic3d_ExportFormat.hxx>
#include <Graphic3d_GraphicDevice.hxx>
#include <Graphic3d_GraphicDriver.hxx>
#include <Graphic3d_Group.hxx>
#include <Graphic3d_GroupDefinitionError.hxx>
#include <Graphic3d_HArray1OfBytes.hxx>
#include <Graphic3d_HSequenceOfGroup.hxx>
#include <Graphic3d_HSequenceOfStructure.hxx>
#include <Graphic3d_HSetOfGroup.hxx>
#include <Graphic3d_HorizontalTextAlignment.hxx>
#include <Graphic3d_InitialisationError.hxx>
#include <Graphic3d_ListIteratorOfListOfPArray.hxx>
#include <Graphic3d_ListIteratorOfListOfShortReal.hxx>
#include <Graphic3d_ListIteratorOfSetListOfSetOfGroup.hxx>
#include <Graphic3d_ListNodeOfListOfPArray.hxx>
#include <Graphic3d_ListNodeOfListOfShortReal.hxx>
#include <Graphic3d_ListNodeOfSetListOfSetOfGroup.hxx>
#include <Graphic3d_ListOfPArray.hxx>
#include <Graphic3d_ListOfShortReal.hxx>
#include <Graphic3d_MapIteratorOfMapOfStructure.hxx>
#include <Graphic3d_MapOfStructure.hxx>
#include <Graphic3d_MaterialAspect.hxx>
#include <Graphic3d_MaterialDefinitionError.hxx>
#include <Graphic3d_NameOfFont.hxx>
#include <Graphic3d_NameOfMaterial.hxx>
#include <Graphic3d_NameOfTexture1D.hxx>
#include <Graphic3d_NameOfTexture2D.hxx>
#include <Graphic3d_NameOfTextureEnv.hxx>
#include <Graphic3d_NameOfTexturePlane.hxx>
#include <Graphic3d_PickIdDefinitionError.hxx>
#include <Graphic3d_Plotter.hxx>
#include <Graphic3d_PlotterDefinitionError.hxx>
#include <Graphic3d_PrimitiveArray.hxx>
#include <Graphic3d_PriorityDefinitionError.hxx>
#include <Graphic3d_SequenceNodeOfSequenceOfAddress.hxx>
#include <Graphic3d_SequenceNodeOfSequenceOfGroup.hxx>
#include <Graphic3d_SequenceNodeOfSequenceOfStructure.hxx>
#include <Graphic3d_SequenceOfAddress.hxx>
#include <Graphic3d_SequenceOfGroup.hxx>
#include <Graphic3d_SequenceOfStructure.hxx>
#include <Graphic3d_SetIteratorOfSetOfGroup.hxx>
#include <Graphic3d_SetListOfSetOfGroup.hxx>
#include <Graphic3d_SetOfGroup.hxx>
#include <Graphic3d_SortType.hxx>
#include <Graphic3d_StdMapNodeOfMapOfStructure.hxx>
#include <Graphic3d_Strips.hxx>
#include <Graphic3d_StructPtr.hxx>
#include <Graphic3d_Structure.hxx>
#include <Graphic3d_StructureDefinitionError.hxx>
#include <Graphic3d_StructureManager.hxx>
#include <Graphic3d_TextPath.hxx>
#include <Graphic3d_Texture1D.hxx>
#include <Graphic3d_Texture1Dmanual.hxx>
#include <Graphic3d_Texture1Dsegment.hxx>
#include <Graphic3d_Texture2D.hxx>
#include <Graphic3d_Texture2Dmanual.hxx>
#include <Graphic3d_Texture2Dplane.hxx>
#include <Graphic3d_TextureEnv.hxx>
#include <Graphic3d_TextureMap.hxx>
#include <Graphic3d_TextureRoot.hxx>
#include <Graphic3d_TransModeFlags.hxx>
#include <Graphic3d_TransformError.hxx>
#include <Graphic3d_TypeOfComposition.hxx>
#include <Graphic3d_TypeOfConnection.hxx>
#include <Graphic3d_TypeOfMaterial.hxx>
#include <Graphic3d_TypeOfPolygon.hxx>
#include <Graphic3d_TypeOfPrimitive.hxx>
#include <Graphic3d_TypeOfPrimitiveArray.hxx>
#include <Graphic3d_TypeOfReflection.hxx>
#include <Graphic3d_TypeOfStructure.hxx>
#include <Graphic3d_TypeOfTexture.hxx>
#include <Graphic3d_TypeOfTextureMode.hxx>
#include <Graphic3d_Vector.hxx>
#include <Graphic3d_VectorError.hxx>
#include <Graphic3d_Vertex.hxx>
#include <Graphic3d_VertexC.hxx>
#include <Graphic3d_VertexN.hxx>
#include <Graphic3d_VertexNC.hxx>
#include <Graphic3d_VertexNT.hxx>
#include <Graphic3d_VerticalTextAlignment.hxx>
#include <Handle_Aspect_AspectFillArea.hxx>
#include <Handle_Aspect_AspectFillAreaDefinitionError.hxx>
#include <Handle_Aspect_AspectLine.hxx>
#include <Handle_Aspect_AspectLineDefinitionError.hxx>
#include <Handle_Aspect_AspectMarker.hxx>
#include <Handle_Aspect_AspectMarkerDefinitionError.hxx>
#include <Handle_Aspect_BadAccess.hxx>
#include <Handle_Aspect_CircularGrid.hxx>
#include <Handle_Aspect_ColorCubeColorMap.hxx>
#include <Handle_Aspect_ColorMap.hxx>
#include <Handle_Aspect_ColorMapDefinitionError.hxx>
#include <Handle_Aspect_ColorRampColorMap.hxx>
#include <Handle_Aspect_ColorScale.hxx>
#include <Handle_Aspect_Driver.hxx>
#include <Handle_Aspect_DriverDefinitionError.hxx>
#include <Handle_Aspect_DriverError.hxx>
#include <Handle_Aspect_EdgeDefinitionError.hxx>
#include <Handle_Aspect_FontMap.hxx>
#include <Handle_Aspect_FontMapDefinitionError.hxx>
#include <Handle_Aspect_FontStyleDefinitionError.hxx>
#include <Handle_Aspect_GenericColorMap.hxx>
#include <Handle_Aspect_GraphicDevice.hxx>
#include <Handle_Aspect_GraphicDeviceDefinitionError.hxx>
#include <Handle_Aspect_GraphicDriver.hxx>
#include <Handle_Aspect_Grid.hxx>
#include <Handle_Aspect_IdentDefinitionError.hxx>
#include <Handle_Aspect_LineStyleDefinitionError.hxx>
#include <Handle_Aspect_LineWidthDefinitionError.hxx>
#include <Handle_Aspect_MarkMap.hxx>
#include <Handle_Aspect_MarkMapDefinitionError.hxx>
#include <Handle_Aspect_MarkerStyleDefinitionError.hxx>
#include <Handle_Aspect_PixMap.hxx>
#include <Handle_Aspect_PixmapDefinitionError.hxx>
#include <Handle_Aspect_PixmapError.hxx>
#include <Handle_Aspect_PolyStyleDefinitionError.hxx>
#include <Handle_Aspect_RectangularGrid.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfColor.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfColorMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfFontMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfMarkMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfTypeMapEntry.hxx>
#include <Handle_Aspect_SequenceNodeOfSequenceOfWidthMapEntry.hxx>
#include <Handle_Aspect_TypeMap.hxx>
#include <Handle_Aspect_TypeMapDefinitionError.hxx>
#include <Handle_Aspect_UndefinedMap.hxx>
#include <Handle_Aspect_WidthMap.hxx>
#include <Handle_Aspect_WidthMapDefinitionError.hxx>
#include <Handle_Aspect_Window.hxx>
#include <Handle_Aspect_WindowDefinitionError.hxx>
#include <Handle_Aspect_WindowDriver.hxx>
#include <Handle_Aspect_WindowError.hxx>
#include <Handle_Graphic3d_ArrayOfPoints.hxx>
#include <Handle_Graphic3d_ArrayOfPolygons.hxx>
#include <Handle_Graphic3d_ArrayOfPolylines.hxx>
#include <Handle_Graphic3d_ArrayOfPrimitives.hxx>
#include <Handle_Graphic3d_ArrayOfQuadrangleStrips.hxx>
#include <Handle_Graphic3d_ArrayOfQuadrangles.hxx>
#include <Handle_Graphic3d_ArrayOfSegments.hxx>
#include <Handle_Graphic3d_ArrayOfTriangleFans.hxx>
#include <Handle_Graphic3d_ArrayOfTriangleStrips.hxx>
#include <Handle_Graphic3d_ArrayOfTriangles.hxx>
#include <Handle_Graphic3d_AspectFillArea3d.hxx>
#include <Handle_Graphic3d_AspectLine3d.hxx>
#include <Handle_Graphic3d_AspectMarker3d.hxx>
#include <Handle_Graphic3d_AspectText3d.hxx>
#include <Handle_Graphic3d_AspectTextDefinitionError.hxx>
#include <Handle_Graphic3d_CycleError.hxx>
#include <Handle_Graphic3d_DataStructureManager.hxx>
#include <Handle_Graphic3d_GraphicDevice.hxx>
#include <Handle_Graphic3d_GraphicDriver.hxx>
#include <Handle_Graphic3d_Group.hxx>
#include <Handle_Graphic3d_GroupDefinitionError.hxx>
#include <Handle_Graphic3d_HArray1OfBytes.hxx>
#include <Handle_Graphic3d_HSequenceOfGroup.hxx>
#include <Handle_Graphic3d_HSequenceOfStructure.hxx>
#include <Handle_Graphic3d_HSetOfGroup.hxx>
#include <Handle_Graphic3d_InitialisationError.hxx>
#include <Handle_Graphic3d_ListNodeOfListOfPArray.hxx>
#include <Handle_Graphic3d_ListNodeOfListOfShortReal.hxx>
#include <Handle_Graphic3d_ListNodeOfSetListOfSetOfGroup.hxx>
#include <Handle_Graphic3d_MaterialDefinitionError.hxx>
#include <Handle_Graphic3d_PickIdDefinitionError.hxx>
#include <Handle_Graphic3d_Plotter.hxx>
#include <Handle_Graphic3d_PlotterDefinitionError.hxx>
#include <Handle_Graphic3d_PriorityDefinitionError.hxx>
#include <Handle_Graphic3d_SequenceNodeOfSequenceOfAddress.hxx>
#include <Handle_Graphic3d_SequenceNodeOfSequenceOfGroup.hxx>
#include <Handle_Graphic3d_SequenceNodeOfSequenceOfStructure.hxx>
#include <Handle_Graphic3d_StdMapNodeOfMapOfStructure.hxx>
#include <Handle_Graphic3d_Structure.hxx>
#include <Handle_Graphic3d_StructureDefinitionError.hxx>
#include <Handle_Graphic3d_StructureManager.hxx>
#include <Handle_Graphic3d_Texture1D.hxx>
#include <Handle_Graphic3d_Texture1Dmanual.hxx>
#include <Handle_Graphic3d_Texture1Dsegment.hxx>
#include <Handle_Graphic3d_Texture2D.hxx>
#include <Handle_Graphic3d_Texture2Dmanual.hxx>
#include <Handle_Graphic3d_Texture2Dplane.hxx>
#include <Handle_Graphic3d_TextureEnv.hxx>
#include <Handle_Graphic3d_TextureMap.hxx>
#include <Handle_Graphic3d_TextureRoot.hxx>
#include <Handle_Graphic3d_TransformError.hxx>
#include <Handle_Graphic3d_VectorError.hxx>
#include <Handle_MMgt_TShared.hxx>
#include <Handle_Quantity_ColorDefinitionError.hxx>
#include <Handle_Quantity_DateDefinitionError.hxx>
#include <Handle_Quantity_HArray1OfColor.hxx>
#include <Handle_Quantity_PeriodDefinitionError.hxx>
#include <Handle_Standard_AbortiveTransaction.hxx>
#include <Handle_Standard_ConstructionError.hxx>
#include <Handle_Standard_DimensionError.hxx>
#include <Handle_Standard_DimensionMismatch.hxx>
#include <Handle_Standard_DivideByZero.hxx>
#include <Handle_Standard_DomainError.hxx>
#include <Handle_Standard_Failure.hxx>
#include <Handle_Standard_ImmutableObject.hxx>
#include <Handle_Standard_LicenseError.hxx>
#include <Handle_Standard_LicenseNotFound.hxx>
#include <Handle_Standard_MultiplyDefined.hxx>
#include <Handle_Standard_NegativeValue.hxx>
#include <Handle_Standard_NoMoreObject.hxx>
#include <Handle_Standard_NoSuchObject.hxx>
#include <Handle_Standard_NotImplemented.hxx>
#include <Handle_Standard_NullObject.hxx>
#include <Handle_Standard_NullValue.hxx>
#include <Handle_Standard_NumericError.hxx>
#include <Handle_Standard_OutOfMemory.hxx>
#include <Handle_Standard_OutOfRange.hxx>
#include <Handle_Standard_Overflow.hxx>
#include <Handle_Standard_Persistent.hxx>
#include <Handle_Standard_ProgramError.hxx>
#include <Handle_Standard_RangeError.hxx>
#include <Handle_Standard_TooManyUsers.hxx>
#include <Handle_Standard_Transient.hxx>
#include <Handle_Standard_Type.hxx>
#include <Handle_Standard_TypeMismatch.hxx>
#include <Handle_Standard_Underflow.hxx>
#include <Handle_TCollection_AVLBaseNode.hxx>
#include <Handle_TCollection_HAsciiString.hxx>
#include <Handle_TCollection_HExtendedString.hxx>
#include <Handle_TCollection_MapNode.hxx>
#include <Handle_TCollection_SeqNode.hxx>
#include <MMgt_StackManager.hxx>
#include <MMgt_TShared.hxx>
#include <Quantity_AbsorbedDose.hxx>
#include <Quantity_Acceleration.hxx>
#include <Quantity_AcousticIntensity.hxx>
#include <Quantity_Activity.hxx>
#include <Quantity_Admittance.hxx>
#include <Quantity_AmountOfSubstance.hxx>
#include <Quantity_AngularVelocity.hxx>
#include <Quantity_Area.hxx>
#include <Quantity_Array1OfCoefficient.hxx>
#include <Quantity_Array1OfColor.hxx>
#include <Quantity_Array2OfColor.hxx>
#include <Quantity_Capacitance.hxx>
#include <Quantity_Coefficient.hxx>
#include <Quantity_CoefficientOfExpansion.hxx>
#include <Quantity_Color.hxx>
#include <Quantity_ColorDefinitionError.hxx>
#include <Quantity_Color_1.hxx>
#include <Quantity_Concentration.hxx>
#include <Quantity_Conductivity.hxx>
#include <Quantity_Constant.hxx>
#include <Quantity_Consumption.hxx>
#include <Quantity_Content.hxx>
#include <Quantity_Convert.hxx>
#include <Quantity_Date.hxx>
#include <Quantity_DateDefinitionError.hxx>
#include <Quantity_Density.hxx>
#include <Quantity_DoseEquivalent.hxx>
#include <Quantity_ElectricCapacitance.hxx>
#include <Quantity_ElectricCharge.hxx>
#include <Quantity_ElectricCurrent.hxx>
#include <Quantity_ElectricFieldStrength.hxx>
#include <Quantity_ElectricPotential.hxx>
#include <Quantity_Energy.hxx>
#include <Quantity_Enthalpy.hxx>
#include <Quantity_Entropy.hxx>
#include <Quantity_Factor.hxx>
#include <Quantity_Force.hxx>
#include <Quantity_Frequency.hxx>
#include <Quantity_HArray1OfColor.hxx>
#include <Quantity_Illuminance.hxx>
#include <Quantity_Impedance.hxx>
#include <Quantity_Index.hxx>
#include <Quantity_Inductance.hxx>
#include <Quantity_KinematicViscosity.hxx>
#include <Quantity_KineticMoment.hxx>
#include <Quantity_Length.hxx>
#include <Quantity_Luminance.hxx>
#include <Quantity_LuminousEfficacity.hxx>
#include <Quantity_LuminousExposition.hxx>
#include <Quantity_LuminousFlux.hxx>
#include <Quantity_LuminousIntensity.hxx>
#include <Quantity_MagneticFieldStrength.hxx>
#include <Quantity_MagneticFlux.hxx>
#include <Quantity_MagneticFluxDensity.hxx>
#include <Quantity_Mass.hxx>
#include <Quantity_MassFlow.hxx>
#include <Quantity_MolarConcentration.hxx>
#include <Quantity_MolarMass.hxx>
#include <Quantity_MolarVolume.hxx>
#include <Quantity_Molarity.hxx>
#include <Quantity_MomentOfAForce.hxx>
#include <Quantity_MomentOfInertia.hxx>
#include <Quantity_Momentum.hxx>
#include <Quantity_NameOfColor.hxx>
#include <Quantity_Normality.hxx>
#include <Quantity_Parameter.hxx>
#include <Quantity_Period.hxx>
#include <Quantity_PeriodDefinitionError.hxx>
#include <Quantity_PhysicalQuantity.hxx>
#include <Quantity_PlaneAngle.hxx>
#include <Quantity_Power.hxx>
#include <Quantity_Pressure.hxx>
#include <Quantity_Quotient.hxx>
#include <Quantity_Rate.hxx>
#include <Quantity_Ratio.hxx>
#include <Quantity_Reluctance.hxx>
#include <Quantity_Resistance.hxx>
#include <Quantity_Resistivity.hxx>
#include <Quantity_Scalaire.hxx>
#include <Quantity_SolidAngle.hxx>
#include <Quantity_SoundIntensity.hxx>
#include <Quantity_SpecificHeatCapacity.hxx>
#include <Quantity_Speed.hxx>
#include <Quantity_SurfaceTension.hxx>
#include <Quantity_Temperature.hxx>
#include <Quantity_ThermalConductivity.hxx>
#include <Quantity_Torque.hxx>
#include <Quantity_TypeOfColor.hxx>
#include <Quantity_Velocity.hxx>
#include <Quantity_Viscosity.hxx>
#include <Quantity_Volume.hxx>
#include <Quantity_VolumeFlow.hxx>
#include <Quantity_Weight.hxx>
#include <Quantity_Work.hxx>
#include <Standard_AbortiveTransaction.hxx>
#include <Standard_Address.hxx>
#include <Standard_AncestorIterator.hxx>
#include <Standard_Boolean.hxx>
#include <Standard_Byte.hxx>
#include <Standard_CString.hxx>
#include <Standard_Character.hxx>
#include <Standard_ConstructionError.hxx>
#include <Standard_DefineHandle.hxx>
#include <Standard_DimensionError.hxx>
#include <Standard_DimensionMismatch.hxx>
#include <Standard_DivideByZero.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_ErrorHandler.hxx>
#include <Standard_ErrorHandlerCallback.hxx>
#include <Standard_ExtCharacter.hxx>
#include <Standard_ExtString.hxx>
#include <Standard_Failure.hxx>
#include <Standard_GUID.hxx>
#include <Standard_HandlerStatus.hxx>
#include <Standard_IStream.hxx>
#include <Standard_ImmutableObject.hxx>
#include <Standard_Integer.hxx>
#include <Standard_InternalType.hxx>
#include <Standard_JmpBuf.hxx>
#include <Standard_KindOfType.hxx>
#include <Standard_LicenseError.hxx>
#include <Standard_LicenseNotFound.hxx>
#include <Standard_MMgrOpt.hxx>
#include <Standard_MMgrRaw.hxx>
#include <Standard_MMgrRoot.hxx>
#include <Standard_Macro.hxx>
#include <Standard_MultiplyDefined.hxx>
#include <Standard_Mutex.hxx>
#include <Standard_NegativeValue.hxx>
#include <Standard_NoMoreObject.hxx>
#include <Standard_NoSuchObject.hxx>
#include <Standard_NotImplemented.hxx>
#include <Standard_NullObject.hxx>
#include <Standard_NullValue.hxx>
#include <Standard_NumericError.hxx>
#include <Standard_OId.hxx>
#include <Standard_OStream.hxx>
#include <Standard_OutOfMemory.hxx>
#include <Standard_OutOfRange.hxx>
#include <Standard_Overflow.hxx>
#include <Standard_PCharacter.hxx>
#include <Standard_PErrorHandler.hxx>
#include <Standard_PExtCharacter.hxx>
#include <Standard_Persistent.hxx>
#include <Standard_Persistent_proto.hxx>
#include <Standard_PrimitiveTypes.hxx>
#include <Standard_ProgramError.hxx>
#include <Standard_RangeError.hxx>
#include <Standard_Real.hxx>
#include <Standard_SStream.hxx>
#include <Standard_ShortReal.hxx>
#include <Standard_Size.hxx>
#include <Standard_Static.hxx>
#include <Standard_Storable.hxx>
#include <Standard_Stream.hxx>
#include <Standard_String.hxx>
#include <Standard_ThreadId.hxx>
#include <Standard_TooManyUsers.hxx>
#include <Standard_Transient.hxx>
#include <Standard_Type.hxx>
#include <Standard_TypeDef.hxx>
#include <Standard_TypeMismatch.hxx>
#include <Standard_UUID.hxx>
#include <Standard_Underflow.hxx>
#include <Standard_Version.hxx>
#include <Standard_WayOfLife.hxx>
#include <Standard_ctype.hxx>
#include <Standard_math.hxx>
%};

%import TCollection.i
%import Standard.i
%import MMgt.i
%import Graphic3d.i
%import Aspect.i
%import Quantity.i
