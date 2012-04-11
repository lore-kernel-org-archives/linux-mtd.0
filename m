Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SI4Zm-0002HT-DL
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 20:55:40 +0000
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] load_xattr_datum need to return a positive number in
 case of unrecoverable error
Date: Wed, 11 Apr 2012 22:54:49 +0200
Message-Id: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As per load_xattr_datum() comment:
	rc < 0 : recoverable error, try again
	rc = 0 : success
	rc > 0 : Unrecoverable error, this node should be deleted.

For now we were only returning negative number (so recoverable error).
But a CRC failure or some inconsitent data seems fatal enough to
consider the attribute instance (version) as lost.

So this patch returns a positive number (1) when it detects an
unrecoverable error.

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
---
 fs/jffs2/xattr.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index b55b803..382b1e0 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -11,6 +11,8 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#define JFFS2_XATTR_IS_CORRUPTED	1
+
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
@@ -153,7 +155,7 @@ static int do_verify_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_dat
 		JFFS2_ERROR("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			    offset, je32_to_cpu(rx.hdr_crc), crc);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	totlen = PAD(sizeof(rx) + rx.name_len + 1 + je16_to_cpu(rx.value_len));
 	if (je16_to_cpu(rx.magic) != JFFS2_MAGIC_BITMASK
@@ -169,7 +171,7 @@ static int do_verify_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_dat
 			    je32_to_cpu(rx.xid), xd->xid,
 			    je32_to_cpu(rx.version), xd->version);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	xd->xprefix = rx.xprefix;
 	xd->name_len = rx.name_len;
@@ -232,7 +234,7 @@ static int do_load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum
 			      ref_offset(xd->node), xd->data_crc, crc);
 		kfree(data);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 
 	xd->flags |= JFFS2_XFLAGS_HOT;
@@ -1282,7 +1284,7 @@ int jffs2_verify_xattr(struct jffs2_sb_info *c)
 	down_write(&c->xattr_sem);
 	list_for_each_entry_safe(xd, _xd, &c->xattr_unchecked, xindex) {
 		rc = do_verify_xattr_datum(c, xd);
-		if (rc < 0)
+		if (rc)
 			continue;
 		list_del_init(&xd->xindex);
 		spin_lock(&c->erase_completion_lock);
-- 
1.7.5.4
