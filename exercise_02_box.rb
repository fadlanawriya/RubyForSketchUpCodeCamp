# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

# Set a=100.mm as a value to define the dimension of the box
a=100.mm
b=30.mm
width=b*10
length=a*5
height=a*3

pt1=Geom::Point3d.new(0,0,0) # create points for each points
pt2=Geom::Point3d.new(width,0,0)
pt3=Geom::Point3d.new(width,length,0)
pt4=Geom::Point3d.new(0,length,0)

group=ent.add_group # create sketchup group in "ent"
group_ent=group.entities # accessing "entities" in "group"

face=group_ent.add_face(pt1,pt2,pt3,pt4)

if face.normal.z<0
 face.reverse!
end

face.pushpull(height) # load the rb file in Sketchup Ruby Console
