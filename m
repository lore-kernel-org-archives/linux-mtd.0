Received: from fep01-mail.bloor.is.net.cable.rogers.com ([66.185.86.71])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZlE1-0003M3-36
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 06:41:13 +0100
Received: from [192.168.2.100] ([24.103.13.31])
	by fep01-mail.bloor.is.net.cable.rogers.comESMTP
	<20030708054051.PNG10184.fep01-mail.bloor.is.net.cable.rogers.com@[192.168.2.100]>
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Jul 2003 01:40:51 -0400
From: Chris AtLee <chris@atlee.ca>
To: Linux MTD <linux-mtd@lists.infradead.org>
Message-Id: <1057642854.847.27.camel@geb>
Mime-Version: 1.0
Date: 08 Jul 2003 01:40:54 -0400
Content-Type: multipart/mixed; boundary="=-rqSWi18P6g1weUZYF1X0"
Subject: Teeny patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rqSWi18P6g1weUZYF1X0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

My compiler (gcc 2.95.3) complains about "int ret = ..." on line 385 of
mtd_blkdevs-24.c

Or should I be using a newer compiler? :)

Cheers
-- 
Chris AtLee <chris@atlee.ca>

--=-rqSWi18P6g1weUZYF1X0
Content-Disposition: attachment; filename=patch
Content-Type: text/x-patch; name=patch; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

Index: drivers/mtd/mtd_blkdevs-24.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtd_blkdevs-24.c,v
retrieving revision 1.11
diff -u -r1.11 mtd_blkdevs-24.c
--- drivers/mtd/mtd_blkdevs-24.c	23 Jun 2003 12:00:08 -0000	1.11
+++ drivers/mtd/mtd_blkdevs-24.c	8 Jul 2003 05:38:48 -0000
@@ -380,9 +380,10 @@
 		if (tr->getgeo) {
 			struct hd_geometry g;
 			struct gendisk *gd = &(tr->blkcore_priv->gd);
+			int ret;
 
 			memset(&g, 0, sizeof(g));
-			int ret = tr->getgeo(dev, &g);
+			ret = tr->getgeo(dev, &g);
 			if (ret)
 				return ret;
 

--=-rqSWi18P6g1weUZYF1X0--
