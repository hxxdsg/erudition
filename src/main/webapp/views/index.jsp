<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Erudition</title>

    <link rel="stylesheet" href="${assetsPath}/css/app.min.css"/>
    <link rel="stylesheet" href="//cdn.bootcss.com/iCheck/1.0.1/skins/square/blue.css"/>
    <link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet">

    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="${assetsPath}/js/jquery-accordion-menu.js"></script>
    <script src="${assetsPath}/js/icheck.js"></script>
    <script src="${assetsPath}/js/template.js"></script>
    <style type="text/css">
        *{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
        body{background:#f0f0f0;}
        /*.content{width:260px;margin:100px auto;}*/
        .filterinput{
            background-color:rgba(249, 244, 244, 0);
            border-radius:15px;
            width:90%;
            height:30px;
            border:thin solid #FFF;
            text-indent:0.5em;
            font-weight:bold;
            color:#FFF;
        }
        #demo-list a{
            overflow:hidden;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            white-space:nowrap;
            width:100%;
        }
    </style>
</head>

<body>
<%--遮罩层--%>
<div class="mask"></div>

<jsp:include page="common/header.jsp" />
<c:set var="secondCates"/>

<div class="main flex-row">
    <div class="flex-2">

        <div class="nav">
            <div id="jquery-accordion-menu" class="jquery-accordion-menu white">
                <div id="user-image">
                    <a href=""><img src="${assetsPath}/images/user.jpg" alt="" class="img-circle"/></a>
                    <div class="user-name">${username}</div>
                </div>

                <div class="jquery-accordion-menu-header" id="form"></div>                 <!--//里面的form是动态添加的-->
                <ul id="demo-list">
                    <li id="home" class="active"><a href="#"><i class="fa fa-home"></i>主页 </a></li>
                    <c:set var="shareCateClass" value=""/>
                    <c:if test="${cateIsActive==0}">
                        <c:set var="shareCateClass" value="active"/>
                    </c:if>
                    <li class="${shareCateClass}" ><a href="#"><i class="fa fa-share-alt"></i>共享目录 </a>
                        <ul class="submenu" id="first-cates">
                            <c:forEach items="${categories}" var="firstCate">
                                <li><a href="#">${firstCate.name}</a>

                                    <ul class="submenu">
                                        <c:forEach items="${firstCate.children}" var="secondCate">
                                            <li><a href="#">${secondCate.name}</a>

                                                <ul class="submenu">
                                                    <c:forEach items="${secondCate.children}" var="thirdCate">
                                                        <li value="${thirdCate.id}"><a href="#">${thirdCate.name}</a></li>
                                                    </c:forEach>
                                                </ul>

                                            </li>
                                        </c:forEach>
                                    </ul>

                                </li>
                            </c:forEach>
                        </ul>

                    </li>

                    <c:set var="commonCateClass" value=""/>
                    <c:if test="${cateIsActive==1}">
                        <c:set var="commonCateClass" value="active"/>
                    </c:if>
                    <%--<li id="collection" class="${commonCateClass}" ><a href="${rootPath}/collection/showcollections"><i class="fa fa-glass"></i>常用目录 </a>--%>
                    <%--<li id="collection" class="${commonCateClass}" ><a href="#"><i class="fa fa-glass"></i>常用目录 </a>--%>
                    <li id="collection" class="" ><a href="#"><i class="fa fa-glass"></i>常用目录 </a>
                            <%--<ul class="submenu" >--%>
                                <%--<c:forEach items="${categories}" var="firstCate">--%>
                                    <%--<li><a href="#">${firstCate.name}</a>--%>

                                        <%--<ul class="submenu">--%>
                                            <%--<c:forEach items="${firstCate.children}" var="secondCate">--%>
                                                <%--<li><a href="#">${secondCate.name}</a>--%>

                                                    <%--<ul class="submenu">--%>
                                                        <%--<c:forEach items="${secondCate.children}" var="thirdCate">--%>
                                                            <%--<li value="${thirdCate.id}"><a href="#">${thirdCate.name}</a></li>--%>
                                                        <%--</c:forEach>--%>
                                                    <%--</ul>--%>

                                                <%--</li>--%>
                                            <%--</c:forEach>--%>
                                        <%--</ul>--%>

                                    <%--</li>--%>
                                <%--</c:forEach>--%>
                            <%--</ul>--%>

                    </li>

                </ul>
                <div class="jquery-accordion-menu-footer">
                    Footer
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
    </div>


    <div class="contents flex-8">
        <div class="header-all">
            <div class="header flex-row" id="home_header">
                <ul class="list-inline">
                    <li class="header-list active" id="recommend_getwin">推荐</li>
                    <li class="header-list" id="history_getwin">最近浏览</li>
                </ul>
            </div>
            <div class="file-body recommend_win" style="display: block">
                <!--<input type="checkbox"/>-->

                <div class="first-floor flex-row">
                    <div class="flex-3">
                        <div>
                            <input type="checkbox"/>
                            <span class="filename">名称</span>
                        </div>
                    </div>
                    <div class="flex-3">
                        大小
                    </div>
                    <div class="flex-3">
                        创建者
                    </div>
                    <div class="flex-3">
                        更新日期
                    </div>
                </div>
               <%-- <script>
                    $(function(){
                        $("#collection").click(function(){
                            console.log("点击了collection")
                        })
                    })

                </script>--%>
                <div class="line"></div>

                <c:forEach var="recommendfile" items="${recommendFiles}">
                    <div class="body-floor flex-row">
                        <div class="flex-3 flex-row">
                            <div class="flex-1 checkbox"><input type="checkbox"/></div>
                            <!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->
                            <div class="flex-1 file-image"><i class="iconfont icon-${recommendfile.type}"></i></div>
                            <div class="file-name flex-4"><span><a href="#">${recommendfile.title}</a></span></div>
                        </div>
                        <div class="flex-3 file-size">
                            <span>${recommendfile.size}</span>
                        </div>
                        <div class="flex-3 file-creator">
                                ${recommendfile.creater}
                        </div>
                        <div class="flex-3 file-time">
                                ${recommendfile.createTime}
                        </div>
                    </div>
                    <div class="line"></div>
                </c:forEach>



            </div>

            <%--<script>--%>
                <%--$("#collection").click(function(){--%>
                    <%--console.log("点击了collection")--%>
                <%--})--%>
            <%--</script>--%>

            <%--<div class="file-body history_win" style="display: none">
                <!--<input type="checkbox"/>-->

                <div class="first-floor flex-row">
                    <div class="flex-3">
                        <div>
                            <input type="checkbox"/>
                            <span class="filename">名称</span>
                        </div>
                    </div>
                    <div class="flex-3">
                        大小
                    </div>
                    <div class="flex-3">
                        创建者
                    </div>
                    <div class="flex-3">
                        更新日期
                    </div>
                </div>
                <div class="line"></div>

                <c:forEach var="recentfile" items="${recentFiles}" begin="0" end="8">
                    <div class="body-floor flex-row">
                        <div class="flex-3 flex-row">
                            <div class="flex-1 checkbox"><input type="checkbox"/></div>
                            <!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->
                            <div class="flex-1 file-image"><i class="iconfont icon-${recentfile.type}"></i></div>
                            <div class="file-name flex-4"><span><a href="#">${recentfile.title}</a></span></div>
                        </div>
                        <div class="flex-3 file-size">
                            <span>${recentfile.size}</span>
                        </div>
                        <div class="flex-3 file-creator">
                                ${recentfile.creater}
                        </div>
                        <div class="flex-3 file-time">
                                ${recentfile.createrTime}
                        </div>
                    </div>
                    <div class="line"></div>
                </c:forEach>




            </div>--%>
            <%--<div class="header flex-row">
                <div class="flex-7 path">
                    根目录
                </div>
                &lt;%&ndash;<div class="flex-3 search">&ndash;%&gt;
                    &lt;%&ndash;<div class="input-group">&ndash;%&gt;
                        &lt;%&ndash;<input type="text" class="form-control" placeholder="该目录下搜索...">&ndash;%&gt;
                              &lt;%&ndash;<span class="input-group-btn">&ndash;%&gt;
                                &lt;%&ndash;<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>&ndash;%&gt;
                              &lt;%&ndash;</span>&ndash;%&gt;
                    &lt;%&ndash;</div>&ndash;%&gt;
                &lt;%&ndash;</div>&ndash;%&gt;
            </div>
            <div class="file-body" id="file-list">
                <div class="first-floor flex-row">
                    <div class="flex-3">
                        <div>
                            <input type="checkbox"/>
                            <span class="filename">名称</span>
                        </div>
                    </div>
                    <div class="flex-3">大小</div>
                    <div class="flex-3">创建者</div>
                    <div class="flex-3">更新日期</div>
                </div>
                <div class="line"></div>

                &lt;%&ndash;<c:forEach items="${showcollections}" var="collections">&ndash;%&gt;
                    <div class='body-floor flex-row'>
                        <div class='flex-3 flex-row'>
                            <div class='flex-1 checkbox'>
                                <input type='checkbox'/>
                            </div>
                            <div class='flex-1 file-image'><i class='iconfont icon-mp4'></i></div>
                            <div class='file-name flex-4'><span id='id'><a href='#'>标题</a></span></div>
                        </div>
                        <div class='flex-3 file-size'><span>124kb</span></div>
                        <div class='flex-3 file-creator'>MR.z</div>
                        <div class='flex-3 file-time'>2015.025</div>
                    </div>
                    <div class='line'></div>
                &lt;%&ndash;</c:forEach>&ndash;%&gt;

                <nav>
                    <ul class="pagination pull-right">
                        <li><a href="#">上一页</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#">下一页</a>
                        </li>
                    </ul>
                </nav>


            </div>--%>
        </div>
    </div>

</div>

<%--主页主要js--%>
<script src="${assetsPath}/js/indexTab.js" charset="utf-8"></script>
<script>
    $(function(){
        var indextab=new indexTab();
    })
</script>
<%--<script src="${assetsPath}/js/require.js" charset="utf-8"></script>--%>
<!--完整的弹窗-->
<script src="${assetsPath}/js/popwinAll.js" charset="utf-8"></script>
<script src="${assetsPath}/js/file_show.js" charset="utf-8"></script>
<script>
    $(function () {
        var fileout=new FileOut();
    })
</script>
<!--fiel-watch窗口模板-->
<!--@依赖于文件弹窗-->
<%--<script id="file-watch-template" type="text/html" charset="utf-8">--%>
    <%--<div class="file-watch" style="display: block;">--%>
        <%--<div class="close-circle">×</div>--%>
        <%--<div class="video">--%>
            <%--<video id="really-cool-video" class="video-js vjs-default-skin" controls--%>
                   <%--preload="auto" poster="really-cool-video-poster.jpg"--%>
                   <%--data-setup='{}'>--%>
                <%--<source src="http://7xpl2y.com1.z0.glb.clouddn.com/asdf.mp4" type="video/mp4">--%>
                <%--<source src="really-cool-video.webm" type="video/webm">--%>
                <%--<p class="vjs-no-js">--%>
                    <%--To view this video please enable JavaScript, and consider upgrading to a web browser--%>
                    <%--that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>--%>
                <%--</p>--%>
            <%--</video>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</script>--%>
<!--file-watch二次弹窗-->

<%--begin尝试文档在线预览--%>
<%--<script id="file-watch-template" type="text/html" charset="utf-8">--%>
    <%--<div class="file-watch" style="display: block;">--%>
        <%--<div class="close-circle">×</div>--%>
        <%--<iframe width='738' height='523' class='preview-iframe' scrolling='no' frameborder='0' src='${assetsPath}/file/text/test.pdf' ></iframe>--%>
    <%--</div>--%>
<%--</script>--%>

<%--end尝试文档在线预览--%>

<script>
    //点开file-watch
    $(document).on("click",".file-out .file-size",function(event){
        event.stopPropagation();
        var html=template('file-watch-template');
        $("body").prepend(html);
        $(".file-watch").fadeIn(200);
    });
    //关闭file-watch
    $(document).on("click",".file-watch .close-circle",function(event){
        event.stopPropagation();
        $(".file-watch").fadeOut(200,function(){
            $(this).remove();
        });
    });
</script>



<%--左侧导航基础模板--%>
<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#jquery-accordion-menu").jqueryAccordionMenu();   //启用插件   jQuery等同于$

    });

    $(function(){
        //顶部导航切换
        $("#demo-list li").click(function(){
            $("#demo-list li.active").removeClass("active")
            $(this).addClass("active");
        })
    })
</script>


<!--动态创建搜索表单-->
<script type="text/javascript">
    (function($) {

        //@header 头部元素
        //@list 无需列表
        //创建一个搜素表单
        function filterList(header, list) {
            var form = $("<form>").attr({
                "class":"filterform",
                action:"#"
            }), input = $("<input>").attr({
                "class":"filterinput",
                type:"text"
            });
            $(form).append(input).appendTo(header);
            $(input).change(function() {              //过滤器的具体效果
                var filter = $(this).val();
                if (filter) {
                    $matches = $(list).find("a:Contains(" + filter + ")").parent();
                    $("li", list).not($matches).slideUp();
                    $matches.slideDown();
                } else {
                    $(list).find("li").slideDown();
                }
                return false;
            }).keyup(function() {           //用来监听键盘的效果的
                $(this).change();
            });
        }

        $(function() {                     //最先运行
            filterList($("#form"), $("#demo-list"));
        });

    })(jQuery);
</script>


<!--icheck    radio不能正常使用-->
<script>
    $(document).ready(function(){
        iCheckready();
    });
    var iCheckready=function(){
        console.log("调用了icheck插件")
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    };
</script>

<!--视频播放-->
<script src="//vjs.zencdn.net/5.8/video.min.js"></script>
<script type="text/javascript">
    $(function(){
        var player = videojs('really-cool-video', { /* Options */ }, function() {
            console.log('Good to go!');

            this.play(); // if you don't trust autoplay for some reason

            // How about an event listener?
            this.on('ended', function() {
                console.log('awww...over so soon?');
            });
        });
    });
</script>
</body>
</html>