Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0XvV-0005HU-RQ
 for linux-mtd@lists.infradead.org; Sat, 29 Oct 2016 18:00:19 +0000
Received: by mail-wm0-x243.google.com with SMTP id c17so12038061wmc.3
 for <linux-mtd@lists.infradead.org>; Sat, 29 Oct 2016 10:59:55 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: write exactly one message on
 probe failure
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <1474276878-1021-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20161028100419.1ba04968@bbrezillon>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, kernel@pengutronix.de,
 Robert Jarzmik <robert.jarzmik@free.fr>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ac811aeb-1f9d-e985-134b-8faba0a1a4cf@gmail.com>
Date: Sat, 29 Oct 2016 19:56:39 +0200
MIME-Version: 1.0
In-Reply-To: <20161028100419.1ba04968@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/28/2016 10:04 AM, Boris Brezillon wrote:
> On Mon, 19 Sep 2016 11:21:18 +0200
> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
> 
>> For some error paths alloc_nand_resource() emitted an error message, for
>> others it didn't. Make it consistently print a message including the
>> error code where it's not constant and drop the hardly helpful
>> additional message printed by the caller of alloc_nand_resource.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> It looks good to me. Ezequiel, Robert, any objection to this patch? If
> not, can I have your Acked/Reviewed-by ?
> 
>> ---
>>  drivers/mtd/nand/pxa3xx_nand.c | 17 ++++++++++-------
>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> index 436dd6dc11f4..052e9725cf12 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -1774,8 +1774,11 @@ static int alloc_nand_resource(struct platform_device *pdev)
>>  	int ret, irq, cs;
>>  
>>  	pdata = dev_get_platdata(&pdev->dev);
>> -	if (pdata->num_cs <= 0)
>> +	if (pdata->num_cs <= 0) {
>> +		dev_err(&pdev->dev, "broken number of chip selects\n");

Not: Should be "invalid number of chip selects" . Also, if you turn the
num_cs to unsigned type in the platdata, the test can be if (foo == 0)
instead.

>>  		return -ENODEV;
>> +	}
>> +
>>  	info = devm_kzalloc(&pdev->dev,
>>  			    sizeof(*info) + sizeof(*host) * pdata->num_cs,
>>  			    GFP_KERNEL);
>> @@ -1814,8 +1817,9 @@ static int alloc_nand_resource(struct platform_device *pdev)
>>  	init_waitqueue_head(&chip->controller->wq);
>>  	info->clk = devm_clk_get(&pdev->dev, NULL);
>>  	if (IS_ERR(info->clk)) {
>> -		dev_err(&pdev->dev, "failed to get nand clock\n");
>> -		return PTR_ERR(info->clk);
>> +		ret = PTR_ERR(info->clk);
>> +		dev_err(&pdev->dev, "failed to get nand clock (%d)\n", ret);
>> +		return ret;
>>  	}
>>  	ret = clk_prepare_enable(info->clk);
>>  	if (ret < 0)
>> @@ -1843,6 +1847,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
>>  	info->mmio_base = devm_ioremap_resource(&pdev->dev, r);
>>  	if (IS_ERR(info->mmio_base)) {
>>  		ret = PTR_ERR(info->mmio_base);
>> +		dev_err(&pdev->dev, "failed to map register space (%d)\n", ret);
>>  		goto fail_disable_clk;
>>  	}
>>  	info->mmio_phys = r->start;
>> @@ -1862,7 +1867,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
>>  				   pxa3xx_nand_irq_thread, IRQF_ONESHOT,
>>  				   pdev->name, info);
>>  	if (ret < 0) {
>> -		dev_err(&pdev->dev, "failed to request IRQ\n");
>> +		dev_err(&pdev->dev, "failed to request IRQ (%d)\n", ret);
>>  		goto fail_free_buf;
>>  	}
>>  
>> @@ -1961,10 +1966,8 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	ret = alloc_nand_resource(pdev);
>> -	if (ret) {
>> -		dev_err(&pdev->dev, "alloc nand resource failed\n");
>> +	if (ret)
>>  		return ret;
>> -	}
>>  
>>  	info = platform_get_drvdata(pdev);
>>  	probe_success = 0;
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


-- 
Best regards,
Marek Vasut
