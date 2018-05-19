// Strategy: bids a random value 


{ include("common.asl") }

//my_price(300). // initial belief

!discover_art("auction_for_PlanoTeste").

+task(S)[artifact_id(Art)]
   <- .wait(math.random(500)+50);
      Bid = math.floor(math.random(1000))+600;
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
//	lookupArtifact(softConstruction, GrArtId1);
//	.print("focar artefato computador ", GrArtId1);
//	focus(GrArtId1);
	.
// plan to execute organisational goals 


{ include("org_code.asl") }
      
/*tarefa2constr */
+!t1ts      <- .print("terminei plano...").
+!t11ts  : pacote(V) & V > 0 & 
		   temDocument(D) & D >  0   
 <- 	
 			   .print("preparando ambiente...");
			.
+!t12ts     <- .print("fazendo plano de teste...");
				planoTeste;
.
				

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }

