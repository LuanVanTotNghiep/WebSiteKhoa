<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	 <script src="${javascript_folder}/jquery-3.3.1.min.js" type="text/javascript" ></script>
	  <script src="${javascript_folder}/style.js"></script>
	${theme.include(top_head_include)}
</head>

<body class="${css_class}">

<a href="#main-content" id="skip-to-content"><@liferay.language key="skip-to-content" /></a>


	<#if is_signed_in>
		<@liferay.dockbar />
	</#if>

<div class="container-fluid" id="wrapper">
	<header id="banner" role="banner" class="abc" >
		<div id="heading" class="row-fluid">
		<div class="span2"><img alt="${logo_description}" width="100px"src="${images_folder}/logo.jpg"  /></div>
		<div class="span9" id="nl_title">
			<h3>TRƯỜNG ĐẠI HỌC NÔNG LÂM TP.HCM</h3>
			<h1> KHOA CÔNG NGHỆ THÔNG TIN	</h1>
		</div>
		<div>
			<#if !is_signed_in>
			<a class="btn btn-large btn-primary" href="${sign_in_url}" data-redirect="${is_login_redirect_required?string}" id="sign-in" rel="nofollow">${sign_in_text}</a>
			</#if>
		</div>
		<div></div>
		</div>
		
		<#if has_navigation || is_signed_in>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
		<img alt="${logo_description}" src="${images_folder}/nonglam.jpg"  />
	</header>

	<div id="content">
		<nav id="breadcrumbs"><@liferay.breadcrumbs /></nav>
		<#if selectable>
			${theme.include(content_include)}
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			${theme.wrapPortlet("portlet.ftl", content_include)}
		</#if>
	</div>

	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</p>
	</footer>
</div>

${theme.include(body_bottom_include)}

${theme.include(bottom_include)}

</body>

</html>