<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<TITLE>{$TITLE}</TITLE>
<!-- <LINK REL="stylesheet" TYPE="text/css" HREF="include/phpreports/sales.css"> -->
<link href="themes/images/style_cn.css" rel="stylesheet" type="text/css">
<link href="themes/images/report.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="themes/images/tabpane.js"></script>
<script type="text/javascript" src="include/js/jquery.min.js"></script>
<script src="include/js/highcharts.js"></script>
<script src="include/js/exporting.js"></script>
<link href="themes/images/tab.css" rel="stylesheet" type="text/css">
</HEAD>
<body BGCOLOR="#FFFFFF" marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" style="text-align:center;" align="center">
<div class="mtitle">
<div class="mtitle-row">&nbsp;</div>
{$TITLE}
</div>

<div  style="position: relative;height: 20px;margin-bottom: 20px">
    <table border="0" align="left" width="100%">
        <form method="post" action="index.php">
            {$HIDDENFIELDHTML}
            <tbody>
                <tr>
                    <td align="center">
                       显示类型: <select name="graphtype">
                            {$GRAPHTYPEOPTS}
                        </select>
                       &nbsp; &nbsp;统计项目: <select name="grouptype">
                            {$COLLECTCOLUMNOPTS}
                        </select>
                       <input type="submit" value="确定" name="submit" class="small button save">
                    </td>
                </tr>
            </tbody>
        </form>
    </table>
</div>

<div class="tab-pane" id="tabPane1">
	<div align="left" class="tab-page" id="tabPage1">
	<h2 class="tab">报表图形</h2>
	<br>
	<!-- changed by xiaoyang on 2012-9-24 -->
	<div id="container"></div>
	<script type="text/javascript">

   $(function () {ldelim}
    var chart;
    $(document).ready(function() {ldelim}
		var colors = Highcharts.getOptions().colors,
            categories = [{$CATEGORIES}],
            name = '{$FIELDNAME}',
			type = '{$TYPE}',
			title = '{$TITLE}',
            data = [{$SERIES}];	
        chart = new Highcharts.Chart({ldelim}
            chart: {ldelim}
                renderTo: 'container',
				inverted: false  //左右显示，默认上下正向。假如设置为true，则横纵坐标调换位置
            {rdelim},
            title: {ldelim}
                text: title
            {rdelim},
            xAxis: {ldelim}
                categories: categories,
				labels: {ldelim}
                        rotation: 0      //坐标值显示的倾斜度    
                    {rdelim}
            {rdelim},
            yAxis: {ldelim}
                min: 0,
                title: {ldelim}
                    text: '数值(个)'
                {rdelim}
            {rdelim},
			plotOptions: {ldelim}
                pie: {ldelim}
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {ldelim}
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {ldelim}
                            return '<b>'+ this.point.name +'</b>: '+ this.y ;
                        {rdelim}
                    {rdelim}
                {rdelim}
            {rdelim},
            tooltip: {ldelim}
                formatter: function() {ldelim}
                    var s;
                    if (type == 'pie') {ldelim}// the pie chart
                        s = ''+
                            this.point.name + ': '+ this.percentage +' %';
                    {rdelim} else {ldelim}
                        s = ''+
                            this.x  +': '+ this.y;
                    {rdelim}
                    return s;
                {rdelim}
            {rdelim},
           series: [{ldelim}
				name: name,
				type: type,
                data: data
           {rdelim}]
        {rdelim});
   {rdelim});  
{rdelim});
    </script>
	</div>
	<div class="tab-page" id="tabPage2">
		<h2 class="tab">报表数据</h2>
			<div id="report">
				<div class="reportTitle">{$TITLE}</div>
				{$REPORT_DATA}
			</div>
	</div>
</div>
</body>
</html>