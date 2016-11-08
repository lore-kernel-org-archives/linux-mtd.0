Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3w4o-0001wl-G2
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2016 02:23:55 +0000
Received: by mail-pf0-x242.google.com with SMTP id 144so9297062pfv.0
 for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2016 18:23:32 -0800 (PST)
Date: Mon, 7 Nov 2016 18:23:30 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 David Woodhouse <dwmw2@infradead.org>,
 Frans Klaver <fransklaver@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use uncached MMIO access for BCM53573
Message-ID: <20161108022330.GA119161@google.com>
References: <1471263690-32512-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1471263690-32512-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Aug 15, 2016 at 02:21:28PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> BCM53573 is a new series of Broadcom's SoCs. It's based on ARM and uses
> this old ChipCommon-based flash access. Early tests resulted in flash
> corruptions that were tracked down to using cached MMIO for flash read
> access. Switch to ioremap_nocache conditionally to support BCM53573 and
> don't break performance on old MIPS devices.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  drivers/mtd/devices/bcm47xxsflash.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
> index 1c65c15..514be04 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -296,16 +296,30 @@ static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
>  		dev_err(dev, "can't request region for resource %pR\n", res);
>  		return -EBUSY;
>  	}
> -	b47s->window = ioremap_cache(res->start, resource_size(res));
> -	if (!b47s->window) {
> -		dev_err(dev, "ioremap failed for resource %pR\n", res);
> -		return -ENOMEM;
> -	}
>  
>  	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
>  	b47s->cc_read = bcm47xxsflash_bcma_cc_read;
>  	b47s->cc_write = bcm47xxsflash_bcma_cc_write;
>  
> +	/*
> +	 * On old MIPS devices cache was magically invalidated when needed,
> +	 * allowing us to use cached access and gain some performance. Trying
> +	 * the same on ARM based BCM53573 results in flash corruptions, we need
> +	 * to use uncached access for it.

Is the word "magically" really used in the Broadcom reference code? I
wouldn't be too suprised actually :)

I'd prefer getting a better explanation on this point, but without that,
I think it's fair to leave the caching for the old (working) MIPS SoCs
and avoid caching on the new ARM one.

> +	 * It may be arch specific, but right now there is only 1 ARM SoC using
> +	 * this driver, so let's follow Broadcom's reference code and check
> +	 * ChipCommon revision.

Yeah, if we get any more ARM chips that behave similarly, I think we'll
just want to do 'if !MIPS'.

Applied to l2-mtd.git.

Brian

> +	 */
> +	if (b47s->bcma_cc->core->id.rev == 54)
> +		b47s->window = ioremap_nocache(res->start, resource_size(res));
> +	else
> +		b47s->window = ioremap_cache(res->start, resource_size(res));
> +	if (!b47s->window) {
> +		dev_err(dev, "ioremap failed for resource %pR\n", res);
> +		return -ENOMEM;
> +	}
> +
>  	switch (b47s->bcma_cc->capabilities & BCMA_CC_CAP_FLASHT) {
>  	case BCMA_CC_FLASHT_STSER:
>  		b47s->type = BCM47XXSFLASH_TYPE_ST;
> -- 
> 1.8.4.5
> 
