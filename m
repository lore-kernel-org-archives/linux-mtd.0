Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13sbn8-0004fS-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 02:13:46 +0000
Date: Sun, 5 Nov 2000 21:10:02 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: corruption with mtdblock
In-Reply-To: <Pine.LNX.4.21.0011060055310.6733-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.10.10011052058170.30791-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I've been trying to find a problem with the MTD block interface for two
days now without any luck.

On a 2.4.0-test10 kernel:

	insmod mtdcore.o
	insmod mtdram.o
	insmod mtdblock.o
	mke2fs /dev/mtdblock0
	mount /dev/mtdblock0 /mnt
	cp -a /sbin /mnt/sbin
	cat /dev/mtdblock0 > /dev/null
	[BOOM! random crash...]

Am I the only one to experience this?

Any ideas?


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
