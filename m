Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9GEF-0004Oy-PY
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 18:55:40 +0000
Received: by mail-pg0-x243.google.com with SMTP id 3so2812906pgd.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 10:55:19 -0800 (PST)
Date: Tue, 22 Nov 2016 10:55:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zach Brown <zach.brown@ni.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 4/5] mtd: nand: implement 'max_bad_blocks' mtd
 function
Message-ID: <20161122185516.GD77253@google.com>
References: <1479757899-6849-1-git-send-email-zach.brown@ni.com>
 <1479757899-6849-5-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479757899-6849-5-git-send-email-zach.brown@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 21, 2016 at 01:51:38PM -0600, Zach Brown wrote:
> Implement the new mtd function 'max_bad_blocks'. Using the chip's
> max_bb_per_die and blocks_per_die fields to determine the maximum bad
> blocks to reserve for an MTD.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
> ---
>  drivers/mtd/nand/nand_base.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 3bde96a..193a6b7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3236,6 +3236,40 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  }
>  
>  /**
> + * nand_max_bad_blocks - [MTD Interface] Max number of bad blocks for an mtd
> + * @mtd: MTD device structure
> + * @ofs: offset relative to mtd start
> + * @len: length of mtd
> + */
> +static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	uint32_t part_start_block;
> +	uint32_t part_end_block;
> +	uint32_t part_start_lun;
> +	uint32_t part_end_lun;
> +
> +	/* max_bb_per_lun and blocks_per_lun used to determine
> +	 * the maximum bad block count.
> +	 */

This is not the right multi-line comment style.

/*
 * Use something more like this, where the first line has only the
 * comment opening.
 */

> +	if (!chip->max_bb_per_die || !chip->blocks_per_die)
> +		return -ENOTSUPP;
> +
> +	/* Get the start and end of the partition in erase blocks. */
> +	part_start_block = mtd_div_by_eb(ofs, mtd);
> +	part_end_block = mtd_div_by_eb(len, mtd) + part_start_block - 1;
> +
> +	/* Get the start and end LUNs of the partition. */
> +	part_start_lun = part_start_block / chip->blocks_per_die;
> +	part_end_lun = part_end_block / chip->blocks_per_die;
> +
> +	/* Look up the bad blocks per unit and multiply by the number of units
> +	 * that the partition spans.
> +	 */

Same.

Brian

> +	return chip->max_bb_per_die * (part_end_lun - part_start_lun + 1);
> +}
> +
> +/**
>   * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
> @@ -4767,6 +4801,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	mtd->_block_isreserved = nand_block_isreserved;
>  	mtd->_block_isbad = nand_block_isbad;
>  	mtd->_block_markbad = nand_block_markbad;
> +	mtd->_max_bad_blocks = nand_max_bad_blocks;
>  	mtd->writebufsize = mtd->writesize;
>  
>  	/*
> -- 
> 2.7.4
> 
