const $ = id => document.getElementById(id);
let regExEmail =  /^(([^<>()\[\]\.,;:\s@\”]+(\.[^<>()\[\]\.,;:\s@\”]:+)*)|(\”.+\”))@(([^<>()[\]\.,;:\s@\”]+\.)+[^<>()[\]\.,;:\s@\”]{2,})$/;


window.addEventListener('load',()=>{

    let listEmails;
    const emailVerify = async() =>{
        try {
            
            const response = await fetch("/api/users/emails");
            const result = await response.json();
            return result;
        } catch (error) {
            console.log(error);
        }
    }
    
    emailVerify().then(array =>{
        listEmails = array
    })
    
    const form =$('formLogin');
    
    const email=$('email');

    const pass=$('password');

    email.addEventListener('keyup',(e)=>{
        
        if(email.value == ''){
            $('errorEmail').innerHTML = "El email es obligatorio"
            email.classList.add('is-invalid')

        }else if(!regExEmail.test(email.value)){
            $('errorEmail').innerHTML = "Debes ingresar un email valido"
            email.classList.add('is-invalid')

        }else if(!listEmails.includes(email.value)){
            $('errorEmail').innerHTML = "Este email no esta registrado"
            email.classList.add('is-invalid')
        }else{
            $('errorEmail').innerHTML = null;
            email.classList.remove('is-invalid')
        }
    })

    pass.addEventListener('keyup',(e)=> {

        if(pass.value.trim() == ''){
            $('errorPass').innerHTML = 'La contraseña es obligatoria'
            pass.classList.add('is-invalid')
        }else{
            $('errorPass').innerHTML = null
            pass.classList.remove('is-invalid')
        }
    })

    form.addEventListener('submit',(e)=>{
        let error = false;
        e.preventDefault()

        // input email
            if(email.value == ''){
                $('errorEmail').innerHTML = "El email es obligatorio"
                email.classList.add('is-invalid')

                error = true;
            }else if(!regExEmail.test(email.value)){
                $('errorEmail').innerHTML = "Debes ingresar un email valido"
                email.classList.add('is-invalid')
                
                error = true;
            }else if(!listEmails.includes(email.value)){
                $('errorEmail').innerHTML = "Este email no esta registrado"
                email.classList.add('is-invalid')
                
                error = true;
            }

        if (!error) {
            form.submit()    
        }

    })

})

