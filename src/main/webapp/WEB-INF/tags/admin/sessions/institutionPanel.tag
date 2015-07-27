<%@ tag description="Admin sessions - institution panel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="tableIndex" required="true"%>
<div class="panel panel-primary">
    <ul class="nav nav-pills nav-stacked">
        <li id="pill_${tableIndex}" class="active"><a
            href="#"
            onclick="toggleContent(${tableIndex}); return false;"><span
                class="badge pull-right"
                id="badge_${tableIndex}" style="display: none">${fn:length(institutionPanel.feedbackSessionRows)}</span><Strong>${institutionPanel.institutionName}
            </Strong></a></li>
    </ul>


    <div class="table-responsive" id="table_${tableIndex}">
        <table class="table table-striped dataTable">
            <thead>
                <tr>
                    <th>Status
                   </th>
                    <th onclick="toggleSort(this,2)"
                        class="button-sort-non">[Course ID]Session Name &nbsp; <span
                        class="icon-sort unsorted"></span>
                    </th>
                    <th> Response Rate 
                    </th>
                    <th onclick="toggleSort(this,4,sortDate)"
                        class="button-sort-non">Start Time&nbsp;
                        <span class="icon-sort unsorted"></span>
                    </th>
                    <th onclick="toggleSort(this,5,sortDate)"
                        class="button-sort-non">End Time&nbsp; <span
                        class="icon-sort unsorted"></span></th>
                    <th onclick="toggleSort(this,6)"
                        class="button-sort-non">Creator</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${institutionPanel.feedbackSessionRows}" var="feedbackSessionRow">
                    <c:if test="${data.showAll or not feedbackSessionRow.endsWithTmt}">

                        <adminSessions:feedbackSessionRow feedbackSessionRow="${feedbackSessionRow}"/>
                        <c:set var="index" value="${index + 1}"/>
                    </c:if>
                </c:forEach>
                <c:set var="tableIndex" value="${tableIndex + 1}"/>
            </tbody>

        </table>
    </div>


</div>