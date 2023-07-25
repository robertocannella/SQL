SELECT
    p.ID,
    p.post_title,
    p.post_content,
    MAX(
        CASE WHEN pm.meta_key = 'rc_poi_location_address' THEN pm.meta_value
    END
) AS rc_poi_location_address,
MAX(
    CASE WHEN pm.meta_key = 'rc_poi_location_geo_code' THEN pm.meta_value
END
) AS rc_poi_location_geo_code
FROM
    wp_posts p
LEFT JOIN wp_postmeta pm ON
    (p.ID = pm.post_id)
WHERE
    p.post_type = 'rc-poi' AND(
        p.post_title LIKE '%go%' OR p.post_content LIKE '%go%' OR pm.meta_key = 'rc_poi_location_address' AND pm.meta_value LIKE '%go%' OR pm.meta_key = 'rc_poi_location_geo_code' AND pm.meta_value LIKE '%go%'
    )
GROUP BY
    p.ID;
