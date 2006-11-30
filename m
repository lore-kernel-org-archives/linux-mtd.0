Received: from smtp109.sbc.mail.mud.yahoo.com ([68.142.198.208])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gpgql-0006cN-KL
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 03:00:59 -0500
From: David Brownell <david-b@pacbell.net>
To: Andrew Victor <andrew@sanpeople.com>
Subject: Re: [Bulk] Re: jffs2_flash_writev(): Non-contiguous write to 00825300
	with mtd_dataflash
Date: Wed, 29 Nov 2006 23:54:07 -0800
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
	<200611290921.02293.david-b@pacbell.net>
	<1164868198.21731.6.camel@fuzzie.sanpeople.com>
In-Reply-To: <1164868198.21731.6.camel@fuzzie.sanpeople.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200611292354.07946.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 29 November 2006 10:29 pm, Andrew Victor wrote:
> hi,
> 
> > > -	device->flags = MTD_CAP_NORFLASH;
> > > +	device->flags = MTD_WRITEABLE;
> > 
> > That "NORFLASH" flag always seemed bogus to me, but it was at the
> > time the only way to make the MTD core behave.
> 
> Wouldn't it be better to introduce a MTD_CAP_DATAFLASH.
> That way if/when more capability flags are added to MTD core, the
> dataflash support will be considered and not forgotten about.

I have no strong opinion one way or another.  Structurally it's
maybe a bit more like NAND, and CAP_NANDFLASH == WRITEABLE, so
there might not be a _need_ for such a capability now that some
of that strangeness is gone ...

- Dave
