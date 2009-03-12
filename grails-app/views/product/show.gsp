<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title>${fieldValue(bean: productInstance, field: 'name')}</title>
  <script type="text/javascript" src="${createLinkTo(dir:'js/dojo', file:'dojo.js')}"
    djConfig="parseOnLoad:true, isDebug:true"></script>
  <g:javascript>
    dojo.require("dojo.io.iframe");

    function submitForm() {
      dojo.io.iframe.send({
        form: 'uploadProductImageForm',
        load: function (data) {
          dojo.byId('productImage').innerHTML = data;
        }
      });
    }
  </g:javascript>
</head>
<body>
<p>
  <g:productCategoryBreadcrumbs category="${productInstance.category}"/>
</p>
<div id="product-head" class="span-20 last">
  <h2>${fieldValue(bean: productInstance, field: 'name')}</h2>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
</div>
<div id="productImage" class="span-7"><img src="${resource(dir: grailsApplication.config.store.productImages.webPath, file: productInstance?.image?.name)}" width="250"></div>
<div class="span-13 last">
  <p>${fieldValue(bean: productInstance, field: 'description')}<br/><br/>
    <strong><g:formatNumber format="\$0.00" number="${productInstance.price}"/></strong></p>
</div>
<g:ifAllGranted role="ROLE_ADMIN">

  <div class="buttons">
    <g:form>
      <input type="hidden" name="id" value="${productInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
      <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
    </g:form>
  </div>

  <g:form name="uploadProductImageForm" method="post" action="uploadProductImage" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${productInstance?.id}"/>
    <input type="file" name="newProductImage"/>
    <input type="button" name="uploadImage" value="Upload Image" onclick="submitForm()"/>
  </g:form>

  <div id="imageUploaded"></div>
</g:ifAllGranted>
</body>
</html>
