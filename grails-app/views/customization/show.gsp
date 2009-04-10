<%@ page import="com.mattstine.wendysstore.domain.Customization" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>Show Customization</title>
</head>
<body>
<div class="body">
  <h1>Show Customization</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name">Customization ID:</td>

        <td valign="top" class="value">${fieldValue(bean: customizationInstance, field: 'id')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Label:</td>

        <td valign="top" class="value">${fieldValue(bean: customizationInstance, field: 'label')}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Type:</td>

        <td valign="top" class="value">${customizationInstance?.type?.labelText}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Required:</td>

        <td valign="top" class="value"><g:if test="${customizationInstance.required}">Yes</g:if><g:else>No</g:else></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Chargeable:</td>

        <td valign="top" class="value"><g:if test="${customizationInstance.chargeable}">Yes</g:if><g:else>No</g:else></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name">Price:</td>

        <td valign="top" class="value">${fieldValue(bean: customizationInstance, field: 'price')}</td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${customizationInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>
  <div class="dialog span-20 last" style="text-align: center">
    <g:form name="addChoiceForm" method="post">
      <input type="hidden" name="customizationId" value="${customizationInstance?.id}"/>
      <input type="hidden" name="id" value="${customizationChoiceInstance?.id}"/>
      <label for="label">Label:</label><g:textField name="label" value="${customizationChoiceInstance.label}"/>
      <label for="chargeable">Chargeable:</label><g:checkBox id="chargeable" name="chargeable" value="${customizationChoiceInstance?.chargeable}"/>
      <label for="price">Price:</label><g:textField name="price" value="${customizationChoiceInstance.price}"/>
      <span class="button">
        <g:if test="${customizationChoiceInstance?.id == null}">
          <g:actionSubmit class="add" value="Add Choice" action="addChoice"/>
        </g:if>
        <g:else>
          <g:actionSubmit class="add" value="Update Choice" action="updateChoice"/>
        </g:else>
      </span>
    </g:form>
  </div>
  <div class="list span-20 last" style="text-align: center">
    <table class="datatable">
      <thead>
      <tr>

        <g:sortableColumn property="label" title="Label"/>

        <g:sortableColumn property="chargeable" title="Chargeable"/>

        <g:sortableColumn property="price" title="Price"/>

        <th>&nbsp;</th>

        <th>&nbsp;</th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${customizationInstance.choices}" status="i" var="customizationChoiceInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td>${fieldValue(bean: customizationChoiceInstance, field: 'label')}</td>

          <td><g:if test="${customizationChoiceInstance.chargeable}">Yes</g:if><g:else>No</g:else></td>

          <td><g:formatNumber number="${customizationChoiceInstance.price}" format="\$0.00"/></td>

          <td class="buttons">
            <g:form action="editChoice">
              <g:hiddenField name="id" value="${customizationChoiceInstance.id}"/>
              <g:hiddenField name="customizationId" value="${customizationInstance.id}"/>
              <span class="button"><g:submitButton name="editCustomizationChoice" class="edit" value="Edit"/></span>
            </g:form>
          </td>

          <td class="buttons">
            <g:form action="deleteChoice">
              <g:hiddenField name="customizationId" value="${customizationInstance.id}"/>
              <g:hiddenField name="id" value="${customizationChoiceInstance.id}"/>
              <span class="button"><g:submitButton class="delete" name="deleteCustomizationChoice" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            </g:form>

          </td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>