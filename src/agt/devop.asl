// Agent damasdevop in project developer_project

/* Initial beliefs and rules */

/* Initial goals */

+terminei 
<- .print("testador terminou");
    addScheme(s1prod);
    .
      

/*tarefa1prod */
+!t1H   
<- 
		
		.wait(500); .print("criando ambiente...");
		criaAmbiente;
		.
+!t2H     : temPacoteTeste(P) & P >  0  & ambienteCriado(T) & T >0   
<- 
		.print("recebendo pacote...");
		.
+!t3H     <- 
		.print("testando...");
		execPlanoTeste;
		
		.
+!t4H     <- 
			  .print("liberando software ok...");
			  enviarHomolog;
			  addScheme(s2prod)[artifact_id(GrArtId)];
			.			
		

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }


