Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpP9R-00010w-1X
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 06:25:43 -0400
Received: from mailgate.cabletime.com ([80.177.138.66] helo=cabletime.com)
	by anchor-post-31.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1BpP9O-0002lp-0V
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 10:25:38 +0000
From: Andy Hawkins <a.hawkins@cabletime.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1090923928.2237.6.camel@adh>
Mime-Version: 1.0
Date: 27 Jul 2004 11:25:28 +0100
Content-Transfer-Encoding: 7bit
Subject: Large JFFS2 filesystem problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.

A while back I posted a message about some problems we were having
mounting a large JFFS2 filesystem on a NAND device. We want to treat up
to 16 128MB devices as a single device, and have a filesystem on that
device (i.e a total of 2 Gig)

However, I've found that if I try to use more than two of these devices,
then I can no longer mount a JFFS2 filesystem on the device.

After some debugging, it appears that the kmalloc in jffs2_scan_medium
fails, trying to allocate 256K of memory. Elsewhere, there is a comment
that the maximum that kmalloc can return is 128K, so this is obviously
incorrect.

Is this a limitation in the size of a JFFS2 filesystem, or is this an
error? It seems to me that this code:

/* 
 * Check, if we have to concatenate physical blocks to larger virtual
blocks
 * to reduce the memorysize for c->blocks. (kmalloc allows max. 128K
allocation)
 */
c->sector_size = c->mtd->erasesize; 
blocks = c->flash_size / c->sector_size;
while ((blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024)) {
	blocks >>= 1;
	c->sector_size <<= 1;
}	

could be the source of the proble, because while it decreases the number
of blocks, it increases the sector size, and it is this sector size that
is used in the kmalloc line that fails.

Previously, someone recommended waiting for YAFFS2, as this is likely to
be more efficient with large filesystems. Does anyone have any idea as
to when this is likely to be available?

Many thanks.

Andy
