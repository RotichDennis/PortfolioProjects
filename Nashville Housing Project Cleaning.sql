select *
from Rotich.dbo.NashvilleHousing

select SaleDateConverted, CONVERT(Date, SaleDate)
from Rotich.dbo.NashvilleHousing

update NashvilleHousing
SET SaleDate= CONVERT (Date,SaleDate)

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

update NashvilleHousing
SET SaleDateConverted=CONVERT(Date, SaleDate)

--Property Address
select PropertyAddress
from Rotich.dbo.NashvilleHousing
where PropertyAddress is null

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
from Rotich.dbo.NashvilleHousing AS a
JOIN Rotich.dbo.NashvilleHousing AS b
on a.ParcelID=b.ParcelID
AND a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null

Update a
SET PropertyAddress=ISNULL(a.PropertyAddress,b.PropertyAddress)
from Rotich.dbo.NashvilleHousing AS a
JOIN Rotich.dbo.NashvilleHousing AS b
on a.ParcelID=b.ParcelID
AND a.[UniqueID] <> b.[UniqueID]
where a.PropertyAddress is null

--breaking address into three sections
 select 
 SUBSTRING(PropertyAddress, 1,CHARINDEX(',',PropertyAddress)-1)as Address
 , SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) as Address
 from Rotich.dbo.NashvilleHousing 


 --removing duplicates
 select*
 from dbo.NashvilleHousing

 WITH RowNumCTE AS(
 select*,
 ROW_NUMBER()OVER(
 PARTITION BY ParcelID,
 PropertyAddress,
 SalePrice,
 LegalReference
 ORDER BY UniqueID)
 row_num
 from dbo.NashvilleHousing
-- order by ParcelID
 )
select *
 from RowNumCTE
 where row_num>1
 --order by PropertyAddress


 --deleting unused columns

 alter table dbo.NashvilleHousing
 drop column TaxDistrict

 select*
 from dbo.NashvilleHousing
