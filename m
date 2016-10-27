Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzquo-0000XQ-GN
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 20:04:43 +0000
Date: Thu, 27 Oct 2016 22:04:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Zach Brown <zach.brown@ni.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 2/3] mtd: nand: implement 'max_bad_blocks' mtd
 function
Message-ID: <20161027220421.7a1471be@bbrezillon>
In-Reply-To: <1477595642-11454-3-git-send-email-zach.brown@ni.com>
References: <1477595642-11454-1-git-send-email-zach.brown@ni.com>
 <1477595642-11454-3-git-send-email-zach.brown@ni.com>
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

On Thu, 27 Oct 2016 14:14:01 -0500
Zach Brown <zach.brown@ni.com> wrote:

> From: Jeff Westfahl <jeff.westfahl@ni.com>
> 
> Implement the new mtd function 'max_bad_blocks'. Use the ONFI parameter
> page to find the maximum bad blocks to reserve for an MTD, taking into
> account how many LUNs the MTD spans.
> 
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> ---
>  drivers/mtd/nand/nand_base.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e5718e5..ac08224 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3226,6 +3226,39 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
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
> +	/* ONFI is used to determine the maximum bad block count. */
> +	if (!chip->onfi_version)
> +		return -ENOTSUPP;
> +
> +	/* Get the start and end of the partition in erase blocks. */
> +	part_start_block = mtd_div_by_eb(ofs, mtd);
> +	part_end_block = mtd_div_by_eb(len, mtd) + part_start_block - 1;
> +
> +	/* Get the start and end LUNs of the partition. */
> +	part_start_lun = part_start_block / chip->onfi_params.blocks_per_lun;
> +	part_end_lun = part_end_block / chip->onfi_params.blocks_per_lun;
> +
> +	/* Look up the bad blocks per unit and multiply by the number of units
> +	 * that the partition spans.
> +	 */
> +	return chip->onfi_params.bb_per_lun *
> +		(part_end_lun - part_start_lun + 1);

Well, it's a good start, but I'd like to have something that works even
for non-ONFI chips. How about adding a field in nand_chip and filling
this field when the ONFI param page is retrieved/parsed. This way we
can easily extend the implementation for full-id entries in the
nand_ids table or for JEDEC compliant chips (assuming the JEDEC
standard provides such information).

> +}
> +
> +/**
>   * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
>   * @mtd: MTD device structure
>   * @chip: nand chip info structure
> @@ -4743,6 +4776,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	mtd->_block_isreserved = nand_block_isreserved;
>  	mtd->_block_isbad = nand_block_isbad;
>  	mtd->_block_markbad = nand_block_markbad;
> +	mtd->_max_bad_blocks = nand_max_bad_blocks;
>  	mtd->writebufsize = mtd->writesize;
>  
>  	/*
