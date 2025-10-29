exec erp_MV_GSPQueryMV3_SearchParticular @HCompany=N'011141', @HOrgID=N'b9ed54b4-8a19-4ca1-8', @beginyear=N'2023', @endyear=N'2023', @begindate=N'10', @enddate=N'10', @HSortID=N'0011000200020001', @HMaterialID=N'00000000000000000311', @Standard=N'0', @HBatch=N'', @cbxIsSF=N'0', @RightSQL=N'!='@'', @WareHouseRight=N'!='@'', @RightMatSort=N'!='@'', @SpeStock=N'Z', @OfObject=N'', @FlexField1=N'', @FlexField2=N'', @FlexField3=N'', @FlexField4=N'', @FlexField5=N'', @BatchNumCode=N'', @WareHouseID=N'061                 ', @GroupFlag=N'0', @Filter=N'', @StartRecNum=N'1', @EndRecNum=N'3000';
--220102013201
  220101013201
  220101014001
  220104014001
  220102014003
--SELECT * FROM GOODSMOVEMENT WHERE GOODSMOVEMENTCODE='YR2023100072' OR GOODSMOVEMENTCODE='YC2023100035'
--SELECT * FROM GOODSMOVEMENTITEM WHERE GOODSMOVEMENTID IN(SELECT GOODSMOVEMENTID FROM GOODSMOVEMENT WHERE GOODSMOVEMENTCODE='YR2023100072' OR GOODSMOVEMENTCODE='YC2023100035')
 Select InvValBalAccount.MaterialID,InvValBalAccount.FiscalYear,InvValBalAccount.FiscalYear,FiscalPeriod,FiscalPeriod,'98','本期合计',sum(isnull(InvValBalAccount.DebQuanAmount,0)),null,
        sum(isnull(InvValBalAccount.DebValueAmount,0)),
        sum(isnull(InvValBalAccount.CredQuanAmount,0)),null,
        sum(isnull(InvValBalAccount.CredValueAmount,0)),
        sum(isnull(InvValBalAccount.CurQuanBalance,0)),
        sum(isnull(InvValBalAccount.CurValueBalance,0))
   from InvValBalAccount
       inner join SpeStocks on SpeStocks.SpeStockCode = InvValBalAccount.SpeStock
       left join lswldw on lswldw.lswldw_wldwbh = InvValBalAccount.OfObject
       left join materials on InvValBalAccount.materialid=materials.materialid
where InvValBalAccount.companyid='011141' and WareHouseID='061                 ' and InvValBalAccount.FiscalYear='2023' and FiscalPeriod='10' and InvValBalAccount.MaterialID='00000000000000000311'
     group by SpeStocks.SpeStockName,lswldw.lswldw_dwmc,SpeStock,OfObject,FiscalYear,FiscalPeriod,InvValBalAccount.MaterialID

--SELECT * FROM MATERIALS WHERE MATERIALCODE='220102014003'
--SELECT * FROM InvValBalAccount where companyid='011141' and MaterialID='00000000000000216054' and WareHouseID='061                 ' and InvValBalAccount.FiscalYear='2023' and FiscalPeriod='10' AND SPESTOCK='Z'

UPDATE InvValBalAccount SET DebValueTotal=429745.65 ,DebValueAmount=429745.65,CurValueBalance=429745.65  where companyid='011141' and MaterialID='00000000000000216054' and WareHouseID='061                 ' and InvValBalAccount.FiscalYear='2023' AND  FiscalPeriod='10' AND SPESTOCK='Z' 
UPDATE InvValBalAccount SET DebValueTotal=537182.06  ,--DebValueAmount=0,
CurValueBalance=519781.95 
where companyid='011141' and MaterialID='00000000000000216054' and WareHouseID='061                 ' and InvValBalAccount.FiscalYear='2023' AND  FiscalPeriod='12' AND SPESTOCK='Z' 
UPDATE InvValBalAccount SET BegValueBalance=519781.95 ,CurValueBalance=519781.95  where companyid='011141' and MaterialID='00000000000000216054' and WareHouseID='061                 ' and InvValBalAccount.FiscalYear='2024' AND  FiscalPeriod='01' AND SPESTOCK='Z' 
