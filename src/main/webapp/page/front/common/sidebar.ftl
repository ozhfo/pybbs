<#macro sidebar sidebar_user_info="" sidebar_topic_user="" sidebar_checkin="" sidebar_create="" sidebar_scoretop=""
    sidebar_create_info="" sidebar_about="" sidebar_other_topic=""
    sidebar_not_reply_topic="" sidebar_xgtopic="" sidebar_jfbbs_run_status="">
<#if sidebar_user_info == "show">
<div class="panel panel-default">
    <#if session.user??>
        <div class="panel-heading">
            <span class="glyphicon glyphicon-user"></span>
            个人信息
        </div>
        <div class="panel-body">
            <div class="media">
                <div class="media-left">
                    <a href="${baseUrl!}/user/${session.user.id!}" style="text-decoration: none;">
                        <img src="${session.user.avatar!}" title="${session.user.nickname!}" class="avatar">
                    </a>
                </div>
                <div class="media-body">
                    <div class="media-heading">
                        <a href="${baseUrl!}/user/${session.user.id!}">${session.user.nickname!}</a>
                    </div>
                    <p>积分: ${session.user.score!}</p>
                </div>
                <#if session.user.signature?? && session.user.signature != "">
                    <div style="color: #7A7A7A; font-size: 12px; margin-top:5px;">
                        <i>“ ${session.user.signature!} ” </i>
                    </div>
                </#if>
            </div>
        </div>
    <#else>
        <div class="panel-body">
            <h5>属于Java语言的bbs</h5>
            <p>在这里，您可以提问，回答，分享，诉说，这是个属于Java程序员的社区，欢迎您的加入！</p>
        </div>
    </#if>
</div>
</#if>
<#if sidebar_topic_user == "show">
<div class="panel panel-default">
    <div class="panel-heading">
        <span class="glyphicon glyphicon-user"></span>
        作者
    </div>
    <div class="panel-body">
        <div class="media">
            <div class="media-left">
                <a href="${baseUrl!}/user/${topic.author_id!}" style="text-decoration: none;">
                    <img src="${topic.avatar!}" title="${topic.nickname!}" class="avatar">
                </a>
            </div>
            <div class="media-body">
                <div class="media-heading">
                    <a href="${baseUrl!}/user/${topic.author_id!}">${topic.nickname!}</a>
                </div>
                <p>积分: ${topic.score!}</p>
            </div>
            <#if topic.signature?? && topic.signature != "">
                <div style="margin-top:5px;" class="signature">
                    <i>“ ${topic.signature!} ” </i>
                </div>
            </#if>
        </div>
    </div>
</div>
</#if>
<#--签到-->
<#if sidebar_checkin == "show">
    <#if session.user?? && session.user.mission?date != session.today?date>
    <div class="panel panel-default">
        <div class="panel-body">
            <a href="${baseUrl!}/mission/daily" class="btn btn-raised btn-default ">领取今日的登录奖励</a>
        </div>
    </div>
    </#if>
</#if>
<#if sidebar_create == "show">
    <#if session.user??>
        <div class="panel panel-default">
            <div class="panel-body">
                <a href="${baseUrl!}/topic/create" class="btn btn-raised btn-default ">&nbsp;发布话题&nbsp;</a>
            </div>
        </div>
    </#if>
</#if>
<#if sidebar_not_reply_topic == "show">
    <#if notReplyTopics.size() &gt; 0>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-th-list"></span>
            无人回复话题
        </div>
        <div class="panel-body">
            <#list notReplyTopics as topic>
                <div class="ellipsis-1 media">
                    <a href="${baseUrl!}/topic/${topic.id!}.html">${topic.title!}</a>
                </div>
            </#list>
        </div>
    </div>
    </#if>
</#if>
<#if sidebar_xgtopic == "show">
    <#if xgTopics?? && xgTopics.size() &gt; 0>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-th-list"></span>
            相关话题
        </div>
        <div class="panel-body">
            <#list xgTopics as topic>
                <div class="ellipsis-1 media">
                    <a href="${baseUrl!}/topic/${topic.id!}.html">${topic.title!}</a>
                </div>
            </#list>
        </div>
    </div>
    </#if>
</#if>
<#if sidebar_scoretop == "show">
<div class="panel panel-default">
    <div class="panel-heading">
        <span class="glyphicon glyphicon-th-list"></span>
        积分榜&nbsp;&nbsp;<a href="${baseUrl!}/user/top100">TOP 100 &gt;&gt;</a>
    </div>
    <div class="panel-body">
        <#list scoreTopTen as top>
            <div>
                <span style="display: inline-block; width: 60px; float: left;">${top.score!}</span>
                <a href="${baseUrl!}/user/${top.id}">${top.nickname!}</a>
            </div>
        </#list>
    </div>
</div>
</#if>
<#if sidebar_create_info == "show">
    <#if session.user??>
        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="glyphicon glyphicon-paperclip"></span>
                话题发布指南
            </div>
            <div class="panel-body">
                <p>• 关于积分：发布话题奖励 3 积分，但是被管理员删除话题将会扣除作者 5 积分</p>
                <p>• 问题标题: 请用准确的语言描述您发布的问题思想</p>
                <p>• 添加标签: 添加一个或者多个合适的标签, 让您发布的问题得到更多有相同兴趣的人参与.</p>
                <p>• 给话题选择合适的板块方便查找浏览</p>
            </div>
        </div>
    </#if>
</#if>
<#if sidebar_other_topic == "show">
    <#if otherTopics.size() &gt; 0>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-th-list"></span>
            作者其他话题
        </div>
        <div class="panel-body">
            <#list otherTopics as topic>
                <div class="ellipsis-1 media">
                    <a href="${baseUrl!}/topic/${topic.id!}.html">${topic.title!}</a>
                </div>
            </#list>
        </div>
    </div>
    </#if>
</#if>
<#if sidebar_about == "show">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-paperclip"></span>
            关于
        </div>
        <div class="panel-body">
            <p>在这里你可以：</p>
            <p>• 向别人提出你遇到的问题</p>
            <p>• 帮助遇到问题的人</p>
            <p>• 分享自己的知识</p>
            <p>• 和其它人一起进步</p>
        </div>
    </div>
</#if>
<#if sidebar_jfbbs_run_status == "show">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-paperclip"></span>
            社区运行状态
        </div>
        <div class="panel-body">
            <table cellpadding="5" cellspacing="0" border="0">
                <tbody>
                    <tr>
                        <td style="width: 60px;" align="right"><span>注册用户</span></td>
                        <td style="padding-left: 20px;" align="left">${userCount!0}</td>
                    </tr>
                    <tr>
                        <td style="width: 60px;" align="right"><span>主题</span></td>
                        <td style="padding-left: 20px;" align="left">${topicCount!0}</td>
                    </tr>
                    <tr>
                        <td style="width: 60px;" align="right"><span>回复</span></td>
                        <td style="padding-left: 20px;" align="left">${replyCount!0}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</#if>
</#macro>