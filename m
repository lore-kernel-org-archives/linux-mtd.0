Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5gfp-0003OT-4J
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:54:10 +0000
Received: by ewy3 with SMTP id 3so1212417ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 08:54:07 -0700 (PDT)
Subject: Re: [PATCH] nand_bbt: convert printks to pr_*
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bill Gatliff <bgat@billgatliff.com>
In-Reply-To: <1301585080-6318-1-git-send-email-bgat@billgatliff.com>
References: <1301585080-6318-1-git-send-email-bgat@billgatliff.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 18:51:38 +0300
Message-ID: <1301673098.2789.114.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for the attempt to give this code some love, I really appreciate
this. But could you please avoid such big patches, even though they are
doing trivial things? Would it please be possible to do one type of
changes at a time? Something like this:

1. Separate patch for indentation fixes.
2. Separate patch for printk() -> pr_* changes.

On Thu, 2011-03-31 at 10:24 -0500, Bill Gatliff wrote:
> @@ -121,7 +121,7 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
>  			end += NAND_SMALL_BADBLOCK_POS - td->offs;
>  			/* Check region between positions 1 and 6 */
>  			for (i = 0; i < NAND_SMALL_BADBLOCK_POS - td->offs - td->len;
> -					i++) {
> +			     i++) {

The line anyway is longer than 80 characters, so may be it is nicer to
introduce a temporary variable for NAND_SMALL_BADBLOCK_POS - td->offs -
td->len ?


> @@ -801,14 +801,14 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>  			res = mtd->read(mtd, to, len, &retlen, buf);
>  			if (res < 0) {
>  				if (retlen != len) {
> -					printk(KERN_INFO "nand_bbt: Error "
> -					       "reading block for writing "
> -					       "the bad block table\n");
> +					pr_info("nand_bbt: Error "
> +						"reading block for writing "
> +						"the bad block table\n");

May be the this can be turned into 2-liner from the 3-liner?

>  					return res;
>  				}
> -				printk(KERN_WARNING "nand_bbt: ECC error "
> -				       "while reading block for writing "
> -				       "bad block table\n");
> +				pr_warn("nand_bbt: ECC error "
> +					"while reading block for writing "
> +					"bad block table\n");

Ditto?
>  			}
>  			/* Read oob data */
>  			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
> @@ -878,22 +878,21 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
>  			goto outerr;
>  
>  		res = scan_write_bbt(mtd, to, len, buf,
> -				td->options & NAND_BBT_NO_OOB ? NULL :
> -				&buf[len]);
> +				     td->options & NAND_BBT_NO_OOB ? NULL :
> +				     &buf[len]);

Did you try to make 2-liners out of that as well?

>  static struct nand_bbt_descr bbt_main_descr = {
>  	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
> -		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
> +	| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,

Err, probably you should align the second line to the beginning of the
first line?

>  	.offs =	8,
>  	.len = 4,
>  	.veroffs = 12,
> @@ -1312,7 +1311,7 @@ static struct nand_bbt_descr bbt_main_descr = {
>  
>  static struct nand_bbt_descr bbt_mirror_descr = {
>  	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
> -		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
> +	| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,

Ditto and in other similar places.

> @@ -1419,7 +1418,8 @@ int nand_default_bbt(struct mtd_info *mtd)
>  			}
>  		}
>  		if (!this->badblock_pattern) {
> -			this->badblock_pattern = (mtd->writesize > 512) ? &largepage_flashbased : &smallpage_flashbased;
> +			this->badblock_pattern = (mtd->writesize > 512) ?
> +				&largepage_flashbased : &smallpage_flashbased;

I think it is cleaner to use normal
if (mtd->writesize > 512)
	this->badblock_pattern = &largepage_flashbased;
else
	this->badblock_pattern = &smallpage_flashbased;

No?

>  int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
>  {
>  	struct nand_chip *this = mtd->priv;
> @@ -1447,7 +1447,8 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
>  	block = (int)(offs >> (this->bbt_erase_shift - 1));
>  	res = (this->bbt[block >> 3] >> (block & 0x06)) & 0x03;
>  
> -	DEBUG(MTD_DEBUG_LEVEL2, "nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
> +	DEBUG(MTD_DEBUG_LEVEL2, "nand_isbad_bbt(): bbt info for "
> +	      "offs 0x%08x: (block %d) 0x%02x\n",
>  	      (unsigned int)offs, block >> 1, res);
>  
>  	switch ((int)res) {

If you'd will to love MTD a bit more, you could kill all these ugly
DEBUG() things and use dev_dbg instead. dev_dbg is way better, and LWM
made a nice article about this: http://lwn.net/Articles/434833/

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
