# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

# Define the module dimension
width=100.mm
length=100.mm
height=100.mm

x=0.mm
y=0.mm
z=0.mm

origin=Geom::Point3d.new(x,y,z)

# Define point for a rectanglein respect to origin point
pt1=Geom::Point3d.new(origin.x,origin.y,origin.z) # create points for each points
pt2=Geom::Point3d.new(origin.x+width,origin.y,origin.z)
pt3=Geom::Point3d.new(origin.x+width,origin.y+length,origin.z)
pt4=Geom::Point3d.new(origin.x,origin.y+length,origin.z)

# Create a definition box_group
box_group=ent.add_group
# Create rengtangular face
face=box_group.entities.add_face(pt1,pt2,pt3,pt4)
if face.normal.z<0
 face.reverse!
end
# Pushpull the face to create the box
face.pushpull(height)


for i in 0..15
  a=25.mm
  width=a*rand(1..4)
  length=a*rand(1..4)
  height=a*rand(1..4)

  x=a*rand(-4..4)
  y=a*rand(-4..4)
  z=a*rand(0..4)

  origin=Geom::Point3d.new(x,y,z)

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
  box_group=group.subtract(box_group)
  if !box_group.manifold?
    break
  end
end
