Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160UCp-0004v9-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Nov 2001 20:49:23 +0000
Received: from gromit.house (gromit.house [192.168.1.133])
	by gateway.house (8.11.6/8.11.2) with ESMTP id fA4KvQs27148
	for <linux-mtd@lists.infradead.org>; Sun, 4 Nov 2001 15:57:26 -0500
Subject: JFFS2, CF, PCMCIA adapter, ATA
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Nov 2001 15:59:13 -0500
Message-Id: <1004907553.4240.42.camel@gromit.house>
Mime-Version: 1.0
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


Hi there,

I've been trying to create a jffs2 image on a 16MB compact flash card
today. I've got a pcmcia-to-cf adapter that works well for treating the
CF like a small disk. The unit I'm plugging the flash into is  GCT
Allwell set-top box with a CF clot in the back. The CF hard shows up as
the frist IDE hard disk. Using lilo and ext2, I can boot a kernel with
it. I would rather use jffs2, for a variety of reasons. 

How do I create a "loopback" jffs2 filesystem? How do I create a jffs2
filesystem on the CF card using the PCMCIA adapter (so that the CF
filesystem can be booted and mounted on the GCT-Allwell)? The mkfs.jffs2
utility creates a file of the filesystem tree I've created (kernel,
busybox, etc.). ... what next?

I'm using 2.4.13, with mtd and jffs2 compiled in. No devfs.

If there's documentation I should be reading, please point me at it.
I've spent a good part of the day with google and the cvs sources for
'mtd'.

Thanks,

Michael
