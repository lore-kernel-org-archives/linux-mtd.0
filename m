Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQll5-0000Xm-Bb
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 22:16:04 +0000
Received: by mail-ob0-f170.google.com with SMTP id va2so5423510obc.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 15:15:41 -0700 (PDT)
Date: Mon, 30 Sep 2013 15:15:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v4 02/12] mtd: nand: rename the cellinfo to bits_per_cell
Message-ID: <20130930221536.GM23337@ld-irv-0074.broadcom.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
 <1380092301-21924-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380092301-21924-3-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 02:58:11PM +0800, Huang Shijie wrote:
> The @cellinfo fields contains unused information, such as write caching,
> internal chip numbering, etc. But we only use it to check the SLC or MLC.
> 
> This patch tries to make it more clear and simple, renames the @cellinfo
> to @bits_per_cell.
> 
> In order to avoiding the bisect issue, this patch also does the following
> changes:
>   (0) add a macro NAND_CI_CELLTYPE_SHIFT to avoid the hardcode.
> 
>   (1) add a helper to parse out the cell type : nand_get_bits_per_cell()
> 
>   (2) parse out the cell type for extended-ID chips and the full-id nand chips.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   14 ++++++++++++--
>  include/linux/mtd/nand.h     |    7 ++++---
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 5c05bab..0eb4a63 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -477,7 +478,7 @@ struct nand_buffers {
>   * @badblockbits:	[INTERN] minimum number of set bits in a good block's
>   *			bad block marker position; i.e., BBM == 11110111b is
>   *			not bad when badblockbits == 7
> - * @cellinfo:		[INTERN] MLC/multichip data from chip ident
> + * @bits_per_cell:	[INTERN] the bits of per cell. i.e., 1 means SLC.

s/bits of/number of bits/

>   * @ecc_strength_ds:	[INTERN] ECC correctability from the datasheet.
>   *			Minimum amount of bit errors per @ecc_step_ds guaranteed
>   *			to be correctable. If unknown, set to zero.

I'll squash that change into the patch myself if the rest looks good.

Brian
