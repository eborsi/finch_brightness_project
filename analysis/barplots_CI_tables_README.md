# README

`barplots_CI_tables` ([link to file](https://github.com/eborsi/finch_brightness_project/blob/main/analysis/raw_data.csv)) contains 2 Excel sheets:
1. The first sheet computes the lower and upper bounds of confidence intervals for the proportions of left vs right **Arrivals** for the four brightness conditions
2. The second sheet computes the lower and upper bounds of confidence intervals for the proportions of left vs right **Origins** for the four brightness conditions

For each of these, there are 13 columns: 
1. **Treatment**: the four brightness conditions
2. **Arrival**/**Origin**: `left` or `right`
3. **Sample size**: all flights counted for the given brightness condition (sum of left, right, and ambiguous counts).
4. **# successes**: number of flights counted in the `Arrival`/`Origin` side
5. **proportion**: proportion of flights to/from the given side (= `# successes`/`Sample size`)
6. **Frequency**: `proportion` as a percentage (=`proportion`\*100)
7. **alpha**: level of significance (set to 0.05)
8. **zcrit**: critical z-score (= NORM.S.INV(1–`alpha`))
9. **p\***: Using the Agresti-Coull method, p\* is defined as:\
     <img src="https://user-images.githubusercontent.com/56667753/221074305-f2867a86-960b-4988-b80b-9b87002eac03.png" width="150" height="60">
10. **lower**: lower bound of the 95% CI, defined as:\
     <img src="https://user-images.githubusercontent.com/56667753/221075181-926316fe-17a5-45e6-b59c-b025728edf62.png" width="150" height="60">
11. **upper**: upper bound of the 95% CI, defined as:\
     <img src="https://user-images.githubusercontent.com/56667753/221074798-6c80ee99-d453-4ebc-9c8b-eec2198da9eb.png" width="150" height="60">
12. **Freq_lower**: `lower` as a percentage (=`lower`\*100)
13. **Freq_upper**: `upper` as a percentage (=`upper`\*100)
