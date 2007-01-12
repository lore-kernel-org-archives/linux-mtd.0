Received: from gateway-1237.mvista.com ([63.81.120.158])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H5VU5-0004wA-6t
	for linux-mtd@lists.infradead.org; Fri, 12 Jan 2007 18:06:55 -0500
Subject: [PATCH] [JFFS2] fix unpoint length
From: Andy Lowe <alowe@mvista.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 12 Jan 2007 17:05:24 -0600
Message-Id: <1168643124.15116.21.camel@alowe-desktop.mvista.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] [JFFS2] fix unpoint length

Fix a couple of instances in JFFS2 where the unpoint() routine is
being called with the wrong length in cases where the point() routine
truncated a request.

Signed-off-by: Andy Lowe <alowe@mvista.com>

Index: linux-2.6.19/fs/jffs2/nodelist.c
===================================================================
--- linux-2.6.19.orig/fs/jffs2/nodelist.c
+++ linux-2.6.19/fs/jffs2/nodelist.c
@@ -443,7 +443,7 @@ static int check_node_data(struct jffs2_
 		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
 		if (!err && retlen < tn->csize) {
 			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
-			c->mtd->unpoint(c->mtd, buffer, ofs, len);
+			c->mtd->unpoint(c->mtd, buffer, ofs, retlen);
 		} else if (err)
 			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
 		else
Index: linux-2.6.19/fs/jffs2/scan.c
===================================================================
--- linux-2.6.19.orig/fs/jffs2/scan.c
+++ linux-2.6.19/fs/jffs2/scan.c
@@ -102,7 +102,7 @@ int jffs2_scan_medium(struct jffs2_sb_in
 		if (!ret && pointlen < c->mtd->size) {
 			/* Don't muck about if it won't let us point to the whole flash */
 			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", pointlen));
-			c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
+			c->mtd->unpoint(c->mtd, flashbuf, 0, pointlen);
 			flashbuf = NULL;
 		}
 		if (ret)
