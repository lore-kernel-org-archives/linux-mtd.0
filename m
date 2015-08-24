Received: from mail-qk0-f180.google.com ([209.85.220.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTtQd-0002c4-8d
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 15:12:57 +0000
Received: by qkfh127 with SMTP id h127so70845957qkf.1
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2015 08:12:34 -0700 (PDT)
Date: Mon, 24 Aug 2015 12:08:47 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on removal
Message-ID: <20150824150847.GA8497@laptop.cereza>
References: <1440356741-24308-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440356741-24308-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 Aug 09:05 PM, Robert Jarzmik wrote:
> After the conversion of pxa architecture to common clock framework, the
> NAND clock can be disabled on driver exit.
> 
> In this case, it happens that if the driver used the NAND and set the
> DFI arbitration bit, the next access to a static memory controller area,
> such as an ethernet card, will stall the system bus, and the core will
> be stalled forever.
> 
> This is especially true on pxa31x SoCs, where the NDCR was augmented
> with a new bit to prevent this lockups by giving full ownership of the
> DFI arbiter to the SMC, in change SCr#6.
> 
> Fix this by clearing the DFI arbritration bit in driver exit. This
> effectively prevents a lockup on zylonite when removing pxa3xx-nand
> module, and using ethernet afterwards.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> 
> ---
> Ezequiel, this deserves a test on Armada, as the bit has another meaning
> there I think.

Right, on NFCv2 (Armada 370/XP) the bit 19 of NDCR has another meaning:
"Stop on uncorrectable error".

The bit is kept cleared during while the controller is used, so it should
be fine to keep it cleared for PXA usage as well.

BTW, the bit 12 (ND_ARB_EN on PXA) is marked as reserved on NFCv2.

> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index f287ce9e225a..087d769f92fd 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -78,6 +78,7 @@
>  #define NDCR_NAND_MODE   	(0x0)
>  #define NDCR_CLR_PG_CNT		(0x1 << 20)
>  #define NDCR_STOP_ON_UNCOR	(0x1 << 19)
> +#define NDCR_ARB_CNTL		(0x1 << 19)

Should we worry about having two definitions for the same bit?
Would it be too ugly to mix the two meaning? Something like this:

/* This bit has two different meanings on NFCv1 and NFCv2 */
#define NDCR_STOP_ON_UNCOR_ARB_CNTL (0x1 << 19)

>  #define NDCR_RD_ID_CNT_MASK	(0x7 << 16)
>  #define NDCR_RD_ID_CNT(x)	(((x) << 16) & NDCR_RD_ID_CNT_MASK)
>  
> @@ -1322,7 +1323,8 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
>  	}
>  
>  	/* Set an initial chunk size */
> -	info->reg_ndcr = ndcr & ~NDCR_INT_MASK;
> +	info->reg_ndcr = ndcr &
> +		~(NDCR_INT_MASK | NDCR_ND_ARB_EN | NDCR_ARB_CNTL);
>  	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
>  	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
>  	return 0;
> @@ -1569,6 +1571,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  	pxa3xx_flash_ids[1].name = NULL;
>  	def = pxa3xx_flash_ids;
>  KEEP_CONFIG:
> +	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
>  	if (info->reg_ndcr & NDCR_DWIDTH_M)
>  		chip->options |= NAND_BUSWIDTH_16;
>  
> @@ -1784,6 +1787,8 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
>  		free_irq(irq, info);
>  	pxa3xx_nand_free_buff(info);
>  

I think a comment here explaining how this disables DFI arbitration and
how clearing it grants DFI access to SMC only.

While here, we might want to document how the whole arbiter applies to
PXA only, since the DFI bus is shared there.

> +	nand_writel(info, NDCR,
> +		    (nand_readl(info, NDCR) & ~NDCR_ND_ARB_EN) | NDCR_ARB_CNTL);

>  	clk_disable_unprepare(info->clk);
>  
>  	for (cs = 0; cs < pdata->num_cs; cs++)
> -- 
> 2.1.4
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Thanks!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
