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
				<p>Welcome</p>
			</div>
		</div>
		<div data-role="page" id="status">
			<div data-role="header" >
				<h1>App Status</h1>
			</div>
			<div data-role="content">
				<ul data-role="listview" data-theme="c" data-inset="true">
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">App version:</span>
							<span class="ui-block-b"><g:meta name="app.version"/></span>
						</div>
					</li>
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">Grails version:</span>
							<span class="ui-block-b"><g:meta name="app.grails.version"/></span>
						</div> 
					</li>
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">Groovy version:</span>
							<span class="ui-block-b">${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</span>
						</div>
					</li>
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">JVM version:</span>
							<span class="ui-block-b">${System.getProperty('java.version')}</span>
						</div>
					</li>
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">Controllers:</span>
							<span class="ui-block-b">${grailsApplication.controllerClasses.size()}</span>
						</div>
					</li>
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">Domains:</span>
							<span class="ui-block-b">${grailsApplication.domainClasses.size()}</span>
						</div>
					</li>
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">Services:</span>
							<span class="ui-block-b">${grailsApplication.serviceClasses.size()}</span>
						</div>
					</li>
					<li>
						<div class="ui-grid-a">
							<span class="ui-block-a">Tag Libs:</span>
							<span class="ui-block-b">${grailsApplication.tagLibClasses.size()}</span>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div data-role="page" id="plugins">
			<div data-role="header" >
				<h1>Plugins</h1>
			</div>
			<div data-role="content">
				<ul data-role="listview" data-theme="c" data-inset="true">
					<g:set var="pluginManager" value="${applicationContext.getBean('pluginManager')}"/>
					<g:each var="plugin" in="${pluginManager.allPlugins}">
						<li>
							<div class="ui-grid-a">
								<span class="ui-block-a">${plugin.name} :</span>
								<span class="ui-block-b">${plugin.version}</span>
							</div>
						</li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
