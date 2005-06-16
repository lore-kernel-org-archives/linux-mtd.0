Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Ditjp-0000C1-9u
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 08:44:54 -0400
Date: Thu, 16 Jun 2005 14:44:52 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Sean Young <sean@mess.org>
Message-ID: <20050616124452.GA4224@wohnheim.fh-wedel.de>
References: <20050613123626.GB30868@wohnheim.fh-wedel.de>
	<20050614192809.GA46302@atlantis.8hz.com>
	<20050614221844.GB17547@wohnheim.fh-wedel.de>
	<20050615192754.GA60103@atlantis.8hz.com>
	<20050615210155.GA32750@wohnheim.fh-wedel.de>
	<20050616091546.GA68824@atlantis.8hz.com>
	<20050616102905.GA2166@wohnheim.fh-wedel.de>
	<20050616115459.GA70753@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050616115459.GA70753@atlantis.8hz.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Embedded bios FTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 June 2005 13:54:59 +0200, Sean Young wrote:
> On Thu, Jun 16, 2005 at 12:29:05PM +0200, Joern Engel wrote:
> > 
> > An ioctl() would have a *really* hard time to make it into the kernel.
> 
> I agree that ioctl()s are ugly, but it does have the advantage that it 
> is accessible from user-space. Excuse my ignorance, but what is the 
> motivation for this?

Past experience, mostly.  95% of all ioctl() uses are for Crap(tm).
Mostly because people having some stupid idea can easily add an
ioctl() and have a hard time adding a new syscall or similar.

After a while, people caught up to this and by today, a new ioctl()
raises the red flag that someone stupid is trying to do something
stupid and should not be allowed to do so.

For the remaining 5% of good ideas, an ioctl number has no advantage
over a new function with a self-explaining name.

> > What you could do, however, might be something similar to this:
> > 
> > o Add an erase() function to stuct block_device_operations
> > o Have fat call that function whenever a block is know unused.
> > o Make sure only to call the function, if it's non-NULL.  Maybe a
> >   wrapper, maybe just
> > 	if (bd_ops->erase)
> > 		bd_ops->erase(block);
> >   inside fs/fat/.
> > o Implement erase() for your ftl driver to do something smart.
> > 
> > Be careful, though.  I haven't worked on block devices for a very long
> > time and could be talking out of my arse.  If you send such a patch to
> > akpm and get flamed into a pile of ashes - don't blame me. ;)
> 
> I'll have to spend more time looking at the block devices/bio code 
> before I can start. :)
> 
> erase() sounds rather mtd-specific. Wouldn't stale() be better?

You're right.  Even for mtd, erase would be the wrong name.  The
semantic is not to erase the full erase block (and to do it now,
imperatively) but to return control over a partial erase block to the
ftl.  Hmm.

For block devices, the semantic is that no read() to this block will
happen before the next write() to it.  forget() might be a decent name
as well.  Then the block device has the option to change the data
within this block as it pleases.  If the next read() happens before
the next write(), random data will be returned.

PS: Yeah, I know, block devices have request(), instead of read() and
write().  Same thing.

Jörn

-- 
The only real mistake is the one from which we learn nothing.
-- John Powell
