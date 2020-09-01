<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext()>
<#assign OrgRolesLocalService = serviceLocator.findService("com.vidyayug.global.service.Org_RolesLocalService")>
<#assign themeDisplay = serviceContext.getThemeDisplay() />
<#assign userGroupRoleLocalServiceUtil = staticUtil['com.liferay.portal.kernel.service.UserGroupRoleLocalServiceUtil']/>
<#assign roleLocalServiceUtil = staticUtil['com.liferay.portal.kernel.service.RoleLocalServiceUtil'] />
<#assign layout = themeDisplay.getLayout() />
<#assign group_id = layout.getGroupId()/> 
<#assign userId= user.getUserId()/>
<#assign userRole= OrgRolesLocalService.getUserRoleInOrganization(userId,group_id)/>

<#assign notificationUrl= portletURLFactory.create(request,"com_liferay_notifications_web_portlet_NotificationsPortlet", themeDisplay.getPlid() ,"RENDER_PHASE")/>
<#assign userNotificationEventLocalService= serviceLocator.findService("com.liferay.portal.kernel.service.UserNotificationEventLocalService") />
<#assign PortalUtil = staticUtil["com.liferay.portal.kernel.util.PortalUtil"] />
<#assign  hiddenPageLayoutId= PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(),'Calendar_Override_Js_portlet_CalendarOverrideJsPortlet') />
	
<#assign notSeenNotificationsCount=userNotificationEventLocalService.getArchivedUserNotificationEventsCount(userId, false) />
	
	<#assign  permissionChecker  =themeDisplay.getPermissionChecker()>
	<#assign  issuperadmin =permissionChecker.isOmniadmin()?string>



<head>
	<title>${the_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
	<link rel="shortcut icon" href="${images_folder}/favicon.ico">
	
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">
	<header id="banner" role="banner">
		<div id="heading" class="col-md-2 col-xs-2 col-sm-2">
			<h1 class="site-title">
				<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" class="v-c-pv-logo" src="${site_logo}"  />
				</a>

				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
			</h1>
		</div>

		
      <div class="banner-pv-nav col-md-10">
	  <button aria-controls="navigation" aria-expanded="false" class="collapsed navbar-toggle" data-target="#navigationsub" data-toggle="collapse" type="button">
						<span class="icon-bar"></span>

						<span class="icon-bar"></span>

						<span class="icon-bar"></span>
					</button>
	
	<li class="v-c-g-c-noti-m m-view"><span id="notify_text" class="fa fa-bell ot-cu-bell1"> </span>
			<div class="not-count1m-view-div">	</div> 
				
		   </li>
		   <ul class="gvc-noti-ul-m">
		   
		    		       
			

		 </ul>
		   
		   
		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
		
	</div>	
	</header>

	<section id="content">
		<h1 class="hide-accessible">${the_title}</h1>

		

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
		
		
		<style>
     .control-menu-level-1{
	 display:none;
	 }
	 .has-control-menu #wrapper {
    margin-top: 0px;
}


body.open #wrapper {
    padding-left: 0px;
}

.sidenav-fixed.sidenav-menu-slider.open {
    visibility: hidden;
	}

	</style>
	 
   <#if userRole== "Site Admin" || issuperadmin="true">
		
	<style>
	
	body.open #wrapper {
    padding-left: 320px;
}
.sidenav-fixed.sidenav-menu-slider.open {
    visibility: visible;
	}
	
     .control-menu-level-1{
	 display:block;
	 }
	 #content {
    margin-top: 72px;
	}
		 .has-control-menu #wrapper {
      margin-top: 65px;
}
.popover.top {
    margin-top: auto !important;
}

div#_com_liferay_calendar_web_portlet_CalendarPortlet_columnOptions {
    margin-top: 0px;
}

@media screen and (min-width: 320px) and (max-width: 767px) {

.popover.top {
    margin-top: auto !important;
}
	 .has-control-menu #wrapper {
     margin-top: 48px !important;
}
#content {
    margin-top: 85px;
}


}

	</style>
		</#if>
		
		<#if userRole== "Site Admin" || userRole== "Parent">
		<style>
		.v-c-g-c-noti{
		display:none !important;
		}
		li.v-c-g-c-noti-m.m-view{
		display:none !important;
		}
		</style>
		</#if>
		
		
		
	</section>
	<!--
	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</p>
		
		user role is :${userRole}
	
		
	</footer>
-->
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>