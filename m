Received: from yw-out-1718.google.com ([74.125.46.156])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lrvb0-0005Ge-Ob
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 14:51:21 +0000
Received: by yw-out-1718.google.com with SMTP id 9so426957ywk.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Apr 2009 07:51:12 -0700 (PDT)
Date: Thu, 9 Apr 2009 10:51:00 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Doug Graham <dgraham@nortel.com>
Subject: Re: mtdblock caching and syncing
Message-ID: <20090409145100.GB7538@yoda.jdub.homelinux.org>
References: <20090409141556.GG15952@nortel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090409141556.GG15952@nortel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 09, 2009 at 10:15:56AM -0400, Doug Graham wrote:
>Hello,
>
>I'm running a 2.6.24 kernel, but I've looked over the latest kernel
>sources, and I don't see a fix for this (although I could have missed
>something).
>
>The problem is that a sync() or fsync() on an mtdblock device does not
>actually get the data all the way to the flash device.  The mtdblock
>layer maintains its own cache of a single erase-unit (256KB in my case).
>If I open /dev/mtdblock0 for writing, write some stuff to it, then call
>fsync() but do not close the device, up to one erase-unit's worth of
>data may still be buffered in memory.  This data is only flushed when
>the device is actually closed (by mtdblock_release).  I think that
>this violates the intended semantics of sync and fsync.  I shouldn't be
>required to do a close() to force the data to the device.

The device in question isn't the flash.  It's the mtdblock device.  So
fsync semantics are preserved.  This is the same as writing to a file
on a hard drive, calling fsync, and having it sit in the hard drive's
cache.

>Another scenario is to open an mtdblock device, write to it, then call
>close() without calling fsync().  In this case, the data may not yet be
>flushed to the mtdblock layer by the time close() is called, so nothing
>gets written to flash during the close().  That's all reasonable so far,
>but if I then type "sync" from the shell (or wait for 30 seconds for
>pdflush to do its thing), all buffered data *should* be flushed to the
>actual device.  As it stands now, the sync will flush data as far as
>the mtdblock layer, but that data may then get buffered in the mtdblock
>layer forever.  It only gets flushed to the device on a close(), and if
>nobody calls close(), it stays there forever.
>
>I think this is fairly serious bug in a flash-based system, where there
>are frequently times that you want to make sure that data has actually
>made it all the way to the device.  I think that a sync() or fsync()
>really ought to somehow propagate all the way down to the mtdblock layer
>so that mtdblock can flush its buffer.

Why are you using mtdblock in a serious flash-based system?  The fact
that it buffers an entire eraseblock means you risk huge data loss in
the event of an unclean shutdown anyway (power loss).  No amount of
sync or fsync will fix that.

>Thoughts?  Suggestions?  Patches?

Word-weasling aside, if you have patches that fix the behavior you don't
like, they would certainly be looked at.  Setting pdflush to 5 seconds
instead of 30 would help a bit, or using the ioctl on the mtdblock device
that already exists to flush would help too.  However you might want to
really look at a system design that relies on mtdblock for data integrity.

josh
