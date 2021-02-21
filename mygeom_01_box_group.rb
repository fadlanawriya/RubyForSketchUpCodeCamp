# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

width=100.mm # initiating width variable
length=200.mm # initiating length variable
height=300.mm # initiating height variable

pt1=Geom::Point3d.new(0,0,0) # create points for each points
pt2=Geom::Point3d.new(width,0,0)
pt3=Geom::Point3d.new(width,length,0)
pt4=Geom::Point3d.new(0,length,0)

group=ent.add_group # create Sketchup Group in "ent"
group_ent=group.entities # accessing "entities" in "group"
face=group_ent.add_face(pt1,pt2,pt3,pt4) # create a face in "group_ent" then assigned to "face" variable

if face.normal.z<0
 face.reverse!
end

face.pushpull(height) # basically, this will create a group rather than seperate faces
