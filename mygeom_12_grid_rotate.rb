# open sketchup active_model
mod=Sketchup.active_model

# access the entities in mod
ent=mod.entities

for j in 0..9
  for i in 0..9
    # Set a=100.mm as a value to define the dimension of the box
    a=100.mm
    width=a*0.2
    length=a*5
    height=a*3

    # Make the origin z set according to height and counter i
    # Set the origin z to correspond with j in x axis
    origin=Geom::Point3d.new(j*a*3,0,i*height)

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

    # Create rotation transformation
    axis=Geom::Vector3d.new(0,0,1) # on z axis
    point=origin # Set it the same as origin points
    angle=Math::PI*0.5*((i*j)/81.0) # Incrementally according to i*j
    tr=Geom::Transformation.rotation(point,axis,angle) # Create rotation
    group.transform!(tr) # Apply rotation
  end
end
