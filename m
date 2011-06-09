Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUYzV-0000iN-LY
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 06:45:18 +0000
Received: by ewy3 with SMTP id 3so532626ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 23:45:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 09:40:57 +0300
Message-ID: <1307601657.7374.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 11:25 -0700, Brian Norris wrote:
> Also fix some punctuation, indentation, and capitalization that went
> along with the affected lines.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c |   65 ++++++++++++++++++++----------------------
>  drivers/mtd/nand/nand_bbt.c  |   39 ++++++++++++-------------
>  2 files changed, 50 insertions(+), 54 deletions(-)
> 

Pushed with few tweaks, thanks!

>  	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
> -		printk(KERN_INFO "%s: second ID read did not match "
> +		pr_info("%s: second ID read did not match "
>  		       "%02x,%02x against %02x,%02x\n", __func__,
>  		       *maf_id, *dev_id, id_data[0], id_data[1]);

This was not properly aligned - I've aligned it:

                pr_info("%s: second ID read did not match "
                        "%02x,%02x against %02x,%02x\n", __func__,
                        *maf_id, *dev_id, id_data[0], id_data[1]);


>  		return ERR_PTR(-ENODEV);
> @@ -3068,10 +3067,10 @@ ident_done:
>  	 * chip correct!
>  	 */
>  	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
> -		printk(KERN_INFO "NAND device: Manufacturer ID:"
> +		pr_info("NAND device: Manufacturer ID:"
>  		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
>  		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
> -		printk(KERN_WARNING "NAND bus width %d instead %d bit\n",
> +		pr_warning("NAND bus width %d instead %d bit\n",
>  		       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
>  		       busw ? 16 : 8);

And this, I've changed it:

                pr_info("NAND device: Manufacturer ID:"
                        " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
                        *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
                pr_warning("NAND bus width %d instead %d bit\n",
                           (chip->options & NAND_BUSWIDTH_16) ? 16 : 8, 
                           busw ? 16 : 8);


> -					printk(KERN_DEBUG "nand_read_bbt: Reserved block at 0x%012llx\n",
> +					pr_debug("nand_read_bbt: Reserved block at 0x%012llx\n",
>  					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
>  					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
>  					mtd->ecc_stats.bbtblocks++;
> @@ -229,7 +229,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
>  				 * Leave it for now, if it's matured we can
>  				 * move this message to MTD_DEBUG_LEVEL0.
>  				 */
> -				printk(KERN_DEBUG "nand_read_bbt: Bad block at 0x%012llx\n",
> +				pr_debug("nand_read_bbt: Bad block at 0x%012llx\n",
>  				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);

Here I aligned lines too. They are also quite long, but that would need
to put this piece of code to a separate function, which is a different
story.

>  				/* Factory marked bad or worn out? */
>  				if (tmp == 0)
> @@ -383,7 +383,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
>  		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
>  			      mtd->writesize, td);
>  		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
> -		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
> +		pr_debug("Bad block table at page %d, version 0x%02X\n",
>  		       td->pages[0], td->version[0]);

Was not aligned.

>  	}
>  
> @@ -392,7 +392,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
>  		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
>  			      mtd->writesize, td);
>  		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
> -		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
> +		pr_debug("Bad block table at page %d, version 0x%02X\n",
>  		       md->pages[0], md->version[0]);

Was not aligned.

> +			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
>  			       chip + 1, this->numchips);

And this and other, I amended them.


> +					pr_info("nand_bbt: Error "
>  					       "reading block for writing "
>  					       "the bad block table\n");
>  					return res;
>  				}
> -				printk(KERN_WARNING "nand_bbt: ECC error "
> +				pr_warn("nand_bbt: ECC error "
>  				       "while reading block for writing "
>  				       "bad block table\n");

Tweaked these 2.

Plus some other minor tweaks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
