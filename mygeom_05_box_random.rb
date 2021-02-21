# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

for i in 0..9
  origin=Geom::Point3d.new(i*200.mm,100.mm,100.mm)
  # Set a=100.mm as a value to define the dimension of the box
  a=100.mm
  width=a
  length=a*5
  random_int=rand(1..10) #create random interger number from 1..10
  height=a*random_int # put random number as height multiplier

  pt1=Geom::Point3d.new(origin.x,origin.y,origin.z) # create points for each points
  pt2=Geom::Point3d.new(origin.x+width,origin.y,origin.z)
  pt3=Geom::Point3d.new(origin.x+width,origin.y+length,origin.z)
  pt4=Geom::Point3d.new(origin.x,origin.y+length,origin.z)

  group=ent.add_group # create sketchup group in "ent"
  group_ent=group.entities # accessing "entities" in "group"

  face=group_ent.add_face(pt1,pt2,pt3,pt4)

  if face.normal.z<0
   face.reverse!
  end
  face.pushpull(height) # load the rb file in Sketchup Ruby Console
end
