Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FKGdK-00018y-9J
	for linux-mtd@lists.infradead.org; Fri, 17 Mar 2006 10:13:02 -0500
Date: Fri, 17 Mar 2006 16:12:41 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060317151241.GG28927@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] move mtd_fake_writev where it belongs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patch applies to current -linus.  Should I send it to akpm?

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster

diff -Nur git/drivers/mtd/mtdcore.c writev/drivers/mtd/mtdcore.c
--- git/drivers/mtd/mtdcore.c	2006-03-17 16:03:55.000000000 +0100
+++ writev/drivers/mtd/mtdcore.c	2006-03-17 16:10:15.000000000 +0100
@@ -35,6 +35,27 @@
 
 static LIST_HEAD(mtd_notifiers);
 
+static int mtd_fake_writev(struct mtd_info *mtd, const struct kvec *vecs,
+		unsigned long count, loff_t to, size_t *retlen)
+{
+	unsigned long i;
+	size_t totlen = 0, thislen;
+	int ret = 0;
+
+	for (i=0; i<count; i++) {
+		if (!vecs[i].iov_len)
+			continue;
+		ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
+		totlen += thislen;
+		if (ret || thislen != vecs[i].iov_len)
+			break;
+		to += vecs[i].iov_len;
+	}
+	if (retlen)
+		*retlen = totlen;
+	return ret;
+}
+
 /**
  *	add_mtd_device - register an MTD device
  *	@mtd: pointer to new MTD device info structure
@@ -49,6 +70,9 @@
 {
 	int i;
 
+	if (!mtd->writev)
+		mtd->writev = mtd_fake_writev;
+
 	down(&mtd_table_mutex);
 
 	for (i=0; i < MAX_MTD_DEVICES; i++)
diff -Nur git/fs/jffs2/writev.c writev/fs/jffs2/writev.c
--- git/fs/jffs2/writev.c	2006-03-17 16:04:05.000000000 +0100
+++ writev/fs/jffs2/writev.c	2006-03-17 16:09:43.000000000 +0100
@@ -15,30 +15,6 @@
 #include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
-/* This ought to be in core MTD code. All registered MTD devices
-   without writev should have this put in place. Bug the MTD
-   maintainer */
-static inline int mtd_fake_writev(struct mtd_info *mtd, const struct kvec *vecs,
-				  unsigned long count, loff_t to, size_t *retlen)
-{
-	unsigned long i;
-	size_t totlen = 0, thislen;
-	int ret = 0;
-
-	for (i=0; i<count; i++) {
-		if (!vecs[i].iov_len)
-			continue;
-		ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
-		totlen += thislen;
-		if (ret || thislen != vecs[i].iov_len)
-			break;
-		to += vecs[i].iov_len;
-	}
-	if (retlen)
-		*retlen = totlen;
-	return ret;
-}
-
 int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 			      unsigned long count, loff_t to, size_t *retlen)
 {
@@ -52,11 +28,8 @@
 		}
 	}
 
-	if (c->mtd->writev)
-		return c->mtd->writev(c->mtd, vecs, count, to, retlen);
-	else {
-		return mtd_fake_writev(c->mtd, vecs, count, to, retlen);
-	}
+	BUG_ON(!c->mtd->writev);
+	return c->mtd->writev(c->mtd, vecs, count, to, retlen);
 }
 
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
