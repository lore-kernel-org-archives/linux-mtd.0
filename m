Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oS2r-0002Ad-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 17:05:21 +0100
Message-ID: <20011002091421.A15650@recycle.lbl.gov>
Date: Tue, 2 Oct 2001 09:14:21 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: JFFS2_RESERVED_BLOCKS_*
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm still fumbling around with MTD/JFFS2, but it does
seem to work.  I have a file system mounted that is
persistent across reboots, which is of course the goal.

Out of 4M Flash on this board, I set aside 1 M for JFFS2.
The rest is supposed to be used for the kernel and initrd,
and I guess I can now program that directly from Linux
instead of from the boot loader.

I have just a few kBytes of junk in that test filesystem, 
as confirmed by du:

/ # du /mnt/test
1       /mnt/test/ssh
0       /mnt/test/html
3       /mnt/test/init.d
11      /mnt/test
/ # 

Imagine my surprise when I read the df output:

/ # df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/ram0                 3835      2359      1476  62% /
/dev/mtdblock2            1024       328       696  32% /mnt/test

Tracing through the source, I discover this is because there
are JFFS2_RESERVED_BLOCKS_WRITE == 5 blocks reserved.  The
Intel 28F320B3 I have has 64 kB erase blocks, so this
reservation accounts for 320 kB.

Maybe my use is atypical, and maybe 5 blocks is a theoretical
minimum.  I don't want to sound like a complainer, either --
this file system certainly looks like it meets my needs.
I guess I just want to point out the superficial imbalance
between the amount of sweat people pour out on projects like
busybox to reduce code size by a few kB, when there is 320 kB
"just lying around" on any JFFS2 on a 64 kB erase block chip.

Maybe the 5-block reservation could be pointed out in the
documentation, and some explanation given as to why this
is reasonable.  Other people may have less wiggle-room in
their design, and we wouldn't want them to be surprised
and get angry with embedded Linux.

      - Larry
