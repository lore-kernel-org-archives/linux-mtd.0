Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBk5h-0003Id-Ay
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 16:49:54 +0000
Date: Thu, 26 Apr 2018 18:49:31 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Arnout Vandecapelle <arnout@mind.be>,
 Dries Staelens <dries.staelens@barco.com>
Subject: Re: [PATCH 09/13] mtd: rawnand: gpmi: poll the BCH interrupt bit in
 start_dma_with_bch_irq()
Message-ID: <20180426184931.4f711654@bbrezillon>
In-Reply-To: <20180426154134.8270-10-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
 <20180426154134.8270-10-sam.lefebvre@essensium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 26 Apr 2018 17:41:30 +0200
Sam Lefebvre <sam.lefebvre@essensium.com> wrote:

> To improve nand performance, the BCH interrupt bit must be polled
> before waiting for occurence. This avoids an unnecessary context switch.
> 
> Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 60bc1bac7741..28a2cf106ddc 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -503,18 +503,31 @@ int start_dma_without_bch_irq(struct gpmi_nand_data *this,
>   * Actually, we must wait for two interrupts :
>   *	[1] firstly the DMA interrupt and
>   *	[2] secondly the BCH interrupt.
> + *	To improve performance, we first poll for the BCH
> + *	interrupt.
>   */
>  int start_dma_with_bch_irq(struct gpmi_nand_data *this,
>  			struct dma_async_tx_descriptor *desc)
>  {
>  	struct completion *bch_c = &this->bch_done;
> +	struct resources *r = &this->resources;
>  	unsigned long timeout;
>  
> -	/* Prepare to receive an interrupt from the BCH block. */
> -	init_completion(bch_c);
> +	/* Disable interrupt */
> +	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN, r->bch_regs + HW_BCH_CTRL_CLR);

I'd prefer to have it disabled in the probe function.

>  
>  	/* start the DMA */
>  	start_dma_without_bch_irq(this, desc);
> +	if (readl(r->bch_regs + HW_BCH_CTRL) & BM_BCH_CTRL_COMPLETE_IRQ) {
> +		writel(BM_BCH_CTRL_COMPLETE_IRQ, r->bch_regs + HW_BCH_CTRL_CLR);
> +		return 0;
> +	}
> +
> +	/* Prepare to receive an interrupt from the BCH block. */
> +	init_completion(bch_c);
> +
> +	/* Re-enable interrupt */
> +	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN, r->bch_regs + HW_BCH_CTRL_SET);
>  
>  	/* Wait for the interrupt from the BCH block. */
>  	timeout = wait_for_completion_timeout(bch_c, msecs_to_jiffies(1000));

And then you can disable it here, so that the interrupt is only active
when we need it.
