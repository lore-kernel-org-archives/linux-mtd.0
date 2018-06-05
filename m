Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQDU5-0007DJ-V4
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2018 15:02:59 +0000
Date: Tue, 5 Jun 2018 17:02:13 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: cfi_cmdset_0002: fix SEGV unlocking multiple
 chips
Message-ID: <20180605170213.7c937bf4@bbrezillon>
In-Reply-To: <20180605140710.8624-1-joakim.tjernlund@infinera.com>
References: <20180605140710.8624-1-joakim.tjernlund@infinera.com>
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

On Tue,  5 Jun 2018 16:07:09 +0200
Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:

> cfi_ppb_unlock() tries to relock all sectors that was locked before
> unlocking the whole chip.
> This locking used the chip start address + the FULL offset from the
> first flash chip, thereby forming an illegal address. Correct by using
> the chip offset(adr).
> 
> In addition, do_ppb_xxlock() failed to add chip->start when
> quering for lock status(and chip_ready test),
> which caused false status reports.
> Fix by adding adr += chip->start and adjust call sites accordingly.
> 
> Fixes: 1648eaaa1575e

Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")

And you probably want to add

Cc: stable@vger.kernel.org

> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 5e526aec66f0..c74c53b886be 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2535,7 +2535,7 @@ static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  
>  struct ppb_lock {
>  	struct flchip *chip;
> -	loff_t offset;
> +	unsigned long adr;
>  	int locked;
>  };
>  
> @@ -2553,8 +2553,9 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
>  	unsigned long timeo;
>  	int ret;
>  
> +	adr += chip->start;
>  	mutex_lock(&chip->mutex);
> -	ret = get_chip(map, chip, adr + chip->start, FL_LOCKING);
> +	ret = get_chip(map, chip, adr, FL_LOCKING);
>  	if (ret) {
>  		mutex_unlock(&chip->mutex);
>  		return ret;
> @@ -2572,8 +2573,8 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
>  
>  	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
>  		chip->state = FL_LOCKING;
> -		map_write(map, CMD(0xA0), chip->start + adr);
> -		map_write(map, CMD(0x00), chip->start + adr);
> +		map_write(map, CMD(0xA0), adr);
> +		map_write(map, CMD(0x00), adr);
>  	} else if (thunk == DO_XXLOCK_ONEBLOCK_UNLOCK) {
>  		/*
>  		 * Unlocking of one specific sector is not supported, so we
> @@ -2611,7 +2612,7 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
>  	map_write(map, CMD(0x00), chip->start);
>  
>  	chip->state = FL_READY;
> -	put_chip(map, chip, adr + chip->start);
> +	put_chip(map, chip, adr);
>  	mutex_unlock(&chip->mutex);
>  
>  	return ret;
> @@ -2670,7 +2671,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>  		 */
>  		if ((adr < ofs) || (adr >= (ofs + len))) {
>  			sect[sectors].chip = &cfi->chips[chipnum];
> -			sect[sectors].offset = offset;
> +			sect[sectors].adr = adr;
>  			sect[sectors].locked = do_ppb_xxlock(
>  				map, &cfi->chips[chipnum], adr, 0,
>  				DO_XXLOCK_ONEBLOCK_GETLOCK);
> @@ -2686,7 +2687,6 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>  		if (adr >> cfi->chipshift) {
>  			adr = 0;
>  			chipnum++;
> -
>  			if (chipnum >= cfi->numchips)
>  				break;
>  		}
> @@ -2714,7 +2714,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>  	 */
>  	for (i = 0; i < sectors; i++) {
>  		if (sect[i].locked)
> -			do_ppb_xxlock(map, sect[i].chip, sect[i].offset, 0,
> +			do_ppb_xxlock(map, sect[i].chip, sect[i].adr, 0,
>  				      DO_XXLOCK_ONEBLOCK_LOCK);
>  	}
>  
