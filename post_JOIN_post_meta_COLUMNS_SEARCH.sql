SELECT p.ID, p.post_title, p.post_content,
    MAX(CASE WHEN pm.meta_key = 'rc_slider_link_text' THEN pm.meta_value END) AS rc_slider_link_text,
    MAX(CASE WHEN pm.meta_key = 'rc_slider_link_url' THEN pm.meta_value END) AS rc_slider_link_url
    FROM wp_posts p
    LEFT JOIN wp_postmeta pm ON (p.ID = pm.post_id)
    WHERE p.post_type = 'rc-slider'
    AND (
        p.post_title LIKE '%go%'
        OR p.post_content LIKE '%go%'
        OR pm.meta_key = 'rc_slider_link_text' AND pm.meta_value LIKE '%go%'
        OR pm.meta_key = 'rc_slider_link_url' AND pm.meta_value LIKE '%go%'
    )
    GROUP BY p.ID;