Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8usd-0001w0-CP
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 11:32:00 +0000
Date: Tue, 26 May 2009 20:31:22 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH 2/2] mtd/maps: uclinux: support Blackfin systems
Message-ID: <20090526113122.GB16835@linux-sh.org>
References: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
	<1243331191-11445-2-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1243331191-11445-2-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, uclinux-dev@uclinux.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 26, 2009 at 05:46:31AM -0400, Mike Frysinger wrote:
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index 57699c2..dcb552f 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -55,8 +55,13 @@ static int __init uclinux_mtd_init(void)
>  {
>  	struct mtd_info *mtd;
>  	struct map_info *mapp;
> +#ifdef CONFIG_BLACKFIN
> +	extern unsigned long memory_mtd_start;
> +	unsigned long addr = (unsigned long) memory_mtd_start;
> +#else
>  	extern char _ebss;
>  	unsigned long addr = (unsigned long) &_ebss;
> +#endif
>  
>  	mapp = &uclinux_ram_map;
>  	mapp->phys = addr;

NAK.

I know there's no accounting for taste, but it would be nice to at least
see some minimal amount of effort going in to fixing these things
sanely rather than just lazily shoving ifdefs in wherever possible.

In this case you should just kill all of that crap off, and have the
platforms that use this set uclinux_ram_map up themselves, it's already
a global. Of course you can use _ebss as a default value for
uclinux_ram_map.phys and just override it in your platform.
