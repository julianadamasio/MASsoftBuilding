// CArtAgO artifact code for project soft_building

package tools;

import cartago.*;

public class AmbientHomologArt extends Artifact {
	void init() {
		//System.out.println("Artefato de Ambiente de Homolog criado");
		defineObsProperty("ambienteCriado", 0);
		defineObsProperty("execPlanoLib", 0);
	}
	
	@OPERATION
	void criaAmbiente() {
		ObsProperty prop = getObsProperty("ambienteCriado");
		prop.updateValue(prop.intValue()+1);
		if(prop.intValue() >= 1){
	    	//signal("tem_doc");
	    	System.out.println("[ArtAmbHom] Ambiente Criado");
	    }else{
	    	
	    	//signal("ntem_doc");
	    	System.out.println("[ArtAmbHom] Ambiente nao foi criado");
	    }
		//signal("tick");
	}
	
	@OPERATION
	void execPlanoLiberacao() {
		ObsProperty prop1 = getObsProperty("execPlanoLib");
		prop1.updateValue(prop1.intValue()+1);
		if(prop1.intValue() >= 1){
	    	//signal("tem_doc");
	    	System.out.println("[ArtAmbHom]  Plano de liberacao executado");
	    }else{
	    	
	    	//signal("ntem_doc");
	    	System.out.println("[ArtAmbHom]  Nao executou plano de liberacao");
	    }
	    	
		//signal("tick");
	}
	
}

