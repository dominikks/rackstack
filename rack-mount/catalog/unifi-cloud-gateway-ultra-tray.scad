use <../tray/tray.scad>

/*
  Parametric rack-mount tray:
  Dimensions can be adjusted using the variables below. You can also add mounting holes to fasten things that have
  screw holes at the bottom.

  !!! Please also make sure that the correct rack frame preset is set in rackFrame.scad !!!
*/

module traySystem (

// begin config 8////////////////////////////////////////////////////////////////////////////////////////////////////////

trayU = 2,

// these dimensions are the total base width including padding not usable space. 
// e.g. 145 baseWidth and 3 sideThickness = 145-(3*2) = 139mm useable space.
baseWidth = 151,
baseDepth = 139,

baseThickness = 3, // tray bottom thickness
frontThickness = 3, // front plate thickness
sideThickness = 3,

backLipHeight = 6,
frontLipHeight = 2,

sideSupport = true,
trayLeftPadding = 10, // extra space between the left rail and tray. configure this to move the tray left/right.

mountPointType = "screwpost",
mountPointElevation = 10, // basically standoff height

// add/config standoff coordinates here. Format is [[x,y]]
mountPoints = []

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
