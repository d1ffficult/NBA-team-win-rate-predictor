import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import StandardScaler

# Load and train model once
df = pd.read_csv("regular_season_with_championship.csv")
features = [
    'FG_PCT', 'FTM', 'REB', 'AST', 'TOV', 'STL', 'BLK',
    'TOP3_PTS', 'TOP3_STL', 'TOP3_BLK',
    'OFF_RATING', 'DEF_RATING', 'PACE'
]
X = df[features]
y = df["W_PCT"]

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

reg = LinearRegression()
reg.fit(X_scaled, y)

df["team_score"] = reg.predict(X_scaled)

def predict(input_json):
    teamA = input_json["teamA"]
    teamB = input_json["teamB"]
    season = input_json["season"]

    teamA_score = df[(df["TEAM_NAME"] == teamA) & (df["SEASON"] == season)]["team_score"]
    teamB_score = df[(df["TEAM_NAME"] == teamB) & (df["SEASON"] == season)]["team_score"]

    a = teamA_score.values[0]
    b = teamB_score.values[0]
    prob_A_win = a / (a + b)

    return round(prob_A_win, 4)
