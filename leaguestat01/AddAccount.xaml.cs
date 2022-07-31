using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using Camille.Enums;
using Camille.RiotGames;

namespace leaguestat01
{
    public partial class AddAccount : Window
    {
        public AddAccount()
        {
            InitializeComponent();
            Dictionary<string, PlatformRoute> routes = new Dictionary<string, PlatformRoute>();
            routes.Add("Europe West", PlatformRoute.EUW1);
            routes.Add("Europe North-east", PlatformRoute.EUN1);
            routes.Add("North America", PlatformRoute.NA1);
            routes.Add("Oceania", PlatformRoute.OC1);
            routes.Add("Japan", PlatformRoute.JP1);
            routes.Add("Brazil", PlatformRoute.BR1);
            routes.Add("Russia", PlatformRoute.RU);
            RegionCBox.ItemsSource = Enum.GetValues(typeof(PlatformRoute));



        }

        
        


        public string AccountNameResult
        {
            get { return AccountNameTextbox.Text; }
        }

        private void AcceptBtn_OnClick(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
        }
    }
}