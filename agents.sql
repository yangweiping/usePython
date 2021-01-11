USE gbtong;
DESC agent_application;

-- Whether has been A user 
	SELECT COUNT(1) AS cnt 
	FROM user 
	WHERE phone = '15185781125';

	SELECT COUNT(1) AS cnt 
	FROM user 
	WHERE real_name = '';

	SELECT COUNT(1) AS cnt 
	FROM user 
	WHERE idcard_number = '';


-- Whether has applied to be an agent
	SELECT 
	FROM agent_application 
	WHERE phone = '13638083564'


-- Update agent info
	update agent 
	set agent_address = '贵州省台江县台盘乡南瓦村'
	where phone = '13638083564';
    
    select count(1) as CNT
    from agent 
    where phone = '13638083564';
	
-- Check whether object is consistant both in user table and agent table
	SELECT a.super_id, u.agent_id
	FROM agent a, user u
	WHERE a.user_id = u.id AND u.phone = '18788718075';
	
-- update agent information with both agent table and user table	
	update user u, agent a1, agent a2
	set u.agent_id = a1.super_id, u.agent_name = a2.name
	where a1.user_id = u.id and u.phone = '13208516981' and a1.super_id = a2.id;
	
-- Check whether an agent has followed agent(s)
	SELECT COUNT(1) AS cnt  
	FROM agent a, agent b
	WHERE b.super_id = a.id AND a.phone = '15085276546';	

-- 台江县经纪人
	select u.real_name as '姓名', u.phone as '电话号码',  a.idcard_number as '身份证号', a.agent_address as '联系地址'
	from user u, agent a
	where u.id = a.user_id and u.idcard_number like '522630%' and u.is_valid != 0 and a.is_valid != 0;
	
-- checks the agents directly follow "工百通"	
	select distinct a1.name
	from agent a1, user u1
	where a1.super_id = (
		select a2.id
		from agent a2, user u2 
		where a2.user_id = u2.id and u2.real_name = '工百通'
	);

-- update a table with itself in parent-child relationship 
	UPDATE agent a1 
	INNER JOIN agent a2
		ON a1.super_id = a2.id
	SET a1.recruiter_phone = a2.phone
	WHERE a1.recruiter_phone IS NULL OR a1.recruiter_phone = '' AND a2.phone IS NOT NULL;
	
-- agent table parent-child relationship checks 
	select u.real_name as '姓名', u.idcard_number as '身份证号', u.phone as '电话号码', a1.agent_address as '地址1', a1.postal_address as '地址2', a1.bank_name as '开户行', a1.bank_card_number as '银行卡号', a1.recruiter_name, a1.recruiter_phone, a2.name as '招募人', a2.phone as '招募人电话'
	from user u, agent a1, agent a2
	where u.id = a1.user_id and u.del_flag != '1' and u.is_valid != 0 and a1.is_valid != 0 and a1.del_flag != '1' and a1.super_id = a2.id;
	
	