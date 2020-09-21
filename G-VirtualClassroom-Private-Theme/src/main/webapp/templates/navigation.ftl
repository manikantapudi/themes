<nav class="${nav_css_class}" id="navigation" role="navigation">
	<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>

	<ul aria-label="<@liferay.language key="site-pages" />" class="nav navbar-blank navbar-nav navbar-site" role="menubar">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_attr_selected = ""
				nav_item_css_class = "vir-private"
				nav_item_layout = nav_item.getLayout()
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_attr_has_popup = "aria-haspopup='true'"
					nav_item_attr_selected = "aria-selected='true'"
					nav_item_css_class = "selected"
				/>
			</#if>

			<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>

				<#if nav_item.hasChildren()>
					<ul class="child-menu" role="menu">
						<#list nav_item.getChildren() as nav_child>
							<#assign
								nav_child_attr_selected = ""
								nav_child_css_class = ""
							/>

							<#if nav_item.isSelected()>
								<#assign
									nav_child_attr_selected = "aria-selected='true'"
									nav_child_css_class = "selected"
								/>
							</#if>

							<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
								<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
							</li>
						</#list>
					</ul>
				</#if>
			</li>
		</#list>
	
		  <li class="v-c-g-c-noti"><span id="notify_text" class="fa fa-bell ot-cu-bell1"> </span>
				<div class="cont-digit1-div"></div> 
				
		   </li>
		   
		   <ul class="gvc-noti-ul">
		     
			  
			 
			
		   </ul>
		  
		<li class="vir-priv-sign-in" >
		 
				<a href="${sign_out_url}"  id="sign_out_url"><div id="sign_out_text-nav">Log out</div></a>		
		</li>
		
	</ul>
</nav>


<script>


$( ".v-c-g-c-noti").click(function() {
 event.stopPropagation();
  $this = $(this);

 $(".gvc-noti-ul").empty();
  if(!$(".v-c-g-c-noti").hasClass("show-notification")){
   console.log("clicked")
   $this.css({
    "pointer-events": "none"
});
   $(".v-c-g-c-noti").addClass("show-notification")
   $(".gvc-noti-ul").css("display", "block")
 notifiCationFunction();
 
  }else{
  console.log("data showing")
   $(".gvc-noti-ul").empty();
   $(".v-c-g-c-noti").removeClass("show-notification")
   $(".gvc-noti-ul").css("display", "none")
  
  }
  
  
  
  
});


$( ".v-c-g-c-noti-m" ).click(function() {
 event.stopPropagation();
console.log("cliked mobile")
  $this = $(this);


 $(".gvc-noti-ul-m").empty();
  if(!$(".v-c-g-c-noti-m").hasClass("show-notification")){
  $this.css({
    "pointer-events": "none"
});
   console.log("clicked mobile")
   $(".v-c-g-c-noti-m").addClass("show-notification")
   $(".gvc-noti-ul-m").css("display", "block")
   
 notifiCationFunction();
  }else{
  console.log("data showing")
  $(".gvc-noti-ul-m").empty();
   $(".v-c-g-c-noti-m").removeClass("show-notification")
   $(".gvc-noti-ul-m").css("display", "none")
  
  }
  
});
$(document).on("click", function(event){
console.log("data yes")
 if($(".v-c-g-c-noti").hasClass("show-notification")){
   $(".gvc-noti-ul").empty();
   $(".v-c-g-c-noti").removeClass("show-notification")
 }
 if($(".v-c-g-c-noti-m").hasClass("show-notification")){
  $(".gvc-noti-ul-m").empty();
   $(".v-c-g-c-noti-m").removeClass("show-notification")
 }
          
    });



jQuery(document).ready(function($) {
var count=${notSeenNotificationsCount};
console.log("count"+count)
if(count == 0){
 $(".cont-digit1").css("display", "none")

 $(".not-count1m-view").css("display", "none")
}else{
var htmlData='<div class="cont-digit1">'+count+'</div>';
var mobilehtmlData='<div class="not-count1m-view">'+count+'</div>'
$(".cont-digit1-div").html(htmlData);

$(".not-count1m-view-div").html(mobilehtmlData);

}
console.log("userRole"+${hiddenPageLayoutId})

		});
 function notifiCationFunction(){
	  AUI().use('aui-base','liferay-portlet-url','aui-node', function(A) {	
	  			var resourceURL = Liferay.PortletURL.createResourceURL();
	  			 
	  			 resourceURL.setPortletId('Calendar_Override_Js_portlet_CalendarOverrideJsPortlet');
	  		    resourceURL.setResourceId('userLatestNotifiCations');
	  		     resourceURL.setPlid("${hiddenPageLayoutId}"); 
	  		  console.log("resourceURL:"+resourceURL);
	  			console.log("userRole12"+resourceURL)
	  			 $.ajax({
	  				url:resourceURL,
	  				type:"POST",						
	  				method: 'POST',
	  				dataType: 'json',	
	  			success: function(data) {
	  				console.log("data"+data)
	  				console.log("data.length"+data.length)
	  				
	  				var htmldata="";
	  				 var count=0;
	  			htmldata=htmldata+'<li class="gvc-noti-li gvc-noti-h">Notifications</li>';
	  					if(data.length>0){
	  					
	  					
	  						for(var i=0;i<data.length;i++){
	  						
	  						if(count<4){
	  					htmldata=htmldata+'<li class="gvc-noti-li">'+data[i].notification+'</li>';
	  					count++;
	  					}else{
	  						htmldata=htmldata+'<li class="gvc-noti-li"><a class="more-notification" href="${notificationUrl}&p_p_state=maximized">View more</a></li>';
	  				break;
	  					}
	  						}
	  						var width = $(window).width();
	  						console.log(width)
	  						jQuery('.gvc-noti-ul').append(htmldata);
	  						jQuery('.gvc-noti-ul-m').append(htmldata);
	  				}else{
	  				htmldata=htmldata+'<li class="gvc-noti-li">You do not have any Notification yet</li>';
	  					jQuery('.gvc-noti-ul').append(htmldata);
	  				jQuery('.gvc-noti-ul-m').append(htmldata);
	  				
	  				}
	  				$(".v-c-g-c-noti").css("pointer-events","auto")
	  				      $(".v-c-g-c-noti-m").css("pointer-events","auto")
	  				$(".cont-digit1").css("display", "none")
	  				$(".not-count1m-view").css("display", "none")
	  				}
	  				});
	  			});
	  }
</script>

