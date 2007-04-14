Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HgNuM-0005p3-HZ
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 12:30:30 -0400
Received: from localhost ([127.0.0.1]:60988 helo=newbox)
	by secure.poehali.org with esmtpa (Exim 4.63)
	(envelope-from <ivan.kuten@promwad.com>) id 1HgNuL-0001An-0T
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 19:30:25 +0300
Date: Sat, 14 Apr 2007 16:38:53 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 and Dataflash write support - data corruption
Message-ID: <20070414163853.41153ddb@newbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I use JFFS2 on r/w partition on Atmel Dataflash AT45DB642 with the following kernel config options enabled:
------- snip ----------
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
--------snip-------------

Linux kernel is 2.6.20 + 2.6.20-at91.patch from http://maxim.org.za/at91_26.html

JFFS2 is created with:
mkfs.jffs2 -r . -o jffs2.img -s 1056 -e 8448 -n -p

I'm observing occasional data corruption (md5sums are different) when my apps which also reside on that r/w partition do writes on dataflash.

"Occasional" means the following:
- 3 apps doing 1Kb writes once 2-3 seconds
- md5sums for those 3 apps are calculated and compared to original
- once 5 mins hardware reset is performed
- after several hours of work md5sums don't match


Can anybody confirm that JFFS2 writes + Dataflash are reliable?

Thank you.

Ivan
