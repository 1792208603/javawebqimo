<%--
  Created by IntelliJ IDEA.
  User: 20698
  Date: 2022/12/13
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="http://${header.host}${pageContext.request.contextPath}/"/>
    <meta charset="utf-8"/>
    <title>管理后台</title>
    <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.css">
    <!-- 引入图标字体 -->
    <link rel="stylesheet" href="static/font/iconfont.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="manage/manage.do">动漫管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="manage/user" id="user">用户管理</a></li>
                <li><a href="manage/comic">动漫管理</a></li>
                <li><a href="manage/news">资讯管理</a></li>
                <li><a href="manage/admin">管理员管理</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">${sessionScope.admin.adminName} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="admin/AdminLogout">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">折线图</div>
        <div class="panel-body">
            <div id="m1" style="width: 100%; height: 600px;"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">柱状图</div>
                <div class="panel-body">
                    <div id="m2" style="width:100%;height:400px;"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">饼图</div>
                <div class="panel-body">
                    <div id="m3" style="width: 100%;height: 400px;"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">加载动画</div>
        <div class="panel-body">
            <div id="m4" style="width: 100%; height: 600px;"></div>
        </div>
    </div>
</div>


<%--<nav aria-label="Page navigation">--%>
<%--    <ul class="pagination">--%>
<%--        <li>--%>
<%--            <a href="#" aria-label="Previous">--%>
<%--                <span aria-hidden="true">&laquo;</span>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--        <li><a href="#">1</a></li>--%>
<%--        <li><a href="#">2</a></li>--%>
<%--        <li><a href="#">3</a></li>--%>
<%--        <li><a href="#">4</a></li>--%>
<%--        <li><a href="#">5</a></li>--%>
<%--        <li>--%>
<%--            <a href="#" aria-label="Next">--%>
<%--                <span aria-hidden="true">&raquo;</span>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</nav>--%>

<script src="static/jquery-3.5.1/jquery-3.5.1.js"></script>
<script src="static/bootstrap-3.4.1-dist/js/bootstrap.js"></script>
<script src="static/echarts/echarts.js"></script>

<script>
    $(function () {
        initLine();
        initBar();
        initPie();
        initLoad();
    });

    function initLine() {
        // 基于准备好的dom，初始化echarts实例
        let myChart = echarts.init(document.getElementById('m1'));


        let option = {
            title: {
                text: 'Stacked Area Chart'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend: {
                // data: ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    // data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: 'Email',
                    type: 'line',
                    stack: 'Total',
                    areaStyle: {},
                    emphasis: {
                        focus: 'series'
                    },
                    // data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name: 'Union Ads',
                    type: 'line',
                    stack: 'Total',
                    areaStyle: {},
                    emphasis: {
                        focus: 'series'
                    },
                    // data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name: 'Video Ads',
                    type: 'line',
                    stack: 'Total',
                    areaStyle: {},
                    emphasis: {
                        focus: 'series'
                    },
                    // data: [150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name: 'Direct',
                    type: 'line',
                    stack: 'Total',
                    areaStyle: {},
                    emphasis: {
                        focus: 'series'
                    },
                    // data: [320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name: 'Search Engine',
                    type: 'line',
                    stack: 'Total',
                    label: {
                        show: true,
                        position: 'top'
                    },
                    areaStyle: {},
                    emphasis: {
                        focus: 'series'
                    },
                    // data: [820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };

        $.ajax({
            url: "testEcharts",
            type: "GET",
            success: function (res) {
                // 获取后台数据,已经转为JSON格式
                // console.log(JSON.parse(res));
                const json = JSON.parse(res);
                // console.log(json);
                // 将数据渲染上去
                option.legend.data = json.legendData;
                option.xAxis[0].data = json.xAxisData;
                $.each(json.seriesData, function (index, value) {
                    option.series[index].data = value;
                });
                myChart.setOption(option);
            }
        })
    }

    function initBar() {

        let myChart = echarts.init(document.getElementById('m2'));

        let option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: 'Direct',
                    type: 'bar',
                    barWidth: '60%',
                    data: [10, 52, 200, 334, 390, 330, 220]
                }
            ]
        };
        myChart.setOption(option);
    }

    function initPie() {

        let myChart = echarts.init(document.getElementById('m3'));

        let option = {
            title: {
                text: 'Referer of a Website',
                subtext: 'Fake Data',
                left: 'center'
            },
            tooltip: {
                trigger: 'item'
            },
            legend: {
                orient: 'vertical',
                left: 'left'
            },
            series: [
                {
                    name: 'Access From',
                    type: 'pie',
                    radius: '50%',
                    data: [
                        {value: 1048, name: 'Search Engine'},
                        {value: 735, name: 'Direct'},
                        {value: 580, name: 'Email'},
                        {value: 484, name: 'Union Ads'},
                        {value: 300, name: 'Video Ads'}
                    ],
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        myChart.setOption(option);
    }

    function initLoad() {

        let myChart = echarts.init(document.getElementById('m4'));

        let option = {
            graphic: {
                elements: [
                    {
                        type: 'group',
                        left: 'center',
                        top: 'center',
                        children: new Array(7).fill(0).map((val, i) => ({
                            type: 'rect',
                            x: i * 20,
                            shape: {
                                x: 0,
                                y: -40,
                                width: 10,
                                height: 80
                            },
                            style: {
                                fill: '#5470c6'
                            },
                            keyframeAnimation: {
                                duration: 1000,
                                delay: i * 200,
                                loop: true,
                                keyframes: [
                                    {
                                        percent: 0.5,
                                        scaleY: 0.3,
                                        easing: 'cubicIn'
                                    },
                                    {
                                        percent: 1,
                                        scaleY: 1,
                                        easing: 'cubicOut'
                                    }
                                ]
                            }
                        }))
                    }
                ]
            }
        };
        myChart.setOption(option);
    }

</script>
</body>
</html>
