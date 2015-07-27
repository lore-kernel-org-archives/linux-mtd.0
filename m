Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJfks-0001bI-KE
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 10:35:40 +0000
Subject: Re: [PATCH v2] mtd: nand_bbt: separate struct nand_chip from
 nand_bbt.c
To: =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, "fransklaver@gmail.com"
 <fransklaver@gmail.com>, "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "baruch@tkos.co.il"
 <baruch@tkos.co.il>, "ezequiel.garcia@free-electrons.com"
 <ezequiel.garcia@free-electrons.com>, "kdasu.kdev@gmail.com"
 <kdasu.kdev@gmail.com>, "rogerq@ti.com" <rogerq@ti.com>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, bpqw <bpqw@micron.com>
References: <87F60714EC601C4C83DFF1D2E3D390A03268E55C@NTXXIAMBX02.xacn.micron.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?RnJhbmsgTGl1IOWImOe+pCAoZnJhbmtsaXUp?= <frankliu@micron.com>, Kamil
 Debski <Kamil.Debski@imgtec.com>
From: Ionela Voinescu <ionela.voinescu@imgtec.com>
Message-ID: <55B60958.7030404@imgtec.com>
Date: Mon, 27 Jul 2015 11:35:04 +0100
MIME-Version: 1.0
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A03268E55C@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

Thank you for your work on this and for considering my suggestions on the code.
This BBT patch is a very good base for the SPI NAND framework work (which will
separate the SPI NAND core from the existing parallel NAND core).
I applied it on the 4.1 kernel and tested it with a GigaDevice flash chip and
it all works alright.

Test procedure:
1. Applied your patch for BBT and the SPI NAND framework patches by Ezequiel Garcia.
2. Compiled and booted kernel.
3. Ran "nandtest" on a 4Gb GigaDevice flash chip in a loop and saw no issues
    after multiple runs.

Best regards,
Ionela.


On 07/07/2015 07:02, Peter Pan ÅË¶° (peterpandong) wrote:
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
> Tested-by: Kamil Debski <kamil.debski@imgtec.com>

Reviewed-by: Ionela Voinescu <ionela.voinescu@imgtec.com>
Tested-by: Ionela Voinescu <ionela.voinescu@imgtec.com>

> ---
> changelog:
> 	v1-v2:
> 		Address Kamil Debski's test
> 		Add necessary comments to nand_bbt struct
>
>   drivers/mtd/nand/docg4.c     |   8 +-
>   drivers/mtd/nand/nand_base.c | 145 +++++++++++-
>   drivers/mtd/nand/nand_bbt.c  | 524 +++++++++++++++++--------------------------
>   include/linux/mtd/bbm.h      |  96 +-------
>   include/linux/mtd/nand.h     |  14 +-
>   include/linux/mtd/nand_bbt.h | 172 ++++++++++++++
>   6 files changed, 533 insertions(+), 426 deletions(-)
>   create mode 100644 include/linux/mtd/nand_bbt.h
>
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index e5d7bca..eb55a21 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -1037,7 +1037,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
>   	 * operation after device power-up.  The above read ensures it never is.
>   	 * Ugly, I know.
>   	 */
> -	if (nand->bbt == NULL)  /* no memory-based bbt */
> +	if (nand->nand_bbt == NULL)  /* no memory-based bbt */
>   		goto exit;
>   
>   	if (mtd->ecc_stats.failed > eccfailed_stats) {
> @@ -1064,7 +1064,11 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
>   		unsigned long bits = ~buf[i];
>   		for_each_set_bit(bitnum, &bits, 8) {
>   			int badblock = block + 7 - bitnum;
> -			nand->bbt[badblock / 4] |=
> +			/*
> +			 * Should we create a mark factory bad block interface
> +			 * for this?
> +			 */
> +			nand->nand_bbt->bbt[badblock / 4] |=
>   				0x03 << ((badblock % 4) * 2);
>   			mtd->ecc_stats.badblocks++;
>   			dev_notice(doc->dev, "factory-marked bad block: %d\n",
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca..eb94714 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -97,6 +97,9 @@ static int nand_get_device(struct mtd_info *mtd, int new_state);
>   static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
>   			     struct mtd_oob_ops *ops);
>   
> +static int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
> +			   int allowbbt);
> +
>   /*
>    * For devices which display every fart in the system on a separate LED. Is
>    * compiled away when LED support is disabled.
> @@ -450,8 +453,8 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
>   	}
>   
>   	/* Mark block bad in BBT */
> -	if (chip->bbt) {
> -		res = nand_markbad_bbt(mtd, ofs);
> +	if (chip->nand_bbt) {
> +		res = nand_bbt_markbad(chip->nand_bbt, ofs);
>   		if (!ret)
>   			ret = res;
>   	}
> @@ -493,10 +496,10 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
>   {
>   	struct nand_chip *chip = mtd->priv;
>   
> -	if (!chip->bbt)
> +	if (!chip->nand_bbt)
>   		return 0;
>   	/* Return info from the table */
> -	return nand_isreserved_bbt(mtd, ofs);
> +	return nand_bbt_isreserved(chip->nand_bbt, ofs);
>   }
>   
>   /**
> @@ -513,12 +516,18 @@ static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
>   			       int allowbbt)
>   {
>   	struct nand_chip *chip = mtd->priv;
> +	struct nand_bbt *bbt = chip->nand_bbt;
>   
> -	if (!chip->bbt)
> +	if (!bbt)
>   		return chip->block_bad(mtd, ofs, getchip);
>   
>   	/* Return info from the table */
> -	return nand_isbad_bbt(mtd, ofs, allowbbt);
> +	if (nand_bbt_isbad(bbt, ofs))
> +		return 1;
> +	else if (allowbbt)
> +		return 0;
> +	else
> +		return nand_bbt_isreserved(bbt, ofs);
>   }
>   
>   /**
> @@ -2729,7 +2738,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
>    *
>    * Erase one ore more blocks.
>    */
> -int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
> +static int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>   		    int allowbbt)
>   {
>   	int page, status, pages_per_block, ret, chipnr;
> @@ -2836,6 +2845,122 @@ erase_exit:
>   	return ret;
>   }
>   
> +/* NAND BBT helper - erase a block, including reserved blocks */
> +static int nand_bbt_erase_block(struct mtd_info *mtd, loff_t addr)
> +{
> +	struct erase_info einfo;
> +	struct nand_chip *chip = mtd->priv;
> +
> +	memset(&einfo, 0, sizeof(einfo));
> +	einfo.mtd = mtd;
> +	einfo.addr = addr;
> +	einfo.len = 1ULL << chip->phys_erase_shift;
> +
> +	return nand_erase_nand(mtd, &einfo, 1);
> +}
> +
> +static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
> +#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
> +/**
> + * nand_create_factory_badblock_pattern - [INTERN] Creates a BBT descriptor
> + * structure for factory bad block marker
> + * @chip: NAND chip to create descriptor for
> + *
> + * This function allocates and initializes a badblock_pattern for factory bad
> + * block marker based on the properties of @chip when chip.badblock_pattern
> + * is NULL.
> + */
> +static int nand_create_factory_badblock_pattern(struct nand_chip *chip)
> +{
> +	struct nand_bbt_descr *bd;
> +
> +	if (chip->badblock_pattern) {
> +		pr_warn("Bad block pattern already allocated; not replacing\n");
> +		return -EINVAL;
> +	}
> +	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
> +	if (!bd)
> +		return -ENOMEM;
> +	bd->options = chip->bbt_options & BADBLOCK_SCAN_MASK;
> +	bd->offs = chip->badblockpos;
> +	bd->len = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
> +	bd->pattern = scan_ff_pattern;
> +	bd->options |= NAND_BADBLOCK_PATTERN_ALLOC;
> +	chip->badblock_pattern = bd;
> +
> +	return 0;
> +}
> +
> +static int nand_is_bad_bbm(struct mtd_info *mtd, loff_t addr)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	struct mtd_oob_ops ops;
> +	struct nand_bbt_descr *bd = chip->badblock_pattern;
> +	int j, ret;
> +	int numpages;
> +
> +	if (bd->options & NAND_BBT_SCAN2NDPAGE)
> +		numpages = 2;
> +	else
> +		numpages = 1;
> +
> +	if (bd->options & NAND_BBT_SCANLASTPAGE)
> +		addr += mtd->erasesize - (mtd->writesize * numpages);
> +
> +	ops.ooblen = mtd->oobsize;
> +	ops.oobbuf = chip->buffers->databuf;
> +	ops.ooboffs = 0;
> +	ops.datbuf = NULL;
> +	ops.mode = MTD_OPS_PLACE_OOB;
> +
> +	for (j = 0; j < numpages; j++) {
> +		/*
> +		 * Read the full oob until read_oob is fixed to handle single
> +		 * byte reads for 16 bit buswidth.
> +		 */
> +		ret = nand_do_read_oob(mtd, addr, &ops);
> +		/* Ignore ECC errors when checking for BBM */
> +		if (ret && !mtd_is_bitflip_or_eccerr(ret))
> +			return ret;
> +
> +		if (memcmp(chip->buffers->databuf + bd->offs,
> +				bd->pattern, bd->len))
> +			return 1;
> +
> +		addr += mtd->writesize;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nand_default_bbt(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	struct nand_bbt *bbt = kzalloc(sizeof(struct nand_bbt), GFP_KERNEL);
> +
> +	if (!bbt)
> +		return -ENOMEM;
> +
> +	bbt->bbt_options = chip->bbt_options;
> +	bbt->mtd = mtd;
> +	bbt->numchips = chip->numchips;
> +	bbt->chipsize = chip->chipsize;
> +	bbt->chip_shift = chip->chip_shift;
> +	bbt->bbt_erase_shift = chip->phys_erase_shift;
> +	bbt->page_shift = chip->page_shift;
> +	bbt->bbt_td = chip->bbt_td;
> +	bbt->bbt_md = chip->bbt_md;
> +	bbt->is_bad_bbm = nand_is_bad_bbm;
> +	bbt->erase = nand_bbt_erase_block;
> +	chip->nand_bbt = bbt;
> +
> +	if (!chip->badblock_pattern &&
> +		nand_create_factory_badblock_pattern(chip))
> +		return -ENOMEM;
> +
> +	return nand_bbt_init(chip->nand_bbt);
> +}
> +
>   /**
>    * nand_sync - [MTD Interface] sync
>    * @mtd: MTD device structure
> @@ -4291,13 +4416,15 @@ void nand_release(struct mtd_info *mtd)
>   	mtd_device_unregister(mtd);
>   
>   	/* Free bad block table memory */
> -	kfree(chip->bbt);
> +	if (chip->nand_bbt)
> +		nand_bbt_release(chip->nand_bbt);
> +	kfree(chip->nand_bbt);
>   	if (!(chip->options & NAND_OWN_BUFFERS))
>   		kfree(chip->buffers);
>   
>   	/* Free bad block descriptor memory */
>   	if (chip->badblock_pattern && chip->badblock_pattern->options
> -			& NAND_BBT_DYNAMICSTRUCT)
> +				& NAND_BADBLOCK_PATTERN_ALLOC)
>   		kfree(chip->badblock_pattern);
>   }
>   EXPORT_SYMBOL_GPL(nand_release);
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 63a1a36..88cb54d 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -60,8 +60,7 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   #include <linux/mtd/mtd.h>
> -#include <linux/mtd/bbm.h>
> -#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_bbt.h>
>   #include <linux/bitops.h>
>   #include <linux/delay.h>
>   #include <linux/vmalloc.h>
> @@ -76,20 +75,20 @@
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
> @@ -122,23 +121,6 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
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
> @@ -159,7 +141,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
>   
>   /**
>    * read_bbt - [GENERIC] Read the bad block table starting from page
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @page: the starting page
>    * @num: the number of bbt descriptors to read
> @@ -168,11 +150,11 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
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
> @@ -182,10 +164,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
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
> @@ -221,8 +203,8 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
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
> @@ -233,13 +215,13 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
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
> @@ -252,7 +234,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>   
>   /**
>    * read_abs_bbt - [GENERIC] Read the bad block table starting at a given page
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @td: descriptor for the bad block table
>    * @chip: read the table for a specific chip, -1 read all chips; applies only if
> @@ -261,25 +243,26 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
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
> @@ -287,7 +270,7 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   }
>   
>   /* BBT marker is in the first page, no OOB */
> -static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
> +static int scan_read_data(struct nand_bbt *bbt, uint8_t *buf, loff_t offs,
>   			 struct nand_bbt_descr *td)
>   {
>   	size_t retlen;
> @@ -297,12 +280,12 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
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
> @@ -311,9 +294,10 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
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
> @@ -341,19 +325,20 @@ static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
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
> -static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
> +static int scan_write_bbt(struct nand_bbt *bbt, loff_t offs, size_t len,
>   			  uint8_t *buf, uint8_t *oob)
>   {
> +	struct mtd_info *mtd = bbt->mtd;
>   	struct mtd_oob_ops ops;
>   
>   	ops.mode = MTD_OPS_PLACE_OOB;
> @@ -366,18 +351,18 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
>   	return mtd_write_oob(mtd, offs, &ops);
>   }
>   
> -static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
> +static u32 bbt_get_ver_offs(struct nand_bbt *bbt, struct nand_bbt_descr *td)
>   {
>   	u32 ver_offs = td->veroffs;
>   
>   	if (!(td->options & NAND_BBT_NO_OOB))
> -		ver_offs += mtd->writesize;
> +		ver_offs += bbt->mtd->writesize;
>   	return ver_offs;
>   }
>   
>   /**
>    * read_abs_bbts - [GENERIC] Read the bad block table(s) for all chips starting at a given page
> - * @mtd: MTD device structure
> + * @bbt: NAND BBT structure
>    * @buf: temporary buffer
>    * @td: descriptor for the bad block table
>    * @md:	descriptor for the bad block table mirror
> @@ -385,130 +370,85 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
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
> @@ -521,18 +461,19 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
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
> @@ -541,12 +482,12 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
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
> @@ -557,20 +498,20 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
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
> @@ -585,28 +526,28 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
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
> @@ -614,12 +555,11 @@ static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
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
> @@ -638,16 +578,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
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
> @@ -678,13 +618,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
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
> @@ -712,13 +652,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
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
> @@ -728,15 +668,15 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
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
> @@ -763,7 +703,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>   			len = ALIGN(len, mtd->writesize);
>   			/* Preset the buffer with 0xff */
>   			memset(buf, 0xff, len +
> -			       (len >> this->page_shift)* mtd->oobsize);
> +			       (len >> bbt->page_shift) * mtd->oobsize);
>   			offs = 0;
>   			ooboffs = len;
>   			/* Pattern is located in oob area of first page */
> @@ -777,20 +717,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
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
> -		res = scan_write_bbt(mtd, to, len, buf,
> +		res = scan_write_bbt(bbt, to, len, buf,
>   				td->options & NAND_BBT_NO_OOB ? NULL :
>   				&buf[len]);
>   		if (res < 0)
> @@ -811,41 +747,36 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
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
> @@ -894,8 +825,8 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
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
> @@ -904,7 +835,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   
>   		/* Read back first? */
>   		if (rd) {
> -			res = read_abs_bbt(mtd, buf, rd, chipsel);
> +			res = read_abs_bbt(bbt, buf, rd, chipsel);
>   			if (mtd_is_eccerr(res)) {
>   				/* Mark table as invalid */
>   				rd->pages[i] = -1;
> @@ -915,7 +846,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
>   		}
>   		/* If they weren't versioned, read both */
>   		if (rd2) {
> -			res2 = read_abs_bbt(mtd, buf, rd2, chipsel);
> +			res2 = read_abs_bbt(bbt, buf, rd2, chipsel);
>   			if (mtd_is_eccerr(res2)) {
>   				/* Mark table as invalid */
>   				rd2->pages[i] = -1;
> @@ -937,14 +868,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
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
> @@ -954,25 +885,25 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
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
> @@ -980,13 +911,14 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
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
> @@ -995,8 +927,8 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
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
> @@ -1007,22 +939,22 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
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
> @@ -1033,16 +965,16 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
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
> @@ -1050,20 +982,19 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
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
> - * @mtd: MTD device structure
> - * @bd: descriptor for the good/bad block search pattern
> + * @bbt: NAND BBT structure
>    *
>    * The function checks, if a bad block table(s) is/are already available. If
>    * not it scans the device for manufacturer marked good / bad blocks and writes
> @@ -1072,21 +1003,21 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
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
> @@ -1094,18 +1025,19 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
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
> @@ -1114,59 +1046,59 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
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
> @@ -1179,13 +1111,13 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
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
> @@ -1193,12 +1125,6 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
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
> @@ -1243,135 +1169,103 @@ static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
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
> diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
> index 36bb6a5..fb751d9 100644
> --- a/include/linux/mtd/bbm.h
> +++ b/include/linux/mtd/bbm.h
> @@ -28,102 +28,8 @@
>   #ifndef __LINUX_MTD_BBM_H
>   #define __LINUX_MTD_BBM_H
>   
> -/* The maximum number of NAND chips in an array */
> -#define NAND_MAX_CHIPS		8
> +#include <linux/mtd/nand_bbt.h>
>   
> -/**
> - * struct nand_bbt_descr - bad block table descriptor
> - * @options:	options for this descriptor
> - * @pages:	the page(s) where we find the bbt, used with option BBT_ABSPAGE
> - *		when bbt is searched, then we store the found bbts pages here.
> - *		Its an array and supports up to 8 chips now
> - * @offs:	offset of the pattern in the oob area of the page
> - * @veroffs:	offset of the bbt version counter in the oob are of the page
> - * @version:	version read from the bbt page during scan
> - * @len:	length of the pattern, if 0 no pattern check is performed
> - * @maxblocks:	maximum number of blocks to search for a bbt. This number of
> - *		blocks is reserved at the end of the device where the tables are
> - *		written.
> - * @reserved_block_code: if non-0, this pattern denotes a reserved (rather than
> - *              bad) block in the stored bbt
> - * @pattern:	pattern to identify bad block table or factory marked good /
> - *		bad blocks, can be NULL, if len = 0
> - *
> - * Descriptor for the bad block table marker and the descriptor for the
> - * pattern which identifies good and bad blocks. The assumption is made
> - * that the pattern and the version count are always located in the oob area
> - * of the first block.
> - */
> -struct nand_bbt_descr {
> -	int options;
> -	int pages[NAND_MAX_CHIPS];
> -	int offs;
> -	int veroffs;
> -	uint8_t version[NAND_MAX_CHIPS];
> -	int len;
> -	int maxblocks;
> -	int reserved_block_code;
> -	uint8_t *pattern;
> -};
> -
> -/* Options for the bad block table descriptors */
> -
> -/* The number of bits used per block in the bbt on the device */
> -#define NAND_BBT_NRBITS_MSK	0x0000000F
> -#define NAND_BBT_1BIT		0x00000001
> -#define NAND_BBT_2BIT		0x00000002
> -#define NAND_BBT_4BIT		0x00000004
> -#define NAND_BBT_8BIT		0x00000008
> -/* The bad block table is in the last good block of the device */
> -#define NAND_BBT_LASTBLOCK	0x00000010
> -/* The bbt is at the given page, else we must scan for the bbt */
> -#define NAND_BBT_ABSPAGE	0x00000020
> -/* bbt is stored per chip on multichip devices */
> -#define NAND_BBT_PERCHIP	0x00000080
> -/* bbt has a version counter at offset veroffs */
> -#define NAND_BBT_VERSION	0x00000100
> -/* Create a bbt if none exists */
> -#define NAND_BBT_CREATE		0x00000200
> -/*
> - * Create an empty BBT with no vendor information. Vendor's information may be
> - * unavailable, for example, if the NAND controller has a different data and OOB
> - * layout or if this information is already purged. Must be used in conjunction
> - * with NAND_BBT_CREATE.
> - */
> -#define NAND_BBT_CREATE_EMPTY	0x00000400
> -/* Write bbt if neccecary */
> -#define NAND_BBT_WRITE		0x00002000
> -/* Read and write back block contents when writing bbt */
> -#define NAND_BBT_SAVECONTENT	0x00004000
> -/* Search good / bad pattern on the first and the second page */
> -#define NAND_BBT_SCAN2NDPAGE	0x00008000
> -/* Search good / bad pattern on the last page of the eraseblock */
> -#define NAND_BBT_SCANLASTPAGE	0x00010000
> -/*
> - * Use a flash based bad block table. By default, OOB identifier is saved in
> - * OOB area. This option is passed to the default bad block table function.
> - */
> -#define NAND_BBT_USE_FLASH	0x00020000
> -/*
> - * Do not store flash based bad block table marker in the OOB area; store it
> - * in-band.
> - */
> -#define NAND_BBT_NO_OOB		0x00040000
> -/*
> - * Do not write new bad block markers to OOB; useful, e.g., when ECC covers
> - * entire spare area. Must be used with NAND_BBT_USE_FLASH.
> - */
> -#define NAND_BBT_NO_OOB_BBM	0x00080000
> -
> -/*
> - * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
> - * was allocated dynamicaly and must be freed in nand_release(). Has no meaning
> - * in nand_chip.bbt_options.
> - */
> -#define NAND_BBT_DYNAMICSTRUCT	0x80000000
> -
> -/* The maximum number of blocks to scan for a bbt */
> -#define NAND_BBT_SCAN_MAXBLOCKS	4
>   
>   /*
>    * Constants for oob configuration
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index f25e2bd..cd1abb71 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -194,6 +194,12 @@ typedef enum {
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
> @@ -627,7 +633,8 @@ struct nand_buffers {
>    * @read_retries:	[INTERN] the number of read retry modes supported
>    * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
>    * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
> - * @bbt:		[INTERN] bad block table pointer
> + * @nand_bbt:		[INTERN] pointer to bad block table structure, which includes
> + *			all information needed by Bad Block Management
>    * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
>    *			lookup.
>    * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
> @@ -716,7 +723,7 @@ struct nand_chip {
>   	struct nand_buffers *buffers;
>   	struct nand_hw_control hwcontrol;
>   
> -	uint8_t *bbt;
> +	struct nand_bbt *nand_bbt;
>   	struct nand_bbt_descr *bbt_td;
>   	struct nand_bbt_descr *bbt_md;
>   
> @@ -838,12 +845,9 @@ struct nand_manufacturers {
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
> index 0000000..1a68104
> --- /dev/null
> +++ b/include/linux/mtd/nand_bbt.h
> @@ -0,0 +1,172 @@
> +/*
> + *  NAND family Bad Block Table support
> + *
> + *  Copyright ? 2015 Broadcom Corporation
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
> +/**
> + * struct nand_bbt - bad block table structure
> + * @mtd:	pointer to MTD device structure
> + * @is_bad_bbm:	check if a block is factory bad block
> + * @mark_bad_bbm:	imitate a block as factory bad block
> + * @erase:	erase block bypassing resvered checks
> + * @bbt_options:	bad block specific options. All options used
> + *			here must come from nand_bbt.h.
> + * @numchips:	number of physical chips, required for NAND_BBT_PERCHIP
> + * @bbt_td:	bad block table descriptor for flash lookup.
> + * @bbt_md:	bad block table mirror descriptor
> + * @chipsize:	the size of one chip for multichip arrays
> + * @chip_shift:	number of address bits in one chip
> + * @bbt_erase_shift:	number of address bits in a bbt entry
> + * @page_shift:	number of address bits in a page
> + * @bbt:	bad block table pointer
> + *
> + */
> +struct nand_bbt {
> +	struct mtd_info *mtd;
> +
> +	/*
> +	 * This is important to abstract out of nand_bbt.c and provide
> +	 * separately in nand_base.c and spi-nand-base.c -- it's sort of
> +	 * duplicated in nand_block_bad() (nand_base) and
> +	 * scan_block_fast() (nand_bbt) right now
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
> +	int numchips;
> +
> +	/* Discourage new customer usages here; suggest usage of the
> +	 * relevant NAND_BBT_* options instead */
> +	struct nand_bbt_descr *bbt_td;
> +	struct nand_bbt_descr *bbt_md;
> +	u64 chipsize;
> +	int chip_shift;
> +	int bbt_erase_shift;
> +	int page_shift;
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
