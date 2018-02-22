Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eos7z-00055C-Jn
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 14:45:45 +0000
Date: Thu, 22 Feb 2018 15:45:09 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH NAND v3] mtd: nand: Replace printk() with appropriate
 pr_*() macro
Message-ID: <20180222154509.4837eb38@bbrezillon>
In-Reply-To: <1519305014-2547-1-git-send-email-shreeya.patel23498@gmail.com>
References: <1519305014-2547-1-git-send-email-shreeya.patel23498@gmail.com>
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

Hi Shreeya,

On Thu, 22 Feb 2018 18:40:14 +0530
Shreeya Patel <shreeya.patel23498@gmail.com> wrote:


> diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
> index c3aa53c..8643512 100644
> --- a/drivers/mtd/nand/diskonchip.c
> +++ b/drivers/mtd/nand/diskonchip.c

[...]

> @@ -438,7 +438,7 @@ static void __init doc2000_count_chips(struct mtd_info *mtd)
>  			break;
>  	}
>  	doc->chips_per_floor = i;
> -	printk(KERN_DEBUG "Detected %d chips per floor.\n", i);
> +	pr_debug("Detected %d chips per floor.\n", i);

Just want to add some more context on pr_debug(), nothing that requires
changes on your side, but as Richard said, it's important to explain it.

pr_debug() and printk(KERN_DEBUG) are not exactly the same. pr_debug()
calls are NOPs by default unless you have enabled the
CONFIG_DYNAMIC_DEBUG option or defined DEBUG (either directly in the
sources or by passing -DDEBUG to gcc). This is not the case with
printk(KERN_DEBUG).

If you want to know more about dynamic debug, you can read [1].

> diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
> index fc9287a..cd3cd1c 100644
> --- a/drivers/mtd/nand/r852.c
> +++ b/drivers/mtd/nand/r852.c
> @@ -7,6 +7,9 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#define DRV_NAME "r852"
> +#define pr_fmt(fmt)  DRV_NAME fmt

It would be nicer with:

#define pr_fmt(fmt)  DRV_NAME ": " fmt

...

> +
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/jiffies.h>
> @@ -935,7 +938,7 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
>  		&dev->card_detect_work, 0);
>  
>  
> -	printk(KERN_NOTICE DRV_NAME ": driver loaded successfully\n");
> +	pr_notice(": driver loaded successfully\n");

and then

	pr_notice("driver loaded successfully\n");

>  	return 0;
>  
>  error10:
> diff --git a/drivers/mtd/nand/r852.h b/drivers/mtd/nand/r852.h
> index 8713c57..709eced 100644
> --- a/drivers/mtd/nand/r852.h
> +++ b/drivers/mtd/nand/r852.h
> @@ -145,16 +145,16 @@ struct r852_device {
>  };
>  
>  #define DRV_NAME "r852"

You don't need this definition anymore, it's been moved to the .c file.
Actually, if you keep it you'll hit a 'redefine' error.

> -
> +#define pr_fmt(fmt)  DRV_NAME fmt

Why do you redefine it here? The only file including r852.h is r852.c,
and pr_fmt() has been defined before all include directives, so when the
preprocessor reaches this point pr_fmt() already has a valid definition.

>  
>  #define dbg(format, ...) \
>  	if (debug) \
> -		printk(KERN_DEBUG DRV_NAME ": " format "\n", ## __VA_ARGS__)
> +		pr_debug(": " format "\n", ## __VA_ARGS__)
>  
>  #define dbg_verbose(format, ...) \
>  	if (debug > 1) \
> -		printk(KERN_DEBUG DRV_NAME ": " format "\n", ## __VA_ARGS__)
> +		pr_debug(": " format "\n", ## __VA_ARGS__)

With the pr_fmt() definition modified as suggested it should be:

		pr_debug(format "\n", ## __VA_ARGS__)

Regards,

Boris

[1]https://01.org/linuxgraphics/gfx-docs/drm/admin-guide/dynamic-debug-howto.html

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
