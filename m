Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZSUB-0006cy-Qu
 for linux-mtd@lists.infradead.org; Sun, 13 Apr 2014 22:02:49 +0000
From: Marek Vasut <marex@denx.de>
To: Austin Boyle <boyle.austin@gmail.com>
Subject: Re: [PATCH v2] mtd: m25p80: Calculate flash block protect bits based
 on number of sectors
Date: Sun, 13 Apr 2014 19:24:03 +0200
References: <alpine.DEB.2.02.1404062115570.19515@austin-Satellite-L510>
In-Reply-To: <alpine.DEB.2.02.1404062115570.19515@austin-Satellite-L510>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404131924.03967.marex@denx.de>
Cc: Angus Clark <angus.clark@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gerlando Falauto <gerlando.falauto@keymile.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday, April 06, 2014 at 01:19:59 PM, Austin Boyle wrote:
[...]

> @@ -752,24 +773,18 @@ static int m25p80_lock(struct mtd_info *mtd, loff_t
> ofs, uint64_t len)
> 
>  	status_old = read_sr(flash);
> 
> -	if (offset < flash->mtd.size-(flash->mtd.size/2))
> -		status_new = status_old | SR_BP2 | SR_BP1 | SR_BP0;
> -	else if (offset < flash->mtd.size-(flash->mtd.size/4))
> -		status_new = (status_old & ~SR_BP0) | SR_BP2 | SR_BP1;
> -	else if (offset < flash->mtd.size-(flash->mtd.size/8))
> -		status_new = (status_old & ~SR_BP1) | SR_BP2 | SR_BP0;
> -	else if (offset < flash->mtd.size-(flash->mtd.size/16))
> -		status_new = (status_old & ~(SR_BP0|SR_BP1)) | SR_BP2;
> -	else if (offset < flash->mtd.size-(flash->mtd.size/32))
> -		status_new = (status_old & ~SR_BP2) | SR_BP1 | SR_BP0;
> -	else if (offset < flash->mtd.size-(flash->mtd.size/64))
> -		status_new = (status_old & ~(SR_BP2|SR_BP0)) | SR_BP1;
> -	else
> -		status_new = (status_old & ~(SR_BP2|SR_BP1)) | SR_BP0;
> +	for (lock_bits = 1; lock_bits < 7; lock_bits++) {
> +		protected_area_start = flash->mtd.size -
> +					get_protected_area(flash, lock_bits);
> +		if (offset >= protected_area_start)
> +			break;
> +	}
> +
> +	status_new = (status_old & ~SR_BP_BIT_MASK) |
> +			((lock_bits << SR_BP_BIT_OFFSET) & SR_BP_BIT_MASK);

This portion of code looks like a duplicate of ...

>  	/* Only modify protection if it will not unlock other areas */
> -	if ((status_new&(SR_BP2|SR_BP1|SR_BP0)) >
> -					(status_old&(SR_BP2|SR_BP1|SR_BP0))) {
> +	if ((status_new & SR_BP_BIT_MASK) > (status_old & SR_BP_BIT_MASK)) {
>  		write_enable(flash);
>  		if (write_sr(flash, status_new) < 0) {
>  			res = 1;
> @@ -786,6 +801,8 @@ static int m25p80_unlock(struct mtd_info *mtd, loff_t
> ofs, uint64_t len) struct m25p *flash = mtd_to_m25p(mtd);
>  	uint32_t offset = ofs;
>  	uint8_t status_old, status_new;
> +	uint8_t lock_bits;
> +	uint32_t protected_area_start;
>  	int res = 0;
> 
>  	mutex_lock(&flash->lock);
> @@ -797,24 +814,19 @@ static int m25p80_unlock(struct mtd_info *mtd, loff_t
> ofs, uint64_t len)
> 
>  	status_old = read_sr(flash);
> 
> -	if (offset+len > flash->mtd.size-(flash->mtd.size/64))
> -		status_new = status_old & ~(SR_BP2|SR_BP1|SR_BP0);
> -	else if (offset+len > flash->mtd.size-(flash->mtd.size/32))
> -		status_new = (status_old & ~(SR_BP2|SR_BP1)) | SR_BP0;
> -	else if (offset+len > flash->mtd.size-(flash->mtd.size/16))
> -		status_new = (status_old & ~(SR_BP2|SR_BP0)) | SR_BP1;
> -	else if (offset+len > flash->mtd.size-(flash->mtd.size/8))
> -		status_new = (status_old & ~SR_BP2) | SR_BP1 | SR_BP0;
> -	else if (offset+len > flash->mtd.size-(flash->mtd.size/4))
> -		status_new = (status_old & ~(SR_BP0|SR_BP1)) | SR_BP2;
> -	else if (offset+len > flash->mtd.size-(flash->mtd.size/2))
> -		status_new = (status_old & ~SR_BP1) | SR_BP2 | SR_BP0;
> -	else
> -		status_new = (status_old & ~SR_BP0) | SR_BP2 | SR_BP1;
> +	for (lock_bits = 1; lock_bits < 7; lock_bits++) {
> +		protected_area_start = flash->mtd.size -
> +					get_protected_area(flash, lock_bits);
> +		if (offset+len >= protected_area_start)
> +			break;
> +	}
> +	lock_bits--;
> +
> +	status_new = (status_old & ~SR_BP_BIT_MASK) |
> +			((lock_bits << SR_BP_BIT_OFFSET) & SR_BP_BIT_MASK);

... this here (if you don't consider the lock_bits--) . Why don't we move this 
into a separate function to avoid the duplication?

>  	/* Only modify protection if it will not lock other areas */
> -	if ((status_new&(SR_BP2|SR_BP1|SR_BP0)) <
> -					(status_old&(SR_BP2|SR_BP1|SR_BP0))) {
> +	if ((status_new & SR_BP_BIT_MASK) < (status_old & SR_BP_BIT_MASK)) {
>  		write_enable(flash);
>  		if (write_sr(flash, status_new) < 0) {
>  			res = 1;
> @@ -826,6 +838,39 @@ err:	mutex_unlock(&flash->lock);
>  	return res;
>  }
> 
> +static int m25p80_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t
> len) +{
> +	struct m25p *flash = mtd_to_m25p(mtd);
> +	uint32_t offset = ofs;
> +	uint8_t status;
> +	uint8_t lock_bits;
> +	uint32_t protected_area_start;
> +	int res;
> +
> +	mutex_lock(&flash->lock);
> +	/* Wait until finished previous command */
> +	if (wait_till_ready(flash)) {
> +		mutex_unlock(&flash->lock);
> +		return -EBUSY;
> +	}
> +	status = read_sr(flash);
> +	mutex_unlock(&flash->lock);
> +
> +	lock_bits = ((status & SR_BP_BIT_MASK) >> SR_BP_BIT_OFFSET);

Excessive () , the outer ones are not needed.

> +
> +	protected_area_start = flash->mtd.size -
> +					get_protected_area(flash, lock_bits);

You might want to introduce some "get_protected_area_size()" here, since this is 
the third time I see this call.

Otherwise nice, thanks for cleaning this mess up, it really helps !
