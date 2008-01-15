Received: from heisenberg.zen.co.uk ([212.23.3.141])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEpkN-0006Kt-5g
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 17:38:47 +0000
Date: Tue, 15 Jan 2008 17:35:50 +0000
From: Ben Hutchings <bhutchings@solarflare.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver (2nd
	try)
Message-ID: <20080115173548.GE28547@solarflare.com>
References: <47866921.40904@solarflare.com>
	<20080114170358.GO3544@solarflare.com>
	<20080115164613.GC22338@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115164613.GC22338@lazybastard.org>
Sender: "Ben Hutchings <bhutchings>" <bwh@solarflare.com>
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Mon, 14 January 2008 17:04:00 +0000, Ben Hutchings wrote:
> > 
> > This patch contains just the MTD driver code (mtd.c) and the two most
> > important header files it shares with our net driver.  The low-level
> > code to access the SPI bus through the network controller is not
> > included (and is unchanged from last time aside from a small change to
> > length validation).  Hopefully this should be more amenable to review,
> > though it cannot be compiled.
> 
> Hehe.  Maybe next time I can get both?  
> 
> Most comments below are fairly generic and can be applied many times
> over, both for mtd.c and the rest.
<snip>
> > +struct efx_mtd {
> > +	struct mtd_info mtd;
> > +	struct mtd_partition mtd_part[EFX_MAX_PARTITIONS];
> > +	struct semaphore access_lock;
> > +	char part_name[EFX_MAX_PARTITIONS][32];
> > +	char name[32];
> > +	struct efx_dl_device *efx_dev; /* driverlink */
> 
> Rename to struct efx_driver_link and kill the comment?

No, there are multiple structures involved in the driverlink API.  But
the "_dl_" in the structure name should be a sufficient clue.

> > +	struct efx_nic *efx; 
> > +	struct efx_spi_device *spi;
> 
> Needing three seperate pointers to some struct efc_* is... interesting.
> Usually one would be enough and the other two can be derived.

The efx_nic pointer can be derived from the efx_dev pointer, though
looking it up requires a function call.  The efx_spi_device pointer is
not redundant, because our NICs usually have 2 SPI devices.

> > +		/* Check contents */
> > +		for (i = 0; i < buf_len; i++) {
> > +			if (buffer)
> > +				expected = buffer[i];
> > +			if (verify_buffer[i] != expected) {
> > +				EFX_ERR(efx_mtd->efx, "%s offset %lx contains "
> > +					"%02x, should be %02x\n", efx_mtd->name,
> > +					(unsigned long)(offset + i),
> > +					verify_buffer[i], expected);
> > +				rc = -EIO;
> > +				goto out;
> > +			}
> > +		}
> 
> Home-brewn memcmp?

:-)  This reports non-matching addresses, and can compare with all-
ones rather than an explicit byte array (if the buffer pointer is NULL)
which we use after an erase.

<snip>
> > +static int efx_mtd_erase(struct mtd_info *mtd, struct erase_info *erase)
> > +{
> > +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> > +	struct efx_spi_device *spi;
> > +	int rc;
> > +
> > +	rc = down_interruptible(&efx_mtd->access_lock);
> 
> What is this semaphore protecting?

It prevents efx_mtd->spi changing underneath us.

<snip> 
> My gut instinct tells me that you can push it through to only protect
> the pure bus access

We already have that for single comamnds, since the net driver reads
the SPI devices.  The access lock is needed to ensure that a sequence
of commands involved in writing is not interrupted, and to exclude a
reset which could interfere with access to the SPI device.

<snip>
> > +out:
> > +	if (rc == 0) {
> > +		erase->state = MTD_ERASE_DONE;
> > +	} else {
> > +		erase->state = MTD_ERASE_FAILED;
> > +		erase->fail_addr = 0xffffffff;
> 
> ???

According to mtd.h:

/* If the erase fails, fail_addr might indicate exactly which block failed.  If
   fail_addr = 0xffffffff, the failure was not at the device level or was not
   specific to any particular block. */

I read that as meaning we must set fail_addr.  Of course it would be
nicer to set it to a meaningful address.

<snip>
> > +static void efx_mtd_sync(struct mtd_info *mtd)
> > +{
> > +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> > +	int rc;
> > +
> > +	down(&efx_mtd->access_lock);
> > +	rc = efx_spi_slow_wait(efx_mtd);
> > +	if (rc != 0)
> > +		EFX_ERR(efx_mtd->efx, "%s sync failed (%d)\n",
> > +			efx_mtd->name, rc);
> 
> How do you handle -EINTR?

Obviously it doesn't.  Given that it can't return an error, do you
have any better suggestions?

<snip>
> > +	/* Initialise structure */
> > +	efx_mtd->efx_dev = efx_dev;
> > +	efx_mtd->efx = efx;
> > +	efx_mtd->spi = spi;
> > +	sema_init(&efx_mtd->access_lock, 1);
> > +	memcpy(&efx_mtd->mtd, template, sizeof(efx_mtd->mtd));
> 
> I'm not too fond of this memcpy approach.  In particular because this
> function is called probe and does no such thing.
> 
> Instead this function could allocate a structure and initialize any
> common fields.  Remaining fields would then be initialized in the two
> actual probe functions below.

Right.  The memcpy() is there because the "template" structures used
to be static data.  I replaced them with dynamically generated
structures when adding support for more SPI devices, but didn't follow
through and rework this initialisation.

<snip>
> > +	EFX_ASSERT(template->numeraseregions == 0);
> > +
> > +	EFX_ASSERT(partitions != NULL);
> > +	EFX_ASSERT(num_partitions > 0);
> > +	EFX_ASSERT(num_partitions <= EFX_MAX_PARTITIONS);
> 
> And I assume most of these assertions are bogus and can be removed.

I suppose they are trivially true now.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
