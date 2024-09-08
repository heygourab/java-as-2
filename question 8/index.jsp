<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Functions Demo</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; padding: 20px; }
        h1 { color: #333; }
        h2 { color: #666; }
        pre { background-color: #f4f4f4; padding: 10px; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>JSTL Functions Demonstration</h1>

    <c:set var="testString" value="Hello, JSTL World!" />
    <c:set var="testArray" value="${fn:split('Apple,Banana,Cherry,Date', ',')}" />

    <h2>1. contains(String, String)</h2>
    <p>Does "${testString}" contain "JSTL"? ${fn:contains(testString, "JSTL")}</p>

    <h2>2. containsIgnoreCase(String, String)</h2>
    <p>Does "${testString}" contain "jstl" (case-insensitive)? ${fn:containsIgnoreCase(testString, "jstl")}</p>

    <h2>3. endsWith(String, String)</h2>
    <p>Does "${testString}" end with "World!"? ${fn:endsWith(testString, "World!")}</p>

    <h2>4. escapeXml(String)</h2>
    <c:set var="xmlString" value="<test>This is XML</test>" />
    <p>Original: ${xmlString}</p>
    <p>Escaped: ${fn:escapeXml(xmlString)}</p>

    <h2>5. indexOf(String, String)</h2>
    <p>Index of "JSTL" in "${testString}": ${fn:indexOf(testString, "JSTL")}</p>

    <h2>6. join(String[], String)</h2>
    <p>Joined array: ${fn:join(testArray, " - ")}</p>

    <h2>7. length(Object)</h2>
    <p>Length of "${testString}": ${fn:length(testString)}</p>

    <h2>8. replace(String, String, String)</h2>
    <p>Replace "JSTL" with "Java": ${fn:replace(testString, "JSTL", "Java")}</p>

    <h2>9. split(String, String)</h2>
    <p>Split "${testString}" by ", ":</p>
    <c:forEach var="item" items="${fn:split(testString, ', ')}">
        <pre>${item}</pre>
    </c:forEach>

    <h2>10. startsWith(String, String)</h2>
    <p>Does "${testString}" start with "Hello"? ${fn:startsWith(testString, "Hello")}</p>

    <h2>11. substring(String, int, int)</h2>
    <p>Substring(7, 11) of "${testString}": ${fn:substring(testString, 7, 11)}</p>

    <h2>12. substringAfter(String, String)</h2>
    <p>Substring after "Hello, " in "${testString}": ${fn:substringAfter(testString, "Hello, ")}</p>

    <h2>13. substringBefore(String, String)</h2>
    <p>Substring before "World" in "${testString}": ${fn:substringBefore(testString, "World")}</p>

    <h2>14. toLowerCase(String)</h2>
    <p>Lowercase: ${fn:toLowerCase(testString)}</p>

    <h2>15. toUpperCase(String)</h2>
    <p>Uppercase: ${fn:toUpperCase(testString)}</p>

    <h2>16. trim(String)</h2>
    <c:set var="stringWithSpaces" value="    Trimmed String    " />
    <p>Original: "${stringWithSpaces}"</p>
    <p>Trimmed: "${fn:trim(stringWithSpaces)}"</p>

</body>
</html>