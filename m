Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0Bes-0005DS-At
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 02:23:55 -0400
Date: Tue, 11 Jul 2006 09:23:42 +0300
From: Ville Herva <vherva@vianova.fi>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work (try 3)
Message-ID: <20060711062342.GY6240@vianova.fi>
References: <20060707122221.GW6240@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060707122221.GW6240@vianova.fi>
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Few notes about the admittedly ugly #ifndef MODULE chunks:

On Fri, Jul 07, 2006 at 03:22:21PM +0300, you [Ville Herva] wrote:
> 
> --- linux-mtd-GIT/drivers/mtd/devices/block2mtd.c	2006-07-05 23:06:10.000000000 +0300
> +++ linux-2.6.17.3.NEW3/drivers/mtd/devices/block2mtd.c	2006-07-07 15:04:48.000000000 +0300
> 	bdev = open_bdev_excl(devname, O_RDWR, NULL);
> +#ifndef MODULE
> +		dev_t dev = name_to_dev_t(devname);
> +#endif

Apparently, name_to_dev_t() is not exported to use in modules (which kind of
makes sense - there shouldn't be need as rootfs should already be available
when a module is being loaded.) So I had to #ifdef it. And on the other
hand, open_bdev_excl() should be enough for modules anyway.

> +#ifndef MODULE
> +static int block2mtd_init_called = 0;
> +static __initdata char block2mtd_paramline[80 + 12]; /* 80 for device, 12 for erase size */
> +#endif

The __initdata variable gave warnings when compiling with -DMODULE (it was
referred, but not on a possible call path.) I decided to #ifdef it away, and
take block2mtd_init_called away as well. At least this saves some memory.

> +{
> +#ifdef MODULE
> +	return block2mtd_setup2(val);
> +#else
> +	if (block2mtd_init_called)
> +		return block2mtd_setup2(val);
> +	strlcpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
> +	return 0;
> +#endif

This should make sure that the behaviour is exactly the same as before in
-DMODULE and echo XX > /sys/module/block2mtd/parameters/block2mtd cases.
Specifically, static char block2mtd_paramline[80 + 12]; instruduced an
additional 92 char upper limit for the device name len. With the new patch,
this limit is only introduced for the kernel boot param (kernel internal
name_to_dev_t() probably won't accept anything longer anyway, but
open_bdev_excl() might, as it takes paths to the filesystem.)

Jörn, the #ifdef MODULE do clutter up the code, so I leave it to you as the
maintainer to decide if they are worth it.
