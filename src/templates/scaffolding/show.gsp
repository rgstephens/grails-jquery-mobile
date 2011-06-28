<% import grails.persistence.Event %> <%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" />
		</title>
	</head>
<body>
	<div data-role="page">
		<div data-role="header">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
			</h1>
		</div>
		<div data-role="content">
			<ul data-role="listview">
				<g:if test="\${flash.message}">
					<li data-theme="e" data-icon="info" class="message">\${flash.message}</li>
				</g:if>
				<% excludedProps = Event.allEvents.toList() << 'version'
				allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
				props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				props.each { p -> %>
				<li>
					<div class="ui-grid-a">
						<span class="ui-block-a">
							<g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" />
						</span>
						<% if (p.isEnum()) { %>
						<span class="ui-block-b">
							<g:fieldValue bean="\${${propertyName}}" field="${p.name}" />
						</span>
						<% } else if (p.oneToMany || p.manyToMany) { %>
						<span class="ui-block-b">
							<ul>
							<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
								<li>
									<g:link controller="${p.referencedDomainClass?.propertyName}"
										action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link>
								</li>
							</g:each>
							</ul>
						</span>
						<% } else if (p.manyToOne || p.oneToOne) { %>
						<span class="ui-block-b">
							<g:link controller="${p.referencedDomainClass?.propertyName}"
								action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
						</span>
						<% } else if (p.type == Boolean || p.type == boolean) { %>
						<span class="ui-block-b">
							<g:formatBoolean boolean="\${${propertyName}?.${p.name}}" />
						</span>
						<% } else if (p.type == Date || p.type == java.sql.Date || p.type ==
						java.sql.Time || p.type == Calendar) { %>
						<span class="ui-block-b">
							<g:formatDate date="\${${propertyName}?.${p.name}}" style="SHORT" />
						</span>
						<% } else if(!p.type.isArray()) { %>
						<span class="ui-block-b">
							<g:fieldValue bean="\${${propertyName}}" field="${p.name}" />
						</span>
						<% } %> <% } %>
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
