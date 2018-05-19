// CArtAgO artifact code for project house_building2

package tools;



import cartago.*;

public class ComputadorArt extends Artifact {

	void init(){
		//System.out.println("Artefato computador foi criado");
		defineObsProperty("pacote", 0);
	}
	
	@OPERATION
	void ligarPc(String l, OpFeedbackParam lig) {
		lig.set(true);
	//	signal("simula ligar pc");
	}
	
	@OPERATION
	void abrirIdeDesenv(String l, OpFeedbackParam open) {
		open.set(true);
		//signal("simula abrir IDE");
	}
	
	@OPERATION
	void codificar() {
		//ligarComp();
		//signal("artefato simula codificacao");
		
		System.out.println("[artComputador] Artefato simula codificacao");
	}
	
	@OPERATION
	void comitar(String coment, OpFeedbackParam com) {
		com.set("comitado");	
	}
	@OPERATION
	void enviarTeste() {
		ObsProperty prop = getObsProperty("pacote");
	    prop.updateValue(prop.intValue()+1);
	    if(prop.intValue() >= 1){
	    	//signal("tem_pacote");
	    	System.out.println("[artComputador] Tem pacote");
	    }else{
	    	
	    	//signal("ntem_pacote");
	    	System.out.println("[artComputador] Nao tem pacote");
	    }
	    
	}
	
	
	
}

