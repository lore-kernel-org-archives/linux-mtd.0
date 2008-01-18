Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFxq8-0001XM-WA
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 20:29:25 +0000
Date: Fri, 18 Jan 2008 21:20:24 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver (3rd
	try)
Message-ID: <20080118202023.GB15039@lazybastard.org>
References: <20080118183026.GH23117@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080118183026.GH23117@solarflare.com>
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 January 2008 18:30:28 +0000, Ben Hutchings wrote:
> 
> My colleague Robert Stonehouse submitted a new version of the sfc
> network driver and accompanying sfc_mtd MTD driver today.  The full
> source is at:
> 
> https://support.solarflare.com/netdev/5/net-2.6.25-sfc-2.2.0045.patch
> https://support.solarflare.com/netdev/5/net-2.6.25-sfc-2.2.0045.tgz

Cool.

> - Renamed efx_mtd_probe() to efx_mtd_register(), since it does
>   not probe
> - Moved structure allocation and device-dependent initialisation out of
>   efx_mtd_register()

My suggestion for this was actually a bit different, see below.

> - Simplified efx_mtd_verify():
>   - Replaced large heap buffer with small stack buffer, as this is not
>     speed-critical
>   - Allowed the caller to specify a repeating pattern, rather than handling
>     the erase pattern directly
>   - Replaced byte-comparison loop with memcmp()

Interesting solution.  Works for me.  If it makes a difference, you
could increase EFX_MTD_VERIFY_BUF_LEN to maybe 128 or 256.  That should
still be safe on the stack and cut down on function calls.  If it
doesn't make a difference, just leave it.

> - Changed type and flags for EEPROM to be "RAM" - the EEPROM is randomly
>   rewritable and it is certainly not DataFlash

Good.  I forgot to mention it when I saw it.

> +static __devinit int efx_mtd_register(struct efx_mtd *efx_mtd,
> +				      struct efx_dl_device *efx_dev,
> +				      struct efx_nic *efx,
> +				      struct efx_spi_device *spi,
> +				      const char *type_name,
> +				      const char **part_type_name,
> +				      unsigned int num_parts)

The function prototype is a monster.  My idea was to have this function
do the allocation and fill in any generic fields, then hand it over to
the concrete probe functions.  That approach doesn't require seven
parameters and is generally safer.  Something very roughly like the code
below.

If you want to combine the snprintf code, mtd registration, etc.  you
can also add another helper funtion.

static __devinit struct efx_mtd *efx_mtd_alloc( struct efx_spi_device *spi)
{
	struct efx_mtd *efx_mtd;

	efx_mtd = kzalloc(sizeof(*efx_mtd), GFP_KERNEL);
	if (!efx_mtd)
		return NULL;

	efx_mtd->spi = spi;
	sema_init(&efx_mtd->access_lock, 1);

	efx_mtd->mtd.size = spi->size;
	efx_mtd->mtd.erasesize = spi->erase_size;
	efx_mtd->mtd.writesize = 1;
	efx_mtd->mtd.priv = efx_mtd;

	efx_mtd->mtd.erase = efx_mtd_erase;
	efx_mtd->mtd.read = efx_mtd_read;
	efx_mtd->mtd.write = efx_mtd_write;
	efx_mtd->mtd.sync = efx_mtd_sync;
	return efx_mtd;
}

static int __devinit
efx_flash_probe(struct efx_dl_device *efx_dev,
		const struct net_device *net_dev,
		const struct efx_dl_device_info *dev_info,
		const char *silicon_rev)
{
	struct efx_nic *efx = efx_dl_get_nic_port(efx_dev)->efx;
	struct efx_mtd *efx_mtd;
	const char *part_type_name[2];
	unsigned int num_parts;
	int rc, len;

	if (!efx->spi_flash)
		return -ENODEV;

	efx_mtd = efx_mtd_alloc();
	if (!efx_mtd)
		return -ENOMEM;

	efx_dev->priv = efx_mtd;
	efx_mtd->efx_dev = efx_dev;
	efx_mtd->efx = efx;

	len = snprintf(efx_mtd->name, sizeof(efx_mtd->name), "%s %s", efx->name, "sfc_flash");
	if (len >= sizeof(efx_mtd->name))
		return -ENAMETOOLONG;
	efx_mtd->mtd.name = efx_mtd->name;
	...

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
