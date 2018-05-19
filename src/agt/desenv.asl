// This desenv bids for task desenv
// Strategy: bids a random value 

{ include("common.asl") }

!discover_art("auction_for_Desenvolver").

+task(S)[artifact_id(Art)]
   <- .wait(math.random(500)+50);
      Bid = math.floor(math.random(1100))+600;
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
	//lookupArtifact(softConstruction, GrArtId1);
	//focus(GrArtId1);
	.

{ include("org_code.asl") }

/*tarefa1constru*/
//@t2cs[atomic]
+!t2cs       <-  .wait(700); .print("desenvolvido...").
+!t21cs    : temDocument(D) & D >  0  
<- 		    .print("ligando pc");
			ligarPc("desenv apertando botão ligar pc", Lig);
			.print(Lig);
			.print("desenv abrindo IDE");
			 abrirIdeDesenv("desenv abrindo IDE", Open);	
			.print(Open);
			.print("codificando...");
			codificar;	
.

+!t22cs      <- 
				.wait(2000) .print("comitando codigo...");
				comitar("comentario", Com);
				.print(Com);
.
+!t3cs 		 <- .wait(2000) .print("enviando para o teste...");
				enviarTeste;
 	            .send(giacomo, tell, terminei); 
 	            //comunicando ao giacamo que terminou para o giacamo criar o outro schema
			  .
			  
//+pacote(V)
//<-  
//	.print("pacote enviado", V);
//.	
//
//+tem_pacote
//<-  
//	.print("tem pacote");
//.
//
//+ntem_pacote
//<-  
//	.print("nao tem pacote");
//.

		  
//+!discover(ArtName)		
//<-			.print("discover artefato");			
//			lookupArtifact(ArtName, _);
//.		
				

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }



				