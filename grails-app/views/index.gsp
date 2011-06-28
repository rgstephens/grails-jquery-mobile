<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile" />
		<title>Grails!</title>
	</head>
	<body>
		<div data-role="page" id="homepage" >
			<div data-role="header">
				<h1>Grails!</h1>
			</div>
			<div data-role="content">
				<ul data-role="listview" data-theme="c">
					<li data-role="list-divider">App Info:</li>
					<li><a href="#status">Status</a></li>
					<li><a href="#plugins">Plugins</a></li>
					<li data-role="list-divider">Controllers:</li>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
			<div data-role="footer">
				footer...
			</div>
		</div>
		<div data-role="page" id="status">
			<div data-role="header" >
				<h1>App Status</h1>
			</div>
			<div data-role="content">
				<ul data-role="listview" data-theme="c">
					<li>App version: <g:meta name="app.version"/></li>
					<li>Grails version: <g:meta name="app.grails.version"/></li>
					<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
					<li>JVM version: ${System.getProperty('java.version')}</li>
					<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
					<li>Domains: ${grailsApplication.domainClasses.size()}</li>
					<li>Services: ${grailsApplication.serviceClasses.size()}</li>
					<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
				</ul>
			</div>
		</div>
		<div data-role="page" id="plugins">
			<div data-role="header" >
				<h1>Plugins</h1>
			</div>
			<div data-role="content">
				<ul data-role="listview" data-theme="c">
					<g:set var="pluginManager" value="${applicationContext.getBean('pluginManager')}"/>
					<g:each var="plugin" in="${pluginManager.allPlugins}">
						<li>${plugin.name} - ${plugin.version}</li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
