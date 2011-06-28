<html>
	<head>
		<meta name="layout" content="mobile" />
		<title>Grails Runtime Exception</title>
	</head>

	<body>
		<div data-role="page" id="error" >
			<div data-role="header">
				<h1>Error</h1>
			</div>
			<div data-role="content">
				<ul data-role="listview" data-theme="c">
					<li data-role="list-divider">Error ${request.'javax.servlet.error.status_code'}</li>
					<li>${request.'javax.servlet.error.message'.encodeAsHTML()}</li>
					
					<li data-role="list-divider">Servlet</li>
					<li>${request.'javax.servlet.error.servlet_name'}</li>
					
					<li data-role="list-divider">URI</li>
					<li>${request.'javax.servlet.error.request_uri'}</li>
					
					<g:if test="${exception}">
						<li data-role="list-divider">Exception Message:</li>
						<li> ${exception.message?.encodeAsHTML()} </li>
						<li data-role="list-divider">Caused by:</li>
						<li> ${exception.cause?.message?.encodeAsHTML()} </li>
						<li data-role="list-divider">Class:</li>
						<li> ${exception.className} </li>
						<li data-role="list-divider">At Line:</li>
						<li> [${exception.lineNumber}] </li>
						<li data-role="list-divider">Code Snippet:</li>
						<li>
							<g:each var="cs" in="${exception.codeSnippet}">
								${cs?.encodeAsHTML()}
							</g:each>
						</li>
						<li data-role="list-divider">Stack Trace</li>
						<li>
							<pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
						</li>
					</g:if>
				</ul>
			</div>
			<div data-role="footer">
				<div data-role="navbar">
					<ul>
						<li><a href="/" data-ajax="false" >Home</a></li>
						<li><a href="#" data-rel="back" >Back</a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
