// CArtAgO artifact code for project soft_building

package tools;

import cartago.*;

public class PlanoTesteArt extends Artifact {
	void init() {
		//System.out.println("Artefato plano de teste foi criado");
		defineObsProperty("temPlanoTeste", 0);
		defineObsProperty("execPlanoTeste", 0);
		defineObsProperty("temPacoteTeste", 0);
	}
	
	@OPERATION
	void planoTeste() {
		ObsProperty prop = getObsProperty("temPlanoTeste");
		prop.updateValue(prop.intValue()+1);
		if(prop.intValue() >= 1){
	    	//signal("tem_doc");
	    	System.out.println("[ArtPT] Tem plano de teste");
	    }else{
	    	
	    	//signal("ntem_doc");
	    	System.out.println("[ArtPT] Nao tem plano de teste");
	    }
	    	
		//signal("tick");
	}
	@OPERATION
	void execPlanoTeste() {
		ObsProperty prop1 = getObsProperty("execPlanoTeste");
		prop1.updateValue(prop1.intValue()+1);
		if(prop1.intValue() >= 1){
	    	//signal("tem_doc");
	    	System.out.println("[ArtPT]  Plano de teste executado");
	    }else{
	    	
	    	//signal("ntem_doc");
	    	System.out.println("[ArtPT]  Nao executou plano de teste");
	    }
	    	
		//signal("tick");
	}
	
	@OPERATION
	void enviarHomolog() {
		ObsProperty prop = getObsProperty("temPacoteTeste");
		prop.updateValue(prop.intValue()+1);
		if(prop.intValue() >= 1){
	    	System.out.println("[ArtPT] Pacote testado enviado");
	    }else{	
	    	System.out.println("[ArtPT] Nao foi enviado pacote testado");
	    }
	    	
		//signal("tick");
	}
	
	
	
}

