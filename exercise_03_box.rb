# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

# Set a Point3d as origin of the box
#Geom::Point3d(x,y,z) is used to create a Point3d object, and assigned to origin
origin=Geom::Point3d.new(100.mm,100.mm,100.mm)

# Set a=100.mm as a value to define the dimension of the box
a=100.mm
width=a
length=a*5
height=a*3

# create points for each points where the origin at the center of the box
pt1=Geom::Point3d.new(origin.x-width/2,origin.y-length/2,origin.z-height/2) # create points for each points
pt2=Geom::Point3d.new(origin.x+width/2,origin.y-length/2,origin.z-height/2)
pt3=Geom::Point3d.new(origin.x+width/2,origin.y+length/2,origin.z-height/2)
pt4=Geom::Point3d.new(origin.x-width/2,origin.y+length/2,origin.z-height/2)

group=ent.add_group # create sketchup group in "ent"
group_ent=group.entities # accessing "entities" in "group"

face=group_ent.add_face(pt1,pt2,pt3,pt4)

if face.normal.z<0
 face.reverse!
end

face.pushpull(height) # load the rb file in Sketchup Ruby Console
