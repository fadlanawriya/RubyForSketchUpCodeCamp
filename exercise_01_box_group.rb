# In this example, I'm going to show you how to create a single group for both boxes where the box are not being grouped individually

# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

width_box1=100.mm
length_box1=200.mm
height_box1=300.mm

width_box2=300.mm
length_box2=400.mm
height_box2=100.mm

pt1_box1=Geom::Point3d.new(0,0,0)
pt2_box1=Geom::Point3d.new(width_box1,0,0)
pt3_box1=Geom::Point3d.new(width_box1,length_box1,0)
pt4_box1=Geom::Point3d.new(0,length_box1,0)

pt1_box2=Geom::Point3d.new(100,0,100)
pt2_box2=Geom::Point3d.new(width_box2,0,100)
pt3_box2=Geom::Point3d.new(width_box2,length_box2,100)
pt4_box2=Geom::Point3d.new(100,length_box2,100)

group=ent.add_group # create sketchup group in "ent"
group_ent=group.entities # accessing "entities" in "group"

face_box1=group_ent.add_face(pt1_box1,pt2_box1,pt3_box1,pt4_box1)
face_box2=group_ent.add_face(pt1_box2,pt2_box2,pt3_box2,pt4_box2)

if face_box1.normal.z<0
 face_box1.reverse!
end

if face_box2.normal.z<0
 face_box2.reverse!
end

face_box1.pushpull(height_box1)
face_box2.pushpull(height_box2) # the result will be the 2 box will be join in 1 group
