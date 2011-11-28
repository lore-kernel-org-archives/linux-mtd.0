Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RV947-0000xu-33
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 21:48:43 +0000
Message-ID: <4ED401B3.1020001@freescale.com>
Date: Mon, 28 Nov 2011 15:48:35 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: LiuShuo <b35362@freescale.com>
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1322095306-13156-1-git-send-email-b35362@freescale.com>
 <1322095306-13156-3-git-send-email-b35362@freescale.com>
In-Reply-To: <1322095306-13156-3-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 akpm@linux-foundation.org, leoli@freescale.com,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/23/2011 06:41 PM, b35362@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> Freescale FCM controller has a 2K size limitation of buffer RAM. In order
> to support the Nand flash chip whose page size is larger than 2K bytes,
> we read/write 2k data repeatedly by issuing FIR_OP_RB/FIR_OP_WB and save
> them to a large buffer.
> 
> Signed-off-by: Liu Shuo <b35362@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>
> ---
>  drivers/mtd/nand/fsl_elbc_nand.c |  211 +++++++++++++++++++++++++++++++++++---
>  1 files changed, 194 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index d634c5f..c96e714 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -55,7 +55,9 @@ struct fsl_elbc_mtd {
>  	struct device *dev;
>  	int bank;               /* Chip select bank number           */
>  	u8 __iomem *vbase;      /* Chip select base virtual address  */
> -	int page_size;          /* NAND page size (0=512, 1=2048)    */
> +	int page_size;          /* NAND page size, the mutiple of 2048.
> +				 * (0=512, 1=2048, 2=4096, 4=8192....)
> +				 */

Again, please remove this.  It was sort-of reasonable when it was a
boolean that selected between slightly different programming models.  It
doesn't make sense as "mtd->writesize == 512 ? 0 : mtd->writesize / 512".

What is the plan for migrating bad block markers on first use?

-Scott
