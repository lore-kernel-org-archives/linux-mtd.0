Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhqCz-00026I-AJ
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 05:50:07 +0000
Date: Tue, 24 Jul 2018 07:49:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux-sh list
 <linux-sh@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] mtd/maps: fix solutionengine.c printk format warnings
Message-ID: <20180724074951.62c49935@bbrezillon>
In-Reply-To: <0ca72308-0551-97dc-dc74-11e1d8dac5b1@infradead.org>
References: <0ca72308-0551-97dc-dc74-11e1d8dac5b1@infradead.org>
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

On Sun, 22 Jul 2018 16:28:52 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix 2 printk format warnings (this driver is currently only used by
> arch/sh/) by using "%pap" instead of "%lx".
> (or we could just cast the physical addresses to unsigned int)
> 
> Fixes these build warnings:
> 
> ../drivers/mtd/maps/solutionengine.c: In function 'init_soleng_maps':
> ../include/linux/kern_levels.h:5:18: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
> ../drivers/mtd/maps/solutionengine.c:62:54: note: format string is defined here
>   printk(KERN_NOTICE "Solution Engine: Flash at 0x%08lx, EPROM at 0x%08lx\n",
>                                                   ~~~~^
>                                                   %08x
> ../include/linux/kern_levels.h:5:18: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
> ../drivers/mtd/maps/solutionengine.c:62:72: note: format string is defined here
>   printk(KERN_NOTICE "Solution Engine: Flash at 0x%08lx, EPROM at 0x%08lx\n",
>                                                                     ~~~~^
>                                                                     %08x
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: linux-mtd@lists.infradead.org
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: linux-sh@vger.kernel.org
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: indent all lines inside the new block
> 
>  drivers/mtd/maps/solutionengine.c |   11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> --- linux-next-20180717.orig/drivers/mtd/maps/solutionengine.c
> +++ linux-next-20180717/drivers/mtd/maps/solutionengine.c
> @@ -59,9 +59,14 @@ static int __init init_soleng_maps(void)
>  			return -ENXIO;
>  		}
>  	}
> -	printk(KERN_NOTICE "Solution Engine: Flash at 0x%08lx, EPROM at 0x%08lx\n",
> -	       soleng_flash_map.phys & 0x1fffffff,
> -	       soleng_eprom_map.phys & 0x1fffffff);

Hm, not sure why masking with 0x1fffffff is required. It seems .phys is
either 0 or 0x1000000, so maybe we should just go for 

	printk(KERN_NOTICE "Solution Engine: Flash at 0x%pap, EPROM at 0x%pap\n",
	       &soleng_flash_map.phys, &soleng_eprom_map.phys);


> +	{
> +		resource_size_t fl_phys = soleng_flash_map.phys & 0x1fffffff;
> +		resource_size_t ep_phys = soleng_eprom_map.phys & 0x1fffffff;
> +
> +		printk(KERN_NOTICE
> +		       "Solution Engine: Flash at 0x%pap, EPROM at 0x%pap\n",
> +	       	       &fl_phys, &ep_phys);
> +	}
>  	flash_mtd->owner = THIS_MODULE;
>  
>  	eprom_mtd = do_map_probe("map_rom", &soleng_eprom_map);
> 
> 
