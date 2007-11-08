Received: from nz-out-0506.google.com ([64.233.162.228])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpxtW-0007Bt-Sq
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:17:33 -0500
Received: by nz-out-0506.google.com with SMTP id z3so23177nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:17:24 -0800 (PST)
Message-ID: <6934efce0711071917r6e283960o1d35213cf83e1483@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:17:23 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/8] MTD: add physical address to point() api -- jffs2 changes
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding the ability to get a physical address from point() in addition
to virtual address.  This physical address will be required for axfs
and cramfs with XIP.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
----
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..f6c6fe2 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -332,7 +332,7 @@ static int jffs2_block_check_erase(struct
jffs2_sb_info *c, struct jffs2_erasebl
 	if (c->mtd->point) {
 		unsigned long *wordebuf;

-		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size, &retlen,
(unsigned char **)&ebuf);
+		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size, &retlen,
&ebuf, NULL);
 		if (ret) {
 			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
 			goto do_flash_read;
@@ -340,7 +340,7 @@ static int jffs2_block_check_erase(struct
jffs2_sb_info *c, struct jffs2_erasebl
 		if (retlen < c->sector_size) {
 			/* Don't muck about if it won't let us point to the whole erase sector */
 			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", retlen));
-			c->mtd->unpoint(c->mtd, ebuf, jeb->offset, retlen);
+			c->mtd->unpoint(c->mtd, jeb->offset, retlen);
 			goto do_flash_read;
 		}
 		wordebuf = ebuf-sizeof(*wordebuf);
@@ -349,7 +349,7 @@ static int jffs2_block_check_erase(struct
jffs2_sb_info *c, struct jffs2_erasebl
 		   if (*++wordebuf != ~0)
 			   break;
 		} while(--retlen);
-		c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
+		c->mtd->unpoint(c->mtd, jeb->offset, c->sector_size);
 		if (retlen)
 			printk(KERN_WARNING "Newly-erased block contained word 0x%lx at
offset 0x%08tx\n",
 			       *wordebuf, jeb->offset + c->sector_size-retlen*sizeof(*wordebuf));
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 2eae5d2..d782ffa 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -62,10 +62,10 @@ static int check_node_data(struct jffs2_sb_info
*c, struct jffs2_tmp_dnode_info
 	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
 	 * adding and jffs2_flash_read_end() interface. */
 	if (c->mtd->point) {
-		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
+		err = c->mtd->point(c->mtd, ofs, len, &retlen, (void **)&buffer, NULL);
 		if (!err && retlen < tn->csize) {
 			JFFS2_WARNING("MTD point returned len too short: %zu instead of
%u.\n", retlen, tn->csize);
-			c->mtd->unpoint(c->mtd, buffer, ofs, retlen);
+			c->mtd->unpoint(c->mtd, ofs, retlen);
 		} else if (err)
 			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
 		else
@@ -99,7 +99,7 @@ static int check_node_data(struct jffs2_sb_info *c,
struct jffs2_tmp_dnode_info
 		kfree(buffer);
 #ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, buffer, ofs, len);
+		c->mtd->unpoint(c->mtd, ofs, len);
 #endif

 	if (crc != tn->data_crc) {
@@ -135,7 +135,7 @@ free_out:
 		kfree(buffer);
 #ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, buffer, ofs, len);
+		c->mtd->unpoint(c->mtd, ofs, len);
 #endif
 	return err;
 }
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 272872d..0b7edc8 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -97,11 +97,11 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	size_t pointlen;

 	if (c->mtd->point) {
-		ret = c->mtd->point (c->mtd, 0, c->mtd->size, &pointlen, &flashbuf);
+		ret = c->mtd->point(c->mtd, 0, c->mtd->size, &pointlen, (void
**)&flashbuf, NULL);
 		if (!ret && pointlen < c->mtd->size) {
 			/* Don't muck about if it won't let us point to the whole flash */
 			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n",
pointlen));
-			c->mtd->unpoint(c->mtd, flashbuf, 0, pointlen);
+			c->mtd->unpoint(c->mtd, 0, pointlen);
 			flashbuf = NULL;
 		}
 		if (ret)
@@ -267,7 +267,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 		kfree(flashbuf);
 #ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
+		c->mtd->unpoint(c->mtd, 0, c->mtd->size);
 #endif
 	if (s)
 		kfree(s);
