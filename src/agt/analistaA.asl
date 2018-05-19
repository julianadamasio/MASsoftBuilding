// Strategy: bids a random value 

{ include("common.asl") }

!discover_art("auction_for_AnalisarEspecifiq").

+task(S)[artifact_id(Art)]
   <- .wait(math.random(600)+50);
      Bid = math.floor(math.random(900))+600;
      //.print("my bid in auction artifact ", Art, " is ",Bid);
      bid( Bid )[artifact_id(Art)]. // recall that the artifact ignores if this
                                    // agent places a bid that is higher than
                                    // the current bid
/* plans for execution phase */

{ include("org_code.asl") }  


+!ganhei <- ?role(R) 
	//.print("ganheiiii");
	//lookupArtifact(odesenv, GrArtId);  
	lookupArtifact(const_group, GrArtId);	//nome do grupo mais id do grupo	
	focus(GrArtId);
	adoptRole(R)[artifact_id(GrArtId)];
	.

+!t1cs 
   <-    .wait(2000) .print("esperando especificacao...");
   		 especificacao;
   		 .print("analisando especific...");
   .
   
{ include("$jacamoJar/templates/org-obedient.asl") }  
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

      
