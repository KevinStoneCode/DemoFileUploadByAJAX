<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../js/jquery-1.12.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // 支援一般瀏覽器
            $('#btnUploadFile').on('click', function () {
                var data = new FormData();
                data.append('ReqAction', 'UploadFile');
                var files = $('#fileUpload').get(0).files;

                if (files.length > 0) {
                    data.append('UploadedFile', files[0]);
                } else {
                    alert('請選擇檔案');
                    return false;
                }
                
                $.ajax({
                    type: 'POST',
                    url: '<%= ResolveClientUrl(Request.AppRelativeCurrentExecutionFilePath) %>',
                    contentType: false,     
                    processData: false,
                    dataType: 'json',
                    data: data
                }).done(function(resp) {
                    alert(resp.result);
                }).fail(function() {
                    alert('Error');
                });
                
            });

            // 支援IE < 10
            //$('#Uploadedfrm').load(function(){
            //    var resp = $(this).contents().find('body').text();
            //    if (resp != '') {
            //        resp = $.parseJSON(resp);
            //        alert(resp.result);
            //    }
            //});
        });
    </script>
</head>
<body>
    <input id="fileUpload" type="file" name="fileUpload" accept=".pdf,.doc,.docx"/>
    <input id="btnUploadFile" type="button" value="上傳" />
    <%--<form action='<%= ResolveClientUrl(Request.AppRelativeCurrentExecutionFilePath) %>' method='post' enctype='multipart/form-data' target='Uploadedfrm'>
        <input type="hidden" name="ReqAction" value="UploadFile"/>
        <input id="fileUpload" type="file" name="fileUpload" accept=".pdf,.doc,.docx"/>
        <input id="btnUploadFile" type="submit" value="上傳" />
    </form>--%>

    <iframe id="Uploadedfrm" name="Uploadedfrm" style="display: none"></iframe>
</body>
</html>
