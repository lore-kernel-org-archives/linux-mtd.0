Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZys4-0003CQ-7m
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 14:00:17 +0000
Date: Thu, 20 Dec 2018 14:59:54 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: Support bad block markers in first,
 second or last page
Message-ID: <20181220145954.55ae36e9@bbrezillon>
In-Reply-To: <1545061693-29216-2-git-send-email-frieder.schrempf@kontron.de>
References: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
 <1545061693-29216-2-git-send-email-frieder.schrempf@kontron.de>
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

On Mon, 17 Dec 2018 15:49:07 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Currently supported bad block marker positions within the block are:
> * in first page only
> * in last page only
> * in first or second page
> 
> Some ESMT NANDs are known to have been shipped by the manufacturer
> with bad block markers in the first or last page, instead of the
> first or second page.
> 
> Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
> first, second *and* last page needs to be checked.
> 
> Therefore we make it possible to set NAND_BBT_SCAN2NDPAGE and
> NAND_BBT_SCANLASTPAGE at the same time to scan/set all three pages.
> 
> To simplify the code, the logic to evaluate the flags is moved to a
> a new function nand_bbm_page_offset().
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/mtd/nand/raw/internals.h |  1 +
>  drivers/mtd/nand/raw/nand_base.c | 72 ++++++++++++++++++++++++++---------
>  drivers/mtd/nand/raw/nand_bbt.c  | 30 +++++++--------
>  3 files changed, 68 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 04c2cf7..8e4b168 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -76,6 +76,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
>  
>  /* Core functions */
>  const struct nand_manufacturer *nand_get_manufacturer(u8 id);
> +int nand_bbm_page_offset(struct nand_chip *chip, int index);
>  int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
>  int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    int allowbbt);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 71050a0..388d9ed 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -253,6 +253,45 @@ static void nand_release_device(struct mtd_info *mtd)
>  }
>  
>  /**
> + * nand_bbm_page_offset - Get the page offsets for bad block markers
> + * @chip: NAND chip object
> + * @index: Index for the page offset

Hm, the meaning of index is far from obvious. How about passing the
current page instead (and return 1 if there are more pages to scan 0
otherwise)?

Something like:

static int nand_bbm_get_next_page(struct nand_chip *chip, int page)
{
	struct mtd_info *mtd = nand_to_mtd(chip);
	int last_page = ((mtd->erasesize - mtd->writesize) >>
			 chip->page_shift) & chip->pagemask;

	if (page < 0 && chip->bbt_options & NAND_BBT_SCANFIRSTPAGE)
		return 0;
	else if (page < 1 && chip->bbt_options & NAND_BBT_SCAN2NDPAGE)
		return 1;
	else if (page < last_page &&
		 chip->bbt_options & NAND_BBT_SCANLASTPAGE)
		return last_page;

	return -1;
}

And yes, that means defining NAND_BBT_SCANFIRSTPAGE and setting it when
appropriate.

> + *
> + * Returns an integer that corresponds to the page offset within a block, for
> + * a page that is used to store bad block markers. If no more page offsets are
> + * available, -1 is returned.
> + */
> +int nand_bbm_page_offset(struct nand_chip *chip, int index)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int last_page = ((mtd->erasesize - mtd->writesize) >>
> +			 chip->page_shift) & chip->pagemask;
> +
> +	switch (index) {
> +	case 0:
> +		if ((chip->bbt_options & NAND_BBT_SCANLASTPAGE) &&
> +		    !(chip->bbt_options & NAND_BBT_SCAN2NDPAGE))
> +			return last_page;
> +		else
> +			return 0;
> +		break;
> +	case 1:
> +		if (chip->bbt_options & NAND_BBT_SCAN2NDPAGE)
> +			return 1;
> +		break;
> +	case 2:
> +		if ((chip->bbt_options & NAND_BBT_SCANLASTPAGE) &&
> +		    (chip->bbt_options & NAND_BBT_SCAN2NDPAGE))
> +			return last_page;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -1;
> +}
> +
> +/**
>   * nand_block_bad - [DEFAULT] Read bad block marker from the chip
>   * @chip: NAND chip object
>   * @ofs: offset from device start
> @@ -261,18 +300,14 @@ static void nand_release_device(struct mtd_info *mtd)
>   */
>  static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
>  {
> -	struct mtd_info *mtd = nand_to_mtd(chip);
> -	int page, page_end, res;
> +	int page_offset, i = 0;
> +	int res, first_page = (int)(ofs >> chip->page_shift) & chip->pagemask;
>  	u8 bad;
>  
> -	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> -		ofs += mtd->erasesize - mtd->writesize;
> +	page_offset = nand_bbm_page_offset(chip, 0);
>  
> -	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
> -	page_end = page + (chip->bbt_options & NAND_BBT_SCAN2NDPAGE ? 2 : 1);
> -
> -	for (; page < page_end; page++) {
> -		res = chip->ecc.read_oob(chip, page);
> +	do {
> +		res = chip->ecc.read_oob(chip, first_page + page_offset);
>  		if (res < 0)
>  			return res;
>  
> @@ -284,7 +319,9 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
>  			res = hweight8(bad) < chip->badblockbits;
>  		if (res)
>  			return res;
> -	}
> +
> +		page_offset = nand_bbm_page_offset(chip, ++i);
> +	} while (page_offset != -1);
>  
>  	return 0;
>  }
> @@ -303,7 +340,7 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct mtd_oob_ops ops;
>  	uint8_t buf[2] = { 0, 0 };
> -	int ret = 0, res, i = 0;
> +	int ret = 0, res, i = 0, page_offset;
>  
>  	memset(&ops, 0, sizeof(ops));
>  	ops.oobbuf = buf;
> @@ -316,17 +353,16 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
>  	}
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  
> -	/* Write to first/last page(s) if necessary */
> -	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> -		ofs += mtd->erasesize - mtd->writesize;
> +	page_offset = nand_bbm_page_offset(chip, 0);
> +
>  	do {
> -		res = nand_do_write_oob(mtd, ofs, &ops);
> +		res = nand_do_write_oob(mtd, ofs + page_offset * mtd->writesize,
> +					&ops);
>  		if (!ret)
>  			ret = res;
>  
> -		i++;
> -		ofs += mtd->writesize;
> -	} while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
> +		page_offset = nand_bbm_page_offset(chip, ++i);
> +	} while (page_offset != -1);
>  
>  	return ret;
>  }
> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> index 98a8268..b1424b3 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -412,10 +412,11 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
>  
>  /* Scan a given block partially */
>  static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
> -			   loff_t offs, uint8_t *buf, int numpages)
> +			   loff_t offs, uint8_t *buf)
>  {
> +	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct mtd_oob_ops ops;
> -	int j, ret;
> +	int i = 0, ret, page_offset;
>  
>  	ops.ooblen = mtd->oobsize;
>  	ops.oobbuf = buf;
> @@ -423,12 +424,15 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
>  	ops.datbuf = NULL;
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  
> -	for (j = 0; j < numpages; j++) {
> +	page_offset = nand_bbm_page_offset(chip, 0);
> +
> +	do {
>  		/*
>  		 * Read the full oob until read_oob is fixed to handle single
>  		 * byte reads for 16 bit buswidth.
>  		 */
> -		ret = mtd_read_oob(mtd, offs, &ops);
> +		ret = mtd_read_oob(mtd, offs + page_offset * mtd->writesize,
> +				   &ops);
>  		/* Ignore ECC errors when checking for BBM */
>  		if (ret && !mtd_is_bitflip_or_eccerr(ret))
>  			return ret;
> @@ -436,8 +440,9 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
>  		if (check_short_pattern(buf, bd))
>  			return 1;
>  
> -		offs += mtd->writesize;
> -	}
> +		page_offset = nand_bbm_page_offset(chip, ++i);
> +	} while (page_offset != -1);
> +
>  	return 0;
>  }
>  
> @@ -456,17 +461,11 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
>  	struct nand_bbt_descr *bd, int chip)
>  {
>  	struct nand_chip *this = mtd_to_nand(mtd);
> -	int i, numblocks, numpages;
> -	int startblock;
> +	int i, numblocks, startblock;
>  	loff_t from;
>  
>  	pr_info("Scanning device for bad blocks\n");
>  
> -	if (bd->options & NAND_BBT_SCAN2NDPAGE)
> -		numpages = 2;
> -	else
> -		numpages = 1;
> -
>  	if (chip == -1) {
>  		numblocks = mtd->size >> this->bbt_erase_shift;
>  		startblock = 0;
> @@ -483,15 +482,12 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
>  		from = (loff_t)startblock << this->bbt_erase_shift;
>  	}
>  
> -	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
> -		from += mtd->erasesize - (mtd->writesize * numpages);
> -
>  	for (i = startblock; i < numblocks; i++) {
>  		int ret;
>  
>  		BUG_ON(bd->options & NAND_BBT_NO_OOB);
>  
> -		ret = scan_block_fast(mtd, bd, from, buf, numpages);
> +		ret = scan_block_fast(mtd, bd, from, buf);
>  		if (ret < 0)
>  			return ret;
>  
