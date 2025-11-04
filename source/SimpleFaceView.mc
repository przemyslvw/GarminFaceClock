using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Lang;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
using Toybox.SensorHistory as Sensor;
using Toybox.Time;
using Toybox.Time.Gregorian;

class SimpleFaceView extends WatchUi.WatchFace {

    // Funkcja inicjalizująca obiekt SimpleFaceView
    function initialize() {
        WatchFace.initialize();
    }

    // Załaduj swoje zasoby tutaj
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Wywoływana, gdy ten widok jest przenoszony na pierwszy plan. Przywróć
    // stan tego widoku i przygotuj go do wyświetlenia. Obejmuje to
    // ładowanie zasobów do pamięci.
    function onShow() as Void {
    }

    // Get current date as string
    function getDateString() as String {
        var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        return Lang.format("$1$ $2$ $3$", [
            today.day,
            today.month,
            today.year
        ]);
    }

    // Get current steps
    function getSteps() as Number {
        var activityInfo = Act.getInfo();
        if (activityInfo != null) {
            return activityInfo.steps;
        }
        return 0;
    }

    // Get current heart rate
    function getHeartRate() as Number {
        var heartRateIterator = Sensor.getHeartRateHistory({
            :period => 1,
            :order => Sensor.ORDER_NEWEST_FIRST
        });
        var sample = heartRateIterator.next();
        if (sample != null && sample.data != null) {
            return sample.data;
        }
        return 0;
    }

    // Get battery percentage
    function getBattery() as Number {
        var stats = Sys.getSystemStats();
        return stats.battery.toNumber();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Clear the screen
        dc.setColor(Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK);
        dc.clear();

        // Get and update time
        var timeFormat = "$1$:$2$";
        var clockTime = Sys.getClockTime();
        var hours = clockTime.hour;
        if (!Sys.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else if (App.getApp().getProperty("UseMilitaryFormat")) {
            timeFormat = "$1$$2$";
            hours = hours.format("%02d");
        }
        
        // Update time
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);
        var timeView = View.findDrawableById("TimeLabel") as Text;
        timeView.setText(timeString);

        // Update date
        var dateView = View.findDrawableById("DateLabel") as Text;
        dateView.setText(getDateString());

        // Update steps
        var steps = getSteps();
        var stepsView = View.findDrawableById("StepsLabel") as Text;
        stepsView.setText(steps.format("%d"));

        // Update heart rate
        var heartRate = getHeartRate();
        var hrView = View.findDrawableById("HeartRateLabel") as Text;
        hrView.setText(heartRate > 0 ? heartRate.format("%d") : "--");

        // Update battery
        var battery = getBattery();
        var batteryView = View.findDrawableById("BatteryLabel") as Text;
        batteryView.setText(battery.format("%d"));

        // Call the parent onUpdate function to handle the layout
        View.onUpdate(dc);
    }

    // Wywoływana, gdy ten widok jest usuwany z ekranu. Zapisz
    // stan tego widoku tutaj. Obejmuje to zwalnianie zasobów z
    // pamięci.
    function onHide() as Void {
    }

    // Użytkownik właśnie spojrzał na swój zegarek. Timery i animacje mogą być uruchamiane tutaj.
    function onExitSleep() as Void {
    }

    // Zakończ wszelkie aktywne timery i przygotuj się do wolnych aktualizacji.
    function onEnterSleep() as Void {
    }

}