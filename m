Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlSmA-0002D8-N8
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 00:14:44 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWW00AA9BBURX00@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 09:14:19 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <CAPgLHd-qf8Zj0gWgJh3_WMZOAx5-H6aABrVFqRsAw=XkOfDdmw@mail.gmail.com>
 <20131126235026.GN9468@ld-irv-0074.broadcom.com>
In-reply-to: <20131126235026.GN9468@ld-irv-0074.broadcom.com>
Subject: Re: [PATCH] MIPS: Alchemy: add missing platform_set_drvdata() in
 au1550nd_probe()
Date: Wed, 27 Nov 2013 09:14:18 +0900
Message-id: <004e01ceeb05$9d579690$d806c3b0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Wei Yongjun' <weiyj.lk@gmail.com>,
 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 'Wei Yongjun' <yongjun_wei@trendmicro.com.cn>,
 'Bill Pemberton' <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, November 27, 2013 8:50 AM, Brian Norris wrote:

Hi Brian Norris,

I added my questions as below. :-)

> On Mon, Nov 11, 2013 at 02:18:29PM +0800, Wei Yongjun wrote:
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >
> > Add missing platform_set_drvdata() in au1550nd_probe(), otherwise
> > calling platform_get_drvdata() in remove returns NULL.
> 
> An alternative solution: just allocate ctx with devm_kzalloc().Then you
> don't have to kfree() it at all.

Even if devm_kzalloc() is used, missing platform_set_drvdata() will
be still necessary.

static int au1550nd_remove(struct platform_device *pdev)
{
	struct au1550nd_ctx *ctx = platform_get_drvdata(pdev);
	.....

	nand_release(&ctx->info);

'ctx' is still used. Also, in order to use 'ctx',
platform_get_drvdata(pdev) should be called.

> 
> I don't mind one solution over the other too much. Let me know which
> you'd prefer.
> 
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > ---
> >  drivers/mtd/nand/au1550nd.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
> > index ae8dd7c..909b673 100644
> > --- a/drivers/mtd/nand/au1550nd.c
> > +++ b/drivers/mtd/nand/au1550nd.c
> > @@ -480,6 +480,8 @@ static int au1550nd_probe(struct platform_device *pdev)
> >
> >  	mtd_device_register(&ctx->info, pd->parts, pd->num_parts);
> >
> > +	platform_set_drvdata(pdev, ctx);
> > +
> 
> Personally, I'd choose to call platform_set_drvdata() earlier in the
> probe routine (e.g., immediately after its allocation), in case we end
> up calling platform_get_drvdata() from some sub-routine in the future.

Do you mean the following?
But, most drivers calls platform_set_drvdata() later in the probe routine.

static int au1550nd_probe(struct platform_device *pdev)
{
        struct au1550nd_platdata *pd;
        struct au1550nd_ctx *ctx;
        struct nand_chip *this;
        struct resource *r;
        int ret, cs;

        pd = dev_get_platdata(&pdev->dev);
        if (!pd) {
                dev_err(&pdev->dev, "missing platform data\n");
                return -ENODEV;
        }

        ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
        if (!ctx) {
                dev_err(&pdev->dev, "no memory for NAND context\n");
                return -ENOMEM;
        }

+	platform_set_drvdata(pdev, ctx);
+

Best regards,
Jingoo Han
