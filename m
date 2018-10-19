Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDQAX-0000Zd-V2
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:30:08 +0000
Date: Fri, 19 Oct 2018 10:29:54 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: boris.brezillon@free-electrons.com, Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: cfi_cmdset_0002: Change do_write_oneword() to
 use chip_good()
Message-ID: <20181019102954.23e26c2e@bbrezillon>
In-Reply-To: <20181019081320.12843-2-ikegami@allied-telesis.co.jp>
References: <20181019081320.12843-1-ikegami@allied-telesis.co.jp>
 <20181019081320.12843-2-ikegami@allied-telesis.co.jp>
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

On Fri, 19 Oct 2018 17:13:18 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> This is required for OpenWrt Project to result the flash write issue as
> below patche.
> 
>   <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>

This part is not really explaining why this fix is needed. Can you
please give more details about why chip_good() should be used instead of
chip_ready().

> 
> So change to use chip_good() instead of chip_ready().
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-mtd@lists.infradead.org

Would be great to have Fixes and Cc-stable tags here.

> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 72428b6bfc47..251c9e1675bd 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1627,31 +1627,37 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  			continue;
>  		}
>  
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
> +		if (chip_good(map, adr, datum))
> +			break;
> +
> +		if (time_after(jiffies, timeo)){
>  			xip_enable(map, chip, adr);
>  			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
>  			xip_disable(map, chip, adr);
> +			ret = -EIO;
>  			break;
>  		}
>  
> -		if (chip_ready(map, adr))
> -			break;
> -
>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
>  	}
> +
>  	/* Did we succeed? */
> -	if (!chip_good(map, adr, datum)) {
> +	if (ret) {
>  		/* reset on all failures. */
>  		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
> -		if (++retry_cnt <= MAX_RETRIES)
> +		if (++retry_cnt <= MAX_RETRIES) {
> +			ret = 0;
>  			goto retry;
> +		}
>  
>  		ret = -EIO;
>  	}
> +
>  	xip_enable(map, chip, adr);
> +
>   op_done:
>  	if (mode == FL_OTP_WRITE)
>  		otp_exit(map, chip, adr, map_bankwidth(map));
