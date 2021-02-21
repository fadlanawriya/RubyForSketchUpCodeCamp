# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

# Set a Point3d as origin of the box
#Geom::Point3d(x,y,z) is used to create a Point3d object, and assigned to origin
origin=Geom::Point3d.new(0.mm,0.mm,0.mm)

# Set a=100.mm as a value to define the dimension of the box
a=100.mm
width=a
length=a*5
height=a*3

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

group_copy=group.copy # copy the group to group_copy
axis=Geom::Vector3d.new(0,0,1) # set z axis for rotation axis
angle=0.25*Math::PI # set the angle as 1/4 PI rad or 45 degree

# note that ruby work in radians instead of degree
# One radian is the angle made at the center of a circle by an arc whose length is equal to the radius of the circle.
rotation_point=origin # set origin above as rotation point
tr=Geom::Transformation.rotation(rotation_point,axis,angle) # The rotation method is used to create a transformation that does rotation about an axis.
group_copy.transform!(tr) # apply the translation to the object

scaling_point=origin
tr_scale=Geom::Transformation.scaling(scaling_point,1.25) # Set scale transformation
group_copy.transform!(tr_scale) # Apply the scaling to the object
