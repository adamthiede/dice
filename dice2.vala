int main (string[] argv) {
    // Create a new application
    var app = new Gtk.Application ("com.elagost.dice",GLib.ApplicationFlags.SEND_ENVIRONMENT);

    app.activate.connect (() => {
        // Create a new window
        var window = new Gtk.ApplicationWindow (app);

        window.default_height = 50;
        window.default_width = 300;
        window.title = "Dice Roller";

		// Add box
        var box = new Gtk.Box (Gtk.Orientation.VERTICAL,0);

		// Add things to put into the box
        var rollButton = new Gtk.Button.with_label ("Roll!");
        var coinButton = new Gtk.Button.with_label ("Flip Coin");
        var count_box=new Gtk.SpinButton.with_range(1,1000,1);
        var countlabel=new Gtk.Label ("Number of Dice");
        var die_box=new Gtk.SpinButton.with_range(2,1000,1);
        var dielabel=new Gtk.Label ("Sides");
        var mod_box=new Gtk.SpinButton.with_range(0,100,1);
        var mod_label=new Gtk.Label ("Mod");
		box.set_spacing(10);

        var textZoneLabel=0;
        var textZone = new Gtk.Label (" ");
        textZone.set_max_width_chars(250);
        textZone.set_wrap(true);

		rollButton.clicked.connect (() => {
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
			var	button_l = "D" + buttonval.to_string();
            var button_v = new Gtk.Button.with_label (button_l);
            hbox.append(button_v);
            button_v.clicked.connect( () => {
                die_box.value=buttonval;
            });
        }
		hbox.set_spacing(0);

		// Add box to the window
        window.set_child (box);
		// Add items to box


        var dbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL,0);
        var dbox1 = new Gtk.Box (Gtk.Orientation.VERTICAL,0);
        var dbox2 = new Gtk.Box (Gtk.Orientation.VERTICAL,0);
        var dbox3 = new Gtk.Box (Gtk.Orientation.VERTICAL,0);

		dbox1.append (countlabel);
		dbox1.append (count_box);
		dbox2.append (dielabel);
        dbox2.append (die_box);
        dbox3.append (mod_label);
        dbox3.append (mod_box);
		dbox.append (dbox1);
		dbox.append (dbox2);
		dbox.append (dbox3);
		box.append (dbox);
		box.append (hbox);
        var buttonbox = new Gtk.Box (Gtk.Orientation.HORIZONTAL,0);
		buttonbox.append (coinButton);
		buttonbox.append (rollButton);
        box.append (buttonbox);
        box.append (textZone);

        window.present ();
    });

    return app.run (argv);
}
