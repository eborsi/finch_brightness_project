# README 

`morphotype_classification_data.csv` contains 6 columns and 422 rows (421 data rows + 1 header row).

Read below for a description of the contents of `morphotype_classification_data.csv`:

## Rows
Each row corresponds to one instance of a bird flying through the tunnel from the interior aviary, as observed by the experimenter and recorded with 2 video cameras (ZCAM E2).\
Only the instances which were included in the subsequent analysis (in `..\analysis\`) are included in this file. 

## Columns:

1. **Filename** (*text*): Name of the image file of the frame obtained from a recording of Camera 2 (placed below the tunnel) associated to a given flight which was analysed to assess the morphotype of the bird.
   
3. **Datetime** (*numerical*): the date and time of recording for each flight in the format `YYYYMMDDHHMMSS`

4. **Session** (*numerical*): recording number within the reel (automatically incremented by the camera for each new recording).

5. **Minute** (*numerical*): time (in minutes passed since the start of recording) when a bird was observed crossing the tunnel by the experimenter. 

6. **Treatment** (*categorical*): Category corresponding to the brightness condition as seen by looking through the tunnel, named as "A", "B", "C", and "D" so that the research technician who conducted the morphotype classification was blind to the conditions.
Can take four values:
- `A` for "Bright to the left": A blackout curtain is placed on the right, while the left side is bright.
- `B` for "Bright to the right": A blackout curtain is placed on the left, while the right side is bright.
- `C` for "Bright": There is no blackout curtain on either side. Both sides are bright.
- `D` for "Dark": A blackout curtain is placed on the right and on the left. Both sides are dark.

