Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhqLD-00016K-7R
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 02:45:00 +0000
Received: by padhy16 with SMTP id hy16so93043077pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2015 19:44:37 -0700 (PDT)
Date: Thu, 1 Oct 2015 19:44:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, dehrenberg@google.com,
 cernekee@gmail.com, sboyd@codeaurora.org,
 linux-arm-msm@vger.kernel.org, agross@codeaurora.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] mtd: nand: Create a BBT flag to access bad block
 markers in raw mode
Message-ID: <20151002024434.GC107187@google.com>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-2-git-send-email-architt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439959746-25498-2-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 19, 2015 at 10:19:02AM +0530, Archit Taneja wrote:
> Some controllers can access the factory bad block marker from OOB only
> when they read it in raw mode. When ECC is enabled, these controllers
> discard reading/writing bad block markers, preventing access to them
> altogether.
> 
> The bbt driver assumes MTD_OPS_PLACE_OOB when scanning for bad blocks.
> This results in the nand driver's ecc->read_oob() op to be called, which
> works with ECC enabled.
> 
> Create a new BBT option flag that tells nand_bbt to force the mode to
> MTD_OPS_RAW. This would result in the correct op being called for the
> underlying nand controller driver.

MTD_OPS_RAW is probably the best way to do this, and we should switch
back to it for all users (rather than a new flag). But to do this, we
need to fix up some things. Particularly, we need to extend
'badblockbits' support so that it is applied consistently in all places
(I recall there is one code path in which bad block scanning does take
this into account, and one that doesn't.)

About badblockbits: it allows us to do a relaxed heuristic on matching
bad block markers, where we say the BBM is "bad" if more than fewer than
N bits are '1'. Right now, we just say that if there are any 0 bits in
the Bad Block Marker (BBM) region, then the block is bad. But this is
problematic for pages that have been worn down and might have bitflips.
So right now, part of a (bad) solution is to read with ECC, so worn
blocks that have data won't be later interpreted as bad blocks if we
rescan the BBMs (ECC will correct the bitflips, if the OOB is
protected).

But that solution is not really good, since ECC is not really a panacea
for misinterpreted BBMs. And HW like yours apparently won't work like
this.

So in summary: if we can consistently make BBM checks look for 6 or 7
"one" bits (rather than a full 8 bits, i.e. BBM == 0xff), then we can
just unconditionally switch to RAW rather than PLACE_OOB. And we don't
need a flag like this pach introduces.

Brian

> Reviewed-by: Andy Gross <agross@codeaurora.org>
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---
>  drivers/mtd/nand/nand_base.c | 6 +++++-
>  drivers/mtd/nand/nand_bbt.c  | 6 +++++-
>  include/linux/mtd/bbm.h      | 7 +++++++
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca..0a0c524 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -394,7 +394,11 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  	} else {
>  		ops.len = ops.ooblen = 1;
>  	}
> -	ops.mode = MTD_OPS_PLACE_OOB;
> +
> +	if (unlikely(chip->bbt_options & NAND_BBT_ACCESS_BBM_RAW))
> +		ops.mode = MTD_OPS_RAW;
> +	else
> +		ops.mode = MTD_OPS_PLACE_OOB;
>  
>  	/* Write to first/last page(s) if necessary */
>  	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 63a1a36..f2d89c9 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -420,7 +420,11 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
>  	ops.oobbuf = buf;
>  	ops.ooboffs = 0;
>  	ops.datbuf = NULL;
> -	ops.mode = MTD_OPS_PLACE_OOB;
> +
> +	if (unlikely(bd->options & NAND_BBT_ACCESS_BBM_RAW))
> +		ops.mode = MTD_OPS_RAW;
> +	else
> +		ops.mode = MTD_OPS_PLACE_OOB;
>  
>  	for (j = 0; j < numpages; j++) {
>  		/*
> diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
> index 36bb6a5..f67f84a 100644
> --- a/include/linux/mtd/bbm.h
> +++ b/include/linux/mtd/bbm.h
> @@ -116,6 +116,13 @@ struct nand_bbt_descr {
>  #define NAND_BBT_NO_OOB_BBM	0x00080000
>  
>  /*
> + * Force MTD_OPS_RAW mode when trying to access bad block markes from OOB. To
> + * be used by controllers which can access BBM only when ECC is disabled, i.e,
> + * when in RAW access mode
> + */
> +#define NAND_BBT_ACCESS_BBM_RAW	0x00100000
> +
> +/*
>   * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
>   * was allocated dynamicaly and must be freed in nand_release(). Has no meaning
>   * in nand_chip.bbt_options.
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
