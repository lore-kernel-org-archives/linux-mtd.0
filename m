Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfV1n-0002Po-MH
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 17:44:21 +0000
Received: by mail-wr0-x244.google.com with SMTP id y43so4941171wrd.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Aug 2017 10:43:59 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: cqspi: fix error return code in
 cqspi_probe()
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170809162204.GA370@embeddedgus>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <63cb3b21-f6cb-ae5c-f349-d21c3208e66e@gmail.com>
Date: Wed, 9 Aug 2017 19:16:03 +0200
MIME-Version: 1.0
In-Reply-To: <20170809162204.GA370@embeddedgus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/09/2017 06:22 PM, Gustavo A. R. Silva wrote:
> platform_get_irq() returns an error code, but the cadence-quadspi
> driver ignores it and always returns -ENXIO. This is not correct
> and, prevents -EPROBE_DEFER from being propagated properly.
> 
> Print and propagate the return value of platform_get_irq on failure.
> 
> This issue was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 53c7d8e..15dacf5 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -1202,8 +1202,8 @@ static int cqspi_probe(struct platform_device *pdev)
>  	/* Obtain IRQ line. */
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "Cannot obtain IRQ.\n");
> -		return -ENXIO;
> +		dev_err(dev, "Cannot obtain IRQ: %d\n", irq);

"Cannot obtain IRQ, ret=%i\n" please . It's inobvious what the value
means otherwise.

> +		return irq;
>  	}
>  
>  	ret = clk_prepare_enable(cqspi->clk);
> 


-- 
Best regards,
Marek Vasut
