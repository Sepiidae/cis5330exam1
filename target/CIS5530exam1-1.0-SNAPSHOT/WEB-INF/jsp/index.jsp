<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
       
        
        <p>Congratulations!</p>
        <p>Your docker instance is running! To prove the instance is running please enter your FIT email address into the form and click encode. </p>

        <p>Clicking encode will provide an “encrypted” string that must be copy and pasted into your Canvas assignment. The instructor will load it into their own docker instance and decode it. When decoded it will “prove” you completed this question.</p>
 
        
        <form id="encForm" action="EncryptServlet">
            <p><label for="username">Encode or Decode String (email address): </label>
                <input id="string" type="text" name="string" placeholder="your fit email address" /></p>
            <p><label for=""></label><input id="encode" type="button" value="Encode" /></p>
            <p><label for=""></label><input id="decode" type="button" value="Decode" /></p>
            
            
            
        </form>
        <div id="results"><h1>Results:</h1><p></p></div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="application/javascript">
    $( document ).ready(function() {
        $("#encode").click(function( event ) {
            $.post("./EncryptServlet", { "action":"encrypt", "string": $("#string").val() }, function(results) { $("#results").append("<p>" + results.string + "</p>");}  );
            
        });
        $("#decode").click(function( event ) {
            $.post("./EncryptServlet", { "action":"decrypt", "string": $("#string").val() }, function(results) { $("#results").append("<p>" + results.string + "</p>"); }  );
            
        });  
    });
    
    </script>
    
</html>
