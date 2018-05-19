// This company bids for all tasks
// Strategy: bids a random value 

{ include("common.asl") }

!discover_art("auction_for_Testar").

+task(S)[artifact_id(Art)]
   <- .wait(math.random(500)+50);
      Bid = math.floor(math.random(1000))+500;
      //.print("my bid in auction artifact ", Art, " is ",Bid);
      bid( Bid )[artifact_id(Art)]. // recall that the artifact ignores if this
                                    // agent places a bid that is higher than
                                    // the current bid

/* plans for execution phase */
+!ganhei <- ?role(R) 
    //.print("ganheiiii");
	//lookupArtifact(odesenv, GrArtId);
	lookupArtifact(const_group, GrArtId);
	focus(GrArtId);
	adoptRole(R)[artifact_id(GrArtId)];
	.

{ include("org_code.asl") }

/*tarefa1constru*/
+!t2ts  : temPlanoTeste(P) & P >  0  

<- 		
		.wait(700); .print("executando plano de teste...");
		execPlanoTeste;
			
.
+!t3ts : execPlanoTeste(E) & E >  0   
 <- 
 
 	.print("liberando software...ok");
 	enviarHomolog;
 	.send(devop, tell, terminei);
 	.	

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }



				