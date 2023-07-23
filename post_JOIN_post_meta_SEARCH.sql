    SELECT DISTINCT p.*
    FROM wp_posts p
    LEFT JOIN wp_postmeta pm ON (p.ID = pm.post_id)
    WHERE p.post_type = 'rc-slider'
    AND (
        p.post_title LIKE '%go%'
        OR p.post_content LIKE '%go%'
        OR pm.meta_key = 'rc_slider_link_text' AND pm.meta_value LIKE '%go%'
        OR pm.meta_key = 'rc_slider_link_url' AND pm.meta_value LIKE '%go%'
    )