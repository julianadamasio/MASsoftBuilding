// Agent georgegerin in project developer_project

/* Initial beliefs and rules */

/* Initial goals */

/*tarefa2prod */
+!t1CP   : temPacoteTeste(T) & T >  0  
<- 
			.print("executar plano de liberacao de software...");
			execPlanoLiberacao;
			.
+!t2CP     <- .print("liberando software (software em producao)...");
			.send(giacomo, tell, softPronto);
.


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }


// uncomment the include below to have an agent compliant with its organisation  
//{ include("$jacamoJar/templates/org-obedient.asl") }
