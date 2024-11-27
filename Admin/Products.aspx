<%@ Page Title="" Language="C#" MasterPageFile="~/Admin1/admin1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="project_Nusery.Admin1.Products" %>

<%@ Import Namespace="project_Nusery" %>

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
                    $('#<%=imgProduct.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Plants</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Plants Name</label>
                                                    <div>
                                                        <asp:TextBox ID="textName" runat="server" CssClass="form-control"
                                                            placeholder="Enter Plants Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextName"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Plants Description</label>
                                                    <div>
                                                        <asp:TextBox ID="TextDescription" runat="server" CssClass="form-control"
                                                            placeholder="Enter Plants Description" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description Is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextDescription"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Plants Price(RS)</label>
                                                    <div>
                                                        <asp:TextBox ID="TextPrice" runat="server" CssClass="form-control"
                                                            placeholder="Enter Plants Price"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextPrice"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Price Must Be In Decimal" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextPrice"
                                                            ValidationExpression="\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Plants Quantity</label>
                                                    <div>
                                                        <asp:TextBox ID="TextQuantity" runat="server" CssClass="form-control"
                                                            placeholder="Enter Plants Quantity"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Quantity Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextQuantity"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Quantity Must Be Nonnegetive" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="TextQuantity"
                                                            ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label>Plants Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control"
                                                            onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Plants Category</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control"
                                                            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId"
                                                            AppendDataBoundItem="true">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Category Is Required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCategories" InitialValue="0">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive"
                                                        CssClass="from-check-input" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary"
                                                        OnClick="btnAddOrUpdate_Click" />

                                                    &nbsp;
                                                 <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary"
                                                     CausesValidation="false" OnClick="btnClear_Click" />
                                                </div>
                                                <div>
                                                    <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category Lists</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">

                                                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand"
                                                        OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Name</th>
                                                                        <th>Image</th>
                                                                        <th>Price(RS)</th>
                                                                        <th>Quantity</th>
                                                                        <th>Description</th>
                                                                        <th>IsActive</th>
                                                                        <th>CategoryName</th>
                                                                        <th>CreatedDate</th>
                                                       
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Name") %> </td>
                                                                <td>
                                                                    <img alt="" width="40" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" />

                                                                </td>

                                                                <td><%# Eval("Price") %></td>
                                                                <td>
                                                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                </td>

                                                                <td><%# Eval("CreatedDate")%></td>

                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                </td>

                                                                <td><%# Eval("CategoryName")%></td>

                                                                <td><%# Eval("Descripation") %></td>

                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CausesValidation="false"
                                                                        CommandArgument='<%# Eval("ProductId")%>' CommandName="edit">
                                                                         <i class="ti-pencil"></i>
                                                                 </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                        CssClass="badge bg-danger" CommandArgument='<%# Eval("ProductId")%>'
                                                                        OnClientClick="return confirm('Do you want to delete this Plant?');"
                                                                        CausesValidation="false">
                                                                         <i class="ti-trash"></i>
                                                                 </asp:LinkButton>

                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                         </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
