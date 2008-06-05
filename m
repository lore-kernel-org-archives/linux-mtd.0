Date: Thu, 5 Jun 2008 22:03:25 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature 
In-Reply-To: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
Message-ID: <alpine.LFD.1.10.0806052116000.3235@apollo.tec.linutronix.de>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, joern@logfs.org, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 May 2008, Alexey Korolev wrote:

> As NAND multiple plane architecture assumes simultaneous write/erase of
> several pages/blocks at the same time, we have to modify page/eraseblock
> sizes and report modified size to upper layers. In other words physical
> erase block size/ page size != reported erase block size/ page size.
>
> For example if we have dual plane device we have to extend erase block
> size and page size in 2 times. 

And why the heck do you have to do all those phys_erase_shift changes ?

mtd->erase_size is completely independent of the nand internal
information already. All it needs is to adjust the erase_size which is
reported to the mtd layer.

> Also this patch keep track on bad block management. NAND datasheets
> alows us combine only pair of neibour blocks into dual/multiple plane
> operations. So if we have multiple plane device and one block is bad,
> reported extended block should be considered as bad. 

Please do this in a separate patch if it's even necessary at all.

> @@ -2269,13 +2269,13 @@ static struct nand_flash_dev *nand_get_f
>  		/* Number of planes*/
>  		chip->numplanes = 1 << ((planeid >> 2) & 0x03);

		planeid is magically declared and initialized, right ?

>  		/* Calc pagesize */
> -		mtd->writesize = 1024 << (extid & 0x3);
> +		mtd->writesize = (1024 << (extid & 0x3)) * chip->numplanes;
>  		extid >>= 2;
>  		/* Calc oobsize */
>  		mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);
>  		extid >>= 2;
>  		/* Calc blocksize. Blocksize is multiples of 64KiB */
> -		mtd->erasesize = (64 * 1024) << (extid & 0x03);
> +		mtd->erasesize = ((64 * 1024) << (extid & 0x03)) * chip->numplanes;
>  		extid >>= 2;
>  		/* Get buswidth information */
>  		busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
> @@ -2290,6 +2290,8 @@ static struct nand_flash_dev *nand_get_f
>  		busw = type->options & NAND_BUSWIDTH_16;
>  	}
>  
> +	chip->oob_phys_size = mtd->oobsize / chip->numplanes;

What the heck initializes chip->numplanes in the else path of 

        if (!type->pagesize) {


>  int nand_scan_tail(struct mtd_info *mtd)
>  {
> -	int i;
> +	int i, j;
> +	int oobfree_len;

One line

>  
> -	if (!chip->write_page)
> -		chip->write_page = nand_write_page;
> -

1) Change has nothing to do with the patch description

2) removing this will break existing code

> +	if (chip->numplanes > 1) {


Introduce new feature in a separate patch

> +		for (oobfree_len = 0; chip->ecc.layout->oobfree[oobfree_len].length; oobfree_len++)
> +			;
> +		i = 0;
> +		while (i < chip->numplanes) {
> +			for (j = 0; j < oobfree_len ; j++) {
> +				chip->ecc.layout->oobfree[j + i * oobfree_len].length = chip->ecc.layout->oobfree[j].length;
> +				chip->ecc.layout->oobfree[j + i * oobfree_len].offset = chip->ecc.layout->oobfree[j].offset + chip->oob_phys_size * i;
> +			}
> +			for (j = 0; j < chip->ecc.layout->eccbytes; j++)
> +				chip->ecc.layout->eccpos[j + i * chip->ecc.layout->eccbytes] = chip->ecc.layout->eccpos[j] + chip->oob_phys_size * i;

Screenwidth 280 characters ?

> +			i++;
> +		}
> +		chip->ecc.layout->eccbytes *= chip->numplanes;
> +	}
>  
>  */
> -static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
> +static int check_pattern(struct mtd_info *mtd, uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
>  {
>  	int i, end = 0;
> +	struct nand_chip *this = mtd->priv;
> +	int plane_num = 0;
>
>  	uint8_t *p = buf;
>  
> -	end = paglen + td->offs;
> +	do {
> +	end = this->page_phys_size + td->offs;
>  	if (td->options & NAND_BBT_SCANEMPTY) {
>  		for (i = 0; i < end; i++) {
>  			if (p[i] != 0xff)
> @@ -103,6 +106,10 @@ static int check_pattern(uint8_t *buf, i
>  				return -1;
>  		}
>  	}
> +	p += len - end;
> +	plane_num++;
> +	}
> +	while (plane_num < this->numplanes);
>  	return 0;
>  }

This change is completely useless. If you have to scan a buffer double
the size, then the code can be called twice. Create an inline function
which does the numplanes magic and call that.
  
> @@ -116,16 +123,22 @@ static int check_pattern(uint8_t *buf, i
>   * no optional empty check
>   *
>  */
> -static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
> +static int check_short_pattern(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
>  {
>  	int i;
>  	uint8_t *p = buf;
>  
> +	struct nand_chip *this = mtd->priv;
> +	int plane_num = 0;
>  	/* Compare the pattern */
> +	do {
>  	for (i = 0; i < td->len; i++) {
> -		if (p[td->offs + i] != td->pattern[i])
> +		if (p[this->oob_phys_size * plane_num + td->offs + i] != td->pattern[i])
>  			return -1;
>  	}
> +	plane_num++;
> +	}
> +	while (plane_num < this->numplanes);
>  	return 0;
>  }

Same here
 
> @@ -318,7 +331,7 @@ static int scan_block_full(struct mtd_in
>  		return ret;
>  
>  	for (j = 0; j < len; j++, buf += scanlen) {
> -		if (check_pattern(buf, scanlen, mtd->writesize, bd))
> +		if (check_pattern(mtd, buf, scanlen, mtd->writesize, bd))
>  			return 1;
>  	}
>  	return 0;
> @@ -349,7 +362,7 @@ static int scan_block_fast(struct mtd_in
>  		if (ret)
>  			return ret;
>  
> -		if (check_short_pattern(buf, bd))
> +		if (check_short_pattern(mtd, buf, bd))
>  			return 1;
>  
>  		offs += mtd->writesize;
> @@ -501,7 +514,7 @@ static int search_bbt(struct mtd_info *m
>  
>  			/* Read first page */
>  			scan_read_raw(mtd, buf, offs, mtd->writesize);
> -			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
> +			if (!check_pattern(mtd, buf, scanlen, mtd->writesize, td)) {

And what puts the BBT magic pattern into both erase blocks ?

Thanks,
	tglx
