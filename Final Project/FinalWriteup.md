# Predicting NBA Team Win Probability from Season Stats

## Exploratory Data Analysis:
Data Source: nba_api
### Each row represents a team’s performance in a single season, including:

Core metrics like FG_PCT, REB, AST, TOV, OFF_RATING, DEF_RATING, PACE

Aggregates of top players: TOP3_PTS, TOP3_STL, TOP3_BLK

Target: W_PCT (team's win percentage for the season)

### EDA insights:

Teams with higher OFF_RATING and DEF_RATING tend to win more

Strong correlation observed between REB, AST, and W_PCT

TOP3_PTS shows importance of star players’ scoring to overall team success

Heatmap was used to assess multicollinearity and filter out redundant features (e.g., dropping PLUS_MINUS, W_PCT when predicting outcomes)

## Methodology
### Goal: 
Predict the win probability of one team against another in a given season using regular season stats

### Model:

Trained a linear regression model to predict W_PCT using 13 numerical features

Features were standardized using StandardScaler

Achieved high R² values, showing good predictive ability and interpretability

### Deployment:

Model served via Flask API deployed on Google Cloud Run

R Shiny app (hosted on shinyapps.io) connects to API and provides interactive team comparison interface

## Results

### Model Performance:

R² (Train): 0.932

R² (Test): 0.921

MAE: 0.0345

MSE: 0.0019

### Example predictions:

Golden State Warriors vs. Boston Celtics (2014–15) → ~63% win probability for Warriors
