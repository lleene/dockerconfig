<?php
    $config['imap_host'] = 'tls://mailserver:143';
    $config['smtp_host'] = 'tls://mailserver:587';

    $config['imap_conn_options'] = array(
        'ssl'         => array(
            'verify_peer'  => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true,
        ),
    );

    $config['smtp_conn_options'] = array(
        'ssl'         => array(
            'verify_peer'  => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true,
        ),
    );