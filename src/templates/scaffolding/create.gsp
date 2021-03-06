<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.plugins.PluginManagerHolder %>
<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div data-role="page">
			<div data-role="header">
				<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			</div>
			<div data-role="content">
				<g:if test="\${flash.message}">
				<div class="message" role="alert">\${flash.message}</div>
				</g:if>
				<g:hasErrors bean="\${${propertyName}}">
				<div class="errors" role="alert">
					<g:renderErrors bean="\${${propertyName}}" as="list" />
				</div>
				</g:hasErrors>
				<g:form action="save" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
				<%  excludedProps = Event.allEvents.toList() << 'version' << 'id' << 'dateCreated' << 'lastUpdated'
					persistentPropNames = domainClass.persistentProperties*.name
					props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					display = true
					required = false
					boolean hasHibernate = PluginManagerHolder.pluginManager.hasGrailsPlugin('hibernate')
					props.each { p ->
						if (hasHibernate) {
							cp = domainClass.constrainedProperties[p.name]
							display = (cp ? cp.display : true)
							required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable : false)
						}
						if (display) { %>
					<div data-role="fieldcontain">
						<label for="${p.name}"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
						${renderEditor(p)}
					</div>
				<%  }   } %>
					<g:submitButton name="create" data-icon="check" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
				</g:form>
			</div>
			<div data-role="footer">
			</div>
		</div>
	</body>
</html>
