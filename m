Received: from mta23.gyao.ne.jp ([125.63.38.249] helo=mx.gate01.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jdd4i-0001tn-Um
	for linux-mtd@lists.infradead.org; Mon, 24 Mar 2008 03:10:17 +0000
Date: Mon, 24 Mar 2008 12:09:45 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH] 1/3 mtd: add Kbuild support and makefile support for
	Dreamcast VMU
Message-ID: <20080324030945.GA15872@linux-sh.org>
References: <1206207805.6324.13.camel@localhost.localdomain>
	<1206208592.6324.19.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1206208592.6324.19.camel@localhost.localdomain>
Cc: Andrew Morton <akpm@osdl.org>, linux-sh <linux-sh@vger.kernel.org>,
	Greg KH <greg@kroah.com>, LKML <linux-kernel@vger.kernel.org>,
	MTD <linux-mtd@lists.infradead.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 22, 2008 at 05:56:32PM +0000, Adrian McMenamin wrote:
> Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>
> ---
> diff -ruN a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> --- a/drivers/mtd/maps/Kconfig	2008-03-22 17:26:24.000000000 +0000
> +++ b/drivers/mtd/maps/Kconfig	2008-03-22 17:20:45.000000000 +0000
> @@ -590,5 +590,19 @@
>  
>  	  This selection automatically selects the map_ram driver.
>  
> +config MTD_VMU_FLASH
> +	tristate "Dreamcast Visual Memory devices and clones"
> +	depends on SH_DREAMCAST
> +	select MAPLE
> +	help
> +	  Flash map driver for the SEGA Dreamcast Visual Memory Unit
> +	  and clones.
> +
> +	  Most Dreamcast users will have one of these and so will want
> +	  to say Y here.
> +
> +	  To compile this driver as a module choose M here: the module
> +	  will be called vmu-flash.
> +
>  endmenu
>  
1/3 and 2/3 should be merged, they're completely tied to each other and
are useless on their own.
