Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhu0x-0005ad-FR
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 08:49:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Aug 2017 14:19:01 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
Subject: Re: [PATCH v4 11/20] mtd: nand: qcom: enable BAM or ADM mode
In-Reply-To: <db662967-2f73-bcfe-aef1-8b9cc860c743@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-12-git-send-email-absahu@codeaurora.org>
 <db662967-2f73-bcfe-aef1-8b9cc860c743@codeaurora.org>
Message-ID: <d68712ee25564439178a81e59ac2ff35@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-08-16 10:20, Archit Taneja wrote:
> On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
>> 1. DM_EN is only required for EBI2 NAND controller which uses ADM
>> 2. BAM mode will be disabled after power on reset which needs to
>>     be enabled before starting any BAM transfers.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 3d9fd7f..ae873d3 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -163,6 +163,9 @@
>>   #define NAND_DEV_CMD_VLD_VAL		(READ_START_VLD | WRITE_START_VLD | \
>>   					 ERASE_START_VLD | SEQ_READ_START_VLD)
>>   +/* NAND_CTRL bits */
>> +#define	BAM_MODE_EN			BIT(0)
>> +
>>   /*
>>    * the NAND controller performs reads/writes with ECC in 516 byte 
>> chunks.
>>    * the driver calls the chunks 'step' or 'codeword' interchangeably
>> @@ -1035,7 +1038,8 @@ static int read_id(struct qcom_nand_host *host, 
>> int column)
>>   	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
>>   	nandc_set_reg(nandc, NAND_ADDR0, column);
>>   	nandc_set_reg(nandc, NAND_ADDR1, 0);
>> -	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>> +	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
>> +		      nandc->props->is_bam ? 0 : DM_EN);
> 
> I'm not sure why the above register was configured in read_id in the
> first place. Would
> it be required later if we want the controller to support multiple
> NAND chips? If not,
> then we could consider dropping this. Anyway, that can be posted as a
> separate patch
> later.

  Correct. It seems the current driver does not have fully support
  second NAND chip select since it need to program NAND_DEV1_CFG1 and
  NAND_DEV1_CFG0 also.

  We can have separate patch series which will add the full support
  for multiple NAND chips and this line can be removed in that patch
  series.

> 
> Reviewed-by: Archit Taneja <architt@codeaurora.org>
> 
> Thanks,
> Archit
> 
>>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>>     	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
>> @@ -2408,12 +2412,19 @@ static void qcom_nandc_unalloc(struct 
>> qcom_nand_controller *nandc)
>>   /* one time setup of a few nand controller registers */
>>   static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
>>   {
>> +	u32 nand_ctrl;
>> +
>>   	/* kill onenand */
>>   	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
>>   	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>>   -	/* enable ADM DMA */
>> -	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>> +	/* enable ADM or BAM DMA */
>> +	if (nandc->props->is_bam) {
>> +		nand_ctrl = nandc_read(nandc, NAND_CTRL);
>> +		nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
>> +	} else {
>> +		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>> +	}
>>     	/* save the original values of these registers */
>>   	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
>> 
