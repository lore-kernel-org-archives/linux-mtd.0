Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19fn2u-0000dR-FZ
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 21:50:40 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19fn1h-0005y8-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 22:49:25 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Thu, 24 Jul 2003 13:50:16 -0700
Message-ID: <m3smov3b07.fsf@bfnet.com>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: ARGH. About to write node to 0x00022fac on flash, but there's data
 already there
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Whenever I write big files to my JFFS2 partition, I'm getting this
error (see Subject: line).  Small files don't result in the error.  I
googled for hints but found nothing helpful.  My stats:

mkfs.jffs2:   revision 1.32
architecture: mipsel
Kernel:       2.4.18 (CONFIG_JFFS2_FS=y, CONFIG_JFFS2_FS_DEBUG=2)

/bin/mount returns:
/dev/mtdblock/2 on /mnt/flash0 type jffs2 (rw,noatime)

Any suggestions?

Dave
