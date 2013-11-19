
/**
 * Based on the unfoldingmaps example 
 * SimpleMarkrApp
 * and
 * gpx_processing
 * https://github.com/FH-Potsdam/gpx_processing
 *
 */


import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.interactions.*;
import TUIO.*;

//de.fhpotsdam.unfolding.Map map;
UnfoldingMap map;
TuioCursorHandler tuioCursorHandler;


Location locationBerlin = new Location(52.5f, 13.4f);
//ArrayList <Location> allTrkpt;
//XMLElement xml; // declare the xml element
GPXReader reader;
ArrayList <String> gpxfiles;


public void setup() {
//  allTrkpt = build_locations_list();
  size(1280, 720, GLConstants.GLGRAPHICS);
    gpxfiles = new ArrayList<String>(); // Make new arraylist

  /**
   * Add all the filenames located in the data folder.
   */
  gpxfiles.add("Nush.gpx");
  gpxfiles.add("20131013-18_04_14.gpx");
  gpxfiles.add("20131013-18_18_29.gpx");
  gpxfiles.add("GPXMaster_01.gpx");
  gpxfiles.add("RK_03.gpx");
  gpxfiles.add("RK_04.gpx");
  gpxfiles.add("Running.gpx");
  reader = new GPXReader(this, gpxfiles );
  noStroke();

  map = new de.fhpotsdam.unfolding.Map(this);
  
  tuioCursorHandler = new TuioCursorHandler(this, map);
  EventDispatcher eventDispatcher = new EventDispatcher();
  eventDispatcher.addBroadcaster(tuioCursorHandler);
  eventDispatcher.register(map, "pan");
  eventDispatcher.register(map, "zoom");
    
    
  map.setTweening(true);
  map.zoomToLevel(2);
  map.panTo(locationBerlin);
  MapUtils.createDefaultEventDispatcher(this, map);
}

public void draw() {
  background(0);
  map.draw();
   tuioCursorHandler.drawCursors();
  // Draws locations on screen positions according to their geo-locations.

  // Fixed-size marker
//  ScreenPosition posBerlin = map.getScreenPosition(locationBerlin);
//  float s = map.getZoom();
//  ellipse(posBerlin.x, posBerlin.y, s, s);
    noFill();
  beginShape();
  strokeWeight(1);
  stroke(255,0,0);
  reader.display();
//  for(int i = 0; i < allTrkpt.size();i++){
//    Location trkpt = allTrkpt.get(i);
//    ScreenPosition pos = map.getScreenPosition(trkpt);
//    vertex(pos.x,pos.y);
//  }
//  endShape();

}


//ArrayList <Location> build_locations_list(){
//
//  ArrayList <Location> locations = new ArrayList<Location>();
//  xml = new XMLElement(this, "20131013-18_18_29.gpx"); // this is the file
//  XMLElement trk = xml.getChild("trk"); // this is a track
//  XMLElement trkseg = trk.getChild("trkseg"); // this is a segemt of a track
//    for (int i = 0; i < trkseg.getChildCount(); i++) {
//    XMLElement child = trkseg.getChild(i);// get every child of trkseg
//    String name = child.getName();
//    if (name.equals("trkpt")) {
//      float lat = child.getFloat("lat");  // xml attribute lat
//      float lon = child.getFloat("lon"); // // xml attribute lon
//      locations.add(new Location(lat, lon));
//    }else{
//      /**
//       * this is just for debugging
//       */
//    }
//  }
//  return locations;
//}
