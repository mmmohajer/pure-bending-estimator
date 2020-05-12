function PureBendingSMADifferentSectionsGUI()
    %----------------------------------------------------------------------
    % Introducing Figure
    % Figure ('Property Name','Property Value')
    % Property Names are: Name, NumberTitle, UNits, Position and so on.
    %----------------------------------------------------------------------
    h_fig=figure('Name','Pure Bending of SMA Different Cross Sections','NumberTitle','off','Units','Normalized','Position',[0,0,1,0.96],'Menubar','None','Resize','On','Color','Black');
    %----------------------------------------------------------------------
    % Defining positions of panels
    %----------------------------------------------------------------------
    Panel_MaterialParameter_Left=0;
    Panel_MaterialParameter_Buttom=0.055;
    Panel_MaterialParameter_Width=0.25;
    Panel_MaterialParameter_Hight=0.945;
    Panel_LoadingParameter_Left=0.25;
    Panel_LoadingParameter_Buttom=0.75;
    Panel_LoadingParameter_Width=0.25;
    Panel_LoadingParameter_Hight=0.25;
    Panel_QNParameter_Left=0.25;
    Panel_QNParameter_Buttom=0.55;
    Panel_QNParameter_Width=0.25;
    Panel_QNParameter_Hight=0.2;
    Panel_SolverButtons_Left=0.25;
    Panel_SolverButtons_Buttom=0.055;
    Panel_SolverButtons_Width=0.25;
    Panel_SolverButtons_Hight=0.55-0.055;
    Panel_Results_Left=0.5;
    Panel_Results_Buttom=0.055;
    Panel_Results_Width=0.5;
    Panel_Results_Hight=0.945;
    %----------------------------------------------------------------------
    % Introducing Panel Properties
    %----------------------------------------------------------------------
    Panel_MaterialParameter_Color='Black';
    Panel_LoadingParameter_Color='Black';
    Panel_QNParameter_Color='Black';
    Panel_SolverButtons_Color='Black';
    Panel_Results_Color='White';
    %----------------------------------------------------------------------
    %Introducing Panels
    %----------------------------------------------------------------------
    Panel_MaterialParameter=uipanel(h_fig,'Units','Normalized','Position',[Panel_MaterialParameter_Left,Panel_MaterialParameter_Buttom,Panel_MaterialParameter_Width,Panel_MaterialParameter_Hight],'BackgroundColor',Panel_MaterialParameter_Color,'Title','Input Material Parameter','TitlePosition','CenterTop','ForeGroundColor','White','BorderWidth',5,'BorderType','etchedin','FontAngle','Italic','FontSize',14,'FontName','Cambria','FontWeight','Bold');
    Panel_LoadingParameter=uipanel(h_fig,'Units','Normalized','Position',[Panel_LoadingParameter_Left,Panel_LoadingParameter_Buttom,Panel_LoadingParameter_Width,Panel_LoadingParameter_Hight],'BackgroundColor',Panel_MaterialParameter_Color,'Title','Input Loading/Unloading Parameter','TitlePosition','CenterTop','ForeGroundColor','White','BorderWidth',5,'BorderType','etchedin','FontAngle','Italic','FontSize',14,'FontName','Cambria','FontWeight','Bold');
    Panel_QNParameter=uipanel(h_fig,'Units','Normalized','Position',[Panel_QNParameter_Left,Panel_QNParameter_Buttom,Panel_QNParameter_Width,Panel_QNParameter_Hight],'BackgroundColor',Panel_QNParameter_Color,'Title','Input Numerical Analysis Parameter','TitlePosition','CenterTop','ForeGroundColor','White','BorderWidth',5,'BorderType','etchedin','FontAngle','Italic','FontSize',14,'FontName','Cambria','FontWeight','Bold');
    Panel_SolverButtons=uipanel(h_fig,'Units','Normalized','Position',[Panel_SolverButtons_Left,Panel_SolverButtons_Buttom,Panel_SolverButtons_Width,Panel_SolverButtons_Hight],'BackgroundColor',Panel_SolverButtons_Color,'Title','Solver','TitlePosition','CenterTop','ForeGroundColor','White','BorderWidth',5,'BorderType','etchedin','FontAngle','Italic','FontSize',14,'FontName','Cambria','FontWeight','Bold');
    Panel_Results=uipanel(h_fig,'Units','Normalized','Position',[Panel_Results_Left,Panel_Results_Buttom,Panel_Results_Width,Panel_Results_Hight],'BackgroundColor',Panel_Results_Color,'Title','Results','TitlePosition','CenterTop','ForeGroundColor','Black','BorderWidth',5,'BorderType','etchedin','FontAngle','Italic','FontSize',14,'FontName','Cambria','FontWeight','Bold');
   %-----------------------------------------------------------------------
   % Components of Panel_Material_Parameter
   %-----------------------------------------------------------------------
   RadioButton_MaterialParameter_RhodS0=uicontrol(Panel_MaterialParameter,'Style','radiobutton','Units','Normalized','Position',[0.02 0.9 0.48 0.1],'BackgroundColor',Panel_MaterialParameter_Color,'Value',1,'Callback',@RadioButton_MaterialParameter_RhodS0_CallBack);
   RadioButton_MaterialParameter_RhodS0_Distinct=uicontrol(Panel_MaterialParameter,'Style','radiobutton','Units','Normalized','Position',[0.52 0.9 0.48 0.1],'BackgroundColor',Panel_MaterialParameter_Color,'Value',0,'Callback',@RadioButton_MaterialParameter_RhodS0_Distinct_CallBack);
   set(RadioButton_MaterialParameter_RhodS0,'String','<HTML><FONT COLOR="white"><font size="2.5"><b><i>Using the multiple of &rho &Delta;S<sub>0</sub></i></b></font></HTML>;');
   set(RadioButton_MaterialParameter_RhodS0_Distinct,'String','<HTML><FONT COLOR="white"><font size="2.5"><b><i>Using &rho & &Delta;S<sub>0</sub> distictively</i></b></font></HTML>;');
   Normalized_StaticText_Parameter_Height=0.04;
   Normalized_StaticText_Parameter_Width=0.45;
   Text_Material_Parameter=cell(15,1);
   Input_Material_Parameter=cell(15,1);
   for i=1:1:15
       First_ST_Bot=0.93-(Normalized_StaticText_Parameter_Height+0.02+(Normalized_StaticText_Parameter_Height/3));
       Text_Material_Parameter{i}=axes('Parent',Panel_MaterialParameter,'Position',[0.02,First_ST_Bot-((Normalized_StaticText_Parameter_Height+0.02)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'Color',Panel_MaterialParameter_Color,'XTick',[],'XTickLabel',[],'XColor',Panel_MaterialParameter_Color,'YTick',[],'YTickLabel',[],'YColor',Panel_MaterialParameter_Color);
       First_Edit_Bot=0.92-(Normalized_StaticText_Parameter_Height+0.02);
       Input_Material_Parameter{i}=uicontrol(Panel_MaterialParameter,'Style','edit','Units','Normalized','Position',[0.53,First_Edit_Bot-((Normalized_StaticText_Parameter_Height+0.02)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'BackgroundColor',[74/255 73/255 72/255],'FontWeight','Bold','ForegroundColor','Yellow','FontSize',10,'FontWeight','Bold','FontAngle','Italic');
   end
   InputTextPosition=[0.6 0.6 0];
   InputTextColor='White';
   InputTextSize=14;
   InputTextFont='Cambria';
   InputTextHA='Center';
   text('position',InputTextPosition,'interpreter','latex','string','$E_A (MPa)$','Parent',Text_Material_Parameter{1},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$E_M (MPa)$','Parent',Text_Material_Parameter{2},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$\alpha_A (\frac{1}{K})$','Parent',Text_Material_Parameter{3},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$\alpha_M (\frac{1}{K})$','Parent',Text_Material_Parameter{4},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$\rho \Delta S_0 (\frac{MPa}{K})$','Parent',Text_Material_Parameter{5},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$\rho (\frac{kg}{m^3})$','Parent',Text_Material_Parameter{6},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$\Delta S_0 (\frac{mm^2}{s^2 K})$','Parent',Text_Material_Parameter{7},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$H$','Parent',Text_Material_Parameter{8},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$T (K)$','Parent',Text_Material_Parameter{9},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$T_0 (K)$','Parent',Text_Material_Parameter{10},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$A_f (K)$','Parent',Text_Material_Parameter{11},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$A_s (K)$','Parent',Text_Material_Parameter{12},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$M_f (K)$','Parent',Text_Material_Parameter{13},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$M_s (K)$','Parent',Text_Material_Parameter{14},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','Mesh File Name','Parent',Text_Material_Parameter{15},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   set(Input_Material_Parameter{6},'Enable','Off');
   set(Input_Material_Parameter{7},'Enable','Off');
   %-----------------------------------------------------------------------
   % Components of Panel_Loading_Parameter
   %-----------------------------------------------------------------------
   Normalized_StaticText_Parameter_Height=0.15;
   Normalized_StaticText_Parameter_Width=0.45;
   Text_Loading_Parameter=cell(4,1);
   Input_Loading_Parameter=cell(4,1);
   for i=1:1:4
       First_ST_Bot=0.95-(Normalized_StaticText_Parameter_Height+0.02+(Normalized_StaticText_Parameter_Height/3));
       Text_Loading_Parameter{i}=axes('Parent',Panel_LoadingParameter,'Position',[0.02,First_ST_Bot-((Normalized_StaticText_Parameter_Height+0.075)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'Color',Panel_LoadingParameter_Color,'XTick',[],'XTickLabel',[],'XColor',Panel_LoadingParameter_Color,'YTick',[],'YTickLabel',[],'YColor',Panel_LoadingParameter_Color);
       First_Edit_Bot=0.92-(Normalized_StaticText_Parameter_Height+0.02);
       Input_Loading_Parameter{i}=uicontrol(Panel_LoadingParameter,'Style','edit','Units','Normalized','Position',[0.53,First_Edit_Bot-((Normalized_StaticText_Parameter_Height+0.075)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'BackgroundColor',[74/255 73/255 72/255],'FontWeight','Bold','ForegroundColor','Yellow','FontSize',10,'FontWeight','Bold','FontAngle','Italic');
   end
   InputTextPosition=[0.6 0.6 0];
   InputTextColor='White';
   InputTextSize=14;
   InputTextFont='Cambria';
   InputTextHA='Center';
   text('position',InputTextPosition,'interpreter','latex','string','$M_{max} (N.mm)$','Parent',Text_Loading_Parameter{1},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$t_0 (s)$','Parent',Text_Loading_Parameter{2},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$\theta (Rad)$','Parent',Text_Loading_Parameter{3},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$\Delta t (s)$','Parent',Text_Loading_Parameter{4},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   %-----------------------------------------------------------------------
   % Components of Panel_QN_Parameter
   %-----------------------------------------------------------------------
   Normalized_StaticText_Parameter_Height=0.2;
   Normalized_StaticText_Parameter_Width=0.45;
   Text_QN_Parameter=cell(3,1);
   Input_QN_Parameter=cell(3,1);
   for i=1:1:3
       First_ST_Bot=0.97-(Normalized_StaticText_Parameter_Height+0.02+(Normalized_StaticText_Parameter_Height/3));
       Text_QN_Parameter{i}=axes('Parent',Panel_QNParameter,'Position',[0.02,First_ST_Bot-((Normalized_StaticText_Parameter_Height+0.1)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'Color',Panel_QNParameter_Color,'XTick',[],'XTickLabel',[],'XColor',Panel_QNParameter_Color,'YTick',[],'YTickLabel',[],'YColor',Panel_QNParameter_Color);
       First_Edit_Bot=0.92-(Normalized_StaticText_Parameter_Height+0.02);
       Input_QN_Parameter{i}=uicontrol(Panel_QNParameter,'Style','edit','Units','Normalized','Position',[0.53,First_Edit_Bot-((Normalized_StaticText_Parameter_Height+0.1)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'BackgroundColor',[74/255 73/255 72/255],'FontWeight','Bold','ForegroundColor','Yellow','FontSize',10,'FontWeight','Bold','FontAngle','Italic');
   end
   InputTextPosition=[0.6 0.6 0];
   InputTextColor='White';
   InputTextSize=14;
   InputTextFont='Cambria';
   InputTextHA='Center';
   text('position',InputTextPosition,'interpreter','latex','string','$dx$','Parent',Text_QN_Parameter{1},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$Iteration_{max}$','Parent',Text_QN_Parameter{2},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$Tolerance$','Parent',Text_QN_Parameter{3},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   %-----------------------------------------------------------------------
   % Components of Panel_SolverButtons_Parameter
   %-----------------------------------------------------------------------
   Normalized_StaticText_Parameter_Height=0.07;
   Normalized_StaticText_Parameter_Width=0.45;
   Text_SolverButtons_Parameter=cell(3,1);
   Input_SolverButtons_Parameter=cell(3,1);
   Buttons_SolverButtons=cell(6,1);
   kText=0;
   kButton=0;
   for i=1:1:9
       if i==1||i==5||i==6
           kText=kText+1;
           First_ST_Bot=0.94-(Normalized_StaticText_Parameter_Height+0.02+(Normalized_StaticText_Parameter_Height/3));
           Text_SolverButtons_Parameter{kText}=axes('Parent',Panel_SolverButtons,'Position',[0.02,First_ST_Bot-((Normalized_StaticText_Parameter_Height+0.03)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'Color',Panel_SolverButtons_Color,'XTick',[],'XTickLabel',[],'XColor',Panel_SolverButtons_Color,'YTick',[],'YTickLabel',[],'YColor',Panel_SolverButtons_Color);
           First_Edit_Bot=0.92-(Normalized_StaticText_Parameter_Height+0.02);
           Input_SolverButtons_Parameter{kText}=uicontrol(Panel_SolverButtons,'Style','edit','Units','Normalized','Position',[0.53,First_Edit_Bot-((Normalized_StaticText_Parameter_Height+0.03)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'BackgroundColor',[74/255 73/255 72/255],'FontWeight','Bold','ForegroundColor','Yellow','FontSize',10,'FontWeight','Bold','FontAngle','Italic');
       else
           kButton=kButton+1;
           First_Edit_Bot=0.92-(Normalized_StaticText_Parameter_Height+0.02);
           Buttons_SolverButtons{kButton}=uicontrol(Panel_SolverButtons,'Style','Push','Units','Normalized','Position',[0.275,First_Edit_Bot-((Normalized_StaticText_Parameter_Height+0.03)*(i-1)),Normalized_StaticText_Parameter_Width,Normalized_StaticText_Parameter_Height],'FontSize',10,'FontWeight','Bold','FontAngle','Italic');
       end
   end
   InputTextPosition=[0.6 0.6 0];
   InputTextColor='White';
   InputTextSize=14;
   InputTextFont='Cambria';
   InputTextHA='Center';
   text('position',InputTextPosition,'interpreter','latex','string','$t_{Final} (s)$','Parent',Text_SolverButtons_Parameter{1},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$Node\ Number$','Parent',Text_SolverButtons_Parameter{2},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   text('position',InputTextPosition,'interpreter','latex','string','$t_{Final}\ for Curves (s)$','Parent',Text_SolverButtons_Parameter{3},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   set(Buttons_SolverButtons{1},'String','Solve','Callback',@PushButton_Solve_CallBack,'Tag','SolverButton');
   set(Buttons_SolverButtons{2},'String','Energy Disspation','Callback',@PushButton_Energy_CallBack,'Enable','Off');
   set(Buttons_SolverButtons{3},'String','Neutral Axis Parameters','Callback',@PushButton_NeutralAxis_CallBack,'Enable','Off');
   set(Buttons_SolverButtons{4},'String','Tecplot Output','Callback',@PushButton_Tecplot_CallBack,'Enable','Off');
   set(Buttons_SolverButtons{5},'String','Curves For Selected Node','Callback',@PushButton_NodalCurves_CallBack,'Enable','Off');
   set(Buttons_SolverButtons{6},'String','Save Data','Callback',@PushButton_Save_CallBack,'Enable','Off');
   set(Input_SolverButtons_Parameter{2},'Enable','Off');
   set(Input_SolverButtons_Parameter{3},'Enable','Off');
   %-----------------------------------------------------------------------
   % Components of Panel_Results
   % text('position',InputTextPosition,'interpreter','latex','string','Energy Dissipated Per Length($\frac{mj}{mm}): \quad 1.23$','Parent',Text_Results{2},'Color',InputTextColor,'FontSize',InputTextSize,'FontWeight','Bold','FontAngle','Italic','FontName',InputTextFont,'HorizontalAlignment',InputTextHA);
   %-----------------------------------------------------------------------
   Text_Results=cell(2,1);
   Text_Results{1}=TextUpdate(Panel_Results);
   set(Text_Results{1}.tx,'Visible','On');
   Text_Results{2}=uicontrol(Panel_Results,'Style','text','Units','Normalized','Position',[0.05 0.775 0.4 0.2],'BackgroundColor','White','FontWeight','Bold','ForegroundColor','Black','FontSize',10,'FontWeight','Bold','FontAngle','Italic');
   set(Text_Results{2},'Visible','Off');
   Axes_Panel_Results=cell(7,1);
   for i=1:1:4
       Axes_Panel_Results{i}=axes('Parent',Panel_Results,'units','Normalized','Position',[0.55 0.1+(0.125+0.1)*(i-1) 0.4 0.125]);
       set(Axes_Panel_Results{i},'Visible','Off','Color','Black','FontSize',10,'FontWeight','Bold','FontAngle','Italic','FontName','Cambria','XColor','Black','YColor','Black');
   end
   j=0;
   for i=5:1:7
       j=j+1;
       Axes_Panel_Results{i}=axes('Parent',Panel_Results,'units','Normalized','Position',[0.05 0.1+(0.125+0.1)*(j-1) 0.4 0.125]);
       set(Axes_Panel_Results{i},'Visible','Off');
   end
   %-----------------------------------------------------------------------
   % Call Back Functions
   %-----------------------------------------------------------------------
   %-----------------------------------------------------------------------
   % Call Back Functions of Panel_Material_Parameter
   %-----------------------------------------------------------------------
   function RadioButton_MaterialParameter_RhodS0_CallBack(src,eventdata)
       set(RadioButton_MaterialParameter_RhodS0,'Value',1);
       set(RadioButton_MaterialParameter_RhodS0_Distinct,'Value',0);
       set(Input_Material_Parameter{5},'Enable','On');
       set(Input_Material_Parameter{6},'Enable','Off');
       set(Input_Material_Parameter{7},'Enable','Off');
    end
   %-----------------------------------------------------------------------
   %-----------------------------------------------------------------------
    function RadioButton_MaterialParameter_RhodS0_Distinct_CallBack(src,eventdata)
       set(RadioButton_MaterialParameter_RhodS0,'Value',0);
       set(RadioButton_MaterialParameter_RhodS0_Distinct,'Value',1);
       set(Input_Material_Parameter{5},'Enable','Off');
       set(Input_Material_Parameter{6},'Enable','On');
       set(Input_Material_Parameter{7},'Enable','On');
    end
   %-----------------------------------------------------------------------
   %-----------------------------------------------------------------------
   %-----------------------------------------------------------------------
   % Call Back Functions of Panel_Solver
   % Message='';
   % for i=1:1:100
   %    pause(.1)
   %    set(ResultsTextBox.tx,'string',cat(1,get(ResultsTextBox.tx,'string'),{num2str(i)}))
   %    jhText1=findjobj(ResultsTextBox.tx);
   %    jhText1.setCaretPosition(jhText1.getDocument.getLength);
   %    je=jhText1.getComponent(0).getComponent(0);
   %    je.setCaretPosition(je.getDocument.getLength);
   % end
   %-----------------------------------------------------------------------
   function PushButton_Solve_CallBack(hObject,eventdata)
       %-------------------------------------------------------------------
       set(Text_Results{1}.tx,'Visible','On','String','');
       set(Text_Results{2},'Visible','Off','String','');
       for i=1:1:7
           set(Axes_Panel_Results{i},'Visible','off');
           set(allchild(Axes_Panel_Results{i}),'Visible','Off');
       end
       for i=2:1:6
           set(Buttons_SolverButtons{i},'Enable','Off');
       end
       set(Input_SolverButtons_Parameter{2},'Enable','Off');
       set(Input_SolverButtons_Parameter{3},'Enable','Off');
       %-------------------------------------------------------------------
       %-------------------------------------------------------------------
       % Read Parameters
       % MatPro=[E_A,E_M,Alpha_A,Alpha_M,H,dS0,Rho]
       % Spec_Temp=[T,T0,A_f,M_s,A_s,M_f]
       % LoadingPro=[TSpanLoading,M_Max,Tet_x,TStep]
       % QNPro=[Differentiate_Value,Maximum_Iteration_Number,Maximum_Tolerance]
       %-------------------------------------------------------------------
       MatPro=zeros(7,1);
       Spec_Temp=zeros(6,1);
       LoadingPro=zeros(4,1);
       QNPro=zeros(3,1);
       MatPro(1)=str2double(get(Input_Material_Parameter{1},'String'));
       MatPro(2)=str2double(get(Input_Material_Parameter{2},'String'));
       MatPro(3)=str2double(get(Input_Material_Parameter{3},'String'));
       MatPro(4)=str2double(get(Input_Material_Parameter{4},'String'));
       MatPro(5)=str2double(get(Input_Material_Parameter{8},'String'));
       EnterRhodS0Together=get(RadioButton_MaterialParameter_RhodS0,'Value');
       if EnterRhodS0Together==1
           MatPro(6)=str2double(get(Input_Material_Parameter{5},'String'));
           MatPro(7)=1;
       else
           MatPro(6)=str2double(get(Input_Material_Parameter{7},'String'));
           MatPro(7)=str2double(get(Input_Material_Parameter{6},'String'));
       end
       Spec_Temp(1)=str2double(get(Input_Material_Parameter{9},'String'));
       Spec_Temp(2)=str2double(get(Input_Material_Parameter{10},'String'));
       Spec_Temp(3)=str2double(get(Input_Material_Parameter{11},'String'));
       Spec_Temp(4)=str2double(get(Input_Material_Parameter{14},'String'));
       Spec_Temp(5)=str2double(get(Input_Material_Parameter{12},'String'));
       Spec_Temp(6)=str2double(get(Input_Material_Parameter{13},'String'));
       LoadingPro(1)=str2double(get(Input_Loading_Parameter{2},'String'));
       LoadingPro(2)=str2double(get(Input_Loading_Parameter{1},'String'));
       LoadingPro(1)=str2double(get(Input_Loading_Parameter{2},'String'));
       LoadingPro(3)=str2double(get(Input_Loading_Parameter{3},'String'));
       LoadingPro(4)=str2double(get(Input_Loading_Parameter{4},'String'));
       QNPro(1)=str2double(get(Input_QN_Parameter{1},'String'));
       QNPro(2)=str2double(get(Input_QN_Parameter{2},'String'));
       QNPro(3)=str2double(get(Input_QN_Parameter{3},'String'));
       TFinal=str2double(get(Input_SolverButtons_Parameter{1},'String'));
       MeshFileName=get(Input_Material_Parameter{15},'String');
       %-------------------------------------------------------------------
       % Programming Part
       %-------------------------------------------------------------------
       [Nodes,Elements,NumElements,NumNodes]=DataImporting(MeshFileName);
       t=LoadingPro(4):LoadingPro(4):TFinal;
       M_t=zeros(length(t),1);
       for i=1:1:length(t)
        M_t(i)=LoadingUnloadingFunction(t(i),LoadingPro(1),LoadingPro(2));
       end
       M_t_x=M_t*cos(LoadingPro(3));
       M_t_y=M_t*sin(LoadingPro(3));
       [~,ACen_x,ACen_y,I_x,I_y]=AreaProperties(Nodes,Elements,NumElements);
       GPar=GuessParameters(M_t_x(1),M_t_y(1),MatPro(1),I_x,I_y,LoadingPro(3));
       [Spec_Stresses,Spec_Strains]=SpeciaStressStrains(MatPro,Spec_Temp);
       Strain1SPT=zeros(NumElements,4);
       Strain2SPT=zeros(NumElements,4);
       Stress1SPT=zeros(NumElements,4);
       StrainFT_Xi_1SPT=zeros(NumElements,4);
       StrainFC_Xi_1SPT=zeros(NumElements,4);
       StrainRT_Xi_1SPT=zeros(NumElements,4);
       StrainRC_Xi_1SPT=zeros(NumElements,4);
       Xi1SPT=zeros(NumElements,4);
       TSlope1SPT=zeros(NumElements,4);
       SPar=zeros(length(t),3);
       StrainStore=cell(length(t)+1,1);
       StressStore=cell(length(t)+1,1);
       NeutralAxisParameters=zeros(length(t),3);
       TCorrectCalculated=zeros(length(t),1);
       Num_Iterations=zeros(length(t),1);
       CorrectCalculated=0;
       for TI=1:1:length(t)+1;
           for i=1:1:NumElements
               for j=1:1:4
                   x=Nodes(Elements(i,j),1);
                   y=Nodes(Elements(i,j),2);
                   if TI==1
                       Strain1SPT(i,j)=0;
                       Strain2SPT(i,j)=0;
                       Stress1SPT(i,j)=0;
                       [StrainFT_Xi_1SPT(i,j),StrainFC_Xi_1SPT(i,j),StrainRT_Xi_1SPT(i,j),StrainRC_Xi_1SPT(i,j)]=deal(Spec_Strains(1),Spec_Strains(3),Spec_Strains(6),Spec_Strains(8));
                       TSlope1SPT(i,j)=MatPro(1);
                       Xi1SPT(i,j)=0;
                   else
                       [Strain1SPT(i,j)]=StrainCalculator(x,y,ACen_x,ACen_y,SPar(TI-1,1),SPar(TI-1,2),SPar(TI-1,3));
                       if TI==2
                           Strain2SPT(i,j)=0;
                       else
                           [Strain2SPT(i,j)]=StrainCalculator(x,y,ACen_x,ACen_y,SPar(TI-2,1),SPar(TI-2,2),SPar(TI-2,3));
                       end
                       [Stress1SPT(i,j),StrainFT_Xi_1SPT(i,j),StrainFC_Xi_1SPT(i,j),StrainRT_Xi_1SPT(i,j),StrainRC_Xi_1SPT(i,j),TSlope1SPT(i,j),Xi1SPT(i,j)]=StressCalculator(Strain1SPT(i,j),MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT(i,j),StrainFC_Xi_1SPT(i,j),StrainRT_Xi_1SPT(i,j),StrainRC_Xi_1SPT(i,j),TSlope1SPT(i,j),Strain2SPT(i,j),Stress1SPT(i,j),Xi1SPT(i,j));
                   end
               end
           end
           if TI<=length(t)
               [SPar(TI,:),Num_Iterations(TI),Magnitude_Error]=QuasiNewtonStrainSolver(GPar,QNPro(1),QNPro(2),QNPro(3),MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT,StrainFC_Xi_1SPT,StrainRT_Xi_1SPT,StrainRC_Xi_1SPT,TSlope1SPT,Strain1SPT,Stress1SPT,NumElements,Nodes,Elements,M_t_x(TI),M_t_y(TI),ACen_x,ACen_y,Xi1SPT);
               if Num_Iterations(TI)<QNPro(2)
                   GPar=SPar(TI,:);
               end
               if Num_Iterations(TI)<QNPro(2)
                   set(Text_Results{1}.tx,'string',cat(1,get(Text_Results{1}.tx,'string'),{strcat('Just finished iteration  #',num2str(TI))},{strcat('Number of Iterations for Quasi Newton to be convergenced  =  ',num2str(Num_Iterations(TI)))}));
               else
                   set(Text_Results{1}.tx,'string',cat(1,get(Text_Results{1}.tx,'string'),{strcat('Just finished iteration  #',num2str(TI))},{strcat('The maximum number of iterations for Quasi Newton was not enough to be convergenced, Magnitude of Error for the last iteration  =  ',num2str(Magnitude_Error))}));
               end
               jhText1=findjobj(Text_Results{1}.tx);
               je=jhText1.getComponent(0).getComponent(0);
               je.setCaretPosition(je.getDocument.getLength);
           end
           if TI>1&&Num_Iterations(TI-1)<QNPro(2)
               CorrectCalculated=CorrectCalculated+1;
               StrainStore{CorrectCalculated}=Strain1SPT;
               StressStore{CorrectCalculated}=Stress1SPT;
               TCorrectCalculated(CorrectCalculated)=t(TI-1);
               NeutralAxisParameters(CorrectCalculated,:)=SPar(TI-1,:);
           end
       end
       set(Buttons_SolverButtons{2},'Enable','On');
       set(Buttons_SolverButtons{3},'Enable','On');
       %-------------------------------------------------------------------
       % Create Structures
       %-------------------------------------------------------------------
       StressStrainData=cell(CorrectCalculated+1,1);
       for i=2:1:CorrectCalculated+1
           StressStrainData{i}=struct('StressVal',StressStore{i-1},'StrainVal',StrainStore{i-1});
       end
       StressStrainData{1}=struct('Nodes',Nodes,'Elements',Elements,'NumElements',NumElements,'CorrectCalculated',CorrectCalculated,'NeutralAxisParametrs',NeutralAxisParameters,'Time',t,'Moment',M_t,'TimeStep',LoadingPro(4),'NumNodes',NumNodes,'TCorrectCalculated',TCorrectCalculated);
       set(hObject,'UserData',StressStrainData);
       %-------------------------------------------------------------------
       %-------------------------------------------------------------------
       for i=2:1:6
           set(Buttons_SolverButtons{i},'Enable','On');
       end
       set(Input_SolverButtons_Parameter{2},'Enable','On');
       set(Input_SolverButtons_Parameter{3},'Enable','On');
   end
   %-----------------------------------------------------------------------
   % h=findobj('Tag','SolverButton');
   % data=get(h,'UserData');
   % display(data{1}.Nodes);
   %-----------------------------------------------------------------------
   function PushButton_Energy_CallBack(hObject,eventdata)
       %-------------------------------------------------------------------
       %-------------------------------------------------------------------
       set(Buttons_SolverButtons{2},'Enable','Off');
       set(Text_Results{2},'String','');
       %-------------------------------------------------------------------
       %-------------------------------------------------------------------
       CalculatedDatas=findobj('Tag','SolverButton');
       PassedDatas=get(CalculatedDatas,'UserData');
       Nodes=PassedDatas{1}.Nodes;
       Elements=PassedDatas{1}.Elements;
       NumElements=PassedDatas{1}.NumElements;
       CorrectCalculated=PassedDatas{1}.CorrectCalculated;
       StressStore=cell(CorrectCalculated,1);
       StrainStore=cell(CorrectCalculated,1);
       for i=1:1:CorrectCalculated
           StressStore{i}=PassedDatas{i+1}.StressVal;
           StrainStore{i}=PassedDatas{i+1}.StrainVal;
       end
       X=zeros(4,1);
       Y=zeros(4,1);
       EnergyStored=0;
       for TI=1:1:CorrectCalculated
           for i=1:1:NumElements
               for j=1:1:4
                   X(j)=Nodes(Elements(i,j),1);
                   Y(j)=Nodes(Elements(i,j),2);
               end
               DX1=X(3)-X(1);
               DX2=X(4)-X(2);
               DY1=Y(3)-Y(1);
               DY2=Y(4)-Y(2);
               Area_Element_i=abs((1/2)*(DX1*DY2-DX2*DY1));
               for j=1:1:4
                   EnergyStored=EnergyStored+((StressStore{TI}(i,j)*StrainStore{TI}(i,j))*Area_Element_i);
               end
           end
       end
       EnergyStored=(1/4)*EnergyStored;
       %-------------------------------------------------------------------
       %-------------------------------------------------------------------
       set(Text_Results{1}.tx,'Visible','Off','String','');
       set(Text_Results{2},'Visible','On');
       set(Text_Results{2},'string',strcat('Energy Dissipated Per Length (mj/mm)  = ',num2str(EnergyStored)));
   end
   %-----------------------------------------------------------------------
   %-----------------------------------------------------------------------
    function PushButton_NeutralAxis_CallBack(hObject,eventdata)
        CalculatedDatas=findobj('Tag','SolverButton');
        PassedDatas=get(CalculatedDatas,'UserData');
        NeutralAxisParametrs=PassedDatas{1}.NeutralAxisParametrs;
        t=PassedDatas{1}.Time;
        M_t=PassedDatas{1}.Moment;
        TCorrectCalculated=PassedDatas{1}.TCorrectCalculated;
        CorrectCalculated=PassedDatas{1}.CorrectCalculated;
        %------------------------------------------------------------------
        %------------------------------------------------------------------
        NeutralAxisParametrs(:,2)=abs(rem(NeutralAxisParametrs(:,2),2*pi()));
        for i=1:1:size(NeutralAxisParametrs,1)
            a1=NeutralAxisParametrs(i,2);
            if a1>=0&&a1<=pi()/2
                NeutralAxisParametrs(i,2)=a1;
            elseif pi()/2<a1&&a1<=pi()
                NeutralAxisParametrs(i,2)=pi()-a1;
            elseif pi<a1&&a1<=3*pi()/2
                NeutralAxisParametrs(i,2)=a1-pi();
            else
                NeutralAxisParametrs(i,2)=2*pi-a1;
            end
            NeutralAxisParametrs(i,2)=NeutralAxisParametrs(i,2)*180/pi();
            NeutralAxisParametrs(i,2)=round(NeutralAxisParametrs(i,2)*10)/10;
        end
        NeutralAxisParametrs(:,3)=round(NeutralAxisParametrs(:,3)*10)/10;
        axes(Axes_Panel_Results{4});
        plot(t,M_t,'r','Linewidth',2);
        xlabel('t (S)');
        ylabel('M(t) (N.mm)');
        title('Loading/Unloading Plot');
        grid on;
        axes(Axes_Panel_Results{3});
        plot(TCorrectCalculated(1:1:CorrectCalculated),NeutralAxisParametrs(1:1:CorrectCalculated,1),'r','Linewidth',2);
        xlabel('t (S)');
        ylabel('\kappa(t)');
        title('Curvature Plot');
        grid on;
        axes(Axes_Panel_Results{2});
        plot(TCorrectCalculated(1:1:CorrectCalculated),NeutralAxisParametrs(1:1:CorrectCalculated,2),'r','Linewidth',2);
        xlabel('t (S)');
        ylabel('\beta(t)');
        title('Angle of Neutral Axis Plot');
        grid on;
        axes(Axes_Panel_Results{1});
        plot(TCorrectCalculated(1:1:CorrectCalculated),NeutralAxisParametrs(1:1:CorrectCalculated,3),'r','Linewidth',2);
        xlabel('t (S)');
        ylabel('z_s (t)');
        title('Deviation of Neutral Axis');
        grid on;
        set(Text_Results{1}.tx,'Visible','Off','String','');
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    function PushButton_NodalCurves_CallBack(hObject,eventdata)
        NodeNumber=str2double(get(Input_SolverButtons_Parameter{2},'String'));
        TFinalNode=str2double(get(Input_SolverButtons_Parameter{3},'String'));
        CalculatedDatas=findobj('Tag','SolverButton');
        PassedDatas=get(CalculatedDatas,'UserData');
        TimeStep=PassedDatas{1}.TimeStep;
        Elements=PassedDatas{1}.Elements;
        NumElements=PassedDatas{1}.NumElements;
        CorrectCalculated=PassedDatas{1}.CorrectCalculated;
        TCorrectCalculated=PassedDatas{1}.TCorrectCalculated;
        StressStore=cell(CorrectCalculated,1);
        StrainStore=cell(CorrectCalculated,1);
        for i=1:1:CorrectCalculated
            StressStore{i}=PassedDatas{i+1}.StressVal;
            StrainStore{i}=PassedDatas{i+1}.StrainVal;
        end
        for i=1:1:NumElements
            for j=1:1:4
                if Elements(i,j)==NodeNumber
                    ElementsNumberNode=i;
                    ComponentsofElementsNumberNode=j;
                    break;
                end
            end
        end
        t1=TimeStep:TimeStep:TFinalNode;
        if length(t1)>=CorrectCalculated
            t=TimeStep:TimeStep:(CorrectCalculated-1)*TimeStep;
        else
            t=TimeStep:TimeStep:TFinalNode;
        end
        STRAINPLOT=zeros(length(t),1);
        STRESSPLOT=zeros(length(t),1);
        TPLOT=zeros(length(t),1);
        for i=1:1:length(t)+1
            STRAINPLOT(i)=StrainStore{i}(ElementsNumberNode,ComponentsofElementsNumberNode);
            STRESSPLOT(i)=StressStore{i}(ElementsNumberNode,ComponentsofElementsNumberNode);
            TPLOT(i)=TCorrectCalculated(i);
        end
        axes(Axes_Panel_Results{5});
        plot(STRAINPLOT,STRESSPLOT,'r','Linewidth',2);
        xlabel('\epsilon');
        ylabel('\sigma (N/mm)');
        title('Strain-Stress Plot');
        grid on;
        axes(Axes_Panel_Results{6});
        plot(TPLOT,STRAINPLOT,'r','Linewidth',2);
        xlabel('t (S)');
        ylabel('\epsilon');
        title('Time-Strain Plot');
        grid on;
        axes(Axes_Panel_Results{7});
        plot(TPLOT,STRESSPLOT,'r','Linewidth',2);
        xlabel('t (S)');
        ylabel('\sigma (N/mm)');
        title('Time-Stress Plot');
        grid on;
        set(Text_Results{1}.tx,'Visible','Off','String','');
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    function PushButton_Tecplot_CallBack(hObject,eventdata)
        NodeNumber=str2double(get(Input_SolverButtons_Parameter{2},'String'));
        TFinalNode=str2double(get(Input_SolverButtons_Parameter{3},'String'));
        CalculatedDatas=findobj('Tag','SolverButton');
        PassedDatas=get(CalculatedDatas,'UserData');
        TimeStep=PassedDatas{1}.TimeStep;
        Elements=PassedDatas{1}.Elements;
        NumElements=PassedDatas{1}.NumElements;
        Nodes=PassedDatas{1}.Nodes;
        NumNodes=PassedDatas{1}.NumNodes;
        CorrectCalculated=PassedDatas{1}.CorrectCalculated;
        t1=TimeStep:TimeStep:TFinalNode;
        if length(t1)>=CorrectCalculated
            t=TimeStep:TimeStep:(CorrectCalculated)*TimeStep;
        else
            t=TimeStep:TimeStep:TFinalNode;
        end
        %------------------------------------------------------------------
        %------------------------------------------------------------------
        StressStore=PassedDatas{length(t)+1}.StressVal;
        StrainStore=PassedDatas{length(t)+1}.StrainVal;
        for i=1:1:NumElements
            for j=1:1:4
                Node_Number=Elements(i,j);
                Stress_Node(Node_Number)=StressStore(i,j);
                Strain_Node(Node_Number)=StrainStore(i,j);
            end
        end
        Results(NumNodes,Elements,Nodes,Stress_Node,Strain_Node)
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
    function PushButton_Save_CallBack(hObject,eventdata)
        NodeNumber=str2double(get(Input_SolverButtons_Parameter{2},'String'));
        TFinalNode=str2double(get(Input_SolverButtons_Parameter{3},'String'));
        CalculatedDatas=findobj('Tag','SolverButton');
        PassedDatas=get(CalculatedDatas,'UserData');
        TimeStep=PassedDatas{1}.TimeStep;
        Elements=PassedDatas{1}.Elements;
        NumElements=PassedDatas{1}.NumElements;
        CorrectCalculated=PassedDatas{1}.CorrectCalculated;
        TCorrectCalculated=PassedDatas{1}.TCorrectCalculated;
        StressStore=cell(CorrectCalculated,1);
        StrainStore=cell(CorrectCalculated,1);
        for i=1:1:CorrectCalculated
            StressStore{i}=PassedDatas{i+1}.StressVal;
            StrainStore{i}=PassedDatas{i+1}.StrainVal;
        end
        for i=1:1:NumElements
            for j=1:1:4
                if Elements(i,j)==NodeNumber
                    ElementsNumberNode=i;
                    ComponentsofElementsNumberNode=j;
                    break;
                end
            end
        end
        t1=TimeStep:TimeStep:TFinalNode;
        if length(t1)>=CorrectCalculated
            t=TimeStep:TimeStep:(CorrectCalculated-1)*TimeStep;
        else
            t=TimeStep:TimeStep:TFinalNode;
        end
        STRAINPLOT=zeros(length(t),1);
        STRESSPLOT=zeros(length(t),1);
        TPLOT=zeros(length(t),1);
        for i=1:1:length(t)+1
            STRAINPLOT(i)=StrainStore{i}(ElementsNumberNode,ComponentsofElementsNumberNode);
            STRESSPLOT(i)=StressStore{i}(ElementsNumberNode,ComponentsofElementsNumberNode);
            TPLOT(i)=TCorrectCalculated(i);
        end
        StressStrainData(:,1)=STRAINPLOT;
        StressStrainData(:,2)=STRESSPLOT;
        StressStrainData(:,3)=TPLOT;
        %------------------------------------------------------------------
        %------------------------------------------------------------------
        NeutralAxisParametrs=PassedDatas{1}.NeutralAxisParametrs;
        NeutralAxisParametrs(:,2)=abs(rem(NeutralAxisParametrs(:,2),2*pi()));
        for i=1:1:size(NeutralAxisParametrs,1)
            a1=NeutralAxisParametrs(i,2);
            a2=pi()-NeutralAxisParametrs(i,2);
            if a1<a2
                NeutralAxisParametrs(i,2)=a1;
            else
                NeutralAxisParametrs(i,2)=-a2;
            end
            NeutralAxisParametrs(i,2)=NeutralAxisParametrs(i,2)*180/pi();
            NeutralAxisParametrs(i,2)=round(NeutralAxisParametrs(i,2)*10)/10;
        end
        NeutralAxisParametrs(:,3)=round(NeutralAxisParametrs(:,3)*10)/10;
        NeutralAxisParametrs(:,3)=round(NeutralAxisParametrs(:,3)*10)/10;
        save('StressStrainResults.txt','StressStrainData','-ascii');
        save('NeutralAxisResults.txt','NeutralAxisParametrs','-ascii');
    end
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [ResultsTextBox]=TextUpdate(Panel_Results)
    ResultsTextBox.tx=uicontrol(Panel_Results,'style','edit','units','Normalized','position',[0 0 1 1],'backgroundcolor','White','HorizontalAlign','left','min',0,'max',2,'enable','inactive','ForegroundColor','Black','FontSize',12,'FontWeight','bold','FontAngle','Italic');
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%%
% Explanation: fgetl(GID) --> Go to Next Line in Notepad
% fscanf(GID,'%e',[4,inf]) --> Read the data with the format float number
% (e)=Formatspc
%%
%--------------------------------------------------------------------------
function [Nodes,Elements,NumElements,NumNodes]=DataImporting(MeshFileName)
   GID=fopen(MeshFileName,'r');
   fgetl(GID);
   fgetl(GID);
   Nodes=fscanf(GID,'%e',[4,inf]);
   Nodes=Nodes';
   fgetl(GID);
   fgetl(GID);
   fgetl(GID);
   Elements=fscanf(GID,'%e',[5,inf]);
   Elements=Elements';
   fclose(GID);
   Nodes(:,[1,4])=[];
   Elements(:,1)=[];
   NumElements=length(Elements);
   NumNodes=length(Nodes);
end
%--------------------------------------------------------------------------
%%
% Define Function M(t), such that: Moment_t = Moment at the time of t
% TimeSpan_Loading = Time-span of loading/unloading
% Moment_Max = Maximum value of applied moment 
%%
%--------------------------------------------------------------------------
function [M_t]=LoadingUnloadingFunction(t,TSpanLoading,M_Max)
    if t<=TSpanLoading
        M_t=(M_Max/TSpanLoading)*t;
    elseif t>TSpanLoading&&t<=3*TSpanLoading
        M_t=(-M_Max/TSpanLoading)*(t-2*TSpanLoading);
    elseif t>3*TSpanLoading&&t<=4*TSpanLoading
        M_t=(M_Max/TSpanLoading)*(t-4*TSpanLoading);
    end
end
%--------------------------------------------------------------------------
%%
% Through this function, the properties of the surface would be calculated
%%
%--------------------------------------------------------------------------
function [TotArea,ACen_x,ACen_y,I_x,I_y]=AreaProperties(Nodes,Elements,Num_Elements)
    Q_x=0;
    Q_y=0;
    TotArea=0;
    I_x=0;
    I_y=0;
    X=zeros(4,1);
    Y=zeros(4,1);
    for i=1:1:Num_Elements
        for j=1:1:4
            X(j)=Nodes(Elements(i,j),1);
            Y(j)=Nodes(Elements(i,j),2);
        end
        DX1=X(3)-X(1);
        DX2=X(4)-X(2);
        DY1=Y(3)-Y(1);
        DY2=Y(4)-Y(2);
        A_i=abs((1/2)*(DX1*DY2-DX2*DY1));
        XBar_i=(1/4)*(X(1)+X(2)+X(3)+X(4));
        YBar_i=(1/4)*(Y(1)+Y(2)+Y(3)+Y(4));
        Q_x=Q_x+(XBar_i*A_i);
        Q_y=Q_y+(YBar_i*A_i);
        I_x=I_x+((YBar_i^2)*A_i);
        I_y=I_y+((XBar_i^2)*A_i);
        TotArea=TotArea+A_i;        
    end
    ACen_x=Q_x/TotArea;
    ACen_y=Q_y/TotArea;
    I_x=I_x+(TotArea*ACen_y^2);
    I_y=I_y+(TotArea*ACen_x^2);
end
%--------------------------------------------------------------------------
%%
% Guess a value for parameters "Beta", "Kappa" and "Z_s" in order to 
% calculate strain
%%
%--------------------------------------------------------------------------
function [GPar]=GuessParameters(M_x,M_y,E,I_X,I_y,Ang_x)
    Kappa_x=M_x/(E*I_X);
    Kappa_y=M_y/(E*I_y);
    Kappa=1/2*(Kappa_x+Kappa_y);
    Beta=Ang_x;
    Ys=0;
    GPar=[Kappa,Beta,Ys];
end
%--------------------------------------------------------------------------
% SStressFTT=Start_Stress_Forward_Transient_Tension
% FStressFTT=Final_Stress_Forward_Transient_Tension
% FStressRTT=Final_Stress_Reverse_Transient_Tension
% SStressRTT=Start_Stress_Reverse_Transient_Tension
% SStrainFTT=Start_Strain_Forward_Transient_Tension
% FStrainFTT=Final_Strain_Forward_Transient_Tension
% SStrainFTC=Start_Strain_Forward_Transient_Compression
% FStrainFTC=Final_Strain_Forward_Transient_Compression
% FStrainRTT=Final_Strain_Reverse_Transient_Tension
% SStrainRTT=Start_Strain_Reverse_Transient_Tension
% FStrainRTC=Final_Strain_Reverse_Transient_Compression
% SStrainRTC=Start_Strain_Reverse_Transient_Compression
%--------------------------------------------------------------------------
function [Spec_Stresses,Spec_Strains]=SpeciaStressStrains(MatPro,Spec_Temp)
    [E_A,E_M,Alp_A,Alp_M,H,dS0,Rho]=deal(MatPro(1),MatPro(2),MatPro(3),MatPro(4),MatPro(5),MatPro(6),MatPro(7));
    [T,T0,Af,Ms,As,Mf]=deal(Spec_Temp(1),Spec_Temp(2),Spec_Temp(3),Spec_Temp(4),Spec_Temp(5),Spec_Temp(6));
    dS=(-(E_M-E_A))/(E_A*E_M);
    dAlp=Alp_M-Alp_A;
    b_M=(-dS0)*(Ms-Mf);
    b_A=(-dS0)*(Af-As);
    S_A=1/E_A;
    Gamma_1FP=dS/(2*b_M*Rho);
    Gamma_2FP=H/(b_M*Rho);
    Gamma_3FP=((T-Ms)*dS0)/b_M;
    PS=roots([Gamma_1FP,Gamma_2FP,Gamma_3FP]);
    for i=1:1:length(PS)
        if imag(PS(i))==0
            if PS(i)>=0
                SStressFTT=PS(i);
                break;
            end
        end
    end
    PS=roots([Gamma_1FP,Gamma_2FP,Gamma_3FP-1]);
    for i=1:1:length(PS)
        if imag(PS(i))==0
            if PS(i)>=0
                FStressFTT=PS(i);
                break;
            end
        end
    end
    Gamma_1RP=dS/(2*b_A*Rho);
    Gamma_2RP=H/(b_A*Rho);
    Gamma_3RP=((T-Af)*dS0)/b_A;
    PS=roots([Gamma_1RP,Gamma_2RP,Gamma_3RP]);
    for i=1:1:length(PS)
        if imag(PS(i))==0
            if PS(i)>=0
                FStressRTT=PS(i);
                break;
            end
        end
    end
    PS=roots([Gamma_1RP,Gamma_2RP,Gamma_3RP-1]);
    for i=1:1:length(PS)
        if imag(PS(i))==0
            if PS(i)>=0
                SStressRTT=PS(i);
                break;
            end
        end
    end
    SXi0=S_A;
    SXi1=S_A+dS;
    AlpXi0=Alp_A;
    AlpXi1=Alp_A+dAlp;
    SStrainFTT=(SXi0*SStressFTT)+(AlpXi0*(T-T0))+((H/(Rho*b_M))*((SStressFTT*H)+((1/2)*dS*SStressFTT^2)+(Rho*dS0*(T-Ms))));
    FStrainFTT=(SXi1*FStressFTT)+(AlpXi1*(T-T0))+((H/(Rho*b_M))*((FStressFTT*H)+((1/2)*dS*FStressFTT^2)+(Rho*dS0*(T-Ms))));
    SStrainFTC=-(SXi0*SStressFTT)+(AlpXi0*(T-T0))-((H/(Rho*b_M))*((SStressFTT*H)+((1/2)*dS*SStressFTT^2)+(Rho*dS0*(T-Ms))));
    FStrainFTC=-(SXi1*FStressFTT)+(AlpXi1*(T-T0))-((H/(Rho*b_M))*((FStressFTT*H)+((1/2)*dS*FStressFTT^2)+(Rho*dS0*(T-Ms))));
    FStrainRTT=(SXi0*FStressRTT)+(AlpXi0*(T-T0))+((H/(Rho*b_A))*((FStressRTT*H)+((1/2)*dS*FStressRTT^2)+(Rho*dS0*(T-Af))));
    SStrainRTT=(SXi1*SStressRTT)+(AlpXi1*(T-T0))+((H/(Rho*b_A))*((SStressRTT*H)+((1/2)*dS*SStressRTT^2)+(Rho*dS0*(T-Af))));
    FStrainRTC=-(SXi0*FStressRTT)+(AlpXi0*(T-T0))-((H/(Rho*b_A))*((FStressRTT*H)+((1/2)*dS*FStressRTT^2)+(Rho*dS0*(T-Af))));
    SStrainRTC=-(SXi1*SStressRTT)+(AlpXi1*(T-T0))-((H/(Rho*b_A))*((SStressRTT*H)+((1/2)*dS*SStressRTT^2)+(Rho*dS0*(T-Af))));
    Spec_Stresses=[SStressFTT,FStressFTT,FStressRTT,SStressRTT];
    Spec_Strains=[SStrainFTT,FStrainFTT,SStrainFTC,FStrainFTC,FStrainRTT,SStrainRTT,FStrainRTC,SStrainRTC];
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function [UnknownAnswers,Num_Iterations,Magnitude_Error]=QuasiNewtonStrainSolver(GPar,Differentiate_Value,Maximum_Iteration_Number,Maximum_Tolerance,MatPro,Spec_Temp,...
    Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT,StrainFC_Xi_1SPT,StrainRT_Xi_1SPT,StrainRC_Xi_1SPT,TSlope1SPT,Strain1SPT,Stress1SPT,Num_Elements,Nodes,Elements,M_x,M_y,...
    ACen_x,ACen_y,Xi1SPT)
    [EqCalculated_GPar,Num_Equations]=Functions(GPar,MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT,StrainFC_Xi_1SPT,StrainRT_Xi_1SPT,...
        StrainRC_Xi_1SPT,TSlope1SPT,Strain1SPT,Stress1SPT,Num_Elements,Nodes,Elements,M_x,M_y,ACen_x,ACen_y,Xi1SPT);
    Jacobian=zeros(Num_Equations,Num_Equations);
    for i=1:1:Num_Equations
        for j=1:1:Num_Equations
            GPar(j)=GPar(j)+Differentiate_Value;
            [FUP,~]=Functions(GPar,MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT,StrainFC_Xi_1SPT,StrainRT_Xi_1SPT,StrainRC_Xi_1SPT,TSlope1SPT,Strain1SPT,...
                Stress1SPT,Num_Elements,Nodes,Elements,M_x,M_y,ACen_x,ACen_y,Xi1SPT);
            Jacobian(i,j)=(FUP(i)-EqCalculated_GPar(i))/Differentiate_Value;
            GPar(j)=GPar(j)-Differentiate_Value;
        end
    end
    A=pinv(Jacobian);
    v=transpose(EqCalculated_GPar);
    s=-A*v;
    x=GPar+transpose(s);
    Magnitude_Error=norm(s);
    Num_Iterations=1;
    while Num_Iterations<=Maximum_Iteration_Number&&Magnitude_Error>Maximum_Tolerance
        w=v;
        [EqCalculated_GPar,~]=Functions(x,MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT,StrainFC_Xi_1SPT,StrainRT_Xi_1SPT,StrainRC_Xi_1SPT,...
            TSlope1SPT,Strain1SPT,Stress1SPT,Num_Elements,Nodes,Elements,M_x,M_y,ACen_x,ACen_y,Xi1SPT);
        v=transpose(EqCalculated_GPar);
        y=v-w;
        z=-A*y;
        p=-transpose(s)*z;
        ut=transpose(s)*A;
        A=A+((1/p)*((s+z)*ut));
        s=-A*v;
        x=x+transpose(s);
        Magnitude_Error=norm(s);
        if Magnitude_Error<Maximum_Tolerance
            break;
        else
            Num_Iterations=Num_Iterations+1;
        end
    end
    UnknownAnswers=x;
end
%--------------------------------------------------------------------------
% GPar = Guessed unknown parameters
%--------------------------------------------------------------------------
function [Eq,Num_Eq]=Functions(GPar,MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT,StrainFC_Xi_1SPT,StrainRT_Xi_1SPT,StrainRC_Xi_1SPT,...
    TSlope1SPT,Strain1SPT,Stress1SPT,Num_Elements,Nodes,Elements,M_x,M_y,ACen_x,ACen_y,Xi1SPT)
    Num_Eq=3;
    Eq=[0,0,0];
    X=zeros(4,1);
    Y=zeros(4,1);
    for i=1:1:Num_Elements
        for j=1:1:4
            X(j)=Nodes(Elements(i,j),1);
            Y(j)=Nodes(Elements(i,j),2);
        end
        DX1=X(3)-X(1);
        DX2=X(4)-X(2);
        DY1=Y(3)-Y(1);
        DY2=Y(4)-Y(2);
        Area_Element_i=abs((1/2)*(DX1*DY2-DX2*DY1));
        for j=1:1:4
            CStrain=StrainCalculator(X(j),Y(j),ACen_x,ACen_y,GPar(1),GPar(2),GPar(3));
            [CStress,~,~,~,~,~,~]=StressCalculator(CStrain,MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT(i,j),StrainFC_Xi_1SPT(i,j),StrainRT_Xi_1SPT(i,j),...
                StrainRC_Xi_1SPT(i,j),TSlope1SPT(i,j),Strain1SPT(i,j),Stress1SPT(i,j),Xi1SPT(i,j));
            Eq(1)=Eq(1)+(CStress*Area_Element_i);
            Eq(2)=Eq(2)+(CStress*Y(j)*Area_Element_i);
            Eq(3)=Eq(3)+(CStress*X(j)*Area_Element_i);
        end
    end
    Eq(1)=(1/4)*Eq(1);
    Eq(2)=(1/4)*Eq(2)+M_x;
    Eq(3)=(1/4)*Eq(3)-M_y;
end
%--------------------------------------------------------------------------
% CStrain = Current Strain
% ACen_x = Area Center in the direction of "x"
% ACen_y = Area Center in the direction of "y"
%--------------------------------------------------------------------------
function [CStrain]=StrainCalculator(x,y,ACen_x,ACen_y,Kappa,Beta,Ys)
    CStrain=-Kappa*(-(x-ACen_x)*sin(Beta)+(y-ACen_y)*cos(Beta)-Ys);
end
%--------------------------------------------------------------------------
% CStress = Current Stress , CStrain = Current Strain
% StrainFT_Xi_1SPT = Strain on the forward transient tensioned curve, 
% calculated by Xi from the previous time step
% StrainFC_Xi_1SPT = Strain on the forward transient compressed curve 
% calculated by Xi from the previous time step
% StrainRT_Xi_1SPT = Strain on the reverse transient tensioned curve 
% calculated by Xi from the previous time step
% StrainRC_Xi_1SPT = Strain on the reverse transient compressed curve 
% calculated by Xi from the previous time step
% TSlope1SPT = Calculated slope of reverse loading by Xi from the previous 
% time step
%--------------------------------------------------------------------------
function [CStress,CStrainFT_Xi,CStrainFC_Xi,CStrainRT_Xi,CStrainRC_Xi,TSlope,CXi]=StressCalculator(CStrain,MatPro,Spec_Temp,Spec_Strains,Spec_Stresses,StrainFT_Xi_1SPT,...
    StrainFC_Xi_1SPT,StrainRT_Xi_1SPT,StrainRC_Xi_1SPT,TSlope_1SPT,Strain1SPT,Stress1SPT,Xi1SPT,CXi)
    [E_A,E_M,Alp_A,Alp_M,H,dS0,Rho]=deal(MatPro(1),MatPro(2),MatPro(3),MatPro(4),MatPro(5),MatPro(6),MatPro(7));
    [T,T0,Af,Ms,As,Mf]=deal(Spec_Temp(1),Spec_Temp(2),Spec_Temp(3),Spec_Temp(4),Spec_Temp(5),Spec_Temp(6));
    [SStrainFTT,FStrainFTT,SStrainFTC,FStrainFTC,FStrainRTT,SStrainRTT,FStrainRTC,SStrainRTC]=...
        deal(Spec_Strains(1),Spec_Strains(2),Spec_Strains(3),Spec_Strains(4),Spec_Strains(5),Spec_Strains(6),Spec_Strains(7),Spec_Strains(8));
    [SStressFTT,FStressFTT,FStressRTT,SStressRTT]=deal(Spec_Stresses(1),Spec_Stresses(2),Spec_Stresses(3),Spec_Stresses(4));
    Strain0=Alp_A*(T-T0);
    dS=(-(E_M-E_A))/(E_A*E_M);
    b_M=(-dS0)*(Ms-Mf);
    b_A=(-dS0)*(Af-As);
    S_A=1/E_A;
    dCStrain=CStrain-Strain1SPT;
    if CStrain>=Strain0&&dCStrain>=0
        if CStrain<=SStrainFTT
            if Xi1SPT==0
                CStress=E_A*(CStrain-(Alp_A*(T-T0)));
                CStrainFT_Xi=SStrainFTT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=SStrainRTT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=E_A;
                CXi=0;
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=StrainFT_Xi_1SPT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=StrainRT_Xi_1SPT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        elseif CStrain>=FStrainFTT
            CStress=E_M*(CStrain-(Alp_M*(T-T0))-H);
            CStrainFT_Xi=SStrainFTT;
            CStrainFC_Xi=SStrainFTC;
            CStrainRT_Xi=SStrainRTT;
            CStrainRC_Xi=SStrainRTC;
            TSlope=E_M;
            CXi=1;
        elseif SStrainFTT<=CStrain&&CStrain<=FStrainFTT
            if CStrain>=StrainFT_Xi_1SPT
                a1=dS^2/(2*b_M*Rho);
                a2=(3*H*dS)/(2*b_M*Rho);
                a3=S_A+((dS*dS0*(T-Ms))/b_M)+(H^2/(b_M*Rho));
                a4=(Alp_A*(T-T0))+((H*(T-Ms)*dS0)/b_M);
                PS=roots([a1,a2,a3,a4-CStrain]);
                for i=1:1:length(PS)
                    if imag(PS(i))==0
                        if SStressFTT<=PS(i)&&PS(i)<=FStressFTT
                            CStress=PS(i);
                            break;
                        end
                    end
                end
                Gamma_1F=dS/(2*b_M*Rho);
                Gamma_2F=H/(b_M*Rho);
                Gamma_3F=((T-Ms)*dS0)/b_M;
                CXi=Gamma_1F*CStress^2+Gamma_2F*CStress+Gamma_3F;
                if 1>=CXi&&CXi>=Xi1SPT
                    Gamma_1R=dS/(2*b_A*Rho);
                    Gamma_2R=H/(b_A*Rho);
                    Gamma_3R=((T-Af)*dS0)/b_A;
                    PS=roots([Gamma_1R,Gamma_2R,Gamma_3R-CXi]);
                    for i=1:1:length(PS)
                        if imag(PS(i))==0
                            if FStressRTT<=PS(i)&&PS(i)<=SStressRTT
                                CStressRT_Xi=PS(i);
                                break;
                            end
                        end
                    end
                    S=S_A+(CXi*dS);
                    Alp=Alp_A+(CXi*dS);
                    CStrainFT_Xi=CStrain;
                    CStrainRT_Xi=(S*CStressRT_Xi)+(Alp*(T-T0))+(H/(Rho*b_A))*((CStressRT_Xi*H)+((1/2)*(dS*CStressRT_Xi^2))+((Rho*dS0)*(T-Af)));        
                    TSlope=abs((CStress-CStressRT_Xi)/(CStrain-CStrainRT_Xi));
                    [CStrainFC_Xi,CStrainRC_Xi]=deal(SStrainFTC,SStrainRTC);
                else
                    CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                    CStrainFT_Xi=StrainFT_Xi_1SPT;
                    CStrainFC_Xi=SStrainFTC;
                    CStrainRT_Xi=StrainRT_Xi_1SPT;
                    CStrainRC_Xi=SStrainRTC;
                    TSlope=TSlope_1SPT;
                    CXi=Xi1SPT;
                end
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=StrainFT_Xi_1SPT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=StrainRT_Xi_1SPT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        end
    end
    if CStrain<=Strain0&&dCStrain<=0
        if CStrain>=SStrainFTC
            if Xi1SPT==0
                CStress=E_A*(CStrain-(Alp_A*(T-T0)));
                CStrainFT_Xi=SStrainFTT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=SStrainRTT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=E_A;
                CXi=0;
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=SStrainFTT;
                CStrainFC_Xi=StrainFC_Xi_1SPT;
                CStrainRT_Xi=SStrainRTT;
                CStrainRC_Xi=StrainRC_Xi_1SPT;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        elseif CStrain<=FStrainFTC
            CStress=E_M*(CStrain-(Alp_M*(T-T0))+H);
            CStrainFT_Xi=SStrainFTT;
            CStrainFC_Xi=SStrainFTC;
            CStrainRT_Xi=SStrainRTT;
            CStrainRC_Xi=SStrainRTC;
            TSlope=E_M;
            CXi=1;
        elseif FStrainFTC<=CStrain&&CStrain<=SStrainFTC
            if CStrain<=StrainFC_Xi_1SPT
                a1=dS^2/(2*b_M*Rho);
                a2=-(3*H*dS)/(2*b_M*Rho);
                a3=S_A+((dS*dS0*(T-Ms))/b_M)+(H^2/(b_M*Rho));
                a4=(Alp_A*(T-T0))-((H*(T-Ms)*dS0)/b_M);
                PS=roots([a1,a2,a3,a4-CStrain]);
                for i=1:1:length(PS)
                    if imag(PS(i))==0
                        if -FStressFTT<=PS(i)&&PS(i)<=-SStressFTT
                            CStress=PS(i);
                            break;
                        end
                    end
                end
                Gamma_1F=dS/(2*b_M*Rho);
                Gamma_2F=-H/(b_M*Rho);
                Gamma_3F=((T-Ms)*dS0)/b_M;
                CXi=Gamma_1F*CStress^2+Gamma_2F*CStress+Gamma_3F;
                if 1>=CXi&&CXi>=Xi1SPT
                    Gamma_1R=dS/(2*b_A*Rho);
                    Gamma_2R=-H/(b_A*Rho);
                    Gamma_3R=((T-Af)*dS0)/b_A;
                    PS=roots([Gamma_1R,Gamma_2R,Gamma_3R-CXi]);
                    for i=1:1:length(PS)
                        if imag(PS(i))==0
                            if -SStressRTT<=PS(i)&&PS(i)<=-FStressRTT
                                CStressRC_Xi=PS(i);
                                break;
                            end
                        end
                    end
                    S=S_A+(CXi*dS);
                    Alp=Alp_A+(CXi*dS);
                    CStrainFC_Xi=CStrain;
                    CStrainRC_Xi=(S*CStressRC_Xi)+(Alp*(T-T0))-(H/(Rho*b_A))*((-CStressRC_Xi*H)+((1/2)*(dS*CStressRC_Xi^2))+((Rho*dS0)*(T-Af)));        
                    TSlope=abs((CStress-CStressRC_Xi)/(CStrain-CStrainRC_Xi));
                    [CStrainFT_Xi,CStrainRT_Xi]=deal(SStrainFTT,SStrainRTT);
                else
                    CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                    CStrainFT_Xi=SStrainFTT;
                    CStrainFC_Xi=StrainFC_Xi_1SPT;
                    CStrainRT_Xi=SStrainRTT;
                    CStrainRC_Xi=StrainRC_Xi_1SPT;
                    TSlope=TSlope_1SPT;
                    CXi=Xi1SPT;
                end
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=SStrainFTT;
                CStrainFC_Xi=StrainFC_Xi_1SPT;
                CStrainRT_Xi=SStrainRTT;
                CStrainRC_Xi=StrainRC_Xi_1SPT;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        end
    end
    if CStrain>=Strain0&&dCStrain<=0
        if CStrain<=FStrainRTT
            CStress=E_A*(CStrain-(Alp_A*(T-T0)));
            CStrainFT_Xi=SStrainFTT;
            CStrainFC_Xi=SStrainFTC;
            CStrainRT_Xi=SStrainRTT;
            CStrainRC_Xi=SStrainRTC;
            TSlope=E_A;
            CXi=0;
        elseif CStrain>=SStrainRTT
            if Xi1SPT==1
                CStress=E_M*(CStrain-(Alp_M*(T-T0))-H);
                CStrainFT_Xi=SStrainFTT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=SStrainRTT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=E_M;
                CXi=1;
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=StrainFT_Xi_1SPT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=StrainRT_Xi_1SPT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        elseif FStrainRTT<=CStrain&&CStrain<=SStrainRTT
            if CStrain<StrainRT_Xi_1SPT
                a1=dS^2/(2*b_A*Rho);
                a2=(3*H*dS)/(2*b_A*Rho);
                a3=S_A+((dS*dS0*(T-Af))/b_A)+(H^2/(b_A*Rho));
                a4=(Alp_A*(T-T0))+((H*(T-Af)*dS0)/b_A);
                PS=roots([a1,a2,a3,a4-CStrain]);
                for i=1:1:length(PS)
                    if imag(PS(i))==0
                        if FStressRTT<=PS(i)&&PS(i)<=SStressRTT
                            CStress=PS(i);
                            break;
                        end
                    end
                end
                Gamma_1R=dS/(2*b_A*Rho);
                Gamma_2R=H/(b_A*Rho);
                Gamma_3R=((T-Af)*dS0)/b_A;
                CXi=Gamma_1R*CStress^2+Gamma_2R*CStress+Gamma_3R;
                if 0<=CXi&&CXi<=Xi1SPT
                    Gamma_1F=dS/(2*b_M*Rho);
                    Gamma_2F=H/(b_M*Rho);
                    Gamma_3F=((T-Ms)*dS0)/b_M;
                    PS=roots([Gamma_1F,Gamma_2F,Gamma_3F-CXi]);
                    for i=1:1:length(PS)
                        if imag(PS(i))==0
                            if SStressFTT<=PS(i)&&PS(i)<=FStressFTT
                                CStressFT_Xi=PS(i);
                                break;
                            end
                        end
                    end
                    S=S_A+(CXi*dS);
                    Alp=Alp_A+(CXi*dS);
                    CStrainRT_Xi=CStrain;
                    CStrainFT_Xi=(S*CStressFT_Xi)+(Alp*(T-T0))+(H/(Rho*b_M))*((CStressFT_Xi*H)+((1/2)*(dS*CStressFT_Xi^2))+((Rho*dS0)*(T-Ms)));        
                    TSlope=abs((CStress-CStressFT_Xi)/(CStrain-CStrainFT_Xi));
                    [CStrainFC_Xi,CStrainRC_Xi]=deal(SStrainFTC,SStrainRTC);
                else
                    CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                    CStrainFT_Xi=StrainFT_Xi_1SPT;
                    CStrainFC_Xi=SStrainFTC;
                    CStrainRT_Xi=StrainRT_Xi_1SPT;
                    CStrainRC_Xi=SStrainRTC;
                    TSlope=TSlope_1SPT;
                    CXi=Xi1SPT;
                end
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=StrainFT_Xi_1SPT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=StrainRT_Xi_1SPT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        end
    end
    if CStrain<=Strain0&&dCStrain>=0
        if CStrain>=FStrainRTC
            CStress=E_A*(CStrain-(Alp_A*(T-T0)));
            CStrainFT_Xi=SStrainFTT;
            CStrainFC_Xi=SStrainFTC;
            CStrainRT_Xi=SStrainRTT;
            CStrainRC_Xi=SStrainRTC;
            TSlope=E_A;
            CXi=0;
        elseif CStrain<=SStrainRTC
            if Xi1SPT==1
                CStress=E_M*(CStrain-(Alp_M*(T-T0))+H);
                CStrainFT_Xi=SStrainFTT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=SStrainRTT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=E_M;
                CXi=1;
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=StrainFT_Xi_1SPT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=StrainRT_Xi_1SPT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        elseif SStrainRTC<=CStrain&&CStrain<=FStrainRTC
            if CStrain>=StrainRC_Xi_1SPT
                a1=dS^2/(2*b_A*Rho);
                a2=-(3*H*dS)/(2*b_A*Rho);
                a3=S_A+((dS*dS0*(T-Af))/b_A)+(H^2/(b_A*Rho));
                a4=(Alp_A*(T-T0))-((H*(T-Af)*dS0)/b_A);
                PS=roots([a1,a2,a3,a4-CStrain]);
                for i=1:1:length(PS)
                    if imag(PS(i))==0
                        if -SStressRTT<=PS(i)&&PS(i)<=-FStressRTT
                            CStress=PS(i);
                            break;
                        end
                    end
                end
                Gamma_1R=dS/(2*b_A*Rho);
                Gamma_2R=-H/(b_A*Rho);
                Gamma_3R=((T-Af)*dS0)/b_A;
                CXi=Gamma_1R*CStress^2+Gamma_2R*CStress+Gamma_3R;
                if 0<=CXi&&CXi<=Xi1SPT
                    Gamma_1F=dS/(2*b_M*Rho);
                    Gamma_2F=-H/(b_M*Rho);
                    Gamma_3F=((T-Ms)*dS0)/b_M;
                    PS=roots([Gamma_1F,Gamma_2F,Gamma_3F-CXi]);
                    for i=1:1:length(PS)
                        if imag(PS(i))==0
                            if -FStressFTT<=PS(i)&&PS(i)<=-SStressFTT
                                CStressFC_Xi=PS(i);
                                break;
                            end
                        end
                    end
                    S=S_A+(CXi*dS);
                    Alp=Alp_A+(CXi*dS);
                    CStrainRC_Xi=CStrain;
                    CStrainFC_Xi=(S*CStressFC_Xi)+(Alp*(T-T0))-(H/(Rho*b_M))*((-CStressFC_Xi*H)+((1/2)*(dS*CStressFC_Xi^2))+((Rho*dS0)*(T-Ms)));        
                    TSlope=abs((CStress-CStressFC_Xi)/(CStrain-CStrainFC_Xi));
                    [CStrainFT_Xi,CStrainRT_Xi]=deal(SStrainFTT,SStrainRTT);
                else
                    CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                    CStrainFT_Xi=StrainFT_Xi_1SPT;
                    CStrainFC_Xi=SStrainFTC;
                    CStrainRT_Xi=StrainRT_Xi_1SPT;
                    CStrainRC_Xi=SStrainRTC;
                    TSlope=TSlope_1SPT;
                    CXi=Xi1SPT;
                end
            else
                CStress=Stress1SPT+(TSlope_1SPT*dCStrain);
                CStrainFT_Xi=StrainFT_Xi_1SPT;
                CStrainFC_Xi=SStrainFTC;
                CStrainRT_Xi=StrainRT_Xi_1SPT;
                CStrainRC_Xi=SStrainRTC;
                TSlope=TSlope_1SPT;
                CXi=Xi1SPT;
            end
        end
    end
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
function Results(Number_Nodes,Elements,Nodes,Stress_Node,Strain_Node)
    ID=fopen('Output data.dat','wt');
    for i=1:1:Number_Nodes
        X(i)=Nodes(i,1);
        Y(i)=Nodes(i,2);
    end
    fprintf(ID,'VARIABLES = "Final X","Final Y","Sigmaxx","Epsilonxx"\n');
    fprintf(ID,['ZONE,N=',num2str(length(X)),',E=',num2str(size(Elements,1)),',F=FEPOINT ,ET=QUADRILATERAL \n']);
    fprintf(ID,'%6.4f %6.4f %10.8f %10.8f\n',[X;Y;Stress_Node;Strain_Node]);
    fprintf(ID,'%6.0f %6.0f %6.0f %6.0f\n',[Elements(:,1)';Elements(:,2)';Elements(:,3)';Elements(:,4)']);
end
%--------------------------------------------------------------------------
%%
%--------------------------------------------------------------------------