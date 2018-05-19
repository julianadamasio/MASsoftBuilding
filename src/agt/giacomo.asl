// Agent Giacomo, who wants to build a house

{ include("common.asl") }

/* Initial beliefs and rules */

// counts the number of tasks based on the observable properties of the auction artifacts
number_of_tasks(NS) :- .findall( S, task(S), L) & .length(L,NS).
      

/* Initial goals */

!have_a_soft.

/* Plans */

+!have_a_soft 
   <- !contract; // hire the professionals that will build the software
      !execute.  // (simulates) the execution of the construction
      
-!have_a_soft[error(E),error_msg(Msg),code(Cmd),code_src(Src),code_line(Line)]
   <- .print("Failed to build a house due to: ",Msg," (",E,"). Command: ",Cmd, " on ",Src,":", Line).

   
/* Plans for Contracting */

+!contract
   <-  !wait_for_bids;
      .
       
+!wait_for_bids
   <- println("Waiting bids for 5 seconds...");
      .wait(5000); // use an internal deadline of 5 seconds to close the auctions
      !show_winners.
   
+!show_winners     
   <- for ( currentWinner(Ag)[artifact_id(ArtId)] ) {
         ?currentBid(Price)[artifact_id(ArtId)]; // check the current bid
         ?task(Task)[artifact_id(ArtId)];          // and the task it is for
         println("Winner of task ", Task," is ", Ag, " for ", Price)
      }. 

+!execute 
:  group(const_group,_, GrArtId)
   <- println;
      println("*** Execution Phase ***");
      println;    
     
      !contract_winners("const_group");
      
      ?formationStatus(ok)[artifact_id(GrArtId)]; 
       addScheme(s1desenv)[artifact_id(GrArtId)];
    .
         
+!contract_winners(GroupName)
    : number_of_tasks(NS) &
      .findall( ArtId, currentWinner(A)[artifact_id(ArtId)] & A \== "no_winner", L) &
      .length(L, NS) 
   <- //.print("tem vencedores");
   for ( currentWinner(Ag)[artifact_id(ArtId)] ) {
            ?task(Task)[artifact_id(ArtId)];    
            println("Contracting ",Ag," for ", Task);
            lookupArtifact(GroupName, GroupId);
            .send(Ag, achieve, contract(Task,GroupId)); // sends the message to the agent notifying it about the result
      };
      .
+terminei 
<- .print("desenvolvedor terminou");
    addScheme(s2desenv);
    .
           
+!contract_winners(_)
   <- println("** I didn't find enough builders!");
      .fail.      

// plans to wait until the group is well formed
// makes this intention suspend until the group is believed to be well formed
+?formationStatus(ok)[artifact_id(G)]
   <- .wait({+formationStatus(ok)[artifact_id(G)]}).  

+softPronto
<- 	.print("Software Pronto");
.	
 


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }

// uncomment the include below to have an agent compliant with its organisation  
//{ include("$jacamoJar/templates/org-obedient.asl") }
