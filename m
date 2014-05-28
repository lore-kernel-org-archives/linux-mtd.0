Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpXdW-0004wc-I7
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 06:46:54 +0000
Received: by mail-pa0-f47.google.com with SMTP id lf10so10426746pab.6
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 23:46:32 -0700 (PDT)
Date: Tue, 27 May 2014 23:46:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [RESEND PATCH v4 2/4] mtd: cfi_cmdset_0002: Invalidate cache
 after entering/exiting OTP memory
Message-ID: <20140528064628.GE5241@norris-Latitude-E6410>
References: <1399270469-31022-1-git-send-email-christian.riesch@omicron.at>
 <1d461044-07e9-48f2-a863-aa1920524b31@mary.at.omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d461044-07e9-48f2-a863-aa1920524b31@mary.at.omicron.at>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 05, 2014 at 08:14:27AM +0200, Christian Riesch wrote:
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1157,11 +1157,42 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
>  typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip,
>  			loff_t adr, size_t len, u_char *buf);
>  
> +static inline void otp_enter(struct map_info *map, struct flchip *chip,

Why is this function marked 'inline'? Is this to satisfy the comments
regarding CONFIG_MTD_XIP and inlining functions? That all looks highly
fragile ('inline' is not a guarantee, for instance). And does anyone
use CONFIG_MTD_XIP=y these days?

If there are no good reasons otherwise, I'd say this trips over Chapter
15 of Documentation/CodingStyle.

But if this is the only issue, then I'm OK taking the series as-is -- it
has been pending for a long time, as you note...

> +			     loff_t adr, size_t len)
> +{
> +	struct cfi_private *cfi = map->fldrv_priv;
> +
> +	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> +			 cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> +			 cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi,
> +			 cfi->device_type, NULL);
> +
> +	INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
> +}
> +
> +static inline void otp_exit(struct map_info *map, struct flchip *chip,

Same here.

> +			    loff_t adr, size_t len)
> +{
> +	struct cfi_private *cfi = map->fldrv_priv;
> +
> +	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> +			 cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> +			 cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi,
> +			 cfi->device_type, NULL);
> +	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi,
> +			 cfi->device_type, NULL);
> +
> +	INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
> +}
> +
>  static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
>  {
>  	DECLARE_WAITQUEUE(wait, current);
>  	unsigned long timeo = jiffies + HZ;
> -	struct cfi_private *cfi = map->fldrv_priv;
>  
>   retry:
>  	mutex_lock(&chip->mutex);

Brian
