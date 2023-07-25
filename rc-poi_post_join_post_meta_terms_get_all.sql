     SELECT p.ID, p.post_title, p.post_content, p.post_status,
        MAX(CASE WHEN pm.meta_key = 'rc_poi_location_address' THEN pm.meta_value END) AS rc_poi_location_address,
        MAX(CASE WHEN pm.meta_key = 'rc_poi_location_geo_code' THEN pm.meta_value END) AS rc_poi_location_geo_code,
        GROUP_CONCAT(DISTINCT t.name SEPARATOR ', ') AS terms,
        tt.term_id
        FROM wp_posts p
        LEFT JOIN wp_postmeta pm ON (p.ID = pm.post_id)
        LEFT JOIN wp_term_relationships tr ON (p.ID = tr.object_id)
        LEFT JOIN wp_term_taxonomy tt ON (tr.term_taxonomy_id = tt.term_taxonomy_id)
        LEFT JOIN wp_terms t ON (tt.term_id = t.term_id)
        WHERE p.post_type LIKE 'rc-poi'
        AND p.post_status LIKE 'publish'
        GROUP BY p.ID;