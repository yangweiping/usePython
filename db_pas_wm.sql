

-- 城乡低保台账
-- 查看数据源
SELECT send_month, data_sources
FROM pas_wm_mz_db
GROUP BY data_sources
ORDER BY send_month;

SELECT amount_month, COUNT(*)
FROM pas_wm_severe_disability_care_benefits
GROUP BY amount_month;

-- 无主要供水工程
SELECT t3.xzname, t2.xzname, t1.xzname, t.*
FROM tareafamily t, txzdata t1, txzdata t2, txzdata t3
WHERE  NOT EXISTS (SELECT * FROM WaterFamily wf,WaterProject wp WHERE wp.id=wf.ProjectId AND wf.isMainWater='1' AND wf.Enabled=1 AND wp.Enabled=1
    AND wf.familyid=t.id)
AND t.water_is_gather='1'
AND (t.is_bq='2' OR (t.is_bq='1' AND  (t.isOutsideCounty='否' OR t.isOutsideCounty IS NULL))
  ) AND t1.id = t.xzid AND t1.pxzcode = t2.xzcode AND t2.pxzcode = t3.xzcode AND t1.leveldm = '60';

-- 未采集关联
SELECT t3.xzname, t2.xzname, t1.xzname, f.*
FROM tareafamily f, txzdata t1, txzdata t2, txzdata t3
WHERE t1.id = f.xzid AND f.water_is_gather != '1' AND t1.pxzcode = t2.xzcode AND t2.pxzcode = t3.xzcode AND t1.leveldm = '60';

-- 产业带动增收
SELECT xiang,count(1) as '户数',sum(g.jtrks) as '人数' from pas_wm_ny_cy_family g
group by xiang;

-- 产业规模
SELECT xiang,count(1) as '户数',sum(g.jtrks) as '人数' from pas_wm_ny_cy_guimo g
group by xiang