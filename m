Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWW7r-0002Jj-8u
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 06:11:17 -0400
Date: Thu, 20 Apr 2006 12:11:01 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexey Zaytsev <alexey.zaytsev@gmail.com>
Message-ID: <20060420101101.GB4047@wohnheim.fh-wedel.de>
References: <f19298770604191204he066f6ctd090a21c6aaeca83@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f19298770604191204he066f6ctd090a21c6aaeca83@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Random fixes for the ixp4xx mapping driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 April 2006 23:04:25 +0400, Alexey Zaytsev wrote:
> 
> I've made a few fixes to the driver, including:
> 
> - Fix build with partitioning disabled.
> - Change the error handling path in a cleaner way.
> - Some coding style.
> 
> 
> Hope gmail won't mess with it.
> 
> --- linux-2.6.16.1.orig/drivers/mtd/maps/ixp4xx.c       2006-04-19
> 21:03:06.000000000 +0400
> +++ linux-2.6.16.1/drivers/mtd/maps/ixp4xx.c    2006-04-19
> 22:13:37.000000000 +0400
> @@ -151,7 +151,9 @@
>        struct resource *res;
>  };
> 
> -static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
> +#ifdef CONFIG_MTD_PARTITIONS
> +static const char *probes[] __initdata = { "RedBoot", "cmdlinepart", NULL };
> +#endif

All this #ifdef mess doesn't make me happy.  In this case, it saves 32
bytes for people using this driver but not having
CONFIG_MTD_PARTITIONS enabled.  That's not a very small gain for a
very small group.  Just make it unconditional.

>   static int ixp4xx_flash_remove(struct platform_device *dev)
>  {
> @@ -164,7 +166,9 @@
>                return 0;
> 
>        if (info->mtd) {
> +#ifdef CONFIG_MTD_PARTITIONS
>                del_mtd_partitions(info->mtd);
> +#endif

In this case, del_mtd_partitions() should be defined to a noop if
CONFIG_MTD_PARTITIONS is not defined.

> +#ifdef CONFIG_MTD_PARTITIONS
>        err = parse_mtd_partitions(info->mtd, probes, &info->partitions, 0);
>        if (err > 0) {
>                err = add_mtd_partitions(info->mtd, info->partitions, err);
> -               if(err)
> -                       printk(KERN_ERR "Could not parse partitions\n");
> +
>        }
> +       if (err < 0)
> +               printk(KERN_ERR "Could not parse partitions\n");
> +#endif

Same here.  parse_mtd_partitions() should be a noop, the rest can just
stay.  Gcc should be smart enough to optimize it away.

The rest looks fine.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
