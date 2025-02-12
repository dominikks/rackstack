use <../tray/tray.scad>

/*
  Parametric rack-mount tray:
  Dimensions can be adjusted using the variables below. You can also add mounting holes to fasten things that have
  screw holes at the bottom.

  !!! Please also make sure that the correct rack frame preset is set in rackFrame.scad !!!
*/

/*
  Measurements of the Vigor 165:
  Width: 180
  Depth: 125
  Screwhold depth: 14
  Screw offset side: 20
  Screw offset front/back: 30
*/

module traySystem (

// begin config 8////////////////////////////////////////////////////////////////////////////////////////////////////////

trayU = 2,

// these dimensions are the total base width including padding not usable space. 
// e.g. 145 baseWidth and 3 sideThickness = 145-(3*2) = 139mm useable space.
baseWidth = 190,
baseDepth = 130,

baseThickness = 3, // tray bottom thickness
frontThickness = 3, // front plate thickness
sideThickness = 3,

backLipHeight = 8,
frontLipHeight = 2,

sideSupport = true,
trayLeftPadding = 10, // extra space between the left rail and tray. configure this to move the tray left/right.

mountPointType = "screwpost",
mountPointElevation = 11, // basically standoff height

// add/config standoff coordinates here. Format is [[x,y]]
mountPoints = [
    [22  ,98],
    [162 ,98],
]

// end config //////////////////////////////////////////////////////////////////////////////////////////////////////////

) {

  bottomScrewTray (
    u = trayU,
    trayWidth = baseWidth,
    trayDepth = baseDepth,
    trayThickness = baseThickness,
    frontLipHeight = frontLipHeight,
    backLipHeight = backLipHeight,
    mountPoints = mountPoints,
    frontThickness = frontThickness,
    sideThickness = sideThickness,
    mountPointElevation = mountPointElevation,
    mountPointType = mountPointType,
    sideSupport = sideSupport,
    trayLeftPadding = trayLeftPadding
  );
}

traySystem();
