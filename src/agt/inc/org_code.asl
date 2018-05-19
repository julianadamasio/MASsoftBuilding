// Common code for the organisational part of the system

task_roles("auction_for_AnalisarEspecifiq",     [analista]).
task_roles("auction_for_Desenvolver",           [desenvolvedor]).
task_roles("auction_for_PlanoTeste",            [analistaTeste]).
task_roles("auction_for_Testar",                [testador]).

//@lin[atomic]
+!contract(Task,GroupId)
    : task_roles(Task,Roles)
   <- joinWorkspace(odesenv, WOrg);
       // .print("worg", WOrg);
      for ( .member( Role, Roles) ) {	
		   adoptRole(Role)[artifact_name(const_group)];
		   !ganhei;
      }. 
    
-!contract(Service,GroupName)[error(E),error_msg(Msg),code(Cmd),code_src(Src),code_line(Line)]
   <- .print("Failed to sign the contract for ",Service,"/",GroupName,": ",Msg," (",E,"). command: ",Cmd, " on ",Src,":", Line).
