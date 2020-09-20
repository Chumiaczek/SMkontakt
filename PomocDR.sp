#include <cstrike>
#include <sourcemod>
#include <multicolors>

#define PL_VERSION "1.0"

#pragma newdecls required
#pragma semicolon 1

char namee[][] = {
  "Chumi",
  "P00f",
  ";-;",
};

char functionn[][] = {
"Właściciel Serwera",
"Opiekun Serwera/Właściciel Forum",
"Opiekun Serwera",
};

char steam[][] = {
  "https://steamcommunity.com/id/chumi-official/",
  "https://steamcommunity.com/id/P00Fdev/",
  "https://steamcommunity.com/id/retard1092/",
};

char forum[][] = {
  "https://errorhead.pl/profile/3316-chumi/",
  "https://errorhead.pl/profile/3266-p00f/",
  "https://errorhead.pl/profile/467--/",
};

char namee1[][] = {
  "W!nn3Web!",
  "Lexxx",
  "P00f",
  "Tyler",
  "Osa",
  "Red Roses",
  "Księżniczka",
};

char functionn1[][] = {
"Właściciel Sieci",
"Właściciel Sieci",
"Zastępca Właścicieli/Admin Techniczny",
"HeadAdmin Sieci",
"Administrator Sieci",
"Junior Admin Sieci",
"Junior Admin Sieci",
};

char steam1[][] = {
  "https://steamcommunity.com/id/1899828/",
  "https://steamcommunity.com/profiles/76561198253455492/",
  "https://steamcommunity.com/id/P00Fdev/",
  "https://steamcommunity.com/id/Sciles",
  "https://steamcommunity.com/id/osabz/",
  "https://steamcommunity.com/id/xoistheonlytimeinvested/",
  "https://steamcommunity.com/id/ksiezniczka3922/",
};

char forum1[][] = {
  "https://errorhead.pl/profile/3034-wnn3web/",
  "https://errorhead.pl/profile/2667-lexxx/",
  "https://errorhead.pl/profile/3266-p00f/",
  "https://errorhead.pl/profile/1711-tyler/",
  "https://errorhead.pl/profile/2260-osa/",
  "https://errorhead.pl/profile/1119-red-roses/",
  "https://errorhead.pl/profile/1638-ksi%C4%99%C5%BCniczka%EF%BB%BF/",
};

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/


public Plugin myinfo = 
{
	name = "[CS:GO] Menu Pomocy DR", 
	author = "Chumi", 
	description = "[CS:GO] Menu Pomocy DR", 
	version = PL_VERSION, 
	url = "https://steamcommunity.com/id/chumi_official",
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_pomoc", CMD_PomocGlowna);
    RegConsoleCmd("sm_serwery", Chumi_Serwery);
    RegConsoleCmd("sm_servers", Chumi_Serwery);
	RegConsoleCmd("sm_regulamin", Chumi_Regulamin);
    RegConsoleCmd("sm_regulaminforum", Chumi_RegulaminForum);
	RegConsoleCmd("sm_forum", Chumi_Forum);
	RegConsoleCmd("sm_vip", Chumi_VIP);
    RegConsoleCmd("sm_sklep", Chumi_Sklep);
    RegConsoleCmd("sm_sklepcs", Chumi_SklepCS);
    RegConsoleCmd("sm_kontakt", Kontakt);
	RegConsoleCmd("sm_kontaktforum", Kontakt_Forum);
}

public void OnMapStart()
{
	AutoExecConfig(true, "MenuPomocy_Config");
}

public void OnClientPostAdminCheck(int client)
{
	CreateTimer(4.0, Timer_Message, GetClientUserId(client));
}

public Action Timer_Message(Handle timer, any clientUserId)
{
	int client = GetClientOfUserId(clientUserId);

	if(client && IsClientConnected(client))
	{
		ClientCommand(client, "sm_pomoc");
	}
}

public Action CMD_PomocGlowna(int client, int args)
{
    Menu menupomoc = new Menu(Menu_Pomocy);
    menupomoc.SetTitle("[EH] Menu pomocy na serwerze DR!");
    menupomoc.AddItem("opcja1", "»Forum/Kontakt");
    menupomoc.AddItem("opcja2", "»Regulamin");
    menupomoc.AddItem("opcja3", "»Usługi na Serwerze");
    menupomoc.AddItem("opcja4", "»Ranking/WR");
    menupomoc.AddItem("opcja5", "»Skiny/Sklep Serwerowy");
    menupomoc.AddItem("opcja6", "»Inne Serwery CS:GO");
	menupomoc.ExitButton = true;
	menupomoc.Display(client, 0);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Menu_Pomocy(Menu menupomoc, MenuAction action, int client, int itemNum)
{
    if (action == MenuAction_Select)
	{
		char info[32];
		GetMenuItem(menupomoc, itemNum, info, sizeof(info));
        if (strcmp(info, "opcja1") == 0) {
			ForumKontakt(client, 0);
		}

        else if (strcmp(info, "opcja2") == 0) {
			ClientCommand(client, "sm_regulamin");
		}

        else if (strcmp(info, "opcja3") == 0) {
			ClientCommand(client, "sm_sklepcs");
		}
        else if (strcmp(info, "opcja4") == 0) {
			RW(client, 0);
		}

        else if (strcmp(info, "opcja5") == 0) {
			ClientCommand(client, "sm_sklep");
		}

        else  if (strcmp(info, "opcja6") == 0) {
			ClientCommand(client, "sm_sklepcs");
		}
    }

    else if (action == MenuAction_End) {
		CloseHandle(menupomoc);
	}
}

public Action ForumKontakt(int client, int args)
{
	Menu menustrony = new Menu(Menu_Strony);
	menustrony.SetTitle("[Menu Pomocy] Wybierz strone którą chcesz wyświetlić:");
	menustrony.AddItem("option1", "Przejdź na nasze forum");
    menustrony.AddItem("option2", "Kontakt z  Wyższą Administracją Serwera");
    menustrony.AddItem("option3", "Kontakt z Wyższą Administracją Forum");
	menustrony.ExitButton = true;
	menustrony.Display(client, 0);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Menu_Strony(Menu menustrony, MenuAction action, int client, int itemNum)
{
	if (action == MenuAction_Select)
	{
		char info[32];
		GetMenuItem(menustrony, itemNum, info, sizeof(info));
		
		if (strcmp(info, "option1") == 0) {
			ClientCommand(client, "sm_forum");
			
		}
		
		else if (strcmp(info, "option2") == 0) {
			ClientCommand(client, "sm_kontakt");
			
		}
		
		else if (strcmp(info, "option3") == 0) {
			ClientCommand(client, "sm_regulaminforum");
			
		}
		
	}
	
	else if (action == MenuAction_End) {
		CloseHandle(menustrony);
	}
}


public Action Chumi_SklepCS(int client, int args)
{
	Menu menupomoc = new Menu(Menu_Uslugi);
	menupomoc.SetTitle("[Usługi] Opcje Usług");
	menupomoc.AddItem("option1", "Zalety poszczególnych usług");
	menupomoc.AddItem("option2", "Kupno usług");
	menupomoc.ExitButton = true;
	menupomoc.Display(client, 0);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Menu_Uslugi(Menu menupomoc, MenuAction action, int client, int itemNum)
{
	if (action == MenuAction_Select)
	{
		char info[32];
		GetMenuItem(menupomoc, itemNum, info, sizeof(info));
		
		if (strcmp(info, "option1") == 0) {
			ClientCommand(client, "sm_vip");
			
		}
		
		else if (strcmp(info, "option2") == 0) {
			ClientCommand(client, "sm_sklepsms");
			
		}
	
	}
	
	else if (action == MenuAction_End) {
		CloseHandle(menupomoc);
	}
}

public Action RW(int client, int args)
{
	Menu menustrony = new Menu(Ranking_WR);
	menustrony.SetTitle("[Rankingi] Rankingi Serwerowe");
	menustrony.AddItem("option1", "WR");
    menustrony.AddItem("option2", "TOP");
    menustrony.AddItem("option3", "Twój Ranking");
	menustrony.ExitButton = true;
	menustrony.Display(client, 0);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Ranking_WR(Menu menupomoc, MenuAction action, int client, int itemNum)
{
	if (action == MenuAction_Select)
	{
		char info[32];
		GetMenuItem(menupomoc, itemNum, info, sizeof(info));
		
		if (strcmp(info, "option1") == 0) {
			ClientCommand(client, "sm_wr");
			
		}
		
		else if (strcmp(info, "option2") == 0) {
			ClientCommand(client, "sm_top");
			
		}

        else if (strcmp(info, "option3") == 0) {
			ClientCommand(client, "sm_rank");
			
		}
	
	}
	
	else if (action == MenuAction_End) {
		CloseHandle(menupomoc);
	}
}

public Action Chumi_Sklep(int client, int args)
{
	Menu menustrony = new Menu(Sklep_Serwer);
	menustrony.SetTitle("[Sklep] Sklepik Serwerowy");
	menustrony.AddItem("option1", "Sklepik");
    menustrony.AddItem("option2", "Twoje Monety");
    menustrony.AddItem("option3", "Gdzie kupić monety?");
	menustrony.ExitButton = true;
	menustrony.Display(client, 0);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Sklep_Serwer(Menu menupomoc, MenuAction action, int client, int itemNum)
{
	if (action == MenuAction_Select)
	{
		char info[32];
		GetMenuItem(menupomoc, itemNum, info, sizeof(info));
		
		if (strcmp(info, "option1") == 0) {
			ClientCommand(client, "sm_store");
			
		}
		
		else if (strcmp(info, "option2") == 0) {
			ClientCommand(client, "sm_monety");
			
		}

        else if (strcmp(info, "option3") == 0) {
			CPrintToChat(client, "Aby zakupić monety, wejdź na: {lightred}http://sklepcs.pl/?p=errhd");
            CPrintToChat(client, "Możesz również skontaktować się z Chumi, który pomoże przy zakupie");
			
		}
	
	}
	
	else if (action == MenuAction_End) {
		CloseHandle(menupomoc);
	}
}

public Action Chumi_Serwery(int client, int args)
{
	Menu menupomoc = new Menu(Menu_Serwer);
	menupomoc.SetTitle("[EH] Nasze inne serwery!");
	menupomoc.AddItem("opcja1", "» Only Mirage #1");
	menupomoc.AddItem("opcja2", "» Only Mirage #2");
	menupomoc.AddItem("opcja3", "» Arena 1v1");
	menupomoc.AddItem("opcja4", "» Retake");
	menupomoc.ExitButton = true;
	menupomoc.Display(client, 0);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Menu_Serwer(Menu menupomoc, MenuAction action, int client, int itemNum)
{
	if (action == MenuAction_Select)
	{
		char info[32];
		GetMenuItem(menupomoc, itemNum, info, sizeof(info));
		
		if (strcmp(info, "opcja1") == 0) {
			CPrintToChat(client, "{purple}---------- {green}Only Mirage #1{purple} ----------");
			CPrintToChat(client, "{purple}IP: 145.239.237.122:27015");
			CPrintToChat(client, "{purple}Właściciel: {darkred}Lexxx, icW, Osa");
			CPrintToChat(client, "{purple}---------------------------------------------------");
		}
		
		else if (strcmp(info, "opcja2") == 0) {
			CPrintToChat(client, "{purple}---------- {green}Only Mirage #2{purple} ----------");
			CPrintToChat(client, "{purple}IP: 145.239.236.196:27105");
			CPrintToChat(client, "{purple}Właściciel: {darkred}Patry$");
			CPrintToChat(client, "{purple}---------------------------------------------------");
		}
		
		else if (strcmp(info, "opcja3") == 0) {
			CPrintToChat(client, "{purple}---------- {green}Arena 1v1{purple} ----------");
			CPrintToChat(client, "{purple}IP: 145.239.237.103:27050");
			CPrintToChat(client, "{purple}Właściciel: {darkred}Tomasz, Osa");
			CPrintToChat(client, "{purple}---------------------------------------------------");
		}
		
		else if (strcmp(info, "opcja4") == 0) {
			CPrintToChat(client, "{purple}---------- {green}Retake{purple} ----------");
			CPrintToChat(client, "{purple}IP: 145.239.20.88:27125");
			CPrintToChat(client, "{purple}Właściciel: {darkred}Chumi, mad dog");
			CPrintToChat(client, "{purple}---------------------------------------------------");
		}
	}
	
	else if (action == MenuAction_End) {
		CloseHandle(menupomoc);
	}
}

public Action Chumi_Regulamin(int client, int args)
{
    CPrintToChat(client, "Regulamin naszego serwera znajduje się tutaj: {lightred}https://errorhead.pl/topic/15064-regulamin-serwera-deathrun/");
}

public Action Chumi_RegulaminForum(int client, int args)
{
    CPrintToChat(client, "Regulamin naszego forum znajduje się tutaj: {lightred}https://errorhead.pl/forum/455-regulamin-forum/");
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public Action Chumi_Forum(int client, int args)
{
    CPrintToChat(client, "Nasze forum znajduje się tutaj: {lightred}https://errorhead.pl");
}

public Action Chumi_VIP(int client, int args)
{
			Menu menupomoc = new Menu(Menu_Vip);
			menupomoc.SetTitle("[Menu VIP] Wybierz jaką usługę wyświetlić");
			menupomoc.AddItem("option1", "VIP");
			menupomoc.AddItem("option2", "Double Jump");
			menupomoc.AddItem("option3", "VIP + Double Jump");
			menupomoc.ExitButton = true;
			menupomoc.Display(client, 0);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Menu_Vip(Menu menupomoc, MenuAction action, int client, int itemNum)
{
	if (action == MenuAction_Select)
	{
		char info[32];
		GetMenuItem(menupomoc, itemNum, info, sizeof(info));
		
		if (strcmp(info, "option1") == 0) {
			CPrintToChat(client, "---------------------------------------");
			CPrintToChat(client, "{lightgreen}W skład VIP'a wchodzi:");
			CPrintToChat(client, "{lightred}125 HP");
			CPrintToChat(client, "{lightred}Strzykawka odnawiająca 50 HP");
			CPrintToChat(client, "{lightred}Dodatkowe Skiny w Sklepie Serwerowym");
			CPrintToChat(client, "{lightred}Prefix na chacie VIP");
			CPrintToChat(client, "---------------------------------------");
		}
		
		else if (strcmp(info, "option2") == 0) {
			CPrintToChat(client, "---------------------------------------");
			CPrintToChat(client, "{lightgreen}Dzięki niemu będziesz w stanie zrobić 2 skoki!");
			CPrintToChat(client, "---------------------------------------");
		}
		else if (strcmp(info, "option3") == 0) {
			CPrintToChat(client, "---------------------------------------");
			CPrintToChat(client, "{lightgreen}W skład VIP'a z Double Jump wchodzi:");
			CPrintToChat(client, "{lightred}125 HP");
			CPrintToChat(client, "{lightred}Strzykawka odnawiająca 50 HP");
			CPrintToChat(client, "{lightred}Dodatkowe darmowe Skiny w Sklepie Serwerowym");
			CPrintToChat(client, "{lightred}Prefix na chacie VIP");
			CPrintToChat(client, "{lightred}Podwójny skok");
			CPrintToChat(client, "---------------------------------------");
		}
	}
}

public Action Kontakt(int client, int args) {
  Menu menu = new Menu(Kontakt_Handler);

  menu.SetTitle("Wybierz osobę:");
  char buffer[1024];
  char optionBuffer[8];
  for (int i = 0; i < sizeof(namee); i++) {
    Format(buffer, sizeof(buffer), "%s [%s]", namee[i], functionn[i]);
    Format(optionBuffer, sizeof(optionBuffer), "%d", i);
    menu.AddItem(optionBuffer, buffer);
  }
  menu.Display(client, 120);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Kontakt_Handler(Menu menu, MenuAction action, int client, int item) {
  if (action == MenuAction_Select) {
    char InfoBuffer[32];
    menu.GetItem(item, InfoBuffer, sizeof(InfoBuffer));
    int option = StringToInt(InfoBuffer);

    CPrintToChat(client, "{yellow}☆%s{grey}[%s]", namee[option], functionn[option]);
    CPrintToChat(client, "{grey}☆Steam: {default}[%s]", steam[option]);
    CPrintToChat(client, "{lightred}☆Forum: {default}[%s]", forum[option]);
    CPrintToChat(client, "{lightgreen}Wydrukowane również w konsoli!");

    PrintToConsole(client, "%s [%s]\nSteam: %s\nForum: %s", namee[option], functionn[option], forum[option]);

    Kontakt(client, 0);
  }
}

public Action Kontakt_Forum(int client, int args) {
  Menu menu = new Menu(Kontakt_Handler1);

  menu.SetTitle("Wybierz osobę:");
  char buffer[1024];
  char optionBuffer[8];
  for (int i = 0; i < sizeof(namee); i++) {
    Format(buffer, sizeof(buffer), "%s [%s]", namee1[i], functionn1[i]);
    Format(optionBuffer, sizeof(optionBuffer), "%d", i);
    menu.AddItem(optionBuffer, buffer);
  }
  menu.Display(client, 120);
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/

public int Kontakt_Handler1(Menu menu, MenuAction action, int client, int item) {
  if (action == MenuAction_Select) {
    char InfoBuffer[32];
    menu.GetItem(item, InfoBuffer, sizeof(InfoBuffer));
    int option = StringToInt(InfoBuffer);

    CPrintToChat(client, "{yellow}☆%s{grey}[%s]", namee1[option], functionn1[option]);
    CPrintToChat(client, "{grey}☆Steam: {default}[%s]", steam1[option]);
    CPrintToChat(client, "{lightred}☆Forum: {default}[%s]", forum1[option]);
    CPrintToChat(client, "{lightgreen}Wydrukowane również w konsoli!");

    PrintToConsole(client, "%s [%s]\nSteam: %s\nForum: %s", namee1[option], functionn1[option], forum1[option]);

    Kontakt(client, 0);
  }
}

/* Watermark by Chumi @ ErrorHead.pl
Przeznaczone do użytku jedynie na serwerze Deathrun Errorhead
© By Chumi 2020
Zakaz Kopiowania bez zgody autora!
*/