Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft6wX-0002VE-BX
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 13:56:52 -0400
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.36 #1 (Debian))
	id 1Ft6wT-0007i1-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 19:56:41 +0200
Date: Wed, 21 Jun 2006 19:56:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: [FYI] Killing JFFS2 with repeated power failures
Message-ID: <20060621175641.GC5085@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While hunting for the cause of CRC error on JFFS2, I noticed a
theoretical problem with JFFS2.

If JFFS2 war writing during a power failure, some amount of flash gets
filled with garbage.  By writing 4KiB pages of random data, nodes of
slightly more than 4KiB are created, with the remainder going into
wbuf.  A power failure now would eat 6KiB with a 2KiB wbuf.

If this happens when the filesystem is full (5 blocks left) and GC has
to kick in, a scenario can be constructed where power failures happen
very shortly after bootup - just long enough for GC to write 1-2
nodes.  And each failure can eat 6KiB of flash space.

Repeat a couple of times and JFFS2 will paint itself into a corner.

Afaics, this problem is highly theoretical and has never been observed
in the field.  And if it ever happens, a system experiencing power
failures at such a rate is effectively bricked anyway.  All we should
make sure is that more than 2-3 power failures are necessary to hit
this problem.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
