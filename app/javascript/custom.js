$(document).ready(function() {
  $show_direction = ""
  $('body').on('click', '.left, .right', function(e) {
      change_direction($(this));
  });
  $('body').on('click', '#info', function(e) {
    get_direction($('#fa_user').attr('data-set'))
    axis = $('#fa_user').parent().attr('id').split('_')
    alert("Output: " + axis[1] + "," + axis[2] + ',' + $show_direction)
  });
  $('body').on('click', '.move', function(e) {
      var token = $('i').parent().attr('id')
      set_direction();
      $.ajax({
        url: "/robot_simulations/move",
        type: "GET",
        dataType: "script",
        data: {token: token, direction: $direction, data_set: $('i').attr('data-set')}
      });
  })
});


function change_direction(val) {
  direction = Number($('i').attr('data-set'))
  if (val.hasClass('left')){
    if (direction == 0){
      $('i').attr('data-set', direction + 270)
    }
    else{
      $('i').attr('data-set', direction - 90)
    }
  } else if (val.hasClass('right')){
    if (direction == 270){
      $('i').attr('data-set', 0)
    }
    else{
      $('i').attr('data-set', direction + 90)
    }
  }
}

function get_direction(direction){
  if (direction == "0"){
    $show_direction = 'North'
  } else if (direction == '90' ){
    $show_direction = 'East'
  } else if (direction == "180"){
    $show_direction = 'South'
  } else if (direction == "270"){
    $show_direction = 'West'
  }
}

function set_direction() {
  var data_set   = $(".fa.fa-user").attr('data-set')
    if (data_set == "0"){
    $direction = 'North'
  } else if (data_set == '90' ){
    $direction = 'East'
  } else if (data_set == "180"){
    $direction = 'South'
  } else if (data_set == "270"){
    $direction = 'West'
  }
}
