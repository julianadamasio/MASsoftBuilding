/* auxiliary rules for agents */

i_am_winning(Art)   // check if I placed the current best bid on auction artifact Art
   :- currentWinner(W)[artifact_id(Art)] &
      .my_name(Me) & .term2string(Me,MeS) & W == MeS.

/* auxiliary plans for Cartago */

// try to find a particular artifact and then focus on it
+!discover_art(ToolName)
   <- //.print("lookup");
   		lookupArtifact(ToolName,ToolId); 
        focus(ToolId);
     // .print("focus");
      .
// keep trying until the artifact is found
-!discover_art(ToolName)
   <- .wait(100);
   //	.print("discoverart");
      !discover_art(ToolName).
