Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBoiY-00026G-Ii
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 21:46:20 +0000
Date: Thu, 26 Apr 2018 23:46:05 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Arnout Vandecapelle <arnout@mind.be>,
 Dries Staelens <dries.staelens@barco.com>
Subject: Re: [PATCH 13/13] mtd: rawnand: gmpi: chain gpmi_nand_command()
 with gpmi_ecc_read_page_data()
Message-ID: <20180426234605.72cd5cb4@bbrezillon>
In-Reply-To: <20180426154134.8270-14-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
 <20180426154134.8270-14-sam.lefebvre@essensium.com>
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

On Thu, 26 Apr 2018 17:41:34 +0200
Sam Lefebvre <sam.lefebvre@essensium.com> wrote:

> An additional interrupt can be avoided in the page and subpage
> read operations by adding a flag start_dma to indicate weather
> gpmi_nand_command() needs to be chained with other dma commands
> or not.
> 
> In case of chaining, gpmi_read_page() gets a flag that adds:
> DMA_PREP_INTERRUPT: chain the dma with previous one
> DMA_PREP_PQ_DISABLE_P: wait for prefetching being ready
> before reading, turns on the CCW_WAIT4RDY flag.
> 
> Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
> ---
>  drivers/dma/mxs-dma.c                      |  3 +++

Changes to mxs-dma.c should be done in a separate patch.

>  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  6 ++++--
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 12 ++++++++++--
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  3 ++-
>  4 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> index 41d167921fab..cb13fc759f97 100644
> --- a/drivers/dma/mxs-dma.c
> +++ b/drivers/dma/mxs-dma.c
> @@ -82,6 +82,7 @@
>  #define CCW_CHAIN		(1 << 2)
>  #define CCW_IRQ			(1 << 3)
>  #define CCW_DEC_SEM		(1 << 6)
> +#define CCW_WAIT4RDY		(1 << 5)
>  #define CCW_WAIT4END		(1 << 7)
>  #define CCW_HALT_ON_TERM	(1 << 8)
>  #define CCW_TERM_FLUSH		(1 << 9)
> @@ -551,6 +552,8 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
>  		ccw->bits |= CCW_TERM_FLUSH;
>  		ccw->bits |= BF_CCW(sg_len, PIO_NUM);
>  		ccw->bits |= BF_CCW(MXS_DMA_CMD_NO_XFER, COMMAND);
> +		if (flags & DMA_PREP_PQ_DISABLE_P)
> +			ccw->bits |= CCW_WAIT4RDY;

Hm, I'm really not sure this is a good idea to abuse the
DMA_PREP_PQ_DISABLE_P flag like that. Better add an mxs APBH specific
API on top of the DMA API to set some of the NAND related flags
(NAND_LOCK, NAND_WAIT4RDY).
