<%@ Page Title="" Language="C#" MasterPageFile="~/user/UserNs.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="project_Nusery.user.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        /*or disappearing alert message*/
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-container">
                        <div>
                            <asp:TextBox ID="TextName" runat="server" CssClass="form-control" Placeholder="Enter Full Name" ToolTip="Full Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required" ControlToValidate="TextName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name Must be in Characters only" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="TextName"></asp:RegularExpressionValidator>
                        </div>
                        <br>
                        <div>
                            <asp:TextBox ID="TextUsername" runat="server" CssClass="form-control" Placeholder="Enter User Name" ToolTip="User Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage=" User name is Required" ControlToValidate="TextUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>

                        </div>
                        <br>
                        <div>
                            <asp:TextBox ID="TextEmail" runat="server" CssClass="form-control" Placeholder="Enter a Email" ToolTip="Email" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage=" Email is Required" ControlToValidate="TextEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <br>
                        <div>
                            <asp:TextBox ID="TextMobile" runat="server" CssClass="form-control" Placeholder="Enter Mobile Number" ToolTip=" Number" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Mobile Number is Required" ControlToValidate="TextMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Mobile Number must have 10 Digits" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" ControlToValidate="TextMobile"></asp:RegularExpressionValidator>
                        </div>
                        <br>
                    </div>
                </div>
                <spam>
                </spam>
                <div class="col-md-6">
                    <div class="form-container">

                        <div>
                            <asp:TextBox ID="TextAddress" runat="server" CssClass="form-control" Placeholder="Enter The Address" ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Required" ControlToValidate="TextAddress" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <br>
                        <div>
                            <asp:TextBox ID="TextPostCode" runat="server" CssClass="form-control" Placeholder="Enter User PostCode/Zip" ToolTip="Post/Zip Code" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage=" PostCode is Required" ControlToValidate="TextPostCode" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPstCode" runat="server" ErrorMessage="Post COde must be 6 Digit" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{6}$" ControlToValidate="TextPostCode"></asp:RegularExpressionValidator>

                        </div>
                        <br>
                        <div>
                            <asp:FileUpload ID="fuUserImage" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" runat="server" />
                        </div>
                        <br>
                        <div>
                            <asp:TextBox ID="TextPassword" runat="server" CssClass="form-control" Placeholder="Enter the Password" ToolTip=" Password" TextMode="Password" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required" ControlToValidate="TextPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <br>
                    </div>
                </div>
                </div>
                <br>
                <div class="row pl-4">

                    <div class="btn_box">

                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" 
                            OnClick="btnRegister_Click"/>

                        <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                            Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>">
                        </asp:Label>

                    </div>

                </div>
                <br>
                <div class="row pl-5">
                    <div style="align-items: center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
