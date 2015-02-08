Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKW8Y-0006Tn-4j
 for linux-mtd@lists.infradead.org; Sun, 08 Feb 2015 17:59:14 +0000
Date: Sun, 8 Feb 2015 18:58:50 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH] mtd: nand: gpmi: fixup return type of
 wait_for_completion_timeout
Message-ID: <20150208185850.750af67d@bbrezillon>
In-Reply-To: <1423413453-5254-1-git-send-email-hofrat@osadl.org>
References: <1423413453-5254-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun,  8 Feb 2015 11:37:33 -0500
Nicholas Mc Guire <hofrat@osadl.org> wrote:

> return type of wait_for_completion_timeout is unsigned long not int. The
> return variable is renamed to reflect its use and the type adjusted to
> unsigned long.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> 
> Patch was only compile tested with imx_v6_v7_defconfig
> (implies CONFIG_MTD_NAND_GPMI_NAND=y)
> 
> Patch is against 3.19.0-rc7 (localversion-next is -next-20150204)
> 
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 33f3c3c..6e44d32 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -446,7 +446,7 @@ int start_dma_without_bch_irq(struct gpmi_nand_data *this,
>  				struct dma_async_tx_descriptor *desc)
>  {
>  	struct completion *dma_c = &this->dma_done;
> -	int err;
> +	unsigned long timeout;
>  
>  	init_completion(dma_c);
>  
> @@ -456,8 +456,8 @@ int start_dma_without_bch_irq(struct gpmi_nand_data *this,
>  	dma_async_issue_pending(get_dma_chan(this));
>  
>  	/* Wait for the interrupt from the DMA block. */
> -	err = wait_for_completion_timeout(dma_c, msecs_to_jiffies(1000));
> -	if (!err) {
> +	timeout = wait_for_completion_timeout(dma_c, msecs_to_jiffies(1000));
> +	if (!timeout) {
>  		dev_err(this->dev, "DMA timeout, last DMA :%d\n",
>  			this->last_dma_type);
>  		gpmi_dump_info(this);
> @@ -477,7 +477,7 @@ int start_dma_with_bch_irq(struct gpmi_nand_data *this,
>  			struct dma_async_tx_descriptor *desc)
>  {
>  	struct completion *bch_c = &this->bch_done;
> -	int err;
> +	unsigned long timeout;
>  
>  	/* Prepare to receive an interrupt from the BCH block. */
>  	init_completion(bch_c);
> @@ -486,8 +486,8 @@ int start_dma_with_bch_irq(struct gpmi_nand_data *this,
>  	start_dma_without_bch_irq(this, desc);
>  
>  	/* Wait for the interrupt from the BCH block. */
> -	err = wait_for_completion_timeout(bch_c, msecs_to_jiffies(1000));
> -	if (!err) {
> +	timeout = wait_for_completion_timeout(bch_c, msecs_to_jiffies(1000));
> +	if (!timeout) {
>  		dev_err(this->dev, "BCH timeout, last DMA :%d\n",
>  			this->last_dma_type);
>  		gpmi_dump_info(this);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
