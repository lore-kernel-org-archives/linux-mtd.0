Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAhT2-0004EI-WD
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 01:18:34 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.realmsys.com (Postfix) with ESMTP id B7D3D52DDF
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2005 23:10:30 -0600 (MDT)
Received: from mail.realmsys.com ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 30947-07 for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2005 23:10:24 -0600 (MDT)
Received: from pgrayson1.inrealm.net (fire2.inream.net [66.239.3.2])
	by mail.realmsys.com (Postfix) with ESMTP id A8E253C2D4
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Aug 2005 23:10:24 -0600 (MDT)
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-FtQoN4ESbbbEdUXo/QLA"
Date: Wed, 31 Aug 2005 23:18:22 -0600
Message-Id: <1125551902.7076.22.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [PATCH] More removing virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FtQoN4ESbbbEdUXo/QLA
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Here is a follow-on patch for Ferenc's patch that removes virtual block
support from jffs2. Just a couple loose ends.

Pete


--=-FtQoN4ESbbbEdUXo/QLA
Content-Disposition: attachment; filename=jffs2-novirtblock2.patch
Content-Type: text/x-patch; name=jffs2-novirtblock2.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

[JFFS2] Follow-on to Ferenc's jffs2-novirtblocks patch
[From: Peter Grayson <pgrayson@realmsys.com>]
diff -Narup mtd/fs/jffs2/fs.c mtd-novirtblock2/fs/jffs2/fs.c
--- mtd/fs/jffs2/fs.c	2005-08-31 17:56:25.000000000 -0600
+++ mtd-novirtblock2/fs/jffs2/fs.c	2005-08-31 23:07:31.887566728 -0600
@@ -469,10 +469,6 @@ int jffs2_do_fill_super(struct super_blo
 			c->flash_size / 1024);
 	}
 
-	if (c->sector_size != c->mtd->erasesize)
-		printk(KERN_INFO "jffs2: Erase block size too small (%dKiB). Using virtual blocks size (%dKiB) instead\n", 
-			c->mtd->erasesize / 1024, c->sector_size / 1024);
-
 	if (c->flash_size < 5*c->sector_size) {
 		printk(KERN_ERR "jffs2: Too few erase blocks (%d)\n", c->flash_size / c->sector_size);
 		return -EINVAL;
@@ -522,7 +518,7 @@ int jffs2_do_fill_super(struct super_blo
 	iput(root_i);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
-	if (c->mtd->flags & MTD_NO_VIRTBLOCKS)
+	if (jffs2_blocks_use_vmalloc(c))
 		vfree(c->blocks);
 	else
 		kfree(c->blocks);

--=-FtQoN4ESbbbEdUXo/QLA--
