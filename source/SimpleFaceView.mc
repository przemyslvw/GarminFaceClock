import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

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

    // Aktualizuj widok
    function onUpdate(dc as Dc) as Void {
        // Pobierz aktualny czas i sformatuj go poprawnie
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Zaktualizuj widok
        var view = View.findDrawableById("TimeLabel") as Text;
        view.setColor(getApp().getProperty("ForegroundColor") as Number);
        view.setText(timeString);

        // Wywołaj funkcję onUpdate z klasy bazowej, aby przerysować układ
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