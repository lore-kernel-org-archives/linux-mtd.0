Received: from mail.timesys.com ([65.117.135.102] helo=exchange.timesys.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMu2S-0008M0-L8
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 19:00:24 +0000
Date: Thu, 20 Nov 2003 13:58:46 -0500
From: John Whitney <john.whitney@timesys.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <BBE27916.2783%john.whitney@timesys.com>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Content-transfer-encoding: 7bit
Subject: JFFS2 and 64-bit flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there anything in latest JFFS2 code that would have problems with 64-bit
buswidth flash access?

I have an four interleaved 16-bit AMD flash chips on a 64-bit bus.  Using
the MTD devices, I can write to, erase, and read the flash with no problems.
(I had to modify my PowerPC kernel to use a 64-bit floating point register
to ensure a 64-bit write, instead of two 32-bit writes.  Prior to this, I
had some failures).

If I copy in a JFFS2 filesystem, I can mount it and use "ls" to get a top
level directory listing.  However, if I use "ls -l" to get the same listing,
I get:

Chip not ready after erase suspended: status = 0x2a
error -5 reading node at 0x000bc110 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 2 returned -5
ls: /mnt/bin: Input/output error

Is this most likely a problem with the cfi_cmdset_0002, or something in
JFFS2?

John Whitney
