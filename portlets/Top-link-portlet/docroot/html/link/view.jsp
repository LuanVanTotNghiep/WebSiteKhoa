<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" %>

<portlet:defineObjects />
<theme:defineObjects/>
<liferay-portlet:renderURL var="loginURL" portletName="58" windowState="<%=LiferayWindowState.EXCLUSIVE.toString() %>">
</liferay-portlet:renderURL>
	<aui:container>
		<aui:row cssClass="container">
			<ul class="top-ul">
				<c:if test="<%=!themeDisplay.isSignedIn() %>">
					<aui:a href="javascript:loginPopup()"><li><%=LanguageUtil.get(locale,"login") %></li></aui:a>
				</c:if>
				<aui:a href="<%=request.getContextPath()%>"><li><%=LanguageUtil.get(locale,"index") %></li></aui:a>
				<aui:a href="<%=request.getContextPath()%>"><li><%=LanguageUtil.get(locale,"link") %></li></aui:a>
				<li><liferay-portlet:runtime portletName="82"></liferay-portlet:runtime></li>
			</ul>
		</aui:row>
	</aui:container>
<aui:script>
Liferay.provide(window,'loginPopup',function(){
	
	AUI().ready('aui-base','aui-modal','liferay-util-window','aui-io-plugin-deprecated',function(A){
		
		var popup = Liferay.Util.Window.getWindow({
			dialog:{
				centered: true,
				width: 700,
				height:500,
				modal: true,
				resizable: false,
			},
			id: 'loginPopup'
		}).plug(A.Plugin.IO,{
			autoLoad:true,
			uri:'<%=loginURL.toString()%>'
		}).render();
		popup.titleNode.html("Login");
		popup.show();
		
		
	})
})
</aui:script>
