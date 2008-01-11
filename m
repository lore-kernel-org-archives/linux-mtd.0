Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JDQ68-0008Iq-Ny
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 20:03:31 +0000
Date: Fri, 11 Jan 2008 20:57:26 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
Message-ID: <20080111195725.GB1399@lazybastard.org>
References: <47866921.40904@solarflare.com>
	<20080110201309.GC26820@lazybastard.org>
	<20080111125000.GL3544@solarflare.com>
	<20080111132444.GA1399@lazybastard.org>
	<20080111185550.GN3544@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080111185550.GN3544@solarflare.com>
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

On Fri, 11 January 2008 18:55:51 +0000, Ben Hutchings wrote:
> 
> It turns out that struct efx_mtd_operations is a redundant indirection
> layer, but I can introduce a dummy struct efx_spi_device which does
> the same thing.

Sounds good.

> > Ok.  A straight conversion to a mutex will likely cause trouble with
> > your reset routine.  Not sure what to do here.
> 
> We can use a mutex if the net driver is guaranteed to call
> reset_suspend() and reset_resume() in the same context.  This is
> currently true (they are always called in a pair by efx_reset() in
> efx.c) but I'm not sure we want to guarantee that.  Unfortunately it
> *is* sometimes necessary to reset the controller after it's been
> exposed through driverlink, so this is not something we can ignore.

I would try to move the lock as far down the callchain as possible.
If you can limit it to the raw bus access, your mtd driver doesn't need
locking at all.

Jörn

-- 
Joern's library part 12:
http://physics.nist.gov/cuu/Units/binary.html
