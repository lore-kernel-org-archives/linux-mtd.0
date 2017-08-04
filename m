Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddY2f-0004GH-Ur
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 08:33:11 +0000
Date: Fri, 4 Aug 2017 10:32:37 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/3] mtd: nand: Remove support for block locking/unlocking
Message-ID: <20170804103237.58eed266@bbrezillon>
In-Reply-To: <1494886663-20700-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1494886663-20700-1-git-send-email-boris.brezillon@free-electrons.com>
 <1494886663-20700-3-git-send-email-boris.brezillon@free-electrons.com>
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

On Tue, 16 May 2017 00:17:42 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Commit 7d70f334ad2b ("mtd: nand: add lock/unlock routines") introduced
> support for the Micron LOCK/UNLOCK commands but no one ever used the
> nand_lock/unlock() functions.
> 
> Remove support for these vendor-specific operations from the core. If
> one ever wants to add them back they should be put in nand_micron.c and
> mtd->_lock/_unlock should be directly assigned from there instead of
> exporting the functions.

Applied.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 172 -------------------------------------------
>  include/linux/mtd/nand.h     |  10 ---
>  2 files changed, 182 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 6b98c032ef50..6eba5ba51c90 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1215,178 +1215,6 @@ int nand_reset(struct nand_chip *chip, int chipnr)
>  }
>  
>  /**
> - * __nand_unlock - [REPLACEABLE] unlocks specified locked blocks
> - * @mtd: mtd info
> - * @ofs: offset to start unlock from
> - * @len: length to unlock
> - * @invert: when = 0, unlock the range of blocks within the lower and
> - *                    upper boundary address
> - *          when = 1, unlock the range of blocks outside the boundaries
> - *                    of the lower and upper boundary address
> - *
> - * Returs unlock status.
> - */
> -static int __nand_unlock(struct mtd_info *mtd, loff_t ofs,
> -					uint64_t len, int invert)
> -{
> -	int ret = 0;
> -	int status, page;
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -
> -	/* Submit address of first page to unlock */
> -	page = ofs >> chip->page_shift;
> -	chip->cmdfunc(mtd, NAND_CMD_UNLOCK1, -1, page & chip->pagemask);
> -
> -	/* Submit address of last page to unlock */
> -	page = (ofs + len) >> chip->page_shift;
> -	chip->cmdfunc(mtd, NAND_CMD_UNLOCK2, -1,
> -				(page | invert) & chip->pagemask);
> -
> -	/* Call wait ready function */
> -	status = chip->waitfunc(mtd, chip);
> -	/* See if device thinks it succeeded */
> -	if (status & NAND_STATUS_FAIL) {
> -		pr_debug("%s: error status = 0x%08x\n",
> -					__func__, status);
> -		ret = -EIO;
> -	}
> -
> -	return ret;
> -}
> -
> -/**
> - * nand_unlock - [REPLACEABLE] unlocks specified locked blocks
> - * @mtd: mtd info
> - * @ofs: offset to start unlock from
> - * @len: length to unlock
> - *
> - * Returns unlock status.
> - */
> -int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> -{
> -	int ret = 0;
> -	int chipnr;
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -
> -	pr_debug("%s: start = 0x%012llx, len = %llu\n",
> -			__func__, (unsigned long long)ofs, len);
> -
> -	if (check_offs_len(mtd, ofs, len))
> -		return -EINVAL;
> -
> -	/* Align to last block address if size addresses end of the device */
> -	if (ofs + len == mtd->size)
> -		len -= mtd->erasesize;
> -
> -	nand_get_device(mtd, FL_UNLOCKING);
> -
> -	/* Shift to get chip number */
> -	chipnr = ofs >> chip->chip_shift;
> -
> -	/*
> -	 * Reset the chip.
> -	 * If we want to check the WP through READ STATUS and check the bit 7
> -	 * we must reset the chip
> -	 * some operation can also clear the bit 7 of status register
> -	 * eg. erase/program a locked block
> -	 */
> -	nand_reset(chip, chipnr);
> -
> -	chip->select_chip(mtd, chipnr);
> -
> -	/* Check, if it is write protected */
> -	if (nand_check_wp(mtd)) {
> -		pr_debug("%s: device is write protected!\n",
> -					__func__);
> -		ret = -EIO;
> -		goto out;
> -	}
> -
> -	ret = __nand_unlock(mtd, ofs, len, 0);
> -
> -out:
> -	chip->select_chip(mtd, -1);
> -	nand_release_device(mtd);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(nand_unlock);
> -
> -/**
> - * nand_lock - [REPLACEABLE] locks all blocks present in the device
> - * @mtd: mtd info
> - * @ofs: offset to start unlock from
> - * @len: length to unlock
> - *
> - * This feature is not supported in many NAND parts. 'Micron' NAND parts do
> - * have this feature, but it allows only to lock all blocks, not for specified
> - * range for block. Implementing 'lock' feature by making use of 'unlock', for
> - * now.
> - *
> - * Returns lock status.
> - */
> -int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> -{
> -	int ret = 0;
> -	int chipnr, status, page;
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -
> -	pr_debug("%s: start = 0x%012llx, len = %llu\n",
> -			__func__, (unsigned long long)ofs, len);
> -
> -	if (check_offs_len(mtd, ofs, len))
> -		return -EINVAL;
> -
> -	nand_get_device(mtd, FL_LOCKING);
> -
> -	/* Shift to get chip number */
> -	chipnr = ofs >> chip->chip_shift;
> -
> -	/*
> -	 * Reset the chip.
> -	 * If we want to check the WP through READ STATUS and check the bit 7
> -	 * we must reset the chip
> -	 * some operation can also clear the bit 7 of status register
> -	 * eg. erase/program a locked block
> -	 */
> -	nand_reset(chip, chipnr);
> -
> -	chip->select_chip(mtd, chipnr);
> -
> -	/* Check, if it is write protected */
> -	if (nand_check_wp(mtd)) {
> -		pr_debug("%s: device is write protected!\n",
> -					__func__);
> -		status = MTD_ERASE_FAILED;
> -		ret = -EIO;
> -		goto out;
> -	}
> -
> -	/* Submit address of first page to lock */
> -	page = ofs >> chip->page_shift;
> -	chip->cmdfunc(mtd, NAND_CMD_LOCK, -1, page & chip->pagemask);
> -
> -	/* Call wait ready function */
> -	status = chip->waitfunc(mtd, chip);
> -	/* See if device thinks it succeeded */
> -	if (status & NAND_STATUS_FAIL) {
> -		pr_debug("%s: error status = 0x%08x\n",
> -					__func__, status);
> -		ret = -EIO;
> -		goto out;
> -	}
> -
> -	ret = __nand_unlock(mtd, ofs, len, 0x1);
> -
> -out:
> -	chip->select_chip(mtd, -1);
> -	nand_release_device(mtd);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(nand_lock);
> -
> -/**
>   * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
>   * @buf: buffer to test
>   * @len: buffer length
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index f01991649118..9ca3ad20faea 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -44,12 +44,6 @@ void nand_release(struct mtd_info *mtd);
>  /* Internal helper for board drivers which need to override command function */
>  void nand_wait_ready(struct mtd_info *mtd);
>  
> -/* locks all blocks present in the device */
> -int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
> -
> -/* unlocks specified locked blocks */
> -int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
> -
>  /* The maximum number of NAND chips in an array */
>  #define NAND_MAX_CHIPS		8
>  
> @@ -89,10 +83,6 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  #define NAND_CMD_SET_FEATURES	0xef
>  #define NAND_CMD_RESET		0xff
>  
> -#define NAND_CMD_LOCK		0x2a
> -#define NAND_CMD_UNLOCK1	0x23
> -#define NAND_CMD_UNLOCK2	0x24
> -
>  /* Extended commands for large page devices */
>  #define NAND_CMD_READSTART	0x30
>  #define NAND_CMD_RNDOUTSTART	0xE0
