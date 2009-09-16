Message-ID: <4AB1132D.30705@nokia.com>
Date: Wed, 16 Sep 2009 19:32:45 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "Korhonen Mika.2 (EXT-Ardites/Oulu)" <ext-mika.2.korhonen@nokia.com>
Subject: Re: [PATCH 1/2] MTD: OneNAND: move erase method to a separate function
References: <1251975273-12432-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-2-git-send-email-ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1251975273-12432-2-git-send-email-ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"dedekind@infradead.org" <dedekind@infradead.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
> Separate the actual execution of erase to a new function:
> onenand_single_block_erase()
> 
> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
> ---

The patch is fine but needs some minor style changes.

Also the patch description should explain that this is in
preparation for adding multiblock erase support.

>  drivers/mtd/onenand/onenand_base.c |  139 +++++++++++++++++++++--------------
>  1 files changed, 83 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index 6e82909..ce9f9a0 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2141,77 +2141,43 @@ static int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs, int allo
>  }
>  
>  /**
> - * onenand_erase - [MTD Interface] erase block(s)
> + * onenand_single_block_erase - [Internal] erase block(s) using regular erase

onenand_single_block_erase is a poor name because it sounds like it erases just one
block.  I suggest onenand_block_by_block_erase instead.

>   * @param mtd		MTD device structure
>   * @param instr		erase instruction
> + * @param region	erase region
>   *
> - * Erase one ore more blocks
> + * Erase one or more blocks one block at a time
>   */
> -static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
> +static int onenand_single_block_erase(struct mtd_info *mtd,
> +				      struct erase_info *instr,
> +				      struct mtd_erase_region_info *region)
>  {
>  	struct onenand_chip *this = mtd->priv;
> -	unsigned int block_size;
>  	loff_t addr = instr->addr;
> -	loff_t len = instr->len;
> -	int ret = 0, i;
> -	struct mtd_erase_region_info *region = NULL;
> +	int len = instr->len;
> +	unsigned int block_size;
>  	loff_t region_end = 0;
> +	int ret = 0;
>  
> -	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
> -
> -	/* Do not allow erase past end of device */
> -	if (unlikely((len + addr) > mtd->size)) {
> -		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
> -		return -EINVAL;
> -	}
> -
> -	if (FLEXONENAND(this)) {
> -		/* Find the eraseregion of this address */
> -		i = flexonenand_region(mtd, addr);
> -		region = &mtd->eraseregions[i];
> -
> +	if (region) {
> +		/* region is set for Flex-OneNAND */
>  		block_size = region->erasesize;
>  		region_end = region->offset + region->erasesize * region->numblocks;
> -
> -		/* Start address within region must align on block boundary.
> -		 * Erase region's start offset is always block start address.
> -		 */
> -		if (unlikely((addr - region->offset) & (block_size - 1))) {
> -			printk(KERN_ERR "onenand_erase: Unaligned address\n");
> -			return -EINVAL;
> -		}
>  	} else {
> -		block_size = 1 << this->erase_shift;
> -
> -		/* Start address must align on block boundary */
> -		if (unlikely(addr & (block_size - 1))) {
> -			printk(KERN_ERR "onenand_erase: Unaligned address\n");
> -			return -EINVAL;
> -		}
> -	}
> -
> -	/* Length must align on block boundary */
> -	if (unlikely(len & (block_size - 1))) {
> -		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
> -		return -EINVAL;
> +		block_size = (1 << this->erase_shift);

Better to pass block_size than to calculate it twice.

>  	}
>  
> -	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
> -
> -	/* Grab the lock and see if the device is available */
> -	onenand_get_device(mtd, FL_ERASING);
> -
> -	/* Loop throught the pages */
>  	instr->state = MTD_ERASING;
>  
> +	/* Loop through the blocks */
>  	while (len) {
>  		cond_resched();
>  
>  		/* Check if we have a bad block, we do not erase bad blocks */
>  		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
> -			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%012llx\n", (unsigned long long) addr);
> +			printk(KERN_WARNING "onenand_erase: attempt to erase a bad block at addr 0x%012llx\n", (unsigned long long) addr);

Messages refer to 'onenand_erase' but the function is now onenand_single_block_erase (or onenand_block_by_block_erase if you take my suggestion)

>  			instr->state = MTD_ERASE_FAILED;
> -			goto erase_exit;
> +			return -1;
>  		}
>  
>  		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);
> @@ -2222,10 +2188,10 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		/* Check, if it is write protected */
>  		if (ret) {
>  			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n",
> -						 onenand_block(this, addr));
> +			       onenand_block(this, addr));
>  			instr->state = MTD_ERASE_FAILED;
>  			instr->fail_addr = addr;
> -			goto erase_exit;
> +			return -1;
>  		}
>  
>  		len -= block_size;
> @@ -2235,24 +2201,85 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
>  			if (!len)
>  				break;
>  			region++;
> -
>  			block_size = region->erasesize;
>  			region_end = region->offset + region->erasesize * region->numblocks;
>  
>  			if (len & (block_size - 1)) {
>  				/* FIXME: This should be handled at MTD partitioning level. */
>  				printk(KERN_ERR "onenand_erase: Unaligned address\n");
> -				goto erase_exit;
> +				return -1;
>  			}
>  		}
> +	}
> +
> +	return 0;
> +}
> +
> +
> +/**
> + * onenand_erase - [MTD Interface] erase block(s)
> + * @param mtd		MTD device structure
> + * @param instr		erase instruction
> + *
> + * Erase one or more blocks
> + */
> +static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	unsigned int block_size;
> +	loff_t addr = instr->addr;
> +	loff_t len = instr->len;
> +	int ret = 0;
> +	struct mtd_erase_region_info *region = NULL;
> +	loff_t region_offset = 0;
>  
> +	DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);
> +
> +	/* Do not allow erase past end of device */
> +	if (unlikely((len + addr) > mtd->size)) {
> +		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
> +		return -EINVAL;
>  	}
>  
> -	instr->state = MTD_ERASE_DONE;
> +	if (FLEXONENAND(this)) {
> +		/* Find the eraseregion of this address */
> +		int i = flexonenand_region(mtd, addr);

A blank line is nice after declarations

> +		region = &mtd->eraseregions[i];
>  
> -erase_exit:
> +		block_size = region->erasesize;
>  
> -	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
> +		/* Start address within region must align on block boundary.
> +		 * Erase region's start offset is always block start address.
> +		 */
> +		region_offset = region->offset;
> +	} else {
> +		block_size = 1 << this->erase_shift;
> +	}
> +
> +	/* Start address must align on block boundary */
> +	if (unlikely((addr - region_offset) & (block_size - 1))) {
> +		printk(KERN_ERR "onenand_erase: Unaligned address\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Length must align on block boundary */
> +	if (unlikely(len & (block_size - 1))) {
> +		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
> +		return -EINVAL;
> +	}
> +
> +	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
> +
> +	/* Grab the lock and see if the device is available */
> +	onenand_get_device(mtd, FL_ERASING);
> +
> +	ret = onenand_single_block_erase(mtd, instr, region);
> +
> +	if (ret) {
> +		ret = -EIO;
> +	} else {
> +		instr->state = MTD_ERASE_DONE;
> +	}

{} not needed, although you could drop the whole thing if
onenand_single_block_erase returned -EIO on error instead
of -1 and set instr->state = MTD_ERASE_DONE before
returning 0.

>  
>  	/* Deselect and wake up anyone waiting on the device */
>  	onenand_release_device(mtd);
