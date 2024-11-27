﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin1/admin1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="project_Nusery.Admin1.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-inner-content">
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-plant bg-c-blue card1-icon"></i>
                                    <span class="text-c-blue f-w-600">Categories</span>
                                    <h4><%Response.Write(Session["category"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="category.aspx"><i class="text-c-blue f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-leaf bg-c-pink card1-icon"></i>
                                    <span class="text-c-pink f-w-600">Plants</span>
                                    <h4><%Response.Write(Session["product"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Products.aspx"><i class="text-c-pink f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-weed bg-c-yellow card1-icon"></i>
                                    <span class="text-c-yellow f-w-600">Total Order</span>
                                    <h4><%Response.Write(Session["order"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Users.aspx"><i class="text-c-blue f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-shopping-cart bg-c-green card1-icon"></i>
                                    <span class="text-c-green f-w-600">Delivery Status</span>
                                    <h4><%Response.Write(Session["delivered"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Report.aspx"><i class="text-c-green f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-delivery-time bg-c-yellow card1-icon"></i>
                                    <span class="text-c-yellow f-w-600">Pending Items</span>
                                    <h4><%Response.Write(Session["pending"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href=""><i class="text-c-yellow f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-users bg-c-blue card1-icon"></i>
                                    <span class="text-c-blue f-w-600">Users</span>
                                    <h4><%Response.Write(Session["user"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href=""><i class="text-c-blue f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-money-bag bg-c-green card1-icon"></i>
                                    <span class="text-c-green f-w-600">Sold Amount</span>
                                    <h4><%Response.Write(Session["soldAmount"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Report.aspx"><i class="text-c-green f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="card widget-card-1">
                                <div class="card-block-small">
                                    <i class="icofont icofont-live-support bg-c-pink card1-icon"></i>
                                    <span class="text-c-pink f-w-600">Feedback</span>
                                    <h4><%Response.Write(Session["contact"]);%></h4>
                                    <div>
                                        <span class="f-left m-t-10 text-muted">
                                            <a href="Contacts.aspx"><i class="text-c-pink f-16 icofont icofont-eye-alt m-r-10"></i>View Detalis</a>
                                        </span>
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
