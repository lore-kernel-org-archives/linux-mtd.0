Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD6jN-0004b4-4Q
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 05:49:49 +0000
Received: by mail-pb0-f49.google.com with SMTP id xb4so1444312pbc.8
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2013 22:49:23 -0700 (PDT)
Date: Fri, 23 Aug 2013 22:49:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 1/9] mtd: nand: rename the cellinfo to bits_per_cell
Message-ID: <20130824054913.GA32074@brian-ubuntu>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376879478-22128-2-git-send-email-b32955@freescale.com>
Cc: dedekind1@gmail.com, dwmw2@infradead.org, akinobu.mita@gmail.com,
 matthieu.castet@parrot.com, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 19, 2013 at 10:31:10AM +0800, Huang Shijie wrote:
> From: Huang Shijie <shijie8@gmail.com>
> 
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
>   (1) add a helper to check the SLC : nand_is_slc()
> 
>   (2) add a helper to parse out the cell type : nand_get_bits_per_cell()
> 
>   (3) parse out the cell type for legacy nand chips and extended-ID
>       chips, and the full-id nand chips.
> 
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Did you really want two signed-off-by lines? :)

> ---
>  drivers/mtd/nand/denali.c    |    2 +-
>  drivers/mtd/nand/nand_base.c |   28 ++++++++++++++++++----------
>  include/linux/mtd/nand.h     |   14 ++++++++++++--
>  3 files changed, 31 insertions(+), 13 deletions(-)

[...]

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 7ed4841..567cbcd 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3077,6 +3077,15 @@ static int nand_id_len(u8 *id_data, int arrlen)
>  	return arrlen;
>  }
>  
> +static int nand_get_bits_per_cell(u8 data)

Maybe make the parameter name 'cellinfo' to make it clearer? And maybe
a short comment to say that it extracts this information from the 3rd
byte of the extended ID de-facto standard?

> +{
> +	int bits;
> +
> +	bits = data & NAND_CI_CELLTYPE_MSK;
> +	bits >>= NAND_CI_CELLTYPE_SHIFT;
> +	return bits + 1;
> +}
> +
>  /*
>   * Many new NAND share similar device ID codes, which represent the size of the
>   * chip. The rest of the parameters must be decoded according to generic or

[...]

> @@ -3224,6 +3232,7 @@ static void nand_decode_id(struct mtd_info *mtd, struct nand_chip *chip,
>  	mtd->oobsize = mtd->writesize / 32;
>  	*busw = type->options & NAND_BUSWIDTH_16;
>  
> +	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);

This is wrong. The NAND covered by nand_decode_id() do not have an
extended ID, so the third ID byte is not meaningful. But all of these
should be SLC, so just:

	/* All legacy ID NAND are small-page, SLC */
	chip->bits_per_cell = 1;

This also highlights the problem I was alluding to if we were to try to
maintain the whole cellinfo field for all NAND; we never guaranteed that
the other bitfields of cellinfo were consistent for extended ID vs.
legacy ID NAND. For legacy ID NAND, cellinfo was always 0, and I don't
know off the top of my head whether 0 makes sense for all the other
bitfields within cellinfo.

>  	/*
>  	 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
>  	 * some Spansion chips have erasesize that conflicts with size

[...]

The rest of the patch looks good. Thanks for doing this!

Brian
