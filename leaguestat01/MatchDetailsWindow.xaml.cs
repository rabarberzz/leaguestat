using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using Camille.RiotGames.MatchV5;

namespace leaguestat01
{
    public partial class MatchDetailsWindow : Window
    {
        public static Match MatchGlobal;
        public MatchDetailsWindow(Match gameMatch)
        {
            InitializeComponent();
            MatchGlobal = gameMatch;
            List<Participant> participants = MatchGlobal.Info.Participants.ToList();
            int halfParticipantCount = participants.Count/2;
            ParticipantListBox.ItemsSource = participants.GetRange(0, halfParticipantCount);
            CompareListbox.ItemsSource = participants.GetRange(halfParticipantCount, halfParticipantCount);


        }

        private void RadioButtonList_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Participant currentParticipant = ParticipantListBox.SelectedItem as Participant;
            MainTabControl.DataContext = currentParticipant;
            double calcKDA = (double)(currentParticipant.Kills + currentParticipant.Assists) /
                             Math.Max(1, currentParticipant.Deaths);
            ParticipantKDA.Content = Math.Round(calcKDA, 2);
            ParticipantTimeSpentLiving.Content = TimeSpan.FromSeconds(currentParticipant.LongestTimeSpentLiving);
            ParticipantTotalTimeCCDealt.Content = TimeSpan.FromSeconds(currentParticipant.TimeCCingOthers);
            ParticipantTotalTimeSpentDead.Content = TimeSpan.FromSeconds(currentParticipant.TotalTimeSpentDead);
            
        }

        private void CompareListbox_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Participant compareParticipant = CompareListbox.SelectedItem as Participant;
            MatchTabStackPanelCompare.DataContext = compareParticipant;
            DamageTabStackPanelCompare.DataContext = compareParticipant;
            KillsTabStackPanelCompare.DataContext = compareParticipant;
            ItemsTabStackPanelCompare.DataContext = compareParticipant;
            SpellTabStackPanelCompare.DataContext = compareParticipant;
            ObjectivesTabStackPanelCompare.DataContext = compareParticipant;
            MiscTabStackPanelCompare.DataContext = compareParticipant;
            double calcKDA = (double)(compareParticipant.Kills + compareParticipant.Assists) /
                             Math.Max(1, compareParticipant.Deaths);
            ParticipantKDACompare.Content = Math.Round(calcKDA, 2);
            ParticipantTotalTimeCCDealtCompare.Content = TimeSpan.FromSeconds(compareParticipant.TimeCCingOthers);
            ParticipantTotalTimeSpentDeadCompare.Content = TimeSpan.FromSeconds(compareParticipant.TotalTimeSpentDead);
            ParticipantTimeSpentLivingCompare.Content = TimeSpan.FromSeconds(compareParticipant.LongestTimeSpentLiving);
        }
    }
}