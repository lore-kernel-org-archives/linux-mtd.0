Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQFgu-0003oe-30
 for linux-mtd@lists.infradead.org; Sun, 08 Jan 2017 15:47:33 +0000
Date: Sun, 8 Jan 2017 16:46:59 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Zach Brown <zach.brown@ni.com>, <computersforpeace@gmail.com>,
 <richard@nod.at>
Cc: <dwmw2@infradead.org>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 4/5] mtd: nand: implement 'max_bad_blocks' mtd function
Message-ID: <20170108164659.34ac8262@bbrezillon>
In-Reply-To: <1483730086-26706-5-git-send-email-zach.brown@ni.com>
References: <1483730086-26706-1-git-send-email-zach.brown@ni.com>
 <1483730086-26706-5-git-send-email-zach.brown@ni.com>
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

On Fri, 6 Jan 2017 13:14:45 -0600
Zach Brown <zach.brown@ni.com> wrote:

> Implement the new mtd function 'max_bad_blocks'. Using the chip's
> max_bb_per_die and blocks_per_die fields to determine the maximum bad
> blocks to reserve for an MTD.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ec1c28a..587cd42 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3263,6 +3263,42 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
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
> +	uint32_t part_start_die;
> +	uint32_t part_end_die;

I missed these ones -> s/uint32_t/u32/.

Brian, Richard, if you're fine with this version, I'd like to take the
whole series in the nand tree (I have other changes which might
conflict with these ones).

> +
> +	/*
> +	 * max_bb_per_die and blocks_per_die used to determine
> +	 * the maximum bad block count.
> +	 */
> +	if (!chip->max_bb_per_die || !chip->blocks_per_die)
> +		return -ENOTSUPP;
> +
> +	/* Get the start and end of the partition in erase blocks. */
> +	part_start_block = mtd_div_by_eb(ofs, mtd);
> +	part_end_block = mtd_div_by_eb(len, mtd) + part_start_block - 1;
> +
> +	/* Get the start and end LUNs of the partition. */
> +	part_start_die = part_start_block / chip->blocks_per_die;
> +	part_end_die = part_end_block / chip->blocks_per_die;
> +
> +	/*
> +	 * Look up the bad blocks per unit and multiply by the number of units
> +	 * that the partition spans.
> +	 */
> +	return chip->max_bb_per_die * (part_end_die - part_start_die + 1);
> +}
> +
> +/**
>   * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
> @@ -4815,6 +4851,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	mtd->_block_isreserved = nand_block_isreserved;
>  	mtd->_block_isbad = nand_block_isbad;
>  	mtd->_block_markbad = nand_block_markbad;
> +	mtd->_max_bad_blocks = nand_max_bad_blocks;
>  	mtd->writebufsize = mtd->writesize;
>  
>  	/*
