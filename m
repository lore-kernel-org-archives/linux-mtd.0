Received: from mail-px0-f189.google.com ([209.85.216.189])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQI9R-0004pu-UO
	for linux-mtd@lists.infradead.org; Mon, 13 Jul 2009 09:48:58 +0000
Received: by pxi27 with SMTP id 27so1035076pxi.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jul 2009 02:48:47 -0700 (PDT)
Message-ID: <4A5B02F2.30303@gmail.com>
Date: Mon, 13 Jul 2009 17:48:34 +0800
From: Eric Miao <eric.y.miao@gmail.com>
MIME-Version: 1.0
To: Mike Rapoport <mike@compulab.co.il>
Subject: Re: [PATCH] [MTD] [NAND] pxa3xx_nand: add single-bit error corrections
	reporting
References: <1246461095-13590-1-git-send-email-mike@compulab.co.il>
	<4A5AFB37.2070804@compulab.co.il>
In-Reply-To: <4A5AFB37.2070804@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Yeasah Pell <yeasah@comrex.com>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Rapoport wrote:
> David, Eric
> Any update on this?
> 

Yep, looks fine to me.

Acked-by: Eric Miao <eric.y.miao@gmail.com>

David,

Could you please help merge this? Or I'll get this upstreamed via the
arm tree if it saves trouble.

> Mike Rapoport wrote:
>> From: Yeasah Pell <yeasah@comrex.com>
>>
>> Signed-off-by: Yeasah Pell <yeasah@comrex.com>
>> Signed-off-by: Mike Rapoport <mike@compulab.co.il>
>> ---
>>  drivers/mtd/nand/pxa3xx_nand.c |   17 ++++++++++++-----
>>  1 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> index 30a8ce6..6ea520a 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -102,6 +102,7 @@ enum {
>>  	ERR_SENDCMD	= -2,
>>  	ERR_DBERR	= -3,
>>  	ERR_BBERR	= -4,
>> +	ERR_SBERR	= -5,
>>  };
>>  
>>  enum {
>> @@ -564,11 +565,13 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>>  
>>  	status = nand_readl(info, NDSR);
>>  
>> -	if (status & (NDSR_RDDREQ | NDSR_DBERR)) {
>> +	if (status & (NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR)) {
>>  		if (status & NDSR_DBERR)
>>  			info->retcode = ERR_DBERR;
>> +		else if (status & NDSR_SBERR)
>> +			info->retcode = ERR_SBERR;
>>  
>> -		disable_int(info, NDSR_RDDREQ | NDSR_DBERR);
>> +		disable_int(info, NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR);
>>  
>>  		if (info->use_dma) {
>>  			info->state = STATE_DMA_READING;
>> @@ -670,7 +673,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
>>  		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
>>  			break;
>>  
>> -		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
>> +		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR);
>>  
>>  		/* We only are OOB, so if the data has error, does not matter */
>>  		if (info->retcode == ERR_DBERR)
>> @@ -687,7 +690,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mtd, unsigned command,
>>  		if (prepare_read_prog_cmd(info, cmdset->read1, column, page_addr))
>>  			break;
>>  
>> -		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR);
>> +		pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR);
>>  
>>  		if (info->retcode == ERR_DBERR) {
>>  			/* for blank page (all 0xff), HW will calculate its ECC as
>> @@ -861,8 +864,12 @@ static int pxa3xx_nand_ecc_correct(struct mtd_info *mtd,
>>  	 * consider it as a ecc error which will tell the caller the
>>  	 * read fail We have distinguish all the errors, but the
>>  	 * nand_read_ecc only check this function return value
>> +	 *
>> +	 * Corrected (single-bit) errors must also be noted.
>>  	 */
>> -	if (info->retcode != ERR_NONE)
>> +	if (info->retcode == ERR_SBERR)
>> +		return 1;
>> +	else if (info->retcode != ERR_NONE)
>>  		return -1;
>>  
>>  	return 0;
> 
