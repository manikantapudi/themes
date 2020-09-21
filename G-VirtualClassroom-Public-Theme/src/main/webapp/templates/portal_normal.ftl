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
	<header id="banner" class="row" role="banner">
		<div id="heading" class="col-md-2 col-xs-2 col-sm-2">
			<h1 class="site-title">
				<a class="${logo_css_class}" href="${site_default_url}" title="${site_name}" key="go-to-x" />
					<img alt="${logo_description}" src="${site_logo}" class="v-c-logo" />
				</a>
                 <#if show_site_name>
					<span class="site-name" title="${site_name}" key="go-to-x" />
						${site_name}
					</span>
				</#if>
			</h1>
		</div>
      <div class="banner-nav col-md-10">
		

		<#if has_navigation && is_setup_complete>
		  <button aria-controls="navigation" aria-expanded="false" class="collapsed navbar-toggle" data-target="#navigation123" data-toggle="collapse" type="button">
						<span class="icon-bar"></span>

						<span class="icon-bar"></span>

						<span class="icon-bar"></span>
					</button>
		
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
		
		</div>
	</header>

	<section id="content">
		<h1 class="hide-accessible">${the_title}</h1>

		<#--
		<nav id="breadcrumbs">
			<@liferay.breadcrumbs />
		</nav>
    -->
		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
			
	</section>
<#--
	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</p>
	</footer>
	-->
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>