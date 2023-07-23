SELECT * FROM wp_posts p 
LEFT JOIN wp_postmeta pm ON (p.ID = pm.post_id)
WHERE p.post_type LIKE 'rc-slider';