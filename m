Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NGTgw-0000sA-O5
	for linux-mtd@lists.infradead.org; Fri, 04 Dec 2009 08:39:11 +0000
Subject: Re: [RFC][PATCH] Add NAND lock/unlock routines
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Dec 2009 10:38:45 +0200
Message-Id: <1259915925.8673.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, some cosmetic comments:

On Wed, 2009-12-02 at 19:54 +0530, Vimal Singh wrote:
> I am not sure how useful it will be, but still here is a patch for review.
> -vimal
> 
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Tue, 24 Nov 2009 18:26:43 +0530
> Subject: [PATCH] Add NAND lock/unlock routines
> 
> At least 'Micron' NAND parts have lock/unlock feature.
> Adding routines for this.
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c |  217 +++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/nand.h     |    6 +
>  2 files changed, 221 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 2957cc7..e447c24 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -757,6 +757,218 @@ static int nand_wait(struct mtd_info *mtd,
> struct nand_chip *chip)
>  }
> 
>  /**
> + * __nand_unlock - [REPLACABLE] unlocks specified locked blockes
> + *
> + * @param mtd - mtd info
> + * @param ofs - offset to start unlock from
> + * @param len - length to unlock
> + * @invert -  when = 0, unlock the range of blocks within the lower and
> + *                      upper boundary address
> + *            whne = 1, unlock the range of blocks outside the boundaries
> + *                      of the lower and upper boundary address
> + *
> + * @return - unlock status
> + */
> +static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
> +					uint64_t len, int invert)
> +{
> +	int ret = 0;
> +	int status, page;
> +	struct nand_chip *chip = mtd->priv;
> +
> +	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
> +			__func__, (unsigned long long)ofs, len);
> +
> +	/* Submit address of first page to unlock */
> +	page = (int)(ofs >> chip->page_shift);

The compiler will automatically cast the result to int I believe.

> +	chip->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & chip->pagemask);
> +
> +	/* Submit address of last page to unlock */
> +	page = (int)((ofs + len) >> chip->page_shift);
Ditto.

> +	chip->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1,
> +				((page | invert) & chip->pagemask));
> +
> +	/* Call wait ready function */
> +	status = chip->waitfunc(mtd, chip);
> +	udelay(1000);
> +	/* See if device thinks it succeeded */
> +	if (status & 0x01) {
> +		/* There was an error */
> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Error status = 0x%08x\n",
> +					__func__, status);
> +		ret = -EIO;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * nand_unlock - [REPLACABLE] unlocks specified locked blockes
> + *
> + * @param mtd - mtd info
> + * @param ofs - offset to start unlock from
> + * @param len - length to unlock
> + *
> + * @return - unlock status
> + */
> +static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +	int ret = 0;
> +	int chipnr;
> +	struct nand_chip *chip = mtd->priv;
> +
> +	/* Start address must align on block boundary */
> +	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Unaligned address\n", __func__);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Length must align on block boundary */
> +	if (len & ((1 << chip->phys_erase_shift) - 1)) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Length not block aligned\n",
> +					__func__);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Do not allow past end of device */
> +	if ((ofs + len) > mtd->size) {

() around ofs + len look a bit silly for me

> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Past end of device\n",
> +					__func__);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Align to last block address if size addresses end of the device */
> +	if ((ofs + len) == mtd->size)
> +		len -= mtd->erasesize;

And here
> +
> +	/* Grab the lock and see if the device is available */
> +	nand_get_device(chip, mtd, FL_UNLOCKING);
> +
> +	/* Shift to get chip number */
> +	chipnr = (int)(ofs >> chip->chip_shift);

I do not think explicit cast is needed.

> +
> +	/* Select the NAND device */
> +	chip->select_chip(mtd, chipnr);
> +
> +	/* Check, if it is write protected */
> +	if (nand_check_wp(mtd)) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Device is write protected!!!\n",
> +					__func__);
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	ret = __nand_unlock(mtd, ofs, len, 0);
> +
> +out:
> +	/* de-select the NAND device */
> +	chip->select_chip(mtd, -1);
> +
> +	/* Deselect and wake up anyone waiting on the device */
> +	nand_release_device(mtd);
> +
> +	return ret;
> +}

...

And take a look at the same things in the rest of the code.

> +/**
>   * nand_read_page_raw - [Intern] read raw page data without ecc
>   * @mtd:	mtd info structure
>   * @chip:	nand chip info structure
> @@ -2257,6 +2469,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct
> erase_info *instr,
> 
>  		status = chip->waitfunc(mtd, chip);
> 
> +printk(KERN_INFO"VIMAL: status: 0x%x\n",status);

Forgot to remove a debugging printk?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
