// CArtAgO artifact code for project soft_building

package tools;

import cartago.*;

public class DocumentacaoArt extends Artifact {
	
	void init() {
		//System.out.println("Artefato documentacao foi criado");
		defineObsProperty("temDocument", 0);
	}
	
	@OPERATION
	void especificacao() {
		ObsProperty prop = getObsProperty("temDocument");
		prop.updateValue(prop.intValue()+1);
		 if(prop.intValue() >= 1){
		    	//signal("tem_doc");
		    	System.out.println("[ArtDoc] Tem documentacao");
		    }else{
		    	
		    	//signal("ntem_doc");
		    	System.out.println("[ArtDoc] Nao tem documentacao");
		    }
		    
		//signal("tick");
	}
}

