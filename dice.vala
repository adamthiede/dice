using Gtk;
public class Dice : Gtk.Application {

    public Dice () {
        Object (
            application_id: "com.elagost.gui.Dice",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 50;
        main_window.default_width = 300;
        main_window.title = "Dice Roller";
        main_window.border_width=10;
        main_window.window_position=Gtk.WindowPosition.CENTER;
        main_window.destroy.connect (Gtk.main_quit);
        var box = new Gtk.Box (Gtk.Orientation.VERTICAL,0);
        main_window.add (box);

        var count_box=new SpinButton.with_range(1,1000,1);
        var countlabel=new Gtk.Label (" Number of Dice ");
        countlabel.margin=10;
        var die_box=new SpinButton.with_range(2,1000,1);
        var dielabel=new Gtk.Label (" Sides ");
        dielabel.margin=10;
        var mod_box=new SpinButton.with_range(0,100,1);
        var mod_label=new Gtk.Label (" Mod ");
        mod_label.margin=10;
        
        count_box.adjustment.value=1;
        die_box.adjustment.value=20;
         
        var textZoneLabel=0;
        var textZone = new Gtk.Label (textZoneLabel.to_string());
        textZone.set_max_width_chars(250);
        textZone.set_line_wrap(true);
		textZone.margin = 10;
        var button_1 = new Gtk.Button.with_label ("Roll!");
		button_1.margin = 10;
		button_1.clicked.connect (() => {
		    var diceResult=0;
		    int count=(int) count_box.adjustment.value;
            var reminder="Rolling "+count.to_string()+" D"+die_box.adjustment.value.to_string();
		    int[] rolls=new int[count];
		    for(int i=0;i<count;i++) {
		        var roll=Random.int_range(1,(int) die_box.adjustment.value+1);
		        rolls[i]=roll;
    		    diceResult+=roll;
    		}
    		if ( (int) mod_box.value > 0 ){
		        diceResult+=+(int)mod_box.value;
		    }
		    textZoneLabel=diceResult;
		    var rolls_string="[ ";
		    for (int i=0;i<rolls.length;i++) {
		        rolls_string+=rolls[i].to_string();
		        if (i<rolls.length-1){
		            rolls_string+=", ";
		        }
		        else {
		            rolls_string+=" ]";
		        }
		    }
		    textZone.label = reminder+"\nTotal: "+textZoneLabel.to_string()+"\nRolls: "+rolls_string;
		    if ( (int) mod_box.value > 0 ){
		        textZone.label+=" Mod: "+mod_box.value.to_string();
		    }
		});

        var coinButton = new Gtk.Button.with_label ("Coin Flip!");
		coinButton.margin = 10;
        coinButton.clicked.connect (() => {
		    var coinFlip=Random.int_range(0,100);
            //stdout.printf("%d\n",coinFlip);
            var coinFlipText="";
            if ( coinFlip%2 == 0 ){
                coinFlipText="Tails";
            }
            else if (coinFlip%2 == 1){
                coinFlipText="Heads";
            }
            else {
                coinFlipText="Unknown!";
            }
            textZone.label = "Coin Flip: "+coinFlipText.to_string()+"\n";
		});

        
        // construct quick die chooser buttons
        var hbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL,5);
        int[] values={4, 6, 8, 10, 20, 100};
        for (int v=0;v<values.length;v++){
            int buttonval=values[v];
            var button_v = new Gtk.Button.with_label (buttonval.to_string());
            hbox.add(button_v);
            button_v.clicked.connect( () => {
                die_box.value=buttonval;
            });
        }

        //construct the box!
		box.add (countlabel);
		box.add (count_box);
		box.add (dielabel);
        box.add (die_box);
        box.add (hbox);
        box.add (mod_label);
        box.add (mod_box);
        box.add(button_1);
        box.add(coinButton);
        box.add (textZone);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new Dice ();
        return app.run (args);
    }
}
