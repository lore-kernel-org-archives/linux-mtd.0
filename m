Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alHFD-0002CT-DR
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2016 14:37:16 +0000
Subject: Re: [PATCH] mtd: nand: jz4780: fixup, device structure assigned at
 probe
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Jorge Ramirez-Ortiz
 <jorge.ramirez-ortiz@linaro.org>
References: <1458784407-12908-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160330163432.29c3864c@bbrezillon>
CC: <alex@alex-smith.me.uk>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <56FBE483.2010407@imgtec.com>
Date: Wed, 30 Mar 2016 15:36:51 +0100
MIME-Version: 1.0
In-Reply-To: <20160330163432.29c3864c@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 30/03/16 15:34, Boris Brezillon wrote:
> On Wed, 23 Mar 2016 21:53:27 -0400
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
>
> How about adding the following message:
>
> "
> bch->dev is already assigned to &pdev->dev in the probe function.
> Remove the duplicate assignment done in jz4780_bch_get().
> "
>
> If you agree I'll add this commit message while applying (no need to
> resend).

That sounds good to me. Congrats on the maintainership btw. :-)

>
> Harvey, can I have your ack on this patch?

Acked-by: Harvey Hunt <harvey.hunt@imgtec.com>

>
> Thanks,
>
> Boris
>

Thanks,

Harvey

>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>   drivers/mtd/nand/jz4780_bch.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
>> index 755499c..d74f4ba 100644
>> --- a/drivers/mtd/nand/jz4780_bch.c
>> +++ b/drivers/mtd/nand/jz4780_bch.c
>> @@ -287,7 +287,6 @@ static struct jz4780_bch *jz4780_bch_get(struct device_node *np)
>>   	bch = platform_get_drvdata(pdev);
>>   	clk_prepare_enable(bch->clk);
>>
>> -	bch->dev = &pdev->dev;
>>   	return bch;
>>   }
>>
>
>
>
