Received: from zrtps0kp.nortel.com ([47.140.192.56])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LrwiQ-0001Zm-FJ
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 16:03:05 +0000
Date: Thu, 9 Apr 2009 12:02:47 -0400
From: "Doug Graham" <dgraham@nortel.com>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: mtdblock caching and syncing
Message-ID: <20090409160247.GI15952@nortel.com>
References: <20090409141556.GG15952@nortel.com>
	<20090409145100.GB7538@yoda.jdub.homelinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090409145100.GB7538@yoda.jdub.homelinux.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 09, 2009 at 10:51:00AM -0400, Josh Boyer wrote:
> On Thu, Apr 09, 2009 at 10:15:56AM -0400, Doug Graham wrote:
> >
> >The problem is that a sync() or fsync() on an mtdblock device does not
> >actually get the data all the way to the flash device.  The mtdblock
> >layer maintains its own cache of a single erase-unit (256KB in my case).
> >If I open /dev/mtdblock0 for writing, write some stuff to it, then call
> >fsync() but do not close the device, up to one erase-unit's worth of
> >data may still be buffered in memory.  This data is only flushed when
> >the device is actually closed (by mtdblock_release).  I think that
> >this violates the intended semantics of sync and fsync.  I shouldn't be
> >required to do a close() to force the data to the device.
> 
> The device in question isn't the flash.  It's the mtdblock device.  So
> fsync semantics are preserved.  This is the same as writing to a file
> on a hard drive, calling fsync, and having it sit in the hard drive's
> cache.

That's a good point, and one I've wondered about before.  I don't know
much about how hard drives manage their cache, but I would assume that
they don't leave dirty data in their cache for an unbounded period
of time.  I'd guess that data is written to the actual disk within a
few 10s of milliseconds after being sent to the device.

In the case of mtdblock, dirty data can stay in the cache forever.

> >I think this is fairly serious bug in a flash-based system, where there
> >are frequently times that you want to make sure that data has actually
> >made it all the way to the device.  I think that a sync() or fsync()
> >really ought to somehow propagate all the way down to the mtdblock layer
> >so that mtdblock can flush its buffer.
> 
> Why are you using mtdblock in a serious flash-based system?  The fact
> that it buffers an entire eraseblock means you risk huge data loss in
> the event of an unclean shutdown anyway (power loss).  No amount of
> sync or fsync will fix that.

We don't use mtdblock during normal operations; we use squashfs and jffs2
(maybe ubifs sometime soon).  But one job that we do use mtdblock for is
burning loads.  We could, and perhaps should, be using the char device
instead to burn loads, except that those require specialized tools to do
erases before writes.  To avoid the need for such specialized tools, we
just use the equivalent of dd on the mtdblock device followed by a sync.
But that doesn't work given the behaviour I'm complaining about.

It's actually a little more complicated that that.  We have a system
comprised of multiple cards.  When upgrading the system from the master
card, we're using NBD to upgrade (some) loads on remote cards.  The NBD
server running on the remote cards never closes the mtdblock device that
it is managing, so the mtdblock_release() method never gets called.
The NDB server cannot using the MTD character device because it knows
nothing about the characteristics of flash, including the need to erase
before writing.  Even if it did know about erasing, we'd want it to do
exactly the same kind of caching the mtdblock already does, so mtdblock
does seem like a good match in this case.  We can certainly modify the
NBD server to close and reopen the device when it needs to be sure that
data has actually been written to flash, but that seems a bit on the
kludgy side, and doesn't help any other applications using mtdblock
(like the dd scheme I mention above).

> >Thoughts?  Suggestions?  Patches?
> 
> Word-weasling aside, if you have patches that fix the behavior you don't
> like, they would certainly be looked at.  Setting pdflush to 5 seconds
> instead of 30 would help a bit, or using the ioctl on the mtdblock device
> that already exists to flush would help too.  However you might want to
> really look at a system design that relies on mtdblock for data integrity.

What's the point of mtdblock then?  All systems care about data integrity
to some degree (some more than others, obviously), so if mtdblock makes
no effort to preserve that integrity, where do you see it ever being
used legitimately?

Thanks very much for your comments.

--Doug.
