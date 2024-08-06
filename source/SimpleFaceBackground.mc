import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    // Funkcja inicjalizująca obiekt Background
    function initialize() {
        var dictionary = {
            :identifier => "Background"
        };

        // Wywołanie funkcji inicjalizującej z klasy bazowej Drawable
        Drawable.initialize(dictionary);
    }

    // Funkcja rysująca tło
    function draw(dc as Dc) as Void {
        // Ustawienie koloru tła, a następnie wyczyszczenie ekranu
        dc.setColor(Graphics.COLOR_TRANSPARENT, getApp().getProperty("BackgroundColor") as Number);
        dc.clear();
    }

}