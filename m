Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lpeem-0008E4-2r
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 08:21:51 +0000
Message-ID: <49D5C704.6010403@embeddedalley.com>
Date: Fri, 03 Apr 2009 12:21:24 +0400
From: Vladimir Barinov <vbarinov@embeddedalley.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes
References: <1238709260-17439-1-git-send-email-vbarinov@embeddedalley.com>
	<20090403053805.GE23731@pengutronix.de>
In-Reply-To: <20090403053805.GE23731@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Lothar Wassmann <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha Hauer wrote:
> Hi,
>
> On Fri, Apr 03, 2009 at 01:54:20AM +0400, Vladimir Barinov wrote:
>   
>> The following patch fixes:
>>  - re-initialization of host->col_addr which is used as byte index
>>    between the successive READID flash commands.
>>  - compile error when CONFIG_PM is enabled
>>  - pass on the error code from clk_get()
>>  - return -ENOMEM in case of failed ioremap()
>>  - pass on the return value of platform_driver_probe() instead of inventing -ENODEV
>>  - let command line partition table parsing with mxc_nand name.
>>    The cmd_line parsing is done via <mtd-id> name that differs
>>    from mxc_nand by default and looks like "NAND 256MiB 1,8V 8-bit"
>>
>> Signed-off-by: Vladimir Barinov <vbarinov@embeddedalley.com>
>> Signed-off-by: Lothar Wassmann <LW@KARO-electronics.de>
>> ---
>>  drivers/mtd/nand/mxc_nand.c |   47 +++++++++++++++++++++++++++---------------
>>  1 files changed, 30 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
>> index bad048a..e94c956 100644
>> --- a/drivers/mtd/nand/mxc_nand.c
>> +++ b/drivers/mtd/nand/mxc_nand.c
>> @@ -831,6 +831,7 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
>>  		break;
>>  
>>  	case NAND_CMD_READID:
>> +		host->col_addr = 0;
>>  		send_read_id(host);
>>  		break;
>>  
>> @@ -881,8 +882,10 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>>  	this->verify_buf = mxc_nand_verify_buf;
>>  
>>  	host->clk = clk_get(&pdev->dev, "nfc");
>> -	if (IS_ERR(host->clk))
>> +	if (IS_ERR(host->clk)) {
>> +		err = PTR_ERR(host->clk);
>>  		goto eclk;
>> +	}
>>  
>>  	clk_enable(host->clk);
>>  	host->clk_act = 1;
>> @@ -895,7 +898,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>>  
>>  	host->regs = ioremap(res->start, res->end - res->start + 1);
>>  	if (!host->regs) {
>> -		err = -EIO;
>> +		err = -ENOMEM;
>>  		goto eres;
>>  	}
>>  
>> @@ -964,6 +967,9 @@ static int __init mxcnd_probe(struct platform_device *pdev)
>>  
>>  	/* Register the partitions */
>>  #ifdef CONFIG_MTD_PARTITIONS
>> +#ifdef CONFIG_MTD_CMDLINE_PARTS
>> +	mtd->name = "mxc_nand";
>> +#endif
>>     
>
> Do we need an ifdef here?
>   
That is due to the useless of such naming for all other cases (i.e. 
redboot fis partition table parsing)
>   
>>  	nr_parts =
>>  	    parse_mtd_partitions(mtd, part_probes, &host->parts, 0);
>>  	if (nr_parts > 0)
>> @@ -1010,30 +1016,35 @@ static int __devexit mxcnd_remove(struct platform_device *pdev)
>>  #ifdef CONFIG_PM
>>  static int mxcnd_suspend(struct platform_device *pdev, pm_message_t state)
>>  {
>> -	struct mtd_info *info = platform_get_drvdata(pdev);
>> +	struct mtd_info *mtd = platform_get_drvdata(pdev);
>> +	struct nand_chip *nand_chip = mtd->priv;
>> +	struct mxc_nand_host *host = nand_chip->priv;
>>  	int ret = 0;
>>  
>>  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND suspend\n");
>> -	if (info)
>> -		ret = info->suspend(info);
>> -
>> -	/* Disable the NFC clock */
>> -	clk_disable(nfc_clk);	/* FIXME */
>> +	if (mtd) {
>> +		ret = mtd->suspend(mtd);
>> +		/* Disable the NFC clock */
>> +		clk_disable(host->clk);
>> +	}
>>  
>>  	return ret;
>>  }
>>  
>>  static int mxcnd_resume(struct platform_device *pdev)
>>  {
>> -	struct mtd_info *info = platform_get_drvdata(pdev);
>> +	struct mtd_info *mtd = platform_get_drvdata(pdev);
>> +	struct nand_chip *nand_chip = mtd->priv;
>> +	struct mxc_nand_host *host = nand_chip->priv;
>>  	int ret = 0;
>>  
>>  	DEBUG(MTD_DEBUG_LEVEL0, "MXC_ND : NAND resume\n");
>> -	/* Enable the NFC clock */
>> -	clk_enable(nfc_clk);	/* FIXME */
>>  
>> -	if (info)
>> -		info->resume(info);
>> +	if (mtd) {
>> +		/* Enable the NFC clock */
>> +		clk_enable(host->clk);
>> +		mtd->resume(mtd);
>> +	}
>>  
>>  	return ret;
>>  }
>> @@ -1054,13 +1065,15 @@ static struct platform_driver mxcnd_driver = {
>>  
>>  static int __init mxc_nd_init(void)
>>  {
>> +	int ret;
>> +
>>  	/* Register the device driver structure. */
>>  	pr_info("MXC MTD nand Driver\n");
>> -	if (platform_driver_probe(&mxcnd_driver, mxcnd_probe) != 0) {
>> +	ret = platform_driver_probe(&mxcnd_driver, mxcnd_probe);
>> +	if (ret)
>>  		printk(KERN_ERR "Driver register failed for mxcnd_driver\n");
>>     
>
> Can you please also remove this printk? platform_driver_probe()
> fails when no platform device is registered for this driver which
> only means that a particular board does not have NAND support. Getting
> an error here is quite confusing in this situation.
>   
Ok, wiil do in the next try.
> Sascha
>
>   
>> -		return -ENODEV;
>> -	}
>> -	return 0;
>> +
>> +	return ret;
>>  }
>>  
>>  static void __exit mxc_nd_cleanup(void)
>> -- 
>> 1.5.6
>>
>>
>>     
>
>   
