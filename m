From: tmcmc-mb-yfuruyama7@ml.toshiba.co.jp (posting test)
Date: Thu, 17 Jan 2019 08:42:19 -0000
Subject: [PATCH] mtd: spinand: Add support for all Toshiba Memory products
In-Reply-To: <d6230005-5dfa-60f9-7eec-87d119aa415d@kontron.de>
References: <20190116055319.2755-1-tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
 <d6230005-5dfa-60f9-7eec-87d119aa415d@kontron.de>
Message-ID: <fd127eea-ec2f-5d28-b8dc-40810f479e95@ml.toshiba.co.jp>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi Schrempf, Miquel,

Thanks a lot.


On 2019?01?16? 21:58, Schrempf Frieder wrote:
> On 16.01.19 06:53, Yoshio Furuyama wrote:
>> Add device table for Toshiba Memory products.
>> Also, generalize OOB layout structure and function names.
>>
>> Signed-off-by: Yoshio Furuyama <tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>
>> ---
>>    drivers/mtd/nand/spi/toshiba.c |   79 +++++++++++++++++++++++++++++++++-------
>>    1 file changed, 65 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
>> index 0812655..0916962 100644
>> --- a/drivers/mtd/nand/spi/toshiba.c
>> +++ b/drivers/mtd/nand/spi/toshiba.c
>> @@ -25,19 +25,19 @@ static SPINAND_OP_VARIANTS(write_cache_variants,
>>    static SPINAND_OP_VARIANTS(update_cache_variants,
>>    		SPINAND_PROG_LOAD(false, 0, NULL, 0));
>>    
>> -static int tc58cvg2s0h_ooblayout_ecc(struct mtd_info *mtd, int section,
>> +static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
>>    				     struct mtd_oob_region *region)
>>    {
>> -	if (section > 7)
>> +	if (section > 0)
>>    		return -ERANGE;
>>    
>> -	region->offset = 128 + 16 * section;
>> -	region->length = 16;
>> +	region->offset = mtd->oobsize / 2;
>> +	region->length = mtd->oobsize / 2;
>>    
>>    	return 0;
>>    }
>>    
>> -static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int section,
>> +static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
>>    				      struct mtd_oob_region *region)
>>    {
>>    	if (section > 0)
>> @@ -45,17 +45,17 @@ static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int section,
>>    
>>    	/* 2 bytes reserved for BBM */
>>    	region->offset = 2;
>> -	region->length = 126;
>> +	region->length = mtd->oobsize / 2 - 2;
>>    
>>    	return 0;
>>    }
>>    
>> -static const struct mtd_ooblayout_ops tc58cvg2s0h_ooblayout = {
>> -	.ecc = tc58cvg2s0h_ooblayout_ecc,
>> -	.free = tc58cvg2s0h_ooblayout_free,
>> +static const struct mtd_ooblayout_ops tc58cxgxsx_ooblayout = {
>> +	.ecc = tc58cxgxsx_ooblayout_ecc,
>> +	.free = tc58cxgxsx_ooblayout_free,
>>    };
>>    
>> -static int tc58cvg2s0h_ecc_get_status(struct spinand_device *spinand,
>> +static int tc58cxgxsx_ecc_get_status(struct spinand_device *spinand,
>>    				      u8 status)
>>    {
>>    	struct nand_device *nand = spinand_to_nand(spinand);
>> @@ -94,15 +94,66 @@ static int tc58cvg2s0h_ecc_get_status(struct spinand_device *spinand,
>>    }
>>    
>>    static const struct spinand_info toshiba_spinand_table[] = {
>> -	SPINAND_INFO("TC58CVG2S0H", 0xCD,
>> +	/* 3.3V 1Gb */
>> +	SPINAND_INFO("TC58CVG0S3", 0xC2,
>> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
>> +		     NAND_ECCREQ(8, 512),
>> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>> +					      &write_cache_variants,
>> +					      &update_cache_variants),
>> +		     0,
>> +		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
>> +				     tc58cxgxsx_ecc_get_status)),
>> +	/* 3.3V 2Gb */
>> +	SPINAND_INFO("TC58CVG1S3", 0xCB,
>> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 1, 1, 1),
>> +		     NAND_ECCREQ(8, 512),
>> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>> +					      &write_cache_variants,
>> +					      &update_cache_variants),
>> +		     0,
>> +		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
>> +				     tc58cxgxsx_ecc_get_status)),
>> +	/* 3.3V 4Gb */
>> +	SPINAND_INFO("TC58CVG2S0", 0xCD,
>> +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 1, 1, 1),
>> +		     NAND_ECCREQ(8, 512),
>> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>> +					      &write_cache_variants,
>> +					      &update_cache_variants),
>> +		     0,
>> +		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
>> +				     tc58cxgxsx_ecc_get_status)),
>> +	/* 1.8V 1Gb */
>> +	SPINAND_INFO("TC58CYG0S3", 0xB2,
>> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
>> +		     NAND_ECCREQ(8, 512),
>> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>> +					      &write_cache_variants,
>> +					      &update_cache_variants),
>> +		     0,
>> +		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
>> +				     tc58cxgxsx_ecc_get_status)),
>> +	/* 1.8V 2Gb */
>> +	SPINAND_INFO("TC58CYG1S3", 0xBB,
>> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 1, 1, 1),
>> +		     NAND_ECCREQ(8, 512),
>> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>> +					      &write_cache_variants,
>> +					      &update_cache_variants),
>> +		     0,
>> +		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
>> +				     tc58cxgxsx_ecc_get_status)),
>> +	/* 1.8V 4Gb */
>> +	SPINAND_INFO("TC58CYG2S0", 0xBD,
>>    		     NAND_MEMORG(1, 4096, 256, 64, 2048, 1, 1, 1),
>>    		     NAND_ECCREQ(8, 512),
>>    		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>>    					      &write_cache_variants,
>>    					      &update_cache_variants),
>> -		     SPINAND_HAS_QE_BIT,
>> -		     SPINAND_ECCINFO(&tc58cvg2s0h_ooblayout,
>> -				     tc58cvg2s0h_ecc_get_status)),
>> +		     0,
>> +		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
>> +				     tc58cxgxsx_ecc_get_status)),
>>    };
>>    
>>    static int toshiba_spinand_detect(struct spinand_device *spinand)
>>
>
