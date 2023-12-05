
# README 

`raw_data.csv` ([link to file](https://github.com/eborsi/finch_brightness_project/blob/main/data/raw_data.csv)) contains 18 columns and 590 rows (589 data rows + 1 header row).

Read below for a description of the contents of `raw_data.csv`:

## Rows
Each row corresponds to one instance of a bird flying through the tunnel from the interior aviary, as observed by the experimenter and recorded with 2 video cameras (ZCAM E2).\
Rows with missing values reflect instances where we were unable to determine one or more of the variables from the video playback (e.g. the video recording was obscured, corrupted, cut, or lost) and instances where the bird's trajectory was incomplete (e.g. the bird landed in the tunnel).

## Columns:

1. **Treatment** (*categorical*): The brightness condition as seen by looking through the tunnel.
Can take four values:\
`Bright-Dark`: A blackout curtain is placed on the right, while the left side is bright.\
`Dark-Bright`: A blackout curtain is placed on the left, while the right side is bright.\
`Dark-Dark`: A blackout curtain is placed on the right and on the left. Both sides are dark.\
`Bright-Bright`: There is no blackout curtain on either side. Both sides are bright.

2. **Date** (*DD/MM/YYYY format*): the date of recording for each flight.

3. **Reel** (*numerical*): number associated to the video camera's metadata and file naming.

4. **Session** (*numerical*): recording number within the reel (automatically incremented by the camera for each new recording).

5. **Minute** (*numerical*): time (in minutes passed since the start of recording) when a bird was observed crossing the tunnel by the experimenter. 

6. **Timestamp** (*numerical*): used as a reference to the corresponding video file name.

7. **Origin** (*categorical*): the side of the interior aviary (facing the tunnel entrance) on which the bird started its trajectory, determined using the video playback from the two cameras.\
Can take three values:\
`Left`: The bird flew from the left side of the aviary.\
`Right`: The bird flew from the right side of the aviary.\
`?`: The side that the bird flew from is ambiguous. Either because the bird flew from the centre, did a loop, or because it was not possible to determine from the video.

8. **Arrival** (*categorical*): the side of the exterior aviary (facing the tunnel entrance) toward which the bird flew after exiting the tunnel, determined using the video playback from the front-facing camera.\
Can take three values:\
`Left`: The bird flew to the left side of the aviary.\
`Right`: The bird flew to the right side of the aviary.\
`?`: The side that the bird flew toward ambiguous. Either because the bird flew straight up or down, or because it was not possible to determine from the video.


7. **Follower** (*categorical*): whether the bird was flying shortly after another bird (within 5 seconds), thus following the previous bird (`1` meaning the first bird to follow, `2` the second bird to follow in a row, and so on).\
If a bird was not a follower, the field is left blank. Else if the bird was a follower, it was excluded from the dataset (hence the `NaN` values) due to potential biases that following a leader can introduce.

8. **Sex** (*categorical*): sex of the bird as determined from video playback. `M` meaning male and `F` meaning female.

9. **X** (*numerical*): x position of the tip of the bird's bill in the first frame where the bird has entered the tunnel (in pixels).

10. **Y** (*numerical*): y position of the tip of the bird's bill in the first frame where the bird has entered the tunnel (in pixels).

11. **X_left** (*numerical*): x position of the lower left corner of the tunnel in the first frame where the bird has entered the tunnel (in pixels).
12. **Y_left** (*numerical*): y position of the lower left corner of the tunnel in the first frame where the bird has entered the tunnel (in pixels).
13. **X_right** (*numerical*): x position of the lower right corner of the tunnel in the first frame where the bird has entered the tunnel (in pixels).
14. **Y_right** (*numerical*): y position of the lower right corner of the tunnel in the first frame where the bird has entered the tunnel (in pixels).

15. **theta** (*numerical*): angle of the lower lip of the tunnel with the horizontal (in radians). Computed using the following formula: 
<img src="https://user-images.githubusercontent.com/56667753/220996160-809623c9-a355-434d-ac6a-23cff3dfc569.png" width="220" height="50">

16. **Entry_raw** (*numerical*): radial projection of the bird’s bill onto the lower lip of the tunnel, using the following formula: 
<img src="https://user-images.githubusercontent.com/56667753/221000799-d95dac2e-8eca-4ddd-af93-1ffd94208fe1.png" width="520" height="80">

17. **Entry** (*numerical*): normalisation of the `Entry_raw` column, such that 𝜑 = -1 represents the left edge, 𝜑 = 0 the centre, and 𝜑 = 1 the right edge, using the following formula:
<img src="https://user-images.githubusercontent.com/56667753/221004215-12bad7d0-b731-477b-b8ba-9ae3e4db3d76.png" width="255" height="85">

18. **Notes** (*text*): Notes of anything out of the ordinary observed during video playback; e.g. a bird flying in zig-zag, birds sitting in the tunnel, or parts of the trajectory being cut from the video recording having just ended or started.
