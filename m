Received: from colin-baker-v0.ics.uci.edu ([128.195.1.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NJAEg-0005Zv-N6
	for linux-mtd@lists.infradead.org; Fri, 11 Dec 2009 18:29:06 +0000
Received: from webmail.ics.uci.edu (susan-foreman.ics.uci.edu [128.195.1.134])
	by colin-baker-v0.ics.uci.edu (8.13.8/8.13.8) with ESMTP id
	nBBISseF023232
	for <linux-mtd@lists.infradead.org>; Fri, 11 Dec 2009 10:28:55 -0800
Message-ID: <ba9f10a6e8ef14a2d032fba7f1686df9.squirrel@webmail.ics.uci.edu>
Date: Fri, 11 Dec 2009 10:28:55 -0800
Subject: ubifs mount failure upon power cycle
From: sid@ics.uci.edu
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to use UBIFS (linux 2.6.31) on a MIPS based platform, 128 MB
SLC (2k page) NAND flash as rootfs. After erasing the flash and mounting
ubifs as rootfs, I do a large amount of file copies from NFS. However, if
there is an abrupt power cycle, upon reboot the rootfs mount fails with
the following error messages:

UBIFS: recovery needed
UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 6:43008
UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 6:43008
UBIFS error (pid 1): ubifs_scan: LEB 6 scanning failed
UBIFS error (pid 1): ubifs_recover_leb: corrupt empty space LEB 6:24576,
corruption starts at 18432
UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 6:18432
UBIFS error (pid 1): ubifs_recover_leb: LEB 6 scanning failed
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(8,1)

I searched the list for similar messages. There was a similar thread
(http://lists.infradead.org/pipermail/linux-mtd/2009-April/025229.html)
for NOR flash. However, the fixes to recovery.c from that thread are
already in the current sources.

Any suggestions/pointers on how to debug/fix would be greatly appreciated.

thanks in advance,
-sid
