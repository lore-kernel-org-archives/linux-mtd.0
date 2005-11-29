Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh70l-0000I3-Iq
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 10:04:44 -0500
Date: Tue, 29 Nov 2005 18:03:20 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20051129180320.22e62e2e.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH] trivial: fix oobavail for partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this patch fixes oobavail propagation to partitions. May I commit this one?

Vitaly

diff -uNr linux-2.6.10.orig/drivers/mtd/mtdpart.c linux-2.6.10.nand/drivers/mtd/mtdpart.c
--- linux-2.6.10.orig/drivers/mtd/mtdpart.c	2005-11-24 15:58:37.000000000 +0300
+++ linux-2.6.10.nand/drivers/mtd/mtdpart.c	2005-11-24 16:33:21.000000000 +0300
@@ -400,6 +400,7 @@
 		slave->mtd.size = parts[i].size;
 		slave->mtd.oobblock = master->oobblock;
 		slave->mtd.oobsize = master->oobsize;
+		slave->mtd.oobavail = master->oobavail;
 		slave->mtd.ecctype = master->ecctype;
 		slave->mtd.eccsize = master->eccsize;
 
