select 
	t.term_id,
    t.name,
    tx.count,
    t.slug,
    tm.meta_value AS Color
    from wp_terms t
LEFT join wp_term_taxonomy tx USING (term_id)
LEFT join wp_termmeta tm USING(term_id)
WHERE taxonomy = 'poi' AND meta_key = 'rc_poi_tax_color'