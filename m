Received: from pythagoras.zen.co.uk ([212.23.3.140])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDP2q-0004J2-4r
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 18:56:03 +0000
Date: Fri, 11 Jan 2008 18:55:51 +0000
From: Ben Hutchings <bhutchings@solarflare.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] [MTD] [RFC] New Solarflare NIC EEPROM/Flash driver
Message-ID: <20080111185550.GN3544@solarflare.com>
References: <47866921.40904@solarflare.com>
	<20080110201309.GC26820@lazybastard.org>
	<20080111125000.GL3544@solarflare.com>
	<20080111132444.GA1399@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080111132444.GA1399@lazybastard.org>
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
> > >   efx_mtd->dead is fun.  Does this still happen with production
> > >   hardware?
> > 
> > It shouldn't happen with anything that passed manufacturing tests.
> > This is playing safe.
> 
> Fair enough.  Then I would prefer the dead_device_operations approach.

It turns out that struct efx_mtd_operations is a redundant indirection
layer, but I can introduce a dummy struct efx_spi_device which does
the same thing.

> > >   Even if it does, instead of setting the flag and checking it in
> > >   every function, you could replace the operations with
> > >   dead_device_operations that simply return -EIO for every call.
> > >
> > >   struct semaphore access_lock; should become a mutex.
> > 
> > Right.  We've tended to be quite conservative in using newer kernel
> > features, since we also need to support old kernels, but we have a
> > good backward-compatibility layer now (unifdef'd out of the submitted
> > code) so this shouldn't be a problem.
> 
> Ok.  A straight conversion to a mutex will likely cause trouble with
> your reset routine.  Not sure what to do here.

We can use a mutex if the net driver is guaranteed to call
reset_suspend() and reset_resume() in the same context.  This is
currently true (they are always called in a pair by efx_reset() in
efx.c) but I'm not sure we want to guarantee that.  Unfortunately it
*is* sometimes necessary to reset the controller after it's been
exposed through driverlink, so this is not something we can ignore.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
