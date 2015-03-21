#Justin Lee

from urllib.request import urlopen
from tkinter import *    # the star means import everything
from tkinter import ttk     # import some sub-modules; one for "widgets"
from tkinter import font    # and one for fonts.



def main():

    yahooWeather = "http://weather.yahooapis.com/forecastrss?w=" #weather forecast
    davis = "2389646" #Davis code for weather
    weatherURL = yahooWeather+davis #weather forcase for Davis
    try:
        myData = urlopen(weatherURL) #open webpage if it exists
    except:
        print("URL not found") #exit program if it doesn't exist
        return

    for byteLine in myData: #for all the elements myData has
        # turn bytes into a string
        line = byteLine.decode()
        line = line.strip()
        line = line.split('"')
        if line[0] == "<yweather:forecast day=":
            forecast = line[3]
            date = line[9]

    root = Tk()  # function that makes a window
    bigFont = font.Font(family='Helvetica', size=26)#font size
    style = ttk.Style()
    style.configure("TButton", font=bigFont)
    style.configure("TLabel",font=bigFont)

    root.title("Davis, CA Forecast") #title of window
    root.geometry("400x400") #dimension of window that is opened

    

    # put a label in the window (Forecast)
    label = ttk.Label(root,text=forecast)
    label.grid()

    # put a label in the window (Date)
    label2 = ttk.Label(root,text=date)
    label2.grid()

    #puts picture in background
    backPic = PhotoImage(file="sunshine.gif")# gets the picture
    pic = ttk.Label(root,image=backPic)
    pic.grid()

    

    root.mainloop()  # actually displays the window
main()
    

