update ar_giroregistration set bankcode='014' where checknum='725386';
update ar_giroregistrationh set bankcode='014' where checknum='725386';

Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='024' and checknum='902804';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='000071';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='210924';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='219976';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='001' and checknum='109023';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='212779';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='178678';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='231758';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='217113';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='024' and checknum='969508';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='230752';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='000376';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='017' and checknum='305961';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='014' and checknum='725386';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='000385';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='036' and checknum='692102';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='208436';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='012' and checknum='741908';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='000557';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='022' and checknum='131883';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='003' and checknum='723563';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='025' and checknum='433863';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='000405';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='000331';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='001' and checknum='375341';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='001' and checknum='375343';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='003' and checknum='724423';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='018' and checknum='245480';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='71';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='376';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='014' and checknum='725386';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='385';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='557';
Update ar_giroregistrationh set chckstatus='O' where yop=2008 and mop=5 and bankcode='006' and checknum='405';
Update ar_giroregistrationh set chckstatus='C' where yop=2008 and mop=5 and bankcode='006' and checknum='331';


insert into ar_giroregistration
select 	
(select max(docEntry)+1 from ar_giroregistration) as docEntry , 
(select max(docNum)+1 from ar_giroregistration) as docNum, 
cast('2008-5-31' as datetime) as docDate,'O' as docStatus, '006' as bankCode, 
	'A331' as checkNum, 
cast('2008-6-10' as datetime) as checkDate, null as clearDate, 'O' as chckStatus, 
	1690000 as chckAmount,1690000 as chckUsedAmnt, now() as auditDate, 
	'ara' as auditUser, objType, backupSts, null as ClearARYop, 
	null as ClearARMop 
	from 
	ar_giroregistration  where docentry=7
	and not exists (select * from ar_giroregistration where '006'=bankCode and 'A331'=checkNum);

insert into ar_giroregistrationh
select 	2008 as yop , 5 as mop,docEntry ,docNum, docDate,docStatus,bankCode, 
	checkNum,checkDate,clearDate,chckStatus, 
	chckAmount,chckUsedAmnt,auditDate, 
	auditUser, objType, backupSts
	from 
	ar_giroregistration where '006' = bankCode and 'A331' = checkNum
	and not exists (select * from ar_giroregistration where '006'=bankCode and 'A331'=checkNum);;

update ar_paymententrydetail3 a,
(select docentry from 
ar_giroregistration where '006' = bankCode and 'A331' = checkNum) as b
set baseentry=b.docentry,basedocnum='A331' 
where a.docentry=12127 and a.entrytypecode='03';



