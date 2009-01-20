Received: from rv-out-0708.google.com ([209.85.198.250])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPCTt-00061N-L5
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 09:01:12 +0000
Received: by rv-out-0708.google.com with SMTP id b17so3198840rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Jan 2009 01:01:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1232436828-15176-2-git-send-email-mike@compulab.co.il>
References: <f17812d70901191916u3891547ds393942a4e444a351@mail.gmail.com>
	<1232436828-15176-1-git-send-email-mike@compulab.co.il>
	<1232436828-15176-2-git-send-email-mike@compulab.co.il>
Date: Tue, 20 Jan 2009 17:01:08 +0800
Message-ID: <f17812d70901200101x5497047aw93c26ca0ccf8ef05@mail.gmail.com>
Subject: Re: [PATCH] MTD: NAND: pxa3xx_nand: use resource_size instead of
	'r->end - r->start + 1'
From: Eric Miao <eric.y.miao@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, eric.miao@marvell.com,
	linux-arm-kernel@lists.arm.linux.org.uk, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 20, 2009 at 3:33 PM, Mike Rapoport <mike@compulab.co.il> wrote:
>
> Signed-off-by: Mike Rapoport <mike@compulab.co.il>

OK

> ---
>  drivers/mtd/nand/pxa3xx_nand.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index cc55cbc..ffa960b 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1118,14 +1118,14 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>                goto fail_put_clk;
>        }
>
> -       r = request_mem_region(r->start, r->end - r->start + 1, pdev->name);
> +       r = request_mem_region(r->start, resource_size(r), pdev->name);
>        if (r == NULL) {
>                dev_err(&pdev->dev, "failed to request memory resource\n");
>                ret = -EBUSY;
>                goto fail_put_clk;
>        }
>
> -       info->mmio_base = ioremap(r->start, r->end - r->start + 1);
> +       info->mmio_base = ioremap(r->start, resource_size(r));
>        if (info->mmio_base == NULL) {
>                dev_err(&pdev->dev, "ioremap() failed\n");
>                ret = -ENODEV;
> @@ -1174,7 +1174,7 @@ fail_free_buf:
>  fail_free_io:
>        iounmap(info->mmio_base);
>  fail_free_res:
> -       release_mem_region(r->start, r->end - r->start + 1);
> +       release_mem_region(r->start, resource_size(r));
>  fail_put_clk:
>        clk_disable(info->clk);
>        clk_put(info->clk);
> --
> 1.5.6.4
>
>
> -------------------------------------------------------------------
> List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
> FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
> Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
>



-- 
Cheers
- eric
