import numpy as np
import mysql.connector
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# connect to database
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="dbCognitiveRegression"
)

mycursor = mydb.cursor()

# get the x data
mycursor.execute("SELECT hoursOfSleep from tblSleepCognitiveData")

sleepQuery = mycursor.fetchall()
hoursOfSleep = [row[0] for row in sleepQuery]

x = np.empty(shape=[len(hoursOfSleep),1], dtype=int)

for i,hours in enumerate(hoursOfSleep):
    x[i]=hours

x.reshape((-1,1))

# get the y data
mycursor.execute("SELECT cognitiveTestScore from tblSleepCognitiveData")

testQuerry = mycursor.fetchall()
testResult = [row[0] for row in testQuerry]

y = np.empty(shape=[len(testResult)], dtype=int)

for i,test in enumerate(testResult):
    y[i]=test

# draw the scatter plot
plt.scatter(x,y)
plt.show()

# implement the linear regression
model = LinearRegression().fit(x,y)

r_sq = model.score(x,y)
print(f"Coefficient of Determination: {r_sq}")

print(f"Intercept(Alpha): {model.intercept_}")

print(f"Slope(Beta): {model.coef_}")

# calculate the future value using array x
y_pred = model.predict(x)
print(f"Predicted Array Response: {y_pred}")

plt.scatter(x,y)
plt.plot(x, y_pred, color='red', marker='o', linestyle='dashed',linewidth=2, markersize=12)
plt.show()

# calculate the future value with single value
prediction = np.array([10]).reshape((-1,1))

y_pred = model.predict(prediction)
print(f"Predicted Single Response: {y_pred}")

plt.scatter(x,y)
plt.plot(prediction,y_pred, color='red', marker='o', linestyle='dashed',linewidth=2, markersize=12)
plt.show()
