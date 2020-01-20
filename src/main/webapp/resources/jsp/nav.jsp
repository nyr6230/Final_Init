<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 	
<div class="navBar" >
        <div class="header">
           <div class="inner">
            <div class="nav-left">
                <div class="logo"><a class="nav-link active" id="logoA" href="${pageContext.request.contextPath}/feed/getFriendFeed">i n ; t</a></div>
            </div>
            <div class="nav-center"></div>
        <div class="nav-right">
        <ul class="nav justify-content-end">
            <li class="nav-item">
              <a class="nav-link active" href="${pageContext.request.contextPath}/feed/wholeFeed" style="padding-top: 12px;"><img id="total_feed" src="/resources/images/friends.png"></a>
            </li>
            <li class="nav-item a_ac1_nav" id="a_ac1_1">
              <a class="nav-link" style="padding-top: 15px;"><img id="notification" src="/resources/images/notification.png"></a>
            </li>
			
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/message/messageMain" style="padding-top: 15px;"><img id="msg" src="/resources/images/msg.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/feed/myFeed?email=${loginInfo.email}" style="padding-top: 12px;"><img id="my_feed" src="/resources/images/user.png"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/member/logout.do" style="padding-top: 12px;"><img id="logout" src="/resources/images/logout.png"></a>
            </li>
          </ul>
            </div>
        </div>
        </div>
    </div>
<script>
     $(".header").mouseenter(function(){
        $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends.png", "/resources/images/friends2.png"));  
        $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification.png", "/resources/images/notification2.png"));  
        $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg.png", "/resources/images/msg2.png"));  
        $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user.png", "/resources/images/user2.png"));  
        $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout.png", "/resources/images/logout2.png"));  
        $(".logo").css("color"," #1D4E89");
     });
     $(".header").mouseleave(function(){
        $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends2.png", "/resources/images/friends.png"));  
        $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification2.png", "/resources/images/notification.png"));  
        $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg2.png", "/resources/images/msg.png"));  
        $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user2.png", "/resources/images/user.png"));  
        $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout2.png", "/resources/images/logout.png")); 
        $(".logo").css("color"," #FFFFFF");
     });
    $("#total_feed").mouseenter(function(){
         $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends2.png", "/resources/images/friends3.png"));  
    });
     $("#total_feed").mouseleave(function(){
         $("#total_feed").attr("src", $("#total_feed").attr("src").replace("/resources/images/friends3.png", "/resources/images/friends2.png"));  
    });  
     $("#notification").mouseenter(function(){
         $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification2.png", "/resources/images/notification3.png"));  
        });
     $("#notification").mouseleave(function(){
         $("#notification").attr("src", $("#notification").attr("src").replace("/resources/images/notification3.png", "/resources/images/notification2.png"));  
    });
     $("#msg").mouseenter(function(){
         $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg2.png", "/resources/images/msg3.png"));  
        });
     $("#msg").mouseleave(function(){
         $("#msg").attr("src", $("#msg").attr("src").replace("/resources/images/msg3.png", "/resources/images/msg2.png"));  
    });
    $("#my_feed").mouseenter(function(){
         $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user2.png", "/resources/images/user3.png"));  
    });
     $("#my_feed").mouseleave(function(){
         $("#my_feed").attr("src", $("#my_feed").attr("src").replace("/resources/images/user3.png", "/resources/images/user2.png"));  
    }); 
    $("#logout").mouseenter(function(){
         $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout2.png", "/resources/images/logout3.png"));  
    });
     $("#logout").mouseleave(function(){
         $("#logout").attr("src", $("#logout").attr("src").replace("/resources/images/logout3.png", "/resources/images/logout2.png"));  
    }); 
    
     $(".header").mouseenter(function(){
     	 $("#logoA").css("background-position","right center"); 
    	 $("#logoA").css("color","#0f4c81");
     });
     $(".header").mouseleave(function(){
     	 $("#logoA").css("background-position","right center"); 
    	 $("#logoA").css("color","white");
     });

    </script>