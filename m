Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LP76i-0006Vu-8y
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 03:16:54 +0000
Received: by rv-out-0708.google.com with SMTP id b17so3088822rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Jan 2009 19:16:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20090119114008.GC2425@trinity.fluff.org>
References: <1232364431-7941-1-git-send-email-mike@compulab.co.il>
	<20090119114008.GC2425@trinity.fluff.org>
Date: Tue, 20 Jan 2009 11:16:50 +0800
Message-ID: <f17812d70901191916u3891547ds393942a4e444a351@mail.gmail.com>
Subject: Re: [PATCH] MTD: NAND: pxa3xx_nand: allow building as module
From: Eric Miao <eric.y.miao@gmail.com>
To: Ben Dooks <ben-linux@fluff.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, eric.miao@marvell.com,
	linux-arm-kernel@lists.arm.linux.org.uk,
	Mike Rapoport <mike@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 19, 2009 at 7:40 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> On Mon, Jan 19, 2009 at 01:27:11PM +0200, Mike Rapoport wrote:
>>
>> Signed-off-by: Mike Rapoport <mike@compulab.co.il>
>> ---
>>  drivers/mtd/nand/Kconfig       |    2 +-
>>  drivers/mtd/nand/pxa3xx_nand.c |   10 ++++++++++
>>  2 files changed, 11 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 8b12e6e..d3966d0 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -334,7 +334,7 @@ config MTD_NAND_ATMEL_ECC_NONE
>>  endchoice
>>
>>  config MTD_NAND_PXA3xx
>> -     bool "Support for NAND flash devices on PXA3xx"
>> +     tristate "Support for NAND flash devices on PXA3xx"
>>       depends on MTD_NAND && PXA3xx
>>       help
>>         This enables the driver for the NAND flash device found on
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>> index cc55cbc..628ba08 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -123,6 +123,7 @@ struct pxa3xx_nand_info {
>>
>>       struct clk              *clk;
>>       void __iomem            *mmio_base;
>> +     struct resource         *res;
>>
>>       unsigned int            buf_start;
>>       unsigned int            buf_count;
>> @@ -1079,6 +1080,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>>
>>       this = &info->nand_chip;
>>       mtd->priv = info;
>> +     mtd->owner = THIS_MODULE;
>>
>>       info->clk = clk_get(&pdev->dev, NULL);
>>       if (IS_ERR(info->clk)) {
>> @@ -1125,6 +1127,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>>               goto fail_put_clk;
>>       }
>>
>> +     info->res = r;
>>       info->mmio_base = ioremap(r->start, r->end - r->start + 1);
>>       if (info->mmio_base == NULL) {
>>               dev_err(&pdev->dev, "ioremap() failed\n");
>> @@ -1199,6 +1202,13 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
>>                               info->data_buff, info->data_buff_phys);
>>       } else
>>               kfree(info->data_buff);
>> +
>> +     iounmap(info->mmio_base);
>> +     release_mem_region(info->res->start, info->res->end - info->res->start + 1);
>
> resource_size() is probably better for the second argument.
>

And maybe we don't even need to introduce the 'info->res', which is
always valid by platform_get_resource() again in _remove().
