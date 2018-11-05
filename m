Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJezU-0001pI-Pa
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 13:32:30 +0000
Date: Mon, 5 Nov 2018 14:32:17 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: boris.brezillon@free-electrons.com, Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 05/11] mtd: cfi_cmdset_0002: Split do_write_oneword()
 to reduce function size
Message-ID: <20181105143217.1a25846b@bbrezillon>
In-Reply-To: <20181025163219.25788-6-ikegami@allied-telesis.co.jp>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-6-ikegami@allied-telesis.co.jp>
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

On Fri, 26 Oct 2018 01:32:13 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> Reduce the size of do_write_oneword() by extracting a helper function
> for the hardware access.
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> Changes since v2:
> - Just update the commit message for the comment
> - Add Reviewed-by tag.
> 
> Changes since v1:
> - Add the patch.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 89 ++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index a3fa2d7b1ba0..ae2d8bd7154e 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1547,11 +1547,10 @@ static int cfi_amdstd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
>  				   do_otp_lock, 1);
>  }
>  
> -static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
> -				     unsigned long adr, map_word datum,
> -				     int mode)
> +static int __xipram do_write_oneword_once(struct map_info *map, struct flchip *chip,
> +					  unsigned long adr, map_word datum,
> +					  int mode, struct cfi_private *cfi)
>  {
> -	struct cfi_private *cfi = map->fldrv_priv;
>  	unsigned long timeo = jiffies + HZ;
>  	/*
>  	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
> @@ -1564,42 +1563,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  	 */
>  	unsigned long uWriteTimeout = (HZ / 1000) + 1;
>  	int ret = 0;
> -	map_word oldd;
> -	int retry_cnt = 0;
> -
> -	adr += chip->start;
> -
> -	mutex_lock(&chip->mutex);
> -	ret = get_chip(map, chip, adr, mode);
> -	if (ret) {
> -		mutex_unlock(&chip->mutex);
> -		return ret;
> -	}
>  
> -	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> -		 __func__, adr, datum.x[0]);
> -
> -	if (mode == FL_OTP_WRITE)
> -		otp_enter(map, chip, adr, map_bankwidth(map));
> -
> -	/*
> -	 * Check for a NOP for the case when the datum to write is already
> -	 * present - it saves time and works around buggy chips that corrupt
> -	 * data at other locations when 0xff is written to a location that
> -	 * already contains 0xff.
> -	 */
> -	oldd = map_read(map, adr);
> -	if (map_word_equal(map, oldd, datum)) {
> -		pr_debug("MTD %s(): NOP\n",
> -		       __func__);
> -		goto op_done;
> -	}
> -
> -	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
> -	ENABLE_VPP(map);
> -	xip_disable(map, chip, adr);
> -
> - retry:
>  	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
>  	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
>  	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
> @@ -1642,6 +1606,53 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  		UDELAY(map, chip, adr, 1);
>  	}
>  
> +	return ret;
> +}
> +
> +static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
> +				     unsigned long adr, map_word datum,
> +				     int mode)
> +{
> +	struct cfi_private *cfi = map->fldrv_priv;
> +	int ret = 0;
> +	map_word oldd;
> +	int retry_cnt = 0;
> +
> +	adr += chip->start;
> +
> +	mutex_lock(&chip->mutex);
> +	ret = get_chip(map, chip, adr, mode);
> +	if (ret) {
> +		mutex_unlock(&chip->mutex);
> +		return ret;
> +	}
> +
> +	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> +		 __func__, adr, datum.x[0]);
> +
> +	if (mode == FL_OTP_WRITE)
> +		otp_enter(map, chip, adr, map_bankwidth(map));
> +
> +	/*
> +	 * Check for a NOP for the case when the datum to write is already
> +	 * present - it saves time and works around buggy chips that corrupt
> +	 * data at other locations when 0xff is written to a location that
> +	 * already contains 0xff.
> +	 */
> +	oldd = map_read(map, adr);
> +	if (map_word_equal(map, oldd, datum)) {
> +		pr_debug("MTD %s(): NOP\n",
> +		       __func__);
> +		goto op_done;
> +	}
> +
> +	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
> +	ENABLE_VPP(map);
> +	xip_disable(map, chip, adr);
> +
> + retry:
> +	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
> +
>  	/* Did we succeed? */

We usually place the ret code check just after the call to the function
returning this ret code:

	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
	if (ret) {
		...
	}

And I don't think we need the "Did we succeed?" comment, since it's
pretty obvious what this check does.

One extra thing you could do to make this piece of code more readable
is use a for loop for the retry logic:

	for (retry_count = 0; retry_count < MAX_RETRIES; retry_count++)	{
		ret = do_write_oneword_once(map, chip, adr, datum,
					    mode, cfi);
		if (!ret)
			break;

		/* reset on all failures. */
		map_write(map, CMD(0xF0), chip->start);
                /* FIXME - should have reset delay before continuing */
	}

>  	if (ret) {
>  		/* reset on all failures. */
