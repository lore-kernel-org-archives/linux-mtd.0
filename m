Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nohu9-0001XG-Hc
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2010 18:42:18 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Nohu1-0002IZ-Jp
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2010 19:42:05 +0100
Received: from gate-ca119.motorola.com ([144.189.100.25])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2010 19:42:05 +0100
Received: from dave+gmane by gate-ca119.motorola.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2010 19:42:05 +0100
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave+gmane@wuertele.com>
Subject: JFFS2 =?utf-8?b?YWxsb2Nfc2Vt?= contention
Date: Mon, 8 Mar 2010 18:41:45 +0000 (UTC)
Message-ID: <loom.20100308T193010-101@post.gmane.org>
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

I have a 45MB JFFS2 partition that is usually about 70% full.  My application
developers are sad that sometimes a small write can take up to 30 seconds.

I have increased the priority of the GC thread so that the chances of a write
having to do garbage collection are small.

I have increased the value of resv_blocks_write and resv_blocks_gctrigger so
that when GC does happen, it has enough free blocks to work with, maximizing
efficiency.

I have run KFT to discover exactly where the block is happening.  Here is the
story:

1.  garbage collection runs
2.  a big file gets written, eg "cp /path/to/mybigfile /path/to/jffs2"
3.  the big file cp enters jffs2_reserve_space and grabs the alloc_sem
4.  a small file gets written, eg "cp /path/to/smallfile /path/to/jffs2"
5.  the small file cp enters jffs2_reserve_space and blocks on alloc_sem
6.  the big file takes up to 30s to finish writing, then releases alloc_sem
7.  the small file cp completes with a huge latency

I know the pid of the process that does the small writes.  I would like to give
it priority over the big writes.  I would be satisfied if I could have the big
write return from sys_write having only written a part of the buffer.

I have tried to use ioprio to increase the small writer's priority, but
apparently JFFS2 does not check ioprio.

Any advice?

Thanks,
Dave
