 function Validate() { 
    
    var name = document.getElementById('name').value;
    var email = document.getElementById('email').value;
    var contact = document.getElementById("contact").value;
    
    var text;
    
  
    if (!name.match(/^[a-zA-Z]+$/)) {
        alert('Only alphabets are allowed for Name');
        return false;
    } 
    if (isNaN(contact) || contact.length !== 10) {
        alert('Please Enter valid Contact Number');
        return false;
    } 
     if (email.indexOf("@") === -1 || email.length < 6) {
        alert('Please Enter valid Email');
        return false;
        
      }  alert("Data Saved Successfully!");
        return true;
    
}
 

