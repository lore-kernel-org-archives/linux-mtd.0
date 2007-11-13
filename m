Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Is11j-0004zQ-39
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 14:02:30 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JRG008JEKVYOEB0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 14:02:22 -0500 (EST)
Date: Tue, 13 Nov 2007 14:02:22 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <6934efce0711130940w69b566edvae62760a746588d2@mail.gmail.com>
Message-id: <alpine.LFD.0.9999.0711131356420.21255@xanadu.home>
References: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
	<alpine.LFD.0.9999.0711121630090.21255@xanadu.home>
	<6934efce0711121450r553ba5fo12f6c676fa79c3fe@mail.gmail.com>
	<alpine.LFD.0.9999.0711121822050.21255@xanadu.home>
	<6934efce0711130940w69b566edvae62760a746588d2@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Nov 2007, Jared Hulbert wrote:

> > Well, actually I just looked and the core already has the code to
> > auto-unlock flash when they have the MTD_STUPID_LOCK bit set.
> >
> > So... if one partition should _not_ be automatically unlocked, it just
> > has to put MTD_STUPID_LOCK in its flag_mask.  I'd have prefered if the
> > auto-unlock was explicitly enabled instead of its prevention, but
> > whatever.
> 
> Right, Justin is just extending that functionality which today only
> kicks in for one size of one chip family.

It probably should be enabled for all flash models which always power up 
locked.

> So to clarify the disagreement you feel the default behavior should be
> to have your writeable partitions default to locked, we feel the
> default behavior should be to have your writeable partitions default
> to unlocked.  Does that sum it up the core philshopical disagreement
> here?

Yes, although I don't feel so strongly about that remaining point.  I 
initially thought there was no way to prevent the auto-unlock besides 
marking the partition read-only as well.

> Actually there is a bit in struct cfi_pri_intelext.FeatureSupport&32
> that I _think_ tells us this is one of the flex lock parts that does
> the nonvolatile locking.  I'll have to confirm that.  That could be
> used in the function fixup_use_powerup_lock() in cfi_cmdset_0001.c to
> be more intelligent than just unlocking everything.  Would that be
> better?

Probably.  At least limiting the fixup only to the affected flash models 
(adding entries as necessary) is way better than the unconditional 
unlock for everything.


Nicolas
