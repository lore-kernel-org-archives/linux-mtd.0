Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9vyG-0007YS-HE
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 13:53:12 +0000
Message-ID: <5592A00A.9030203@imgtec.com>
Date: Tue, 30 Jun 2015 14:56:26 +0100
From: Ionela Voinescu <ionela.voinescu@imgtec.com>
MIME-Version: 1.0
To: =?UTF-8?B?IlBldGVyIFBhbiDmvZjmoIsgKHBldGVycGFuZG9uZyki?=
 <peterpandong@micron.com>, <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, <fransklaver@gmail.com>, <wsa@the-dreams.de>,
 <zajec5@gmail.com>, <boris.brezillon@free-electrons.com>,
 <baruch@tkos.co.il>, <ezequiel.garcia@free-electrons.com>,
 <kdasu.kdev@gmail.com>, <rogerq@ti.com>, <asierra@xes-inc.com>, bpqw
 <bpqw@micron.com>
Subject: RE: [PATCH 1/1] mtd: nand_bbt: separate struct nand_chip from
 nand_bbt.c
References: <01E663332929A545AEC3C74AA81C954607DE589B@hhmail02.hh.imgtec.org>
In-Reply-To: <01E663332929A545AEC3C74AA81C954607DE589B@hhmail02.hh.imgtec.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: frankliu <"Frank Liu 刘群 frankliu"@micron.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

Thank you for putting the time and effort into separating BBT and preparing the ground for SPI NAND. This is good work.

I know you're preparing a new version of this but I wanted to draw your attention to some small details in the code.

I'm looking forward to working with you on this and we'll talk tomorrow about an action plan going forward.

Best regards,

Ionela.

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Peter Pan ?? (peterpandong)
> Sent: 15 May 2015 08:32
> To: dwmw2@infradead.org; Brian Norris; fransklaver@gmail.com; wsa@the-dreams.de; zajec5@gmail.com; boris.brezillon@free-electrons.com; baruch@tkos.co.il; ezequiel.garcia@free-electrons.com; kdasu.kdev@gmail.com; rogerq@ti.com; asierra@xes-inc.com; bpqw
> Cc: Qi Wang 王起 (qiwang); linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Peter Pan 潘栋 (peterpandong)
> Subject: [PATCH 1/1] mtd: nand_bbt: separate struct nand_chip from nand_bbt.c
>
> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> onenand has own bbt(onenand_bbt.c).
>
> Parameterize a few relevant device detail information into a new
> nand_bbt struct, and set some hooks for chip specified part. Allocate
> and initialize struct nand_bbt in nand_base.c.
>
> Most of the patch is borrowed from Brian Norris <computersforpeace@gmail.com>.
> http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/nand-bbt
>
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>   drivers/mtd/nand/docg4.c     |   8 +-
>   drivers/mtd/nand/nand_base.c | 145 +++++++++++-
>   drivers/mtd/nand/nand_bbt.c  | 518 +++++++++++++++++--------------------------
>   include/linux/mtd/bbm.h      |  96 +-------
>   include/linux/mtd/nand.h     |  11 +-
>   include/linux/mtd/nand_bbt.h | 160 +++++++++++++
>   6 files changed, 516 insertions(+), 422 deletions(-)
>   create mode 100644 include/linux/mtd/nand_bbt.h
>
[snip]

> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 2c4fa1a..0dd6d5e 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -62,8 +62,7 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   #include <linux/mtd/mtd.h>
> -#include <linux/mtd/bbm.h>
> -#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_bbt.h>
>   #include <linux/bitops.h>
>   #include <linux/delay.h>
>   #include <linux/vmalloc.h>
> @@ -78,20 +77,20 @@
>   #define BBT_ENTRY_MASK		0x03
>   #define BBT_ENTRY_SHIFT		2
>   
> -static int nand_update_bbt(struct mtd_info *mtd, loff_t offs);
> +static int nand_update_bbt(struct nand_bbt *bbt, loff_t offs);
>   
> -static inline uint8_t bbt_get_entry(struct nand_chip *chip, int block)
> +static inline uint8_t bbt_get_entry(struct nand_bbt *bbt, int block)
>   {
> -	uint8_t entry = chip->bbt[block >> BBT_ENTRY_SHIFT];
> +	uint8_t entry = bbt->bbt[block >> BBT_ENTRY_SHIFT];
>   	entry >>= (block & BBT_ENTRY_MASK) * 2;
>   	return entry & BBT_ENTRY_MASK;
>   }
>   
> -static inline void bbt_mark_entry(struct nand_chip *chip, int block,
> +static inline void bbt_mark_entry(struct nand_bbt *bbt, int block,
>   		uint8_t mark)
>   {
>   	uint8_t msk = (mark & BBT_ENTRY_MASK) << ((block & BBT_ENTRY_MASK) * 2);
> -	chip->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
> +	bbt->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
>   }
>   
>   static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
> @@ -124,23 +123,6 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
>   }
>   
>   /**
> - * check_short_pattern - [GENERIC] check if a pattern is in the buffer
> - * @buf: the buffer to search
> - * @td:	search pattern descriptor
> - *
> - * Check for a pattern at the given place. Used to search bad block tables and
> - * good / bad block identifiers. Same as check_pattern, but no optional empty
> - * check.
> - */
> -static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
> -{
> -	/* Compare the pattern */
> -	if (memcmp(buf + td->offs, td->pattern, td->len))
> -		return -1;
> -	return 0;
> -}
> -
> -/**
>    * add_marker_len - compute the length of the marker in data area
>    * @td: BBT descriptor used for computation
>    *
> @@ -161,7 +143,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
>   
>   /**
>    * read_bbt - [GENERIC] Read the bad block table starting from page
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @page: the starting page
>    * @num: the number of bbt descriptors to read
> @@ -170,11 +152,11 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
>    *
>    * Read the bad block table starting from page.
>    */
> -static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
> +static int read_bbt(struct nand_bbt *bbt, uint8_t *buf, int page, int num,
>   		struct nand_bbt_descr *td, int offs)
>   {
> +	struct mtd_info *mtd = bbt->mtd;
>   	int res, ret = 0, i, j, act = 0;
> -	struct nand_chip *this = mtd->priv;
>   	size_t retlen, len, totlen;
>   	loff_t from;
>   	int bits = td->options & NAND_BBT_NRBITS_MSK;
> @@ -184,10 +166,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>   
>   	totlen = (num * bits) >> 3;
>   	marker_len = add_marker_len(td);
> -	from = ((loff_t)page) << this->page_shift;
> +	from = ((loff_t)page) << bbt->page_shift;
>   
>   	while (totlen) {
> -		len = min(totlen, (size_t)(1 << this->bbt_erase_shift));
> +		len = min(totlen, (size_t)(1 << bbt->bbt_erase_shift));
>   		if (marker_len) {
>   			/*
>   			 * In case the BBT marker is not in the OOB area it
> @@ -223,8 +205,8 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>   				if (reserved_block_code && (tmp == reserved_block_code)) {
>   					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
>   						 (loff_t)(offs + act) <<
> -						 this->bbt_erase_shift);
> -					bbt_mark_entry(this, offs + act,
> +						 bbt->bbt_erase_shift);
> +					bbt_mark_entry(bbt, offs + act,
>   							BBT_BLOCK_RESERVED);
>   					mtd->ecc_stats.bbtblocks++;
>   					continue;
> @@ -235,13 +217,13 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>   				 */
>   				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
>   					 (loff_t)(offs + act) <<
> -					 this->bbt_erase_shift);
> +					 bbt->bbt_erase_shift);
>   				/* Factory marked bad or worn out? */
>   				if (tmp == 0)
> -					bbt_mark_entry(this, offs + act,
> +					bbt_mark_entry(bbt, offs + act,
>   							BBT_BLOCK_FACTORY_BAD);
>   				else
> -					bbt_mark_entry(this, offs + act,
> +					bbt_mark_entry(bbt, offs + act,
>   							BBT_BLOCK_WORN);
>   				mtd->ecc_stats.badblocks++;
>   			}
> @@ -254,7 +236,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>   
>   /**
>    * read_abs_bbt - [GENERIC] Read the bad block table starting at a given page
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @td: descriptor for the bad block table
>    * @chip: read the table for a specific chip, -1 read all chips; applies only if
> @@ -263,25 +245,26 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>    * Read the bad block table for all chips starting at a given page. We assume
>    * that the bbt bits are in consecutive order.
>    */
> -static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td, int chip)
> +static int read_abs_bbt(struct nand_bbt *bbt, uint8_t *buf,
> +			struct nand_bbt_descr *td, int chip)
>   {
> -	struct nand_chip *this = mtd->priv;
> +	struct mtd_info *mtd = bbt->mtd;
>   	int res = 0, i;
>   
>   	if (td->options & NAND_BBT_PERCHIP) {
>   		int offs = 0;
> -		for (i = 0; i < this->numchips; i++) {
> +		for (i = 0; i < bbt->numchips; i++) {
>   			if (chip == -1 || chip == i)
> -				res = read_bbt(mtd, buf, td->pages[i],
> -					this->chipsize >> this->bbt_erase_shift,
> +				res = read_bbt(bbt, buf, td->pages[i],
> +					bbt->chipsize >> bbt->bbt_erase_shift,
>   					td, offs);
>   			if (res)
>   				return res;
> -			offs += this->chipsize >> this->bbt_erase_shift;
> +			offs += bbt->chipsize >> bbt->bbt_erase_shift;
>   		}
>   	} else {
> -		res = read_bbt(mtd, buf, td->pages[0],
> -				mtd->size >> this->bbt_erase_shift, td, 0);
> +		res = read_bbt(bbt, buf, td->pages[0],
> +				mtd->size >> bbt->bbt_erase_shift, td, 0);
>   		if (res)
>   			return res;
>   	}
> @@ -289,7 +272,7 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   }
>   
>   /* BBT marker is in the first page, no OOB */
> -static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
> +static int scan_read_data(struct nand_bbt *bbt, uint8_t *buf, loff_t offs,
>   			 struct nand_bbt_descr *td)
>   {
>   	size_t retlen;
> @@ -299,12 +282,12 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>   	if (td->options & NAND_BBT_VERSION)
>   		len++;
>   
> -	return mtd_read(mtd, offs, len, &retlen, buf);
> +	return mtd_read(bbt->mtd, offs, len, &retlen, buf);
>   }
>   
>   /**
>    * scan_read_oob - [GENERIC] Scan data+OOB region to buffer
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @offs: offset at which to scan
>    * @len: length of data region to read
> @@ -313,9 +296,10 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>    * page,OOB,page,OOB,... in buf. Completes transfer and returns the "strongest"
>    * ECC condition (error or bitflip). May quit on the first (non-ECC) error.
>    */
> -static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
> +static int scan_read_oob(struct nand_bbt *bbt, uint8_t *buf, loff_t offs,
>   			 size_t len)
>   {
> +	struct mtd_info *mtd = bbt->mtd;
>   	struct mtd_oob_ops ops;
>   	int res, ret = 0;
>   
> @@ -343,13 +327,13 @@ static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>   	return ret;
>   }
>   
> -static int scan_read(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
> +static int scan_read(struct nand_bbt *bbt, uint8_t *buf, loff_t offs,
>   			 size_t len, struct nand_bbt_descr *td)
>   {
>   	if (td->options & NAND_BBT_NO_OOB)
> -		return scan_read_data(mtd, buf, offs, td);
> +		return scan_read_data(bbt, buf, offs, td);
>   	else
> -		return scan_read_oob(mtd, buf, offs, len);
> +		return scan_read_oob(bbt, buf, offs, len);
>   }
>   
>   /* Scan write data with oob to flash */
> @@ -368,8 +352,9 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,

Wouldn't it be best if all the functions here would use nand_bbt as arg. and obtain mtd_info
from there? Just for consistency.
Is there any reason you kept this function with mtd_info as argument?

>   	return mtd_write_oob(mtd, offs, &ops);
>   }
>   
> -static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
> +static u32 bbt_get_ver_offs(struct nand_bbt *bbt, struct nand_bbt_descr *td)
>   {
> +	struct mtd_info *mtd = bbt->mtd;

I think bbt->mtd can be used directly in the code below in this function without having an
extra local variable for it.

>   	u32 ver_offs = td->veroffs;
>   
>   	if (!(td->options & NAND_BBT_NO_OOB))
> @@ -379,7 +364,7 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
>   
>   /**
>    * read_abs_bbts - [GENERIC] Read the bad block table(s) for all chips starting at a given page
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @td: descriptor for the bad block table
>    * @md:	descriptor for the bad block table mirror
> @@ -387,130 +372,85 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
>    * Read the bad block table(s) for all chips starting at a given page. We
>    * assume that the bbt bits are in consecutive order.
>    */
> -static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
> +static void read_abs_bbts(struct nand_bbt *bbt, uint8_t *buf,
>   			  struct nand_bbt_descr *td, struct nand_bbt_descr *md)
>   {
> -	struct nand_chip *this = mtd->priv;
> +	struct mtd_info *mtd = bbt->mtd;
>   
>   	/* Read the primary version, if available */
>   	if (td->options & NAND_BBT_VERSION) {
> -		scan_read(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
> +		scan_read(bbt, buf, (loff_t)td->pages[0] << bbt->page_shift,
>   			      mtd->writesize, td);
> -		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
> +		td->version[0] = buf[bbt_get_ver_offs(bbt, td)];
>   		pr_info("Bad block table at page %d, version 0x%02X\n",
>   			 td->pages[0], td->version[0]);
>   	}
>   
>   	/* Read the mirror version, if available */
>   	if (md && (md->options & NAND_BBT_VERSION)) {
> -		scan_read(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
> +		scan_read(bbt, buf, (loff_t)md->pages[0] << bbt->page_shift,
>   			      mtd->writesize, md);
> -		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
> +		md->version[0] = buf[bbt_get_ver_offs(bbt, md)];
>   		pr_info("Bad block table at page %d, version 0x%02X\n",
>   			 md->pages[0], md->version[0]);
>   	}
>   }
>   
> -/* Scan a given block partially */
> -static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
> -			   loff_t offs, uint8_t *buf, int numpages)
> -{
> -	struct mtd_oob_ops ops;
> -	int j, ret;
> -
> -	ops.ooblen = mtd->oobsize;
> -	ops.oobbuf = buf;
> -	ops.ooboffs = 0;
> -	ops.datbuf = NULL;
> -	ops.mode = MTD_OPS_PLACE_OOB;
> -
> -	for (j = 0; j < numpages; j++) {
> -		/*
> -		 * Read the full oob until read_oob is fixed to handle single
> -		 * byte reads for 16 bit buswidth.
> -		 */
> -		ret = mtd_read_oob(mtd, offs, &ops);
> -		/* Ignore ECC errors when checking for BBM */
> -		if (ret && !mtd_is_bitflip_or_eccerr(ret))
> -			return ret;
> -
> -		if (check_short_pattern(buf, bd))
> -			return 1;
> -
> -		offs += mtd->writesize;
> -	}
> -	return 0;
> -}
> -
>   /**
>    * create_bbt - [GENERIC] Create a bad block table by scanning the device
> - * @mtd: MTD device structure
> - * @buf: temporary buffer
> - * @bd: descriptor for the good/bad block search pattern
> + * @bbt: NAND BBT structure
>    * @chip: create the table for a specific chip, -1 read all chips; applies only
>    *        if NAND_BBT_PERCHIP option is set
>    *
>    * Create a bad block table by scanning the device for the given good/bad block
>    * identify pattern.
>    */
> -static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
> -	struct nand_bbt_descr *bd, int chip)
> +static int create_bbt(struct nand_bbt *bbt, int chip)
>   {
> -	struct nand_chip *this = mtd->priv;
> -	int i, numblocks, numpages;
> -	int startblock;
> +	struct mtd_info *mtd = bbt->mtd;
> +	int i, startblock, numblocks;
>   	loff_t from;
>   
>   	pr_info("Scanning device for bad blocks\n");
>   
> -	if (bd->options & NAND_BBT_SCAN2NDPAGE)
> -		numpages = 2;
> -	else
> -		numpages = 1;
> -
>   	if (chip == -1) {
> -		numblocks = mtd->size >> this->bbt_erase_shift;
> +		numblocks = mtd->size >> bbt->bbt_erase_shift;
>   		startblock = 0;
>   		from = 0;
>   	} else {
> -		if (chip >= this->numchips) {
> +		if (chip >= bbt->numchips) {
>   			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
> -			       chip + 1, this->numchips);
> +			       chip + 1, bbt->numchips);
>   			return -EINVAL;
>   		}
> -		numblocks = this->chipsize >> this->bbt_erase_shift;
> +		numblocks = bbt->chipsize >> bbt->bbt_erase_shift;
>   		startblock = chip * numblocks;
>   		numblocks += startblock;
> -		from = (loff_t)startblock << this->bbt_erase_shift;
> +		from = (loff_t)startblock << bbt->bbt_erase_shift;
>   	}
>   
> -	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
> -		from += mtd->erasesize - (mtd->writesize * numpages);
> -
>   	for (i = startblock; i < numblocks; i++) {
>   		int ret;
>   
> -		BUG_ON(bd->options & NAND_BBT_NO_OOB);
> -
> -		ret = scan_block_fast(mtd, bd, from, buf, numpages);
> +		ret = bbt->is_bad_bbm(mtd, from);
>   		if (ret < 0)
>   			return ret;
>   
>   		if (ret) {
> -			bbt_mark_entry(this, i, BBT_BLOCK_FACTORY_BAD);
> +			bbt_mark_entry(bbt, i, BBT_BLOCK_FACTORY_BAD);
>   			pr_warn("Bad eraseblock %d at 0x%012llx\n",
>   				i, (unsigned long long)from);
>   			mtd->ecc_stats.badblocks++;
>   		}
>   
> -		from += (1 << this->bbt_erase_shift);
> +		from += (1 << bbt->bbt_erase_shift);
>   	}
>   	return 0;
>   }
>   
>   /**
>    * search_bbt - [GENERIC] scan the device for a specific bad block table
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @td: descriptor for the bad block table
>    *
> @@ -523,18 +463,19 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
>    *
>    * The bbt ident pattern resides in the oob area of the first page in a block.
>    */
> -static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
> +static int search_bbt(struct nand_bbt *bbt, uint8_t *buf,
> +			struct nand_bbt_descr *td)
>   {
> -	struct nand_chip *this = mtd->priv;
> +	struct mtd_info *mtd = bbt->mtd;
>   	int i, chips;
>   	int startblock, block, dir;
>   	int scanlen = mtd->writesize + mtd->oobsize;
>   	int bbtblocks;
> -	int blocktopage = this->bbt_erase_shift - this->page_shift;
> +	int blocktopage = bbt->bbt_erase_shift - bbt->page_shift;
>   
>   	/* Search direction top -> down? */
>   	if (td->options & NAND_BBT_LASTBLOCK) {
> -		startblock = (mtd->size >> this->bbt_erase_shift) - 1;
> +		startblock = (mtd->size >> bbt->bbt_erase_shift) - 1;
>   		dir = -1;
>   	} else {
>   		startblock = 0;
> @@ -543,12 +484,12 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
>   
>   	/* Do we have a bbt per chip? */
>   	if (td->options & NAND_BBT_PERCHIP) {
> -		chips = this->numchips;
> -		bbtblocks = this->chipsize >> this->bbt_erase_shift;
> +		chips = bbt->numchips;
> +		bbtblocks = bbt->chipsize >> bbt->bbt_erase_shift;
>   		startblock &= bbtblocks - 1;
>   	} else {
>   		chips = 1;
> -		bbtblocks = mtd->size >> this->bbt_erase_shift;
> +		bbtblocks = mtd->size >> bbt->bbt_erase_shift;
>   	}
>   
>   	for (i = 0; i < chips; i++) {
> @@ -559,20 +500,20 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
>   		for (block = 0; block < td->maxblocks; block++) {
>   
>   			int actblock = startblock + dir * block;
> -			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
> +			loff_t offs = (loff_t)actblock << bbt->bbt_erase_shift;
>   
>   			/* Read first page */
> -			scan_read(mtd, buf, offs, mtd->writesize, td);
> +			scan_read(bbt, buf, offs, mtd->writesize, td);
>   			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
>   				td->pages[i] = actblock << blocktopage;
>   				if (td->options & NAND_BBT_VERSION) {
> -					offs = bbt_get_ver_offs(mtd, td);
> +					offs = bbt_get_ver_offs(bbt, td);
>   					td->version[i] = buf[offs];
>   				}
>   				break;
>   			}
>   		}
> -		startblock += this->chipsize >> this->bbt_erase_shift;
> +		startblock += bbt->chipsize >> bbt->bbt_erase_shift;
>   	}
>   	/* Check, if we found a bbt for each requested chip */
>   	for (i = 0; i < chips; i++) {
> @@ -587,28 +528,28 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
>   
>   /**
>    * search_read_bbts - [GENERIC] scan the device for bad block table(s)
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @td: descriptor for the bad block table
>    * @md: descriptor for the bad block table mirror
>    *
>    * Search and read the bad block table(s).
>    */
> -static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
> +static void search_read_bbts(struct nand_bbt *bbt, uint8_t *buf,
>   			     struct nand_bbt_descr *td,
>   			     struct nand_bbt_descr *md)
>   {
>   	/* Search the primary table */
> -	search_bbt(mtd, buf, td);
> +	search_bbt(bbt, buf, td);
>   
>   	/* Search the mirror table */
>   	if (md)
> -		search_bbt(mtd, buf, md);
> +		search_bbt(bbt, buf, md);
>   }
>   
>   /**
>    * write_bbt - [GENERIC] (Re)write the bad block table
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @td: descriptor for the bad block table
>    * @md: descriptor for the bad block table mirror
> @@ -616,12 +557,11 @@ static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
>    *
>    * (Re)write the bad block table.
>    */
> -static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
> +static int write_bbt(struct nand_bbt *bbt, uint8_t *buf,
>   		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
>   		     int chipsel)
>   {
> -	struct nand_chip *this = mtd->priv;
> -	struct erase_info einfo;
> +	struct mtd_info *mtd = bbt->mtd;
>   	int i, res, chip = 0;
>   	int bits, startblock, dir, page, offs, numblocks, sft, sftmsk;
>   	int nrchips, pageoffs, ooboffs;
> @@ -640,16 +580,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   		rcode = 0xff;
>   	/* Write bad block table per chip rather than per device? */
>   	if (td->options & NAND_BBT_PERCHIP) {
> -		numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
> +		numblocks = (int)(bbt->chipsize >> bbt->bbt_erase_shift);
>   		/* Full device write or specific chip? */
>   		if (chipsel == -1) {
> -			nrchips = this->numchips;
> +			nrchips = bbt->numchips;
>   		} else {
>   			nrchips = chipsel + 1;
>   			chip = chipsel;
>   		}
>   	} else {
> -		numblocks = (int)(mtd->size >> this->bbt_erase_shift);
> +		numblocks = (int)(mtd->size >> bbt->bbt_erase_shift);
>   		nrchips = 1;
>   	}
>   
> @@ -680,13 +620,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   		for (i = 0; i < td->maxblocks; i++) {
>   			int block = startblock + dir * i;
>   			/* Check, if the block is bad */
> -			switch (bbt_get_entry(this, block)) {
> +			switch (bbt_get_entry(bbt, block)) {
>   			case BBT_BLOCK_WORN:
>   			case BBT_BLOCK_FACTORY_BAD:
>   				continue;
>   			}
>   			page = block <<
> -				(this->bbt_erase_shift - this->page_shift);
> +				(bbt->bbt_erase_shift - bbt->page_shift);
>   			/* Check, if the block is used by the mirror table */
>   			if (!md || md->pages[chip] != page)
>   				goto write;
> @@ -714,13 +654,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   		default: return -EINVAL;
>   		}
>   
> -		to = ((loff_t)page) << this->page_shift;
> +		to = ((loff_t)page) << bbt->page_shift;
>   
>   		/* Must we save the block contents? */
>   		if (td->options & NAND_BBT_SAVECONTENT) {
>   			/* Make it block aligned */
> -			to &= ~(((loff_t)1 << this->bbt_erase_shift) - 1);
> -			len = 1 << this->bbt_erase_shift;
> +			to &= ~((loff_t)((1 << bbt->bbt_erase_shift) - 1));
> +			len = 1 << bbt->bbt_erase_shift;
>   			res = mtd_read(mtd, to, len, &retlen, buf);
>   			if (res < 0) {
>   				if (retlen != len) {
> @@ -730,15 +670,15 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   				pr_warn("nand_bbt: ECC error while reading block for writing bad block table\n");
>   			}
>   			/* Read oob data */
> -			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
> +			ops.ooblen = (len >> bbt->page_shift) * mtd->oobsize;
>   			ops.oobbuf = &buf[len];
>   			res = mtd_read_oob(mtd, to + mtd->writesize, &ops);
>   			if (res < 0 || ops.oobretlen != ops.ooblen)
>   				goto outerr;
>   
>   			/* Calc the byte offset in the buffer */
> -			pageoffs = page - (int)(to >> this->page_shift);
> -			offs = pageoffs << this->page_shift;
> +			pageoffs = page - (int)(to >> bbt->page_shift);
> +			offs = pageoffs << bbt->page_shift;
>   			/* Preset the bbt area with 0xff */
>   			memset(&buf[offs], 0xff, (size_t)(numblocks >> sft));
>   			ooboffs = len + (pageoffs * mtd->oobsize);
> @@ -765,7 +705,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   			len = ALIGN(len, mtd->writesize);
>   			/* Preset the buffer with 0xff */
>   			memset(buf, 0xff, len +
> -			       (len >> this->page_shift)* mtd->oobsize);
> +			       (len >> bbt->page_shift) * mtd->oobsize);
>   			offs = 0;
>   			ooboffs = len;
>   			/* Pattern is located in oob area of first page */
> @@ -779,16 +719,12 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   		for (i = 0; i < numblocks; i++) {
>   			uint8_t dat;
>   			int sftcnt = (i << (3 - sft)) & sftmsk;
> -			dat = bbt_get_entry(this, chip * numblocks + i);
> +			dat = bbt_get_entry(bbt, chip * numblocks + i);
>   			/* Do not store the reserved bbt blocks! */
>   			buf[offs + (i >> sft)] &= ~(msk[dat] << sftcnt);
>   		}
>   
> -		memset(&einfo, 0, sizeof(einfo));
> -		einfo.mtd = mtd;
> -		einfo.addr = to;
> -		einfo.len = 1 << this->bbt_erase_shift;
> -		res = nand_erase_nand(mtd, &einfo, 1);
> +		res = bbt->erase(mtd, to);
>   		if (res < 0)
>   			goto outerr;
>   
> @@ -813,41 +749,36 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   
>   /**
>    * nand_memory_bbt - [GENERIC] create a memory based bad block table
> - * @mtd: MTD device structure
> - * @bd: descriptor for the good/bad block search pattern
> + * @bbt: NAND BBT structure
>    *
>    * The function creates a memory based bbt by scanning the device for
>    * manufacturer / software marked good / bad blocks.
>    */
> -static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
> +static inline int nand_memory_bbt(struct nand_bbt *bbt)
>   {
> -	struct nand_chip *this = mtd->priv;
> -
> -	return create_bbt(mtd, this->buffers->databuf, bd, -1);
> +	return create_bbt(bbt, -1);
>   }
>   
>   /**
>    * check_create - [GENERIC] create and write bbt(s) if necessary
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
> - * @bd: descriptor for the good/bad block search pattern
>    *
>    * The function checks the results of the previous call to read_bbt and creates
>    * / updates the bbt(s) if necessary. Creation is necessary if no bbt was found
>    * for the chip/device. Update is necessary if one of the tables is missing or
>    * the version nr. of one table is less than the other.
>    */
> -static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
> +static int check_create(struct nand_bbt *bbt, uint8_t *buf)
>   {
>   	int i, chips, writeops, create, chipsel, res, res2;
> -	struct nand_chip *this = mtd->priv;
> -	struct nand_bbt_descr *td = this->bbt_td;
> -	struct nand_bbt_descr *md = this->bbt_md;
> +	struct nand_bbt_descr *td = bbt->bbt_td;
> +	struct nand_bbt_descr *md = bbt->bbt_md;
>   	struct nand_bbt_descr *rd, *rd2;
>   
>   	/* Do we have a bbt per chip? */
>   	if (td->options & NAND_BBT_PERCHIP)
> -		chips = this->numchips;
> +		chips = bbt->numchips;
>   	else
>   		chips = 1;
>   
> @@ -896,8 +827,8 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   				continue;
>   
>   			/* Create the table in memory by scanning the chip(s) */
> -			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
> -				create_bbt(mtd, buf, bd, chipsel);
> +			if (!(bbt->bbt_options & NAND_BBT_CREATE_EMPTY))
> +				create_bbt(bbt, chipsel);
>   
>   			td->version[i] = 1;
>   			if (md)
> @@ -906,7 +837,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   
>   		/* Read back first? */
>   		if (rd) {
> -			res = read_abs_bbt(mtd, buf, rd, chipsel);
> +			res = read_abs_bbt(bbt, buf, rd, chipsel);
>   			if (mtd_is_eccerr(res)) {
>   				/* Mark table as invalid */
>   				rd->pages[i] = -1;
> @@ -917,7 +848,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   		}
>   		/* If they weren't versioned, read both */
>   		if (rd2) {
> -			res2 = read_abs_bbt(mtd, buf, rd2, chipsel);
> +			res2 = read_abs_bbt(bbt, buf, rd2, chipsel);
>   			if (mtd_is_eccerr(res2)) {
>   				/* Mark table as invalid */
>   				rd2->pages[i] = -1;
> @@ -939,14 +870,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   
>   		/* Write the bad block table to the device? */
>   		if ((writeops & 0x01) && (td->options & NAND_BBT_WRITE)) {
> -			res = write_bbt(mtd, buf, td, md, chipsel);
> +			res = write_bbt(bbt, buf, td, md, chipsel);
>   			if (res < 0)
>   				return res;
>   		}
>   
>   		/* Write the mirror bad block table to the device? */
>   		if ((writeops & 0x02) && md && (md->options & NAND_BBT_WRITE)) {
> -			res = write_bbt(mtd, buf, md, td, chipsel);
> +			res = write_bbt(bbt, buf, md, td, chipsel);
>   			if (res < 0)
>   				return res;
>   		}
> @@ -956,25 +887,25 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   
>   /**
>    * mark_bbt_regions - [GENERIC] mark the bad block table regions
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @td: bad block table descriptor
>    *
>    * The bad block table regions are marked as "bad" to prevent accidental
>    * erasures / writes. The regions are identified by the mark 0x02.
>    */
> -static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
> +static void mark_bbt_region(struct nand_bbt *bbt, struct nand_bbt_descr *td)
>   {
> -	struct nand_chip *this = mtd->priv;
> +	struct mtd_info *mtd = bbt->mtd;
>   	int i, j, chips, block, nrblocks, update;
>   	uint8_t oldval;
>   
>   	/* Do we have a bbt per chip? */
>   	if (td->options & NAND_BBT_PERCHIP) {
> -		chips = this->numchips;
> -		nrblocks = (int)(this->chipsize >> this->bbt_erase_shift);
> +		chips = bbt->numchips;
> +		nrblocks = (int)(bbt->chipsize >> bbt->bbt_erase_shift);
>   	} else {
>   		chips = 1;
> -		nrblocks = (int)(mtd->size >> this->bbt_erase_shift);
> +		nrblocks = (int)(mtd->size >> bbt->bbt_erase_shift);
>   	}
>   
>   	for (i = 0; i < chips; i++) {
> @@ -982,13 +913,14 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
>   		    !(td->options & NAND_BBT_WRITE)) {
>   			if (td->pages[i] == -1)
>   				continue;
> -			block = td->pages[i] >> (this->bbt_erase_shift - this->page_shift);
> -			oldval = bbt_get_entry(this, block);
> -			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
> +			block = td->pages[i] >>
> +				(bbt->bbt_erase_shift - bbt->page_shift);
> +			oldval = bbt_get_entry(bbt, block);
> +			bbt_mark_entry(bbt, block, BBT_BLOCK_RESERVED);
>   			if ((oldval != BBT_BLOCK_RESERVED) &&
>   					td->reserved_block_code)
> -				nand_update_bbt(mtd, (loff_t)block <<
> -						this->bbt_erase_shift);
> +				nand_update_bbt(bbt, (loff_t)block <<
> +						bbt->bbt_erase_shift);
>   			continue;
>   		}
>   		update = 0;
> @@ -997,8 +929,8 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
>   		else
>   			block = i * nrblocks;
>   		for (j = 0; j < td->maxblocks; j++) {
> -			oldval = bbt_get_entry(this, block);
> -			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
> +			oldval = bbt_get_entry(bbt, block);
> +			bbt_mark_entry(bbt, block, BBT_BLOCK_RESERVED);
>   			if (oldval != BBT_BLOCK_RESERVED)
>   				update = 1;
>   			block++;
> @@ -1009,22 +941,22 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
>   		 * bbts.  This should only happen once.
>   		 */
>   		if (update && td->reserved_block_code)
> -			nand_update_bbt(mtd, (loff_t)(block - 1) <<
> -					this->bbt_erase_shift);
> +			nand_update_bbt(bbt, (loff_t)(block - 1) <<
> +					bbt->bbt_erase_shift);
>   	}
>   }
>   
>   /**
>    * verify_bbt_descr - verify the bad block description
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @bd: the table to verify
>    *
>    * This functions performs a few sanity checks on the bad block description
>    * table.
>    */
> -static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
> +static void verify_bbt_descr(struct nand_bbt *bbt, struct nand_bbt_descr *bd)
>   {
> -	struct nand_chip *this = mtd->priv;
> +	struct mtd_info *mtd = bbt->mtd;
>   	u32 pattern_len;
>   	u32 bits;
>   	u32 table_size;
> @@ -1035,16 +967,16 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>   	pattern_len = bd->len;
>   	bits = bd->options & NAND_BBT_NRBITS_MSK;
>   
> -	BUG_ON((this->bbt_options & NAND_BBT_NO_OOB) &&
> -			!(this->bbt_options & NAND_BBT_USE_FLASH));
> +	BUG_ON((bbt->bbt_options & NAND_BBT_NO_OOB) &&
> +			!(bbt->bbt_options & NAND_BBT_USE_FLASH));
>   	BUG_ON(!bits);
>   
>   	if (bd->options & NAND_BBT_VERSION)
>   		pattern_len++;
>   
>   	if (bd->options & NAND_BBT_NO_OOB) {
> -		BUG_ON(!(this->bbt_options & NAND_BBT_USE_FLASH));
> -		BUG_ON(!(this->bbt_options & NAND_BBT_NO_OOB));
> +		BUG_ON(!(bbt->bbt_options & NAND_BBT_USE_FLASH));
> +		BUG_ON(!(bbt->bbt_options & NAND_BBT_NO_OOB));
>   		BUG_ON(bd->offs);
>   		if (bd->options & NAND_BBT_VERSION)
>   			BUG_ON(bd->veroffs != bd->len);
> @@ -1052,20 +984,19 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>   	}
>   
>   	if (bd->options & NAND_BBT_PERCHIP)
> -		table_size = this->chipsize >> this->bbt_erase_shift;
> +		table_size = bbt->chipsize >> bbt->bbt_erase_shift;
>   	else
> -		table_size = mtd->size >> this->bbt_erase_shift;
> +		table_size = mtd->size >> bbt->bbt_erase_shift;
>   	table_size >>= 3;
>   	table_size *= bits;
>   	if (bd->options & NAND_BBT_NO_OOB)
>   		table_size += pattern_len;
> -	BUG_ON(table_size > (1 << this->bbt_erase_shift));
> +	BUG_ON(table_size > (1 << bbt->bbt_erase_shift));
>   }
>   
>   /**
>    * nand_scan_bbt - [NAND Interface] scan, find, read and maybe create bad block table(s)

Looking through the sources I've seen that the driver for disckonchip bypasses the call

for nand_bbt_init by not registering as scan_bbt function the default one but its own

inftl_scan_bbt. That would initialize the descriptors but it would call nand_scan_bbt

with the old arguments (mtd_info and descriptor).

This raises another issue: the only location where the nand_bbt structure is allocated and

initialized is in nand_default_bbt. But if another scan_bbt function is registered and the

default is not used, the structure will remain uninitialized.

Also, there is still a nand_scan_bbt declared as external in include/linux/mtd/nand.h

having the old header, that should be removed.

> - * @mtd: MTD device structure
> - * @bd: descriptor for the good/bad block search pattern
> + * @bbt: NAND BBT structure
>    *
>    * The function checks, if a bad block table(s) is/are already available. If
>    * not it scans the device for manufacturer marked good / bad blocks and writes
> @@ -1074,21 +1005,21 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>    * The bad block table memory is allocated here. It must be freed by calling
>    * the nand_free_bbt function.
>    */
> -static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
> +static int nand_scan_bbt(struct nand_bbt *bbt)
>   {
> -	struct nand_chip *this = mtd->priv;
> +	struct mtd_info *mtd = bbt->mtd;
>   	int len, res;
>   	uint8_t *buf;
> -	struct nand_bbt_descr *td = this->bbt_td;
> -	struct nand_bbt_descr *md = this->bbt_md;
> +	struct nand_bbt_descr *td = bbt->bbt_td;
> +	struct nand_bbt_descr *md = bbt->bbt_md;
>   
> -	len = mtd->size >> (this->bbt_erase_shift + 2);
> +	len = mtd->size >> (bbt->bbt_erase_shift + 2);
>   	/*
>   	 * Allocate memory (2bit per block) and clear the memory bad block
>   	 * table.
>   	 */
> -	this->bbt = kzalloc(len, GFP_KERNEL);
> -	if (!this->bbt)
> +	bbt->bbt = kzalloc(len, GFP_KERNEL);
> +	if (!bbt->bbt)
>   		return -ENOMEM;
>   
>   	/*
> @@ -1096,18 +1027,19 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>   	 * memory based bad block table.
>   	 */
>   	if (!td) {
> -		if ((res = nand_memory_bbt(mtd, bd))) {
> +		res = nand_memory_bbt(bbt);
> +		if (res) {
>   			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
>   			goto err;
>   		}
>   		return 0;
>   	}
> -	verify_bbt_descr(mtd, td);
> -	verify_bbt_descr(mtd, md);
> +	verify_bbt_descr(bbt, td);
> +	verify_bbt_descr(bbt, md);
>   
>   	/* Allocate a temporary buffer for one eraseblock incl. oob */
> -	len = (1 << this->bbt_erase_shift);
> -	len += (len >> this->page_shift) * mtd->oobsize;
> +	len = (1 << bbt->bbt_erase_shift);
> +	len += (len >> bbt->page_shift) * mtd->oobsize;
>   	buf = vmalloc(len);
>   	if (!buf) {
>   		res = -ENOMEM;
> @@ -1116,59 +1048,59 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>   
>   	/* Is the bbt at a given page? */
>   	if (td->options & NAND_BBT_ABSPAGE) {
> -		read_abs_bbts(mtd, buf, td, md);
> +		read_abs_bbts(bbt, buf, td, md);
>   	} else {
>   		/* Search the bad block table using a pattern in oob */
> -		search_read_bbts(mtd, buf, td, md);
> +		search_read_bbts(bbt, buf, td, md);
>   	}
>   
> -	res = check_create(mtd, buf, bd);
> +	res = check_create(bbt, buf);
>   	if (res)
>   		goto err;
>   
>   	/* Prevent the bbt regions from erasing / writing */
> -	mark_bbt_region(mtd, td);
> +	mark_bbt_region(bbt, td);
>   	if (md)
> -		mark_bbt_region(mtd, md);
> +		mark_bbt_region(bbt, md);
>   
>   	vfree(buf);
>   	return 0;
>   
>   err:
> -	kfree(this->bbt);
> -	this->bbt = NULL;
> +	kfree(bbt->bbt);
> +	bbt->bbt = NULL;
>   	return res;
>   }
>   
>   /**
>    * nand_update_bbt - update bad block table(s)
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @offs: the offset of the newly marked block
>    *
>    * The function updates the bad block table(s).
>    */
> -static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
> +static int nand_update_bbt(struct nand_bbt *bbt, loff_t offs)
>   {
> -	struct nand_chip *this = mtd->priv;
> +	struct mtd_info *mtd = bbt->mtd;
>   	int len, res = 0;
>   	int chip, chipsel;
>   	uint8_t *buf;
> -	struct nand_bbt_descr *td = this->bbt_td;
> -	struct nand_bbt_descr *md = this->bbt_md;
> +	struct nand_bbt_descr *td = bbt->bbt_td;
> +	struct nand_bbt_descr *md = bbt->bbt_md;
>   
> -	if (!this->bbt || !td)
> +	if (!bbt->bbt || !td)
>   		return -EINVAL;
>   
>   	/* Allocate a temporary buffer for one eraseblock incl. oob */
> -	len = (1 << this->bbt_erase_shift);
> -	len += (len >> this->page_shift) * mtd->oobsize;
> +	len = (1 << bbt->bbt_erase_shift);
> +	len += (len >> bbt->page_shift) * mtd->oobsize;
>   	buf = kmalloc(len, GFP_KERNEL);
>   	if (!buf)
>   		return -ENOMEM;
>   
>   	/* Do we have a bbt per chip? */
>   	if (td->options & NAND_BBT_PERCHIP) {
> -		chip = (int)(offs >> this->chip_shift);
> +		chip = (int)(offs >> bbt->chip_shift);
>   		chipsel = chip;
>   	} else {
>   		chip = 0;
> @@ -1181,13 +1113,13 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
>   
>   	/* Write the bad block table to the device? */
>   	if (td->options & NAND_BBT_WRITE) {
> -		res = write_bbt(mtd, buf, td, md, chipsel);
> +		res = write_bbt(bbt, buf, td, md, chipsel);
>   		if (res < 0)
>   			goto out;
>   	}
>   	/* Write the mirror bad block table to the device? */
>   	if (md && (md->options & NAND_BBT_WRITE)) {
> -		res = write_bbt(mtd, buf, md, td, chipsel);
> +		res = write_bbt(bbt, buf, md, td, chipsel);
>   	}
>   
>    out:
> @@ -1195,12 +1127,6 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
>   	return res;
>   }
>   
> -/*
> - * Define some generic bad / good block scan pattern which are used
> - * while scanning a device for factory marked good / bad blocks.
> - */
> -static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
> -
>   /* Generic flash bbt descriptors */
>   static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
>   static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
> @@ -1245,135 +1171,103 @@ static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
>   	.pattern = mirror_pattern
>   };
>   
> -#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
>   /**
> - * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
> - * @this: NAND chip to create descriptor for
> + * nand_bbt_init - [NAND Interface] Initialize and locate/create a bad block
> + * table
>    *
> - * This function allocates and initializes a nand_bbt_descr for BBM detection
> - * based on the properties of @this. The new descriptor is stored in
> - * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
> - * passed to this function.
> - */
> -static int nand_create_badblock_pattern(struct nand_chip *this)
> -{
> -	struct nand_bbt_descr *bd;
> -	if (this->badblock_pattern) {
> -		pr_warn("Bad block pattern already allocated; not replacing\n");
> -		return -EINVAL;
> -	}
> -	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
> -	if (!bd)
> -		return -ENOMEM;
> -	bd->options = this->bbt_options & BADBLOCK_SCAN_MASK;
> -	bd->offs = this->badblockpos;
> -	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
> -	bd->pattern = scan_ff_pattern;
> -	bd->options |= NAND_BBT_DYNAMICSTRUCT;
> -	this->badblock_pattern = bd;
> -	return 0;
> -}
> -
> -/**
> - * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    *
>    * This function selects the default bad block table support for the device and
> - * calls the nand_scan_bbt function.
> + * scans for an existing table, or else creates one.
>    */
> -int nand_default_bbt(struct mtd_info *mtd)
> +int nand_bbt_init(struct nand_bbt *bbt)
>   {
> -	struct nand_chip *this = mtd->priv;
> -	int ret;
> -
>   	/* Is a flash based bad block table requested? */
> -	if (this->bbt_options & NAND_BBT_USE_FLASH) {
> +	if (bbt->bbt_options & NAND_BBT_USE_FLASH) {
>   		/* Use the default pattern descriptors */
> -		if (!this->bbt_td) {
> -			if (this->bbt_options & NAND_BBT_NO_OOB) {
> -				this->bbt_td = &bbt_main_no_oob_descr;
> -				this->bbt_md = &bbt_mirror_no_oob_descr;
> +		if (!bbt->bbt_td) {
> +			if (bbt->bbt_options & NAND_BBT_NO_OOB) {
> +				bbt->bbt_td = &bbt_main_no_oob_descr;
> +				bbt->bbt_md = &bbt_mirror_no_oob_descr;
>   			} else {
> -				this->bbt_td = &bbt_main_descr;
> -				this->bbt_md = &bbt_mirror_descr;
> +				bbt->bbt_td = &bbt_main_descr;
> +				bbt->bbt_md = &bbt_mirror_descr;
>   			}
>   		}
>   	} else {
> -		this->bbt_td = NULL;
> -		this->bbt_md = NULL;
> +		bbt->bbt_td = NULL;
> +		bbt->bbt_md = NULL;
>   	}
>   
> -	if (!this->badblock_pattern) {
> -		ret = nand_create_badblock_pattern(this);
> -		if (ret)
> -			return ret;
> -	}
> +	return nand_scan_bbt(bbt);
> +}
> +EXPORT_SYMBOL(nand_bbt_init);
>   
> -	return nand_scan_bbt(mtd, this->badblock_pattern);
> +void nand_bbt_release(struct nand_bbt *bbt)
> +{
> +	kfree(bbt->bbt);
>   }
> +EXPORT_SYMBOL(nand_bbt_release);
>   
>   /**
> - * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
> - * @mtd: MTD device structure
> + * nand_bbt_isreserved - [NAND Interface] Check if a block is reserved
> + * @bbt: NAND BBT structure
>    * @offs: offset in the device
>    */
> -int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
> +int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs)
>   {
> -	struct nand_chip *this = mtd->priv;
>   	int block;
>   
> -	block = (int)(offs >> this->bbt_erase_shift);
> -	return bbt_get_entry(this, block) == BBT_BLOCK_RESERVED;
> +	block = (int)(offs >> bbt->bbt_erase_shift);
> +	return bbt_get_entry(bbt, block) == BBT_BLOCK_RESERVED;
>   }
> +EXPORT_SYMBOL(nand_bbt_isreserved);
>   
>   /**
> - * nand_isbad_bbt - [NAND Interface] Check if a block is bad
> - * @mtd: MTD device structure
> + * nand_bbt_isbad - [NAND Interface] Check if a block is bad
> + * @bbt: NAND BBT structure
>    * @offs: offset in the device
> - * @allowbbt: allow access to bad block table region
>    */
> -int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
> +int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs)
>   {
> -	struct nand_chip *this = mtd->priv;
>   	int block, res;
>   
> -	block = (int)(offs >> this->bbt_erase_shift);
> -	res = bbt_get_entry(this, block);
> +	block = (int)(offs >> bbt->bbt_erase_shift);
> +	res = bbt_get_entry(bbt, block);
>   
> -	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
> +	pr_debug("nand_bbt_isbad(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
>   		 (unsigned int)offs, block, res);
>   
>   	switch (res) {
>   	case BBT_BLOCK_GOOD:
> +	case BBT_BLOCK_RESERVED:
>   		return 0;
>   	case BBT_BLOCK_WORN:
> +	case BBT_BLOCK_FACTORY_BAD:
> +	default:
>   		return 1;
> -	case BBT_BLOCK_RESERVED:
> -		return allowbbt ? 0 : 1;
>   	}
> -	return 1;
>   }
> +EXPORT_SYMBOL(nand_bbt_isbad);
>   
>   /**
> - * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
> - * @mtd: MTD device structure
> + * nand_bbt_markbad - [NAND Interface] Mark a block bad in the BBT
> + * @bbt: NAND BBT structure
>    * @offs: offset of the bad block
>    */
> -int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
> +int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs)
>   {
> -	struct nand_chip *this = mtd->priv;
>   	int block, ret = 0;
>   
> -	block = (int)(offs >> this->bbt_erase_shift);
> +	block = (int)(offs >> bbt->bbt_erase_shift);
>   
>   	/* Mark bad block in memory */
> -	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
> +	bbt_mark_entry(bbt, block, BBT_BLOCK_WORN);
>   
>   	/* Update flash-based bad block table */
> -	if (this->bbt_options & NAND_BBT_USE_FLASH)
> -		ret = nand_update_bbt(mtd, offs);
> +	if (bbt->bbt_options & NAND_BBT_USE_FLASH)
> +		ret = nand_update_bbt(bbt, offs);
>   
>   	return ret;
>   }
> -
> -EXPORT_SYMBOL(nand_scan_bbt);
> +EXPORT_SYMBOL(nand_bbt_markbad);

[snip]

> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 6c51876..fbd3007 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -192,6 +192,12 @@ typedef enum {
>   /* Nand scan has allocated controller struct */
>   #define NAND_CONTROLLER_ALLOC	0x80000000
>   
> +/*
> + * Flag to mark that the badblock_pattern is allocated dynamicaly and must
> + * be freed in nand_release().
> + */
> +#define NAND_BADBLOCK_PATTERN_ALLOC	0x08000000
> +
>   /* Cell info constants */
>   #define NAND_CI_CHIPNR_MSK	0x03
>   #define NAND_CI_CELLTYPE_MSK	0x0C
> @@ -711,7 +717,7 @@ struct nand_chip {
>   	struct nand_buffers *buffers;
>   	struct nand_hw_control hwcontrol;
>   

Please also modify the comment describing the structure.

> -	uint8_t *bbt;
> +	struct nand_bbt *nand_bbt;
>   	struct nand_bbt_descr *bbt_td;
>   	struct nand_bbt_descr *bbt_md;
>   
> @@ -833,12 +839,9 @@ struct nand_manufacturers {
>   extern struct nand_flash_dev nand_flash_ids[];
>   extern struct nand_manufacturers nand_manuf_ids[];
>   
> -extern int nand_default_bbt(struct mtd_info *mtd);
>   extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
>   extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
>   extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
> -extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
> -			   int allowbbt);
>   extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
>   			size_t *retlen, uint8_t *buf);
>   
> diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
> new file mode 100644
> index 0000000..03ee0eb
> --- /dev/null
> +++ b/include/linux/mtd/nand_bbt.h
> @@ -0,0 +1,160 @@
> +/*
> + *  NAND family Bad Block Table support
> + *
> + *  Copyright © 2015 Broadcom Corporation
> + *  Brian Norris <computersforpeace@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +#ifndef __LINUX_MTD_NAND_BBT_H
> +#define __LINUX_MTD_NAND_BBT_H
> +
> +struct mtd_info;
> +
> +/* The maximum number of NAND chips in an array */
> +#define NAND_MAX_CHIPS		8
> +
> +/**
> + * struct nand_bbt_descr - bad block table descriptor
> + * @options:	options for this descriptor
> + * @pages:	the page(s) where we find the bbt, used with option BBT_ABSPAGE
> + *		when bbt is searched, then we store the found bbts pages here.
> + *		Its an array and supports up to 8 chips now
> + * @offs:	offset of the pattern in the oob area of the page
> + * @veroffs:	offset of the bbt version counter in the oob are of the page
> + * @version:	version read from the bbt page during scan
> + * @len:	length of the pattern, if 0 no pattern check is performed
> + * @maxblocks:	maximum number of blocks to search for a bbt. This number of
> + *		blocks is reserved at the end of the device where the tables are
> + *		written.
> + * @reserved_block_code: if non-0, this pattern denotes a reserved (rather than
> + *              bad) block in the stored bbt
> + * @pattern:	pattern to identify bad block table or factory marked good /
> + *		bad blocks, can be NULL, if len = 0
> + *
> + * Descriptor for the bad block table marker and the descriptor for the
> + * pattern which identifies good and bad blocks. The assumption is made
> + * that the pattern and the version count are always located in the oob area
> + * of the first block.
> + */
> +struct nand_bbt_descr {
> +	int options;
> +	int pages[NAND_MAX_CHIPS];
> +	int offs;
> +	int veroffs;
> +	uint8_t version[NAND_MAX_CHIPS];
> +	int len;
> +	int maxblocks;
> +	int reserved_block_code;
> +	uint8_t *pattern;
> +};
> +
> +/* Options for the bad block table descriptors */
> +
> +/* The number of bits used per block in the bbt on the device */
> +#define NAND_BBT_NRBITS_MSK	0x0000000F
> +#define NAND_BBT_1BIT		0x00000001
> +#define NAND_BBT_2BIT		0x00000002
> +#define NAND_BBT_4BIT		0x00000004
> +#define NAND_BBT_8BIT		0x00000008
> +/* The bad block table is in the last good block of the device */
> +#define NAND_BBT_LASTBLOCK	0x00000010
> +/* The bbt is at the given page, else we must scan for the bbt */
> +#define NAND_BBT_ABSPAGE	0x00000020
> +/* bbt is stored per chip on multichip devices */
> +#define NAND_BBT_PERCHIP	0x00000080
> +/* bbt has a version counter at offset veroffs */
> +#define NAND_BBT_VERSION	0x00000100
> +/* Create a bbt if none exists */
> +#define NAND_BBT_CREATE		0x00000200
> +/*
> + * Create an empty BBT with no vendor information. Vendor's information may be
> + * unavailable, for example, if the NAND controller has a different data and OOB
> + * layout or if this information is already purged. Must be used in conjunction
> + * with NAND_BBT_CREATE.
> + */
> +#define NAND_BBT_CREATE_EMPTY	0x00000400
> +/* Write bbt if necessary */
> +#define NAND_BBT_WRITE		0x00002000
> +/* Read and write back block contents when writing bbt */
> +#define NAND_BBT_SAVECONTENT	0x00004000
> +/* Search good / bad pattern on the first and the second page */
> +#define NAND_BBT_SCAN2NDPAGE	0x00008000
> +/* Search good / bad pattern on the last page of the eraseblock */
> +#define NAND_BBT_SCANLASTPAGE	0x00010000
> +/*
> + * Use a flash based bad block table. By default, OOB identifier is saved in
> + * OOB area. This option is passed to the default bad block table function.
> + */
> +#define NAND_BBT_USE_FLASH	0x00020000
> +/*
> + * Do not store flash based bad block table marker in the OOB area; store it
> + * in-band.
> + */
> +#define NAND_BBT_NO_OOB		0x00040000
> +/*
> + * Do not write new bad block markers to OOB; useful, e.g., when ECC covers
> + * entire spare area. Must be used with NAND_BBT_USE_FLASH.
> + */
> +#define NAND_BBT_NO_OOB_BBM	0x00080000
> +
> +/* The maximum number of blocks to scan for a bbt */
> +#define NAND_BBT_SCAN_MAXBLOCKS	4
> +
> +struct nand_bbt {
> +	struct mtd_info *mtd;
> +
> +	/*
> +	 * This is important to abstract out of nand_bbt.c and provide
> +	 * separately in nand_base.c and spi-nand-base.c -- it's sort of
> +	 * duplicated in nand_block_bad() (nand_base) and
> +	 * scan_block_fast() (nand_bbt) right now

There is no scan_block_fast any more.

> +	 *
> +	 * Note that this also means nand_chip.badblock_pattern should
> +	 * be removed from nand_bbt.c
> +	 */
> +	int (*is_bad_bbm)(struct mtd_info *mtd, loff_t ofs);
> +
> +	/* Only required if the driver wants to attempt to program new
> +	 * bad block markers that imitate the factory-marked BBMs */
> +	int (*mark_bad_bbm)(struct mtd_info *mtd, loff_t ofs);
> +
> +	/* Erase a block, bypassing reserved checks */
> +	int (*erase)(struct mtd_info *mtd, loff_t ofs);
> +
> +	unsigned int bbt_options;
> +
> +	/* Only required for NAND_BBT_PERCHIP */
> +	int numchips;
> +
> +	/* Discourage new customer usages here; suggest usage of the
> +	 * relevant NAND_BBT_* options instead */
> +	struct nand_bbt_descr *bbt_td;
> +	struct nand_bbt_descr *bbt_md;
> +
> +	/* The rest are filled in by nand_bbt_init() */
> +
> +	u64 chipsize;
> +	int chip_shift;
> +	int bbt_erase_shift;
> +	int page_shift;
> +
> +	u8 *bbt;
> +};
> +
> +int nand_bbt_init(struct nand_bbt *bbt);
> +void nand_bbt_release(struct nand_bbt *bbt);
> +int nand_bbt_markbad(struct nand_bbt *bbt, loff_t offs);
> +int nand_bbt_isreserved(struct nand_bbt *bbt, loff_t offs);
> +int nand_bbt_isbad(struct nand_bbt *bbt, loff_t offs);
> +
> +#endif	/* __LINUX_MTD_NAND_BBT_H */
