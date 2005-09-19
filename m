Received: from hkn.eecs.berkeley.edu ([128.32.47.228])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHUFD-0007sF-Fy
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 18:36:23 -0400
Received: from gagpcool (helo=localhost)
	by hkn.eecs.berkeley.edu with local-esmtp (Exim 3.35 #1 (Debian))
	id 1EHUFA-00064Y-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Sep 2005 15:36:12 -0700
Date: Mon, 19 Sep 2005 15:36:11 -0700 (PDT)
From: Gagan Prakash <gagpcool@hkn.eecs.berkeley.edu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0509191525180.1130-100000@hkn.eecs.berkeley.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: FAT on raw Nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I am trying to solve the problem of allowing a device with raw nand to be
exposed to any Desktop OS (OS 10, Windows and Linux) without having to
install any sort of driver on the Desktop OS that is not already present.
The only solution I have read of/come up with is for the device to act as
USB external drive and let the host OS mount it as a FAT filesystem. This
means that the filesystem on device partition that is exposed needs to be
FAT.

Now from the archives I know its not the easiest and safest thing to
expose a partition as FAT on raw nand. And it also requires the writing of
a FTL layer. I was wondering if there is a better solution for this
problem.

For example is there a way to emulate FAT on top of existing nand fs like
YAFFS or JFFS2 (this would seem hard specially for writes). Or is the only
solution is to format the device as FAT and expose it as an external USB
drive to the host OS.

Thanks

Gagan Prakash
