# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

for i in 0..10
  # Set a=100.mm as a value to define the dimension of the box
  a=100.mm

  # Set random rectangular base
  random_int=rand(0.5..2.0) # create random float number from 0.5..1.5
  width=a*random_int
  length=a*random_int

  wl_size=(width*length)
  triple_a=(a*a*a)
  height=triple_a/wl_size # set the volume of the box constant

  # create random (x,y) position
  random_x=(rand(1..10)*10*a).mm
  random_y=(rand(1..10)*10*a).mm
  origin=Geom::Point3d.new(random_x,random_y,0)

  # create points for each points where the origin at the center of the box
  pt1=Geom::Point3d.new(origin.x-width/2,origin.y-length/2,origin.z) # create points for each points
  pt2=Geom::Point3d.new(origin.x+width/2,origin.y-length/2,origin.z)
  pt3=Geom::Point3d.new(origin.x+width/2,origin.y+length/2,origin.z)
  pt4=Geom::Point3d.new(origin.x-width/2,origin.y+length/2,origin.z)

  group=ent.add_group # create sketchup group in "ent"
  group_ent=group.entities # accessing "entities" in "group"

  face=group_ent.add_face(pt1,pt2,pt3,pt4)

  if face.normal.z<0 #this code is used to flip the face if not upward
   face.reverse!
  end

  face.pushpull(height) # load the rb file in Sketchup Ruby Console
end
