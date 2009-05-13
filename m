Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4H3n-0004yl-9d
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 16:12:05 +0000
Date: Wed, 13 May 2009 18:11:54 +0200
From: Daniel Mack <daniel@caiaq.de>
To: Vladimir Barinov <vbarinov@embeddedalley.com>
Subject: Re: [PATCH] mtd: mxc_nand: fix built breakage
Message-ID: <20090513161154.GK32424@buzzloop.caiaq.de>
References: <1242229410-11853-1-git-send-email-daniel@caiaq.de>
	<4A0AF0C7.5090104@embeddedalley.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A0AF0C7.5090104@embeddedalley.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Linux MTD list <linux-mtd@lists.infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 13, 2009 at 08:09:43PM +0400, Vladimir Barinov wrote:
> Please find the patch that I've sent some time ago. This patch should  
> fix the issue you described.
> http://lists.infradead.org/pipermail/linux-mtd/2009-April/025363.html


Ah, ok, thanks.

Did anyone pick it up for mainline already?
Sascha, I didn't see that one in your tree either.

Daniel


> Daniel Mack wrote:
>> The MXC NAND driver does not currently build with CONFIG_PM set.
>>
>>   drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_suspend':
>>   drivers/mtd/nand/mxc_nand.c:1021: error: 'nfc_clk' undeclared (first use in this function)
>>   drivers/mtd/nand/mxc_nand.c:1021: error: (Each undeclared identifier is reported only once
>>   drivers/mtd/nand/mxc_nand.c:1021: error: for each function it appears in.)
>>   drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_resume':
>>   drivers/mtd/nand/mxc_nand.c:1033: error: 'nfc_clk' undeclared (first use in this function)
>>   make[3]: *** [drivers/mtd/nand/mxc_nand.o] Error 1
>>   make[2]: *** [drivers/mtd/nand] Error 2
>>   make[1]: *** [drivers/mtd] Error 2
>>   make: *** [drivers] Error 2
>>
>> Signed-off-by: Daniel Mack <daniel@caiaq.de>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Linux MTD list <linux-mtd@lists.infradead.org>
>> ---
>>  drivers/mtd/nand/mxc_nand.c |    8 ++++++--
>>  1 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
>> index 21fd4f1..d352d2a 100644
>> --- a/drivers/mtd/nand/mxc_nand.c
>> +++ b/drivers/mtd/nand/mxc_nand.c
>> @@ -1011,6 +1011,8 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
>>  static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
>>  {
>>  	struct mtd_info *info = platform_get_drvdata(pdev);
>> +        struct nand_chip *nand_chip = info->priv;
>>   +	struct mxc_nand_host *host = nand_chip->priv;
>>  	int ret = 0;
>>   	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
>> @@ -1018,7 +1020,7 @@ static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
>>  		ret = info->suspend(info);
>>   	/* Disable the NFC clock */
>> -	clk_disable(nfc_clk);	/* FIXME */
>> +	clk_disable(host->clk);	/* FIXME */
>>   	return ret;
>>  }
>> @@ -1026,11 +1028,13 @@ static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
>>  static int mxcnd_resume(struct platform_device *pdev)
>>  {
>>  	struct mtd_info *info = platform_get_drvdata(pdev);
>> +        struct nand_chip *nand_chip = info->priv;
>> +	struct mxc_nand_host *host = nand_chip->priv;
>>  	int ret = 0;
>>   	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
>>  	/* Enable the NFC clock */
>> -	clk_enable(nfc_clk);	/* FIXME */
>> +	clk_enable(host->clk);	/* FIXME */
>>   	if (info)
>>  		info->resume(info);
>>   
>
