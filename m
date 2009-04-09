Received: from zrtps0kp.nortel.com ([47.140.192.56])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lrv3E-0003fS-5x
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 14:16:26 +0000
Received: from zrtps0m6.us.nortel.com (zrtps0m6.us.nortel.com [47.140.192.58])
	by zrtps0kp.nortel.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id
	n39EFxp14580
	(using TLSv1/SSLv3 with cipher EDH-RSA-DES-CBC3-SHA (168 bits) verified
	OK) for <linux-mtd@lists.infradead.org>; Thu, 9 Apr 2009 14:16:15 GMT
Received: from wcary472.ca.nortel.com (wcary472.ca.nortel.com [47.129.73.197])
	by zrtps0m6.us.nortel.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id
	n39EFvI06104
	(using TLSv1/SSLv3 with cipher EDH-RSA-DES-CBC3-SHA (168 bits) verified
	NO) for <linux-mtd@lists.infradead.org>; Thu, 9 Apr 2009 14:15:58 GMT
Received: from wcary472.ca.nortel.com (localhost.localdomain [127.0.0.1])
	by wcary472.ca.nortel.com (8.13.1/8.12.11) with ESMTP id n39EFvJg028137
	for <linux-mtd@lists.infradead.org>; Thu, 9 Apr 2009 10:15:57 -0400
Received: (from dgraham@localhost)
	by wcary472.ca.nortel.com (8.13.1/8.13.1/Submit) id n39EFufo028136
	for linux-mtd@lists.infradead.org; Thu, 9 Apr 2009 10:15:56 -0400
Date: Thu, 9 Apr 2009 10:15:56 -0400
From: "Doug Graham" <dgraham@nortel.com>
To: linux-mtd@lists.infradead.org
Subject: mtdblock caching and syncing
Message-ID: <20090409141556.GG15952@nortel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm running a 2.6.24 kernel, but I've looked over the latest kernel
sources, and I don't see a fix for this (although I could have missed
something).

The problem is that a sync() or fsync() on an mtdblock device does not
actually get the data all the way to the flash device.  The mtdblock
layer maintains its own cache of a single erase-unit (256KB in my case).
If I open /dev/mtdblock0 for writing, write some stuff to it, then call
fsync() but do not close the device, up to one erase-unit's worth of
data may still be buffered in memory.  This data is only flushed when
the device is actually closed (by mtdblock_release).  I think that
this violates the intended semantics of sync and fsync.  I shouldn't be
required to do a close() to force the data to the device.

Another scenario is to open an mtdblock device, write to it, then call
close() without calling fsync().  In this case, the data may not yet be
flushed to the mtdblock layer by the time close() is called, so nothing
gets written to flash during the close().  That's all reasonable so far,
but if I then type "sync" from the shell (or wait for 30 seconds for
pdflush to do its thing), all buffered data *should* be flushed to the
actual device.  As it stands now, the sync will flush data as far as
the mtdblock layer, but that data may then get buffered in the mtdblock
layer forever.  It only gets flushed to the device on a close(), and if
nobody calls close(), it stays there forever.

I think this is fairly serious bug in a flash-based system, where there
are frequently times that you want to make sure that data has actually
made it all the way to the device.  I think that a sync() or fsync()
really ought to somehow propagate all the way down to the mtdblock layer
so that mtdblock can flush its buffer.

Thoughts?  Suggestions?  Patches?

Thanks,
Doug.
