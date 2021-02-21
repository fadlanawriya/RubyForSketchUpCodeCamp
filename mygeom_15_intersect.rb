# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

# This is a basic code to make a simple box
# Set a=100.mm as a value to define the dimension of the box
a=100.mm
width=a
length=a
height=a

x=0.mm # Define the x position
y=0.mm # Define the y position
z=0.mm # Define the z position

origin=Geom::Point3d.new(x,y,z) # Create point for origin

# Define points for a rectangle in respect to origin point
pt1=Geom::Point3d.new(origin.x,origin.y,origin.z)
pt2=Geom::Point3d.new(origin.x+width,origin.y,origin.z)
pt3=Geom::Point3d.new(origin.x+width,origin.y+length,origin.z)
pt4=Geom::Point3d.new(origin.x,origin.y+length,origin.z)

# Create a group_box group_ent
box_group=ent.add_group
# Create a rectangular face
face=box_group.entities.add_face(pt1,pt2,pt3,pt4)
if face.normal.z<0
 face.reverse!
end
face.pushpull(height) # load the rb file in Sketchup Ruby Console

# Make a copy of box and move it
box_copy=box_group.copy
u=width*rand(-0.8..0.8)
v=length*rand(-0.8..0.8)
w=height*rand(-0.8..0.8)
move_vector=Geom::Vector3d.new(u,v,w)
tr=Geom::Transformation.translation(move_vector)
box_copy.transform!(tr)

# Union box_group with box_copy
intersect_result=box_copy.intersect(box_group)
