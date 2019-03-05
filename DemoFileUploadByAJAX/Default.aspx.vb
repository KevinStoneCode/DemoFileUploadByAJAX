
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim action As String = Request("ReqAction")
        Select Case action
            Case "UploadFile"
                Dim str As String = ""
                If Request.Files.AllKeys.Any() Then

                    Dim HttpPostedFile = Request.Files(0)
                    '' or 讀取指定的上傳檔案(input Name attribute) 
                    '' Dim HttpPostedFile = Request.Files("UploadedFile")

                    If HttpPostedFile IsNot Nothing AndAlso HttpPostedFile.ContentLength > 0 Then
                        Dim fileName As String = IO.Path.GetFileName(HttpPostedFile.FileName)
                        Dim fileSize As Long = HttpPostedFile.ContentLength

                        str &= "檔案名稱:" & fileName
                        str &= "\n檔案大小:" & fileSize & " bytes"
                        '' 檔案轉成位元組陣列
                        'Dim buffer As Byte() = Nothing
                        'Using binaryReader = New IO.BinaryReader(HttpPostedFile.InputStream)
                        '    buffer = binaryReader.ReadBytes(HttpPostedFile.ContentLength)
                        'End Using
                    End If
                End If

                Response.Clear()
                Response.ContentType = "text/html"
                Response.HeaderEncoding = System.Text.Encoding.GetEncoding("utf-8")
                Response.Write("{""result"": """ & str & """}")
                Response.End()
        End Select
    End Sub

End Class
