Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AksAj-0006Af-1V
	for linux-mtd@lists.infradead.org; Sun, 25 Jan 2004 21:52:01 +0000
Received: from eric by maxwell.lnxi.com with local (Exim 3.35 #1 (Debian))
	id 1AksCZ-0000Yu-00
	for <linux-mtd@lists.infradead.org>; Sun, 25 Jan 2004 14:53:55 -0700
To: <linux-mtd@lists.infradead.org> 
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 25 Jan 2004 14:53:55 -0700
Message-ID: <m3u12jr8y4.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Subject: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Currently I am examining the possibility of using a filesystem with
LinuxBIOS so that I may store parameters and kernels in the flash in a
more flexible manner. 

The current flash chips I am working with are NOR flash from 512KiB to
4MiB.  And they generally have a 64KiB erase size.

I have two flash blocks that are reserved for XIP code (the hw
initialization firmware) and the rest can be used for the filesystem.
So in the worst case I have 6 flash blocks to play with.

The old papers on jffs2 would make it unacceptable as it reserves
5 erase blocks.  And I don't know if yaffs or yaffs2 is any better.

In addition boot time is important so it would be ideal if I did not
to read every byte of the ROM chip to initialize the filesystem.

Is there a filesystem that only reserves one erase block?

Does it look like I need to write my own solution?

Eric
