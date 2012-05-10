Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSV41-0000Al-Ba
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 15:14:00 +0000
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] allow JFFS2 to discriminate between recoverable and
 non-recoverable errors
Date: Thu, 10 May 2012 17:13:44 +0200
Message-Id: <1336662824-2594-1-git-send-email-jcd@tribudubois.net>
Cc: Jean-Christophe DUBOIS <jcd@tribudubois.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is basicaly a reverse of commit f326966b3df47f4fa7e90425f60efdd30c31fe19.

It allows JFFS2 to make the distinction between a potential transient error
(reading or writing the media) and a non recoverable error like a bad CRC on
the extended attribute data or some insconsitent paramaters.

In order to make clear that the error is indeed intended to report a corrupted
attribute, a new local error code (JFFS2_XATTR_IS_CORRUPTED) is introduced.

This error code is never reported to user space and only checked locally in this
file.

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
---
 fs/jffs2/xattr.c |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index b55b803..c18c0ab 100644
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
@@ -227,12 +229,12 @@ static int do_load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum
 	data[xd->name_len] = '\0';
 	crc = crc32(0, data, length);
 	if (crc != xd->data_crc) {
-		JFFS2_WARNING("node CRC failed (JFFS2_NODETYPE_XREF)"
+		JFFS2_WARNING("node CRC failed (JFFS2_NODETYPE_XATTR)"
 			      " at %#08x, read: 0x%08x calculated: 0x%08x\n",
 			      ref_offset(xd->node), xd->data_crc, crc);
 		kfree(data);
 		xd->flags |= JFFS2_XFLAGS_INVALID;
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 
 	xd->flags |= JFFS2_XFLAGS_HOT;
@@ -270,7 +272,7 @@ static int load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *x
 	if (xd->xname)
 		return 0;
 	if (xd->flags & JFFS2_XFLAGS_INVALID)
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	if (unlikely(is_xattr_datum_unchecked(c, xd)))
 		rc = do_verify_xattr_datum(c, xd);
 	if (!rc)
@@ -462,7 +464,7 @@ static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref
 	if (crc != je32_to_cpu(rr.node_crc)) {
 		JFFS2_ERROR("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			    offset, je32_to_cpu(rr.node_crc), crc);
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	if (je16_to_cpu(rr.magic) != JFFS2_MAGIC_BITMASK
 	    || je16_to_cpu(rr.nodetype) != JFFS2_NODETYPE_XREF
@@ -472,7 +474,7 @@ static int verify_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref
 			    offset, je16_to_cpu(rr.magic), JFFS2_MAGIC_BITMASK,
 			    je16_to_cpu(rr.nodetype), JFFS2_NODETYPE_XREF,
 			    je32_to_cpu(rr.totlen), PAD(sizeof(rr)));
-		return -EIO;
+		return JFFS2_XATTR_IS_CORRUPTED;
 	}
 	ref->ino = je32_to_cpu(rr.ino);
 	ref->xid = je32_to_cpu(rr.xid);
-- 
1.7.9.5
