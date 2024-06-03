<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html lang="en">
<head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Document</title>
       <style>
            .cont{
              display: flex;
              flex-wrap: wrap;
              width: 750px;
              height: 150px;
              align-items: center;
              background-color: white;
              justify-content: space-around;
              border: 2px solid black;
               
              justify-items: center;
            }
            .con1,.con2{
                  width: 350px;
                  height: 20px;
                  border: 1px dashed black;
            }
            .con3,.con4,.con5{
              width: 90px;
              height: 20px;
              border: 1px dashed black;
            }
            .con6,.con7{
              width: 350px;
              height: 20px;
               border: 1px dashed black;
       
            }
             
            .btn{
              display: flex;
              width:350px;
              /* border: 2px solid black; */
              justify-content: space-evenly;

            }
            div input[type="submit"]{
              width: 60px;
              height: 25px;
            }
       *{
       padding: 0;
       /* margin: 0; */
       
}
.logo{
       /* position: relative; */
        margin-top: 5px;

}
.head{
       display: flex;
       flex-direction: column;
       border: 2px solid black;
       /* justify-content: space-evenly; */
       align-items: center;
       height: 85px;
       font-weight:bold;
       font-size:30px;
       background-color: rgba(251, 250, 248, 0.967);
}
.searchbar{
       width: 500px;
       height: 26px;
       border:2px solid black; 
       
}
.searchbtn{
        height: 30px;
        width: 30px;
        margin-left: -30px;
        
       background-color:aqua;
}
.navbar{
       margin-top: -16px;
       width: 100%;
       position: sticky; 
}
ul li h3{
       color: #fff;
}
ul{
       list-style: none;
       background: #22438c;
}
ul li{
       display: inline-block;
}
ul li a{
       display: block;
       padding: 10px 15px;
       color: #fff;
       text-decoration: none;
       text-align: center;
       font-size: 20px;
}
ul li ul.dropdown {
       /* width: 100%; */
       background: #22438c;
       position: absolute;
       z-index: 999;
       display: none;
}
ul li a:hover{
       background: #112c66;
       /* border: 0.1px double white; */
}
ul li:hover ul.dropdown{
       display: flex;
       flex-direction: column;
}
.options{
       
       margin-top: -43px;
       margin-left: 73%;
        
}
.menu{
       height: 60px;
       overflow:hidden;
}

.content{
       display: flex;
       flex-direction: column;
       align-items: center;
       border: 2px solid black;
       height: 100%;
}
 
 
       </style>
</head>
<body>

       <header> 
              <div class="head">
                       <div class="logo">Electronics Shop</div> 
                       <div > 
                          Admin 
                     </div>
                </div>
         </header>
       <nav class="navbar">
              <div class="menu">
                     <ul>
                            <li><a href="#">Home</a></li> 
                            <li >
                                   <a href="#">Products</a>
                                   <ul class="dropdown">
                                          <li><a href="laptoppage.jsp">Laptop</a></li>
                                          <li><a href="tvpage.jsp">TV</a></li>
                                          <li><a href="camerapage.jsp">Camera</a></li>
                                          <li><a href="phonepage.jsp">Phone</a></li>
                                   </ul>
                            </li>
                           <div class="options"> 
                            <li><a href="adminorderpage.jsp">Orders</a></li>
                            <li><a href="#">Profile</a></li>
                            <li><a href="#">LogIn</a></li>
                            <li> <a href="#">About</a></li>   
                           </div>    
                     </ul>
                      
              </div>
       </nav>

<div class="content"> 
        
       <form action="Indata" method="post"> 
              <div style="margin: 10px 10px;"> 
                     insert opration : <label for="product">Choose a Product</label>
                                       <select name="product" id="product">
                                          <option value="tv">tv</option>
                                          <option value="laptop">laptop</option>
                                          <option value="phone">phone</option>
                                          <option value="camera">camera</option>
                                       </select>
              
              </div>
              <div class="cont">
              
              <div ><input type="text" placeholder="  Brand" name="brand" class="con1"></div>
              <div ><input type="text" placeholder="  model " name="model" class="con2"></div>
               <div ><input type="text" placeholder="  img " name="img" class="con2"></div>
              <div ><input type="text" placeholder="  features " name="feature" class="con6"></div>
              <div ><input type="text" placeholder="  discription " name="discription" class="con7"></div>
              <div ><input type="text" placeholder=" price " name="price" class="con3"></div>
              <div ><input type="text" placeholder=" discount " name="discount" class="con4"></div>
              <div ><input type="text" placeholder=" oprice " name="oprice" class="con5"></div>
               
               
               <div class="btn">
                     <div><input type="submit" name="btn1" value="cancel"></button></div>
                     <div><input type="submit" name="btn2" value="insert"></div>
               </div>
          </div>
       </form>  

        
       <form action="Updata" method="post"> 
              <div style="margin: 10px 10px;"> 
                     update opration :  <input type="text" placeholder="  id" name="id">
              
              </div>
          <div class="cont">
          
              <div ><input type="text" placeholder="  Brand" name="brand" class="con1"></div>
              <div ><input type="text" placeholder="  model " name="model" class="con2"></div>
               <div ><input type="text" placeholder=" New img " name="img" class="con2"></div>
              <div ><input type="text" placeholder=" New features " name="feature" class="con6"></div>
              <div ><input type="text" placeholder=" New discription " name="discription" class="con7"></div>
              <div ><input type="text" placeholder="  price " name="price" class="con3"></div>
              <div ><input type="text" placeholder=" discount " name="discount" class="con4"></div>
              <div ><input type="text" placeholder=" oprice " name="oprice" class="con5"></div>
               
               
              <div class="btn">
                     <div><input type="submit" name="btn1" value="cancel"></button></div>
                     <div><input type="submit" name="btn2" value="update"></div>
               </div>
          </div>
       </form>
        
       <form action="Deldata" method="post"> 
              <div style="margin: 10px 10px;"> 
                     delete opration :  
              
              </div>
              <div class="cont">
                  <div ><input type="text" placeholder="  id " name="id" class="con6"></div>
                  <div ><input type="text" placeholder="  model" name="model" class="con1"></div>                                    
                   
                   
                  <div class="btn">
                  
                     <div><input type="submit" name="btn1" value="cancel"></button></div>
                     <div><input type="submit" name="btn2" value="delete"></div>
               </div>
              </div>
           </form>
            
       
       </div>

</body>
</html>