Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewVPe-0003qY-57
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 16:08:16 +0000
Date: Thu, 15 Mar 2018 17:07:02 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com
Subject: Re: [PATCH 2/3] mtd: maps: Remove print after allocation failure
Message-ID: <20180315170702.552c4756@bbrezillon>
In-Reply-To: <1521041718-32492-2-git-send-email-arushisinghal19971997@gmail.com>
References: <1521041718-32492-1-git-send-email-arushisinghal19971997@gmail.com>
 <1521041718-32492-2-git-send-email-arushisinghal19971997@gmail.com>
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

Hi Arushi,

On Wed, 14 Mar 2018 21:05:17 +0530
Arushi Singhal <arushisinghal19971997@gmail.com> wrote:

> The prints after [k|v][m|z|c]alloc() functions are not needed, because
> in case of failure, allocator will print their internal error prints
> anyway.
> 
> Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> ---
>  drivers/mtd/maps/sun_uflash.c | 4 +---

And here as well some of the drivers are still printing error messages
after mem allocation failures (amd76xrom, ck804xrom, esb2rom, ichxrom,
vmu-flash).

Regards,

Boris

>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
> index 1e73bba..80a253c 100644
> --- a/drivers/mtd/maps/sun_uflash.c
> +++ b/drivers/mtd/maps/sun_uflash.c
> @@ -62,10 +62,8 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
>  	}
>  
>  	up = kzalloc(sizeof(struct uflash_dev), GFP_KERNEL);
> -	if (!up) {
> -		printk(KERN_ERR PFX "Cannot allocate struct uflash_dev\n");
> +	if (!up)
>  		return -ENOMEM;
> -	}
>  
>  	/* copy defaults and tweak parameters */
>  	memcpy(&up->map, &uflash_map_templ, sizeof(uflash_map_templ));



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
