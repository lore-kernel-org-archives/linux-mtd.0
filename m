Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNR6J-0004AX-V5
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2016 20:17:32 +0000
Date: Sun, 24 Jan 2016 20:17:37 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
CC: Brian Norris <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, Javier Martinez Canillas
 <javier@osg.samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Luis de Bethencourt
 <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>, Neelesh Gupta
 <neelegup@linux.vnet.ibm.com>, David Woodhouse <dwmw2@infradead.org>, Cyril
 Bur <cyrilbur@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use ioremap_cachable() instead of
 KSEG0ADDR()
In-Reply-To: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
Message-ID: <alpine.DEB.2.00.1601240345260.5958@tp.orcam.me.uk>
References: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 17 Jan 2016, Rafa³ Mi³ecki wrote:

> Using KSEG0ADDR makes code highly MIPS dependent and not portable.
> Ideally we should use ioremap_cache which is generic but right now MIPS
> doesn't define it which results in kernel using ioremap instead.
> Once MIPS gets ioremap_cache we will switch to it, it's going to be
> trivial with this patch applied first.

 Agreed, I think your proposal is a move in the right direction and does 
not regress current code as we're using KSEG0ADDR anyway, which is 
MIPS-specific.

> KSEG0ADDR was translating 0x1c000000 into 0x9c000000. With
> ioremap_cachable we use MIPS's __ioremap (and remap_area_pages). This
> results in different address (e.g. 0xc0080000) but it still should be
> cached as expected and it was successfully tested with BCM47186B0.

 This is due to this piece:

	/*
	 * Map uncached objects in the low 512mb of address space using KSEG1,
	 * otherwise map using page tables.
	 */
	if (IS_LOW512(phys_addr) && IS_LOW512(last_addr) &&
	    flags == _CACHE_UNCACHED)
		return (void __iomem *) CKSEG1ADDR(phys_addr);

special-casing uncached mapping only (replicated in 2 places).  I think 
there will really be no harm from returning a KSEG0 mapping for calls 
requesting a caching mode equal to `_page_cachable_default', which -- 
depending on the cache architecture -- will have been either hardwired or 
prearranged via Config.K0.  I think there's really no need to put pressure 
on the TLB, which may be small, in cases where a fixed mapping will do.

 We also seem to pessimise the `cpu_has_64bit_addresses' case and always 
return a fixed uncached mapping, regardless of the mode requested, hmm...

> Moreover drivers/bcma/driver_chipcommon_sflash.c nicely sets us up a
> struct resource for access window, but we just aren't using it. Use it
> now and drop duplicated info.

 Agreed, again, except from one nit, as noted below.

> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
> index 347bb83..84f8fae 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -275,15 +275,33 @@ static void bcm47xxsflash_bcma_cc_write(struct bcm47xxsflash *b47s, u16 offset,
>  
>  static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
>  {
> -	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +	struct bcma_sflash *sflash = dev_get_platdata(dev);
>  	struct bcm47xxsflash *b47s;
> +	struct resource *res;
>  	int err;
>  
> -	b47s = devm_kzalloc(&pdev->dev, sizeof(*b47s), GFP_KERNEL);
> +	b47s = devm_kzalloc(dev, sizeof(*b47s), GFP_KERNEL);
>  	if (!b47s)
>  		return -ENOMEM;
>  	sflash->priv = b47s;
>  
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "invalid resource\n");
> +		return -EINVAL;
> +	}
> +	if (!devm_request_mem_region(dev, res->start, resource_size(res),
> +				     res->name)) {
> +		dev_err(dev, "can't request region for resource %pR\n", res);
> +		return -EBUSY;
> +	}
> +	b47s->window = ioremap_cachable(res->start, resource_size(res));
> +	if (!b47s->window) {
> +		dev_err(dev, "ioremap failed for resource %pR\n", res);

 You need to call `devm_release_mem_region' in this case.

> +		return -ENOMEM;
> +	}
> +
>  	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
>  	b47s->cc_read = bcm47xxsflash_bcma_cc_read;
>  	b47s->cc_write = bcm47xxsflash_bcma_cc_write;

 LGTM otherwise.

  Maciej
