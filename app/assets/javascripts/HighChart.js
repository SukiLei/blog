var HighChart = {
 
    ChartDataFormate: {//数据格式化
 
        FormateNOGroupData: function (data) {//处理不分组的数据
 
            var categories = [];
 
            var datas = [];
 
            for (var i = 0; i < data.length; i++) {
 
                categories.push(data[i].name || "");
 
                datas.push([data[i].name, data[i].value || 0]);
 
            }
 
            return { category: categories, data: datas };
 
        }，…………
 
       },
 
    ChartOptionTemplates: {//图表配置项
 
        Pie: function (data, name, title) {
 
            var pie_datas = HighChart.ChartDataFormate.FormateNOGroupData(data);
 
            var option = {
 
                chart: {
 
                    plotBackgroundColor: null,
 
                    plotBorderWidth: null,
 
                    plotShadow: false
 
                },
 
               …….
 
            };
 
            return option;
 
        },
 
    RenderChart: function (option, container) {//页面渲染
 
        container.highcharts(option);
 
    }