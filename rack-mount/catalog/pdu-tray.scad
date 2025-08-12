include <../common.scad>
use <../rackEars.scad>

wallThickness = 3;
brickSize = [78, 83, 34];
powerPlugHeight = 15;
powerPlugWidth = 30;    
    
module bottomScrewTray() {
  u=3;
  trayWidth=205;
  trayDepth=brickSize[1] + 2 * wallThickness;
  trayThickness=wallThickness;
  frontThickness=wallThickness;
  sideThickness=wallThickness;
  frontLipHeight=5;
  backLipHeight=10;
  trayLeftPadding=0;
  sideSupport = true;

  lipThickness = sideThickness;

  screwDx = rackMountScrewWidth; // x dist between the mount holes
  screwDz = uDiff * u;

  plateLength = screwDx + 2 * rackMountScrewXDist;
  plateHeight = screwDz + 2 * rackMountScrewZDist;

  minScrewToTraySpacing = railScrewHoleToInnerEdge;

  leftScrewDistToTray = minScrewToTraySpacing + trayLeftPadding;

  leftScrewGlobalX = -leftScrewDistToTray;
  rightScrewGlobalX = screwDx + leftScrewGlobalX;

  // check (tray width)+(configured extra space) fits within the rack
  assert(trayWidth <= screwDx - (2 * minScrewToTraySpacing + trayLeftPadding));

  // base
  cube(size=[trayWidth, trayDepth, trayThickness]);

  // front lip
  translate(v=[0, 0, trayThickness])
    cube(size=[trayWidth, lipThickness, frontLipHeight]);

  // back lip
  translate(v=[0, trayDepth - lipThickness, trayThickness])
    cube(size=[trayWidth, lipThickness, backLipHeight]);

  translate(v=[leftScrewGlobalX, 0, rackMountScrewZDist])
    rackEarModule(
      frontThickness=frontThickness, sideThickness=sideThickness, frontWidth=leftScrewDistToTray + rackMountScrewXDist + sideThickness, sideDepth=trayDepth - lipThickness, u=u, backPlaneHeight=trayThickness + backLipHeight, support=sideSupport
    );

  translate(v=[rightScrewGlobalX, 0, rackMountScrewZDist])
    mirror(v=[1, 0, 0])
      rackEarModule(
        frontThickness=frontThickness, sideThickness=sideThickness, frontWidth=rightScrewGlobalX - trayWidth + rackMountScrewXDist + sideThickness, sideDepth=trayDepth - lipThickness, u=u, backPlaneHeight=trayThickness + backLipHeight, support=sideSupport
      );
}

module powerBrick() {
    size = brickSize;    
    frontPadding = 4;
    
    difference() {
        cube(size = [size[0] + 2 * wallThickness, size[1] + 2 * wallThickness, size[2]]);
        
        translate([wallThickness, wallThickness, 0])
        cube(size = size);
        
        translate([wallThickness + size[0] / 2 - powerPlugWidth / 2, wallThickness + size[1], size[2] / 2 - powerPlugHeight / 2])
        cube(size = [powerPlugWidth, wallThickness, powerPlugHeight]);
        
        translate([frontPadding + wallThickness, 0, frontPadding])
        cube(size = [size[0] - 2 * frontPadding, size[1] - 2 * frontPadding, size[2] - 2 * frontPadding]);
    }
}

module perforations() {
    // Bottom perforations for airflow
    // Front Right Cube
    translate(v=[60, 40, -50])
        rotate(a=[90,0,0])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);
        
    // Front Center Cube
    translate(v=[80, 35, -50])
        rotate(a=[90,0,45])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);

    // Front Left Cube
    translate(v=[95, 40, -50])
        rotate(a=[90,0,0])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);
        
    // Center Right Cube
    translate(v=[50.5, 65, -50])
        rotate(a=[90,0,45])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);
        
    // Center Left Cube
    translate(v=[110, 65, -50])
        rotate(a=[90,0,45])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);
            
    // Rear Left Cube
    translate(v=[60, 75, -50])
        rotate(a=[90,0,0])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);
        
    // Rear Center Cube
    translate(v=[80, 92, -50])
        rotate(a=[90,0,45])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);

    // Rear Right Cube
    translate(v=[96, 75, -50])
        rotate(a=[90,0,0])
        rotate(a=[0,90,90])
        cube(size=[12,12,135]);
}

translate([0, 0, wallThickness])
powerBrick();

difference() {
    bottomScrewTray();
    
    //translate([wallThickness + brickSize[0] / 2 - powerPlugWidth / 2, wallThickness + brickSize[1] + 30, 0])
    //cube([powerPlugWidth, powerPlugHeight, wallThickness]);
    
    // Zip tie
    translate([wallThickness + 5, wallThickness + 10, 0])
    cube(size = [10, 3, wallThickness]);
    
    translate([wallThickness + 5, wallThickness + 23, 0])
    cube(size = [10, 3, wallThickness]);
    
    translate([wallThickness + 5, wallThickness + 10, wallThickness - 1])
    cube(size = [10, 16, 1]);
    
    translate([-20, -19, 0])
    perforations();
    
    translate([80, -19, 0])
    perforations();
    
    translate([96, 14, 0])
    cube(size=[12,12,135]);
    
    translate([96, 63, 0])
    cube(size=[12,12,135]);
}
