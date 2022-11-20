HTMLWidgets.widget({

  name: 'MultibarHorizontal',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        var newSvg = document.getElementById(el.id);
        newSvg.innerHTML += '<div id="chart1" class="with-3d-shadow with-transitions" style="height: 80vh;"><svg></svg></div>';

        var long_short_data = x.data;

        var chart;
        nv.addGraph(function() {
            chart = nv.models.multiBarHorizontalChart()
                .x(function(d) { return d.label })
                .y(function(d) { return d.value })
                .yErr(function(d) { return [-Math.abs(d.value * Math.random() * 0.3), Math.abs(d.value * Math.random() * 0.3)] })
                .barColor(d3.scale.category20().range())
                .duration(250)
                .margin({left: 100})
                .stacked(true);

            chart.yAxis.tickFormat(d3.format(',.2f'));

            chart.yAxis.axisLabel(x.yax);
            chart.xAxis.axisLabel(x.xax).axisLabelDistance(20);

            d3.select('#chart1 svg')
                .datum(long_short_data)
                .call(chart);

            nv.utils.windowResize(chart.update);

            chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });
            chart.state.dispatch.on('change', function(state){
                nv.log('state', JSON.stringify(state));
            });
            return chart;
        });


      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
