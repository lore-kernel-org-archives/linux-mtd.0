Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjdHK-0000az-1q
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 18:45:14 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1NjdHF-0005lI-1s
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 19:45:05 +0100
Received: from gate-ca119.motorola.com ([144.189.100.25])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2010 19:45:05 +0100
Received: from dave+gmane by gate-ca119.motorola.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2010 19:45:05 +0100
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave+gmane@wuertele.com>
Subject: Improving JFFS2 write latency
Date: Mon, 22 Feb 2010 18:36:03 +0000 (UTC)
Message-ID: <loom.20100222T192132-297@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My linux-2.6.18 system has a 45MB JFFS2 partition which must store two 15MB
files and hundreds of small (<64kB) files.  The files are written often and
deleted often, so even though the filesystem is nowhere near full there tend to
be very few free blocks available.  I am trying to improve the maximum latency
of writing the small files.  I am willing to sacrifice some capacity of my
partition.

Normally, small file writes complete in under a second, but sometimes when there
is garbage collection to be done, the writes take over ten seconds.  I would
like to tune JFFS2 in such a way that small files always write in under one
second.

It appears to me that the values in c->resv_blocks_write and
c->resv_blocks_gctrigger should affect the maximum latency of a write that does
GC.  If resv_blocks_write is a large percentage of the partition size, then
there should always be lots of free blocks around in which to do GC, so GC
should be easier.  If (resv_blocks_gctrigger-resv_blocks_write) is large, then
GC should be triggered by writes long before GC is really needed, so the GC that
the write does should be minimal.

Is this logic correct?  Are there any other ways that I can improve the write
latency for small files, especially given that I'm willing to sacrifice some
capacity of my partition?

Thanks,
Dave
