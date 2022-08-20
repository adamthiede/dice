#include <gtk/gtk.h>

static void
print_hello (GtkWidget *widget,
             gpointer   data)
{
  g_print ("Hello World\n");
}

static void
roll_dice (GtkWidget *widget,
             gpointer   data)
{
  g_print ("%d\n", rand() % 20);
}

static void
activate (GtkApplication *app,
          gpointer        user_data)
{
  GtkWidget *window;
  GtkWidget *button;
  GtkWidget *textarea;

  window = gtk_application_window_new (app);
  gtk_window_set_title (GTK_WINDOW (window), "Dice Roller");
  gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);

  button = gtk_button_new_with_label ("Roll Dice");
  g_signal_connect (button, "clicked", G_CALLBACK (roll_dice), NULL);

  textearea = gtk_button_ne_with_label ("Result");

  gtk_window_set_child (GTK_WINDOW (window), button);
  gtk_window_set_child (GTK_WINDOW (window), textarea);

  gtk_window_present (GTK_WINDOW (window));
}

int
main (int    argc,
      char **argv)
{
  GtkApplication *app;
  int status;

  app = gtk_application_new ("com.elagost.Dice2", G_APPLICATION_FLAGS_NONE);
  g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
  status = g_application_run (G_APPLICATION (app), argc, argv);
  g_object_unref (app);

  return status;
}
