# README 

`morphotype_classification_data.csv` contains 6 columns and 422 rows (421 data rows + 1 header row).

Read below for a description of the contents of `morphotype_classification_data.csv`:

## Rows
Each row corresponds to one instance of a bird flying through the tunnel from the interior aviary, as observed by the experimenter and recorded with 2 video cameras (ZCAM E2).\
Only the instances which were included in the subsequent analysis (in `..\analysis\`) are included in this file. 

## Columns:

1. **Filename** (*text*): Name of the image file of the frame obtained from a recording of Camera 2 (placed below the tunnel) associated to a given flight which was analysed to assess the morphotype of the bird.
   
2. **Datetime** (*numerical*): the date and time of recording for each flight in the format `YYYYMMDDHHMMSS`

3. **Session** (*numerical*): number associated to the video camera's metadata and file naming (automatically incremented by the camera for each new recording).

4. **Minute** (*numerical*): time (in minutes passed since the start of recording) when a bird was observed crossing the tunnel by the experimenter. 

5. **Category** (*categorical*): Category corresponding to the brightness condition as seen by looking through the tunnel, with letters as names so that the research technician who conducted the morphotype classification was blind to the conditions.
Can take four values:
- `A` for "Bright to the left": A blackout curtain is placed on the right, while the left side is bright.
- `B` for "Bright to the right": A blackout curtain is placed on the left, while the right side is bright.
- `C` for "Bright": There is no blackout curtain on either side. Both sides are bright.
- `D` for "Dark": A blackout curtain is placed on the right and on the left. Both sides are dark.

6. **Morph** (*categorical*): Category indicating the bird's morphotype as assessed using the video frames. Can take 20 values: `1`, `...`,`19` for the 1st to 19th identified morphotypes, or `undetermined` for instances when the morphotype could not be visually determined.

