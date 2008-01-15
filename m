Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEq9X-0008Dr-M8
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 18:04:48 +0000
Date: Tue, 15 Jan 2008 18:55:53 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver (2nd
	try)
Message-ID: <20080115175553.GG22338@lazybastard.org>
References: <47866921.40904@solarflare.com>
	<20080114170358.GO3544@solarflare.com>
	<20080115164613.GC22338@lazybastard.org>
	<20080115173548.GE28547@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115173548.GE28547@solarflare.com>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	linux-net-drivers@solarflare.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 17:35:50 +0000, Ben Hutchings wrote:
> > >
> > > +		/* Check contents */
> > > +		for (i = 0; i < buf_len; i++) {
> > > +			if (buffer)
> > > +				expected = buffer[i];
> > > +			if (verify_buffer[i] != expected) {
> > > +				EFX_ERR(efx_mtd->efx, "%s offset %lx contains "
> > > +					"%02x, should be %02x\n", efx_mtd->name,
> > > +					(unsigned long)(offset + i),
> > > +					verify_buffer[i], expected);
> > > +				rc = -EIO;
> > > +				goto out;
> > > +			}
> > > +		}
> > 
> > Home-brewn memcmp?
> 
> :-)  This reports non-matching addresses, and can compare with all-
> ones rather than an explicit byte array (if the buffer pointer is NULL)
> which we use after an erase.

I have this piece of code for similar purposes.  Notice the first
comment. :)

/*
 * TODO: move to lib/string.c
 */
/**
 * memchr_inv - Find a character in an area of memory.
 * @s: The memory area
 * @c: The byte to search for
 * @n: The size of the area.
 *
 * returns the address of the first character other than @c, or %NULL
 * if the whole buffer contains just @c.
 */
void *memchr_inv(const void *s, int c, size_t n)
{
	const unsigned char *p = s;
	while (n-- != 0) {
		if ((unsigned char)c != *p++) {
			return (void *)(p - 1);
		}
	}
	return NULL;
}

> <snip>
> > > +static int efx_mtd_erase(struct mtd_info *mtd, struct erase_info *erase)
> > > +{
> > > +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> > > +	struct efx_spi_device *spi;
> > > +	int rc;
> > > +
> > > +	rc = down_interruptible(&efx_mtd->access_lock);
> > 
> > What is this semaphore protecting?
> 
> It prevents efx_mtd->spi changing underneath us.
> 
> <snip> 
> > My gut instinct tells me that you can push it through to only protect
> > the pure bus access
> 
> We already have that for single comamnds, since the net driver reads
> the SPI devices.  The access lock is needed to ensure that a sequence
> of commands involved in writing is not interrupted, and to exclude a
> reset which could interfere with access to the SPI device.

Ok.  I will ignore the semaphore from now on.  Rest assured that someone
else will ask about it later.

> <snip>
> > > +out:
> > > +	if (rc == 0) {
> > > +		erase->state = MTD_ERASE_DONE;
> > > +	} else {
> > > +		erase->state = MTD_ERASE_FAILED;
> > > +		erase->fail_addr = 0xffffffff;
> > 
> > ???
> 
> According to mtd.h:
> 
> /* If the erase fails, fail_addr might indicate exactly which block failed.  If
>    fail_addr = 0xffffffff, the failure was not at the device level or was not
>    specific to any particular block. */
> 
> I read that as meaning we must set fail_addr.  Of course it would be
> nicer to set it to a meaningful address.

Hmm.  fail_addr is only used by jffs2 to mark blocks as bad, with
0xffffffff indicating that no block is to blame and nothing should be
marked bad.  Not the nicest interface I have ever seen, but your usage
of it seems proper.

> <snip>
> > > +static void efx_mtd_sync(struct mtd_info *mtd)
> > > +{
> > > +	struct efx_mtd *efx_mtd = (struct efx_mtd *)mtd->priv;
> > > +	int rc;
> > > +
> > > +	down(&efx_mtd->access_lock);
> > > +	rc = efx_spi_slow_wait(efx_mtd);
> > > +	if (rc != 0)
> > > +		EFX_ERR(efx_mtd->efx, "%s sync failed (%d)\n",
> > > +			efx_mtd->name, rc);
> > 
> > How do you handle -EINTR?
> 
> Obviously it doesn't.  Given that it can't return an error, do you
> have any better suggestions?

Can you prevent efx_spi_slow_wait from returning -EINTR?  If you can't,
a BUG_ON() at least makes the problem explicit.  

> Ben Hutchings, Senior Software Engineer, Solarflare Communications
> Not speaking for my employer; that's the marketing department's job.

:)

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
