Received: from lakermmtao08.cox.net ([68.230.240.31])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbSpJ-0001ZK-Bj
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 19:31:23 -0400
Received: from tinker ([68.100.185.121]) by lakermmtao08.cox.net
	(InterMail vM.6.01.03.02 201-2131-111-104-20040324) with SMTP
	id <20040618233109.LOYC17721.lakermmtao08.cox.net@tinker>
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jun 2004 19:31:09 -0400
Message-ID: <001501c4558c$4e42ce80$4402a8c0@tinker>
From: "Dan Brown" <dan_brown@ieee.org>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 18 Jun 2004 19:30:56 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: DOC support update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The new NAND-subsystem-based DiskOnChip driver should now be fairly close to
providing proper JFFS2 support, if it doesn't already.  A tricky issue with
the hardware ECC generator was discovered today, and hopefully solved.

I say hopefully because I won't have a chance to really test it myself until
Monday.  However, interested folks who don't have vital data on their DOC
devices are welcome to do so and provide feedback.

Brief HOWTO (better HOWTO coming soon!):

- Have a DOC Millenium or DOC2000 TSOP.  Millenium+ is not supported (other
folks are hard at work on this).  DOC2000 original does not have BBT
handling yet (coming soon!) and should not be used with JFFS2 yet.

- Load the new diskonchip module (there is now a kernel configuration option
for this under NAND devices).  If your DOC device is not at window D000,
you'll have to edit the source or remap your chip.  Proper probing coming
soon!

- A bunch of mtd devices should be created.  mtd0 is the whole DOC.  The
others are partitions created by M-Systems.  A "BDK" partition is probably
the M-Sys BIOS driver.  A "BDTL" partition is where your INFTL filesystem
used to be.  I say used to be, because you're about to trash it.

- You can review the list of devices with 'cat /proc/mtd'

- Assuming your BDTL partition is mtd3:

    flash_eraseall -j /dev/mtd3
    mkfs.jffs2 -p -e 16384 -n -q -r <rootdir> -o <outputfile>
    nandwrite /dev/mtd3 <outputfile from above>
    mount -t jffs2 /dev/mtdblock3 <mountpoint>

- Cross your fingers.



Results, comments, etc appreciated.

    -Dan Brown
