Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AsIy1-0007vx-EQ
	for linux-mtd@lists.infradead.org; Sun, 15 Feb 2004 09:53:37 +0000
Date: Sun, 15 Feb 2004 01:53:26 -0800
From: Marc Singer <elf@buici.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20040215095325.GA27531@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Can 256K erase blocks work with JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In struggling through final steps in proving a new kernel port, I'm
trying to mount a root filesystem so I can see a shell prompt.  I've
got a mapping driver with partitions that appears to work correctly.
Yet, I'm concerned that the very large erase block size could be
causing problems.

When creating the jffs2 filesystem, if I set the erase block size to
256 then the filesystem created is twice the size of my total flash
capacity--can't use it.  The default of 64 produces a modest
filesystem of 5MB.

I'm pretty sure of the erase size.  There are two StrataFlash
28F640J3A chips wired for a 32 bit data bus.  Each has 8MBytes
organized in 64 blocks.  Moreover, empirical evidence shows that the
erase size of 256K.

The kernel will mount the filesystem as rootm but I don't get a shell.
I'm reasonably confident that the root is good because it has worked
when mounted over NFS.  This new system uses the same CPU, but doesn't
yet have a working network driver.

So, I'm asking if I have a snowball's chance in hades with this.  Or,
should I start working on other means of mounting a root filesystem?

TIA
