Received: from mail-db8lp0184.outbound.messaging.microsoft.com
 ([213.199.154.184] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsp2Z-0003Py-J6
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 07:26:06 +0000
Date: Tue, 17 Dec 2013 14:56:24 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131217065622.GA6052@shlinux2.ap.freescale.net>
References: <1387263581-7863-1-git-send-email-eliedebrauwer@gmail.com>
 <1387263581-7863-2-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1387263581-7863-2-git-send-email-eliedebrauwer@gmail.com>
Cc: shijie8@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 07:59:41AM +0100, Elie De Brauwer wrote:
> The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
> able to correct bitflips on data actually streamed through the block.
> When erasing a block the data does not stream through the BCH block
> and therefore no ECC data is written to the NAND chip. This causes
> gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
> found in an erased page. Typically causing problems at higher levels
> (ubifs corrupted empty space warnings). This problem was also observed
> when using SLC NAND devices.
> 
> This patch configures the BCH block to mark a block as 'erased' if
> no more than gf_len/2 bitflips are found. Next HW_BCH_STATUS0:ALLONES
> is used to check if the data read were all ones, indicating a read of a
> properly erased chunk was performed. If this was not the case a slow path
> is entered where bitflips are counted and corrected in software,
> allowing the upper layers to take proper actions.
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  |    2 ++
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   16 ++++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   44 +++++++++++++++++++++++++++++---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    1 +
>  4 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> index 588f537..a30502f 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -30,7 +30,9 @@
>  #define BM_BCH_CTRL_COMPLETE_IRQ		(1 << 0)
>  
>  #define HW_BCH_STATUS0				0x00000010
> +#define BM_BCH_STATUS0_ALLONES_MASK		(1 << 4)
>  #define HW_BCH_MODE				0x00000020
> +#define BM_BCH_MODE_ERASE_THRESHOLD_MASK	0xff
>  #define HW_BCH_ENCODEPTR			0x00000030
>  #define HW_BCH_DATAPTR				0x00000040
>  #define HW_BCH_METAPTR				0x00000050
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index aaced29..86b9126 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>  			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>  
> +	/*
> +	 * Set the tolerance for bitflips when reading erased blocks
> +	 * equal to half the gf_len.
> +	 */
> +	writel((gf_len/2) & BM_BCH_MODE_ERASE_THRESHOLD_MASK,

Please code it like this:
	writel((gf_len / 2) & BM_BCH_MODE_ERASE_THRESHOLD_MASK,

Since the name gpmi_allones is complained by Brain,
you have to send a v4 version.


thanks
Huang Shijie
