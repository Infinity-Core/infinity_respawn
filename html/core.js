jQuery(function () {

    function display(bool) {
        if (bool) {
            jQuery("#identity_manager").show();
        } else {
            jQuery("#identity_manager").hide();
        }
    }
    display(false)

    window.addEventListener('message', function(event) {
        let item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }

        if(item.status == true){

            $('.case_respawn').unbind('click').click(function(){
                let respawnID      = $(this).data('respawn');
                $.post(`https://${GetParentResourceName()}/respawn`, JSON.stringify({
                    id : respawnID
                }));
                return
            })

        }

    })
})