Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJbvI-0001FE-El
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 10:15:58 +0000
Date: Mon, 5 Nov 2018 11:15:44 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: boris.brezillon@free-electrons.com, Hauke Mehrtens <hauke@hauke-m.de>,
 stable@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Koen Vandeputte
 <koen.vandeputte@ncentric.com>, Fabio Bettoni <fbettoni@gmail.com>
Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
 do_write_oneword() to use chip_good()
Message-ID: <20181105111544.4e511ed9@bbrezillon>
In-Reply-To: <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
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

On Fri, 26 Oct 2018 01:32:09 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> In OpenWrt Project the flash write error caused on some products.

It's okay to mention that the issue was discovered by the OpenWRT team,
but I'd rephrase it differently.

"As reported by the OpenWRT team, write requests sometimes fail on some
platforms".

> Also the issue can be fixed by using chip_good() instead of chip_ready().
> The chip_ready() just checks the value from flash memory twice.
> And the chip_good() checks the value with the expected value.
> Probably the issue can be fixed as checked correctly by the chip_good().
> So change to use chip_good() instead of chip_ready().

Well, that's not really explaining why you think chip_good() should be
used instead of chip_ready(). So I went on and looked at the
chip_good(), chip_ready() and do_write_oneword() implementation, and
also looked at users of do_write_oneword(). It seems this function is
used to write data to the flash, and apparently the "one bit should
toggle to reflect a busy state" does not apply when writing things to
the memory array (it's probably working for other CFI commands, but I
guess it takes more time to actually change the level of a NOR cell,
hence the result of 2 identical reads does not mean that the write is
done).

Also, it seems that cmdset_0001 is not implementing chip_ready() the
same way, and I wonder if cmdset_0002 implementation is correct to
start with. Or maybe I don't get what chip_ready() is for.

Anyway, this is the sort of clarification I'd like to have.

> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>

Has the patch really gone through all those people? SoB is used when you
apply a patch in your tree or when you're the original author.

> Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>

Not sure we want to add new undocumented tags, but you can mention
that all those people helped you find/debug the issue. They can also
add their Reviewed-by/Tested-by if they like.

> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> ---
> Changes since v2:
> - Just update the commit message for the comment.
> 
> Changes since v1:
> - Just update the commit message.
> 
> Background:
> This is required for OpenWrt Project to result the flash write issue as
> below patche.
> <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>
> 
> Also the original patch in OpenWRT is below.
> <https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>
> 
> The reason to use chip_good() is that just actually fix the issue.
> And also in the past I had fixed the erase function also as same way by the
> patch below.
>   <https://patchwork.ozlabs.org/patch/922656/>
>     Note: The reason for the patch for erase is same.
> 
> In my understanding the chip_ready() is just checked the value twice from
> flash.
> So I think that sometimes incorrect value is read twice and it is depended
> on the flash device behavior but not sure..
> 
> So change to use chip_good() instead of chip_ready().
> 
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

Not a big deal, but I'd prefer to not have coding style changes mixed
with functional changes (in other words, you can drop the addition of
blanks lines around xip_enable()).

>   op_done:
>  	if (mode == FL_OTP_WRITE)
>  		otp_exit(map, chip, adr, map_bankwidth(map));
