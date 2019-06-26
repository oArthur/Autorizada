<%@page import="org.ja.autorizada2.modelo.Painel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Grenciar Servi�os</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
function dadosForm() {
	var dados = "";
	
	dados += "nome=" + document.getElementById("nome").value;
	dados += "&cep=" + document.getElementById("cep").value;
	dados += "&ende=" + document.getElementById("ende").value;
	dados += "&nota=" + document.getElementById("nota").value;
	dados += "&defeito=" + document.getElementById("defeito").value;
	dados += "&fabricante=" + document.getElementById("fabricante").value;
	dados += "&vend=" + document.getElementById("vend").value;
	dados += "&produto=" + document.getElementById("produto").value;
	dados += "&serie=" + document.getElementById("serie").value;
	dados += "&cod=" + document.getElementById("cod").value;
	dados += "&chegada=" + document.getElementById("chegada").value;
	dados += "&saida=" + document.getElementById("saida").value;
	dados += "&defeitov=" + document.getElementById("defeitov").value;
	dados += "&nometec=" + document.getElementById("nometec").value;
	dados += "&codtec=" + document.getElementById("codtec").value;
	dados += "&status=" + document.getElementById("status").value;
	dados += "&email=" + document.getElementById("email").value;
	dados += "&tell=" + document.getElementById("tell").value;
	dados += "&nivel=" + document.getElementById("nivel").value;
	return dados;
}

function gravado() {

	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	       // Typical action to be performed when the document is ready:
	       var msg = xhttp.responseText;
	       document.getElementById("msg").innerHTML = msg;
	       if (msg == "Gravado com sucesso.") {
	    	   document.getElementById("msg").className = "alert alert-success";   
	    	   
	       }else {
	    	   document.getElementById("msg").className = "alert alert-danger";
	       }
	    }
	};
	xhttp.open("GET", "wservletPainel?"+dadosForm(), true);
	xhttp.send();
	
}

function apagar() {
	if (confirm("Realmente deseja apagar esse registro??")) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var msg = xhttp.responseText;

				if (msg == "Gravado com sucesso") {
					document.getElementById("msg").className = "alert alert-info";
					document.getElementById("msg").innerHTML = "Informa��o apagada";
					document.getElementById("formulario").reset();
				} else {
					document.getElementById("msg").className = "alert alert-danger";
					document.getElementById("msg").innerHTML = "Erro ao apagar";
				}
			}
		};
		xhttp.open("POST", "servletPainel?" + dadosForm() + "&apagar", true);
		xhttp.send();
	}
}

function apagarAtualizar() {

		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var msg = xhttp.responseText;

			}
		};
		xhttp.open("POST", "servletPainel?" + dadosForm() + "&apagar", true);
		xhttp.send();
		gravado();
		//window.setTimeout('gravado()', 100); 
		
	}
	
function novo(){
	window.location.replace('Gerenciamento.jsp');
}


</script>	
	
	
<%
Painel painel = new Painel();

if (request.getParameter("cod") != null){
	int cod = Integer.parseInt(request.getParameter("cod"));
	painel = painel.getPainel(cod);
}
%>
	

</head>
<div class="container">
<img
			src="https://i.imgur.com/rejrZDU.jpg"
			style="width: 80px" align="left" />
<h2>Autorizada J.A</h2>
<font size="2">Relat�rio de pesta��o de servi�os.</font>
<form id="form">
<div id="msg"></div>
<input type="hidden" value="<%out.print(painel.getCod());%>" id="cod" />
<br>
  <div class="row">
    <div class="form-group col-md-4 " >
      <label for="nome">Nome do Cliente/Empresa:</label> <input
							type="text" name="nome" 
							class="form-control" readonly id="nome"
							placeholder="Nome do Cliente/Empresa"
							value="<%out.print(painel.getNome());%>">
							
    </div>
    	<div class="form-group col-md-2">
    <label for="loc">CEP:</label> <input name="cep"  type="number"
							class="form-control"
							id="cep" readonly placeholder="ex: 01001-000"
							value="<%out.print(painel.getCep());%>">
    </div>
    <div class="form-group col-md-4">
    <label for="loc">Endere�o:</label> <input name="ende" type="text"
							class="form-control"
							id="ende" readonly placeholder="Ex:Casa/Ap:2 "
							value="<%out.print(painel.getEnde());%>">
    </div>
    <div class="form-group col-md-2">
    <label for="loc">N� Nota Fiscal:</label> <input name="nota" type="number"
							class="form-control"
							id="nota" readonly placeholder="ex: XXXXXX"
							value="<%out.print(painel.getNota());%>">
    </div>
  </div>
 <div class="row">
    <div class="form-group col-md-3">
      <label for="sel2">Loja que Vendeu:</label> <select
							class="form-control"  id="vend" name="vend"
							value="<%out.print(painel.getVend());%>">
								<option>Gasfilar</option>
								<option>Chama Alternativa</option>
								<option>Campe�o da Constru��o</option>
								<option>S� Reparos</option>
								<option>Tendtudo</option>
								<option>AcCoelho</option>
	</select>
	<script>
	document.getElementById("vend").value = "<% out.print(painel.getVend()); %>";
	</script>
    </div>
    <div class="form-group col-md-2">
      <label for="sel3">Fabricante:</label> <select
							class="form-control"  id="fabricante" name="fabricante"
							value="<%out.print(painel.getFabricante());%>">
								<option>Emmeti</option>
								<option>Rinnai</option>
								<option>Aqualimp</option>
								<option>G-Light</option>
								<option>Rowa</option>
								<option>A�pio</option>

	</select>
	<script>
	document.getElementById("fabricante").value = "<% out.print(painel.getFabricante()); %>";
	</script>
    </div>
    <div class="form-group col-md-2">
    <label for="loc">Produto:</label> <input name="produto" type="text"
							class="form-control"
							id="produto" placeholder="Nome do Produto"
							value="<%out.print(painel.getProduto());%>">
    </div>
     <div class="form-group col-md-2">
    <label for="loc">N� de Serie:</label> <input name="serie" type="text"
							class="form-control"
							id="serie" placeholder="N� de Serie"
							value="<%out.print(painel.getSerie());%>">
    </div>
    <div class="form-group col-md-3">
    <label for="loc">Defeito:</label> <input name="defeito" type="text"
							class="form-control"
							id="defeito" readonly placeholder="Defeito Alegado"
							value="<%out.print(painel.getDefeito());%>">
    </div>
 <div class="form-group col-md-3">
  <label for="usr">Data da visita/Chegada:</label> <input
							type="datetime-local" class="form-control" id="chegada" 
							 name="chegada">
</div>
	<div class="form-group col-md-2">
	<label for="usr">Saida:</label> <input
							type="time" class="form-control" id="saida" 
							name="saida">
	</div>
	<div class="form-group col-md-3">
	<label for="usr">Defeito Apresentado:</label> <input
							type="text" class="form-control" id="defeitov" 
							name="defeitov" placeholder="Defeito presenciado">
	</div>
	<div class="form-group col-md-3">
	<label for="usr">Nome do T�cnico:</label> <input
							type="text" class="form-control" id="nometec" 
							name="nometec">
	</div>
	<div class="form-group col-md-1">
	<label for="usr">Cod:</label> <input
							type="number" class="form-control" id="codtec" 
							name="codtec">
	</div>
	<div class="form-group col-md-2">
      <label for="sel1">Status:</label> <select
							class="form-control"  id="status" name="status">
								<option>Concluido</option>
								<option>N�o Visitado</option>
								<option>Reagendado</option>

	</select>
    </div>
    <div class="form-group col-md-1 d-none">
	<label for="usr">Email:</label> <input
							type="text" class="form-control" id="email" 
							name="email" readonly value="<%out.print(painel.getEmail());%>" >
	</div>
	 <div class="form-group col-md-1 d-none">
	<label for="usr">tell:</label> <input
							type="number" class="form-control" id="tell" 
							name="tell" readonly value="<%out.print(painel.getTell());%>" >
	</div>
   <div class="form-group col-md-1 d-none">
	<label for="usr">Urgencia:</label> <input
							type="text" class="form-control" id="nivel" 
							name="nivel" readonly value="<%out.print(painel.getNivel());%>" >
	</div>

  </div>
  <br>
  <button type="button" class="btn btn-dark" onclick="novo()" >Novo</button>
	<button type="button" class="btn btn-primary" onclick="apagarAtualizar()" >Atualizar</button>
	<button type="button" class="btn btn-danger" onclick="apagar()" >Apagar</button>
</form>
</div>
</body>
</html>