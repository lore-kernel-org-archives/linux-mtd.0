Received: from moutng.kundenserver.de ([212.227.126.173])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al7hl-0000CO-4a
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 14:27:09 +0000
Received: from [212.227.126.160] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1Al7hQ-0007m1-00
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 15:26:48 +0100
Received: from [217.88.220.117] (helo=phoenix.one.melware.de)
	by mrelayng.kundenserver.de with asmtp (Exim 3.35 #1)
	id 1Al7hP-0007ks-00
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 15:26:47 +0100
Received: from phoenix.one.melware.de (phoenix.one.melware.de [192.168.100.2])
	by phoenix.one.melware.de (8.12.9/8.12.9) with ESMTP id i0QEQjnB032327
	for <linux-mtd@lists.infradead.org>; Mon, 26 Jan 2004 15:26:45 +0100
Date: Mon, 26 Jan 2004 15:26:45 +0100 (MET)
From: Armin Schindler <armin@melware.de>
Sender: <armin@melware.de>
To: <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.31.0401261520320.32301-100000@phoenix.one.melware.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

together with latest CVS of jffs2 (one week old), I try to use
my rootfs on a jffs2 NAND-Flash partition.

It seems to work pretty good, but when I have e.g. reset/power-down,
on the next boot/rootfs-mount I get messages like:

 jffs2_scan_dirent_node(): Name CRC failed on node at 0x001b89dc: Read 0xffffffff,
 calculated 0xc04c39e5
 Empty flash at 0x001b8a10 ends at 0x001b8c00
 Empty flash at 0x001b93f8 ends at 0x001b9400

I thought, that such errors will be fixed, but every time I mount the partition,
these errors still exist.

Is the filesystem now unfixable or am I doing something wrong?

Thanks for any hint,
Armin
