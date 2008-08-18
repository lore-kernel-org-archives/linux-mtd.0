Received: from mho-01-bos.mailhop.org ([63.208.196.178])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KV3vS-00082G-K2
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 12:33:34 +0000
Date: Mon, 18 Aug 2008 15:33:20 +0300
From: Tony Lindgren <tony@atomide.com>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCH] [MTD] OneNAND OMAP3: add delay for GPIO
Message-ID: <20080818123319.GD17827@atomide.com>
References: <48A4103C.9090603@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48A4103C.9090603@nokia.com>
Cc: linux-omap@vger.kernel.org,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Adrian Hunter <ext-adrian.hunter@nokia.com> [080814 14:21]:
> On OMAP3, the driver was occasionally not seeing the GPIO
> interrupt.  Adding a small delay of one register read
> eliminates the problem.

Pushing to linux-omap tree.

Tony

> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---
> drivers/mtd/onenand/omap2.c |    9 +++++++--
> 1 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index 2bd8746..bf6bba5 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -141,8 +141,13 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
>
> 		/* Turn interrupts on */
> 		syscfg = read_reg(c, ONENAND_REG_SYS_CFG1);
> -		syscfg |= ONENAND_SYS_CFG1_IOBE;
> -		write_reg(c, syscfg, ONENAND_REG_SYS_CFG1);
> +		if (!(syscfg & ONENAND_SYS_CFG1_IOBE)) {
> +			syscfg |= ONENAND_SYS_CFG1_IOBE;
> +			write_reg(c, syscfg, ONENAND_REG_SYS_CFG1);
> +			if (cpu_is_omap34xx())
> +				/* Add a delay to let GPIO settle */
> +				syscfg = read_reg(c, ONENAND_REG_SYS_CFG1);
> +		}
>
> 		INIT_COMPLETION(c->irq_done);
> 		if (c->gpio_irq) {
> -- 
> 1.5.4.3
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
