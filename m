Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD253-0004p6-JA
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 03:00:59 +0000
Received: by iecvh10 with SMTP id vh10so168599138iec.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 20:00:36 -0700 (PDT)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] jffs2:Remove redundant error checking after calling
 jffs2_scan_dirty_space in the file scan.c
Date: Wed,  8 Jul 2015 23:00:30 -0400
Message-Id: <1436410831-29257-2-git-send-email-xerofoify@gmail.com>
In-Reply-To: <1436410831-29257-1-git-send-email-xerofoify@gmail.com>
References: <1436410831-29257-1-git-send-email-xerofoify@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This removes all redundant error checks agains the return value
of the function jffs2_scan_dirty_space in the file scan.c due
to this function always completing successfully and never returning
a error code to its caller to indicate a failure has occurred.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 fs/jffs2/scan.c | 75 +++++++++++++++++++--------------------------------------
 1 file changed, 25 insertions(+), 50 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 9ad5ba4..39f6032 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -72,8 +72,7 @@ static int file_dirty(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 
 	if ((ret = jffs2_prealloc_raw_node_refs(c, jeb, 1)))
 		return ret;
-	if ((ret = jffs2_scan_dirty_space(c, jeb, jeb->free_size)))
-		return ret;
+	jffs2_scan_dirty_space(c, jeb, jeb->free_size);
 	/* Turned wasted size into dirty, since we apparently 
 	   think it's recoverable now. */
 	jeb->dirty_size += jeb->wasted_size;
@@ -330,14 +329,12 @@ static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_erasebloc
 {
 	struct jffs2_xattr_datum *xd;
 	uint32_t xid, version, totlen, crc;
-	int err;
 
 	crc = crc32(0, rx, sizeof(struct jffs2_raw_xattr) - 4);
 	if (crc != je32_to_cpu(rx->node_crc)) {
 		JFFS2_WARNING("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			      ofs, je32_to_cpu(rx->node_crc), crc);
-		if ((err = jffs2_scan_dirty_space(c, jeb, je32_to_cpu(rx->totlen))))
-			return err;
+		jffs2_scan_dirty_space(c, jeb, je32_to_cpu(rx->totlen));
 		return 0;
 	}
 
@@ -349,8 +346,7 @@ static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_erasebloc
 	if (totlen != je32_to_cpu(rx->totlen)) {
 		JFFS2_WARNING("node length mismatch at %#08x, read=%u, calc=%u\n",
 			      ofs, je32_to_cpu(rx->totlen), totlen);
-		if ((err = jffs2_scan_dirty_space(c, jeb, je32_to_cpu(rx->totlen))))
-			return err;
+		jffs2_scan_dirty_space(c, jeb, je32_to_cpu(rx->totlen));
 		return 0;
 	}
 
@@ -386,14 +382,12 @@ static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock
 {
 	struct jffs2_xattr_ref *ref;
 	uint32_t crc;
-	int err;
 
 	crc = crc32(0, rr, sizeof(*rr) - 4);
 	if (crc != je32_to_cpu(rr->node_crc)) {
 		JFFS2_WARNING("node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
 			      ofs, je32_to_cpu(rr->node_crc), crc);
-		if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(rr->totlen)))))
-			return err;
+		jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(rr->totlen)));
 		return 0;
 	}
 
@@ -401,8 +395,7 @@ static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock
 		JFFS2_WARNING("node length mismatch at %#08x, read=%u, calc=%zd\n",
 			      ofs, je32_to_cpu(rr->totlen),
 			      PAD(sizeof(struct jffs2_raw_xref)));
-		if ((err = jffs2_scan_dirty_space(c, jeb, je32_to_cpu(rr->totlen))))
-			return err;
+		jffs2_scan_dirty_space(c, jeb, je32_to_cpu(rr->totlen));
 		return 0;
 	}
 
@@ -594,8 +587,7 @@ full_scan:
 			  jeb->offset + ofs);
 		if ((err = jffs2_prealloc_raw_node_refs(c, jeb, 1)))
 			return err;
-		if ((err = jffs2_scan_dirty_space(c, jeb, ofs)))
-			return err;
+		jffs2_scan_dirty_space(c, jeb, ofs);
 	}
 
 	/* Now ofs is a complete physical flash offset as it always was... */
@@ -625,8 +617,7 @@ scan_more:
 		if (ofs == prevofs) {
 			pr_warn("ofs 0x%08x has already been seen. Skipping\n",
 				ofs);
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, 4);
 			ofs += 4;
 			continue;
 		}
@@ -637,8 +628,7 @@ scan_more:
 				  sizeof(struct jffs2_unknown_node),
 				  jeb->offset, c->sector_size, ofs,
 				  sizeof(*node));
-			if ((err = jffs2_scan_dirty_space(c, jeb, (jeb->offset + c->sector_size)-ofs)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, (jeb->offset + c->sector_size)-ofs);
 			break;
 		}
 
@@ -670,8 +660,7 @@ scan_more:
 				if (unlikely(*(uint32_t *)(&buf[inbuf_ofs]) != 0xffffffff)) {
 					pr_warn("Empty flash at 0x%08x ends at 0x%08x\n",
 						empty_start, ofs);
-					if ((err = jffs2_scan_dirty_space(c, jeb, ofs-empty_start)))
-						return err;
+					jffs2_scan_dirty_space(c, jeb, ofs-empty_start);
 					goto scan_more;
 				}
 
@@ -718,23 +707,20 @@ scan_more:
 		if (ofs == jeb->offset && je16_to_cpu(node->magic) == KSAMTIB_CIGAM_2SFFJ) {
 			pr_warn("Magic bitmask is backwards at offset 0x%08x. Wrong endian filesystem?\n",
 				ofs);
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, 4);
 			ofs += 4;
 			continue;
 		}
 		if (je16_to_cpu(node->magic) == JFFS2_DIRTY_BITMASK) {
 			jffs2_dbg(1, "Dirty bitmask at 0x%08x\n", ofs);
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, 4);
 			ofs += 4;
 			continue;
 		}
 		if (je16_to_cpu(node->magic) == JFFS2_OLD_MAGIC_BITMASK) {
 			pr_warn("Old JFFS2 bitmask found at 0x%08x\n", ofs);
 			pr_warn("You cannot use older JFFS2 filesystems with newer kernels\n");
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, 4);
 			ofs += 4;
 			continue;
 		}
@@ -744,8 +730,7 @@ scan_more:
 				     __func__,
 				     JFFS2_MAGIC_BITMASK, ofs,
 				     je16_to_cpu(node->magic));
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, 4);
 			ofs += 4;
 			continue;
 		}
@@ -763,8 +748,7 @@ scan_more:
 				     je32_to_cpu(node->totlen),
 				     je32_to_cpu(node->hdr_crc),
 				     hdr_crc);
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, 4);
 			ofs += 4;
 			continue;
 		}
@@ -774,8 +758,7 @@ scan_more:
 			pr_warn("Node at 0x%08x with length 0x%08x would run over the end of the erase block\n",
 				ofs, je32_to_cpu(node->totlen));
 			pr_warn("Perhaps the file system was created with the wrong erase size?\n");
-			if ((err = jffs2_scan_dirty_space(c, jeb, 4)))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, 4);
 			ofs += 4;
 			continue;
 		}
@@ -784,8 +767,7 @@ scan_more:
 			/* Wheee. This is an obsoleted node */
 			jffs2_dbg(2, "Node at 0x%08x is obsolete. Skipping\n",
 				  ofs);
-			if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)))))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)));
 			ofs += PAD(je32_to_cpu(node->totlen));
 			continue;
 		}
@@ -868,14 +850,12 @@ scan_more:
 				pr_notice("CLEANMARKER node found at 0x%08x has totlen 0x%x != normal 0x%x\n",
 					  ofs, je32_to_cpu(node->totlen),
 					  c->cleanmarker_size);
-				if ((err = jffs2_scan_dirty_space(c, jeb, PAD(sizeof(struct jffs2_unknown_node)))))
-					return err;
+				jffs2_scan_dirty_space(c, jeb, PAD(sizeof(struct jffs2_unknown_node)));
 				ofs += PAD(sizeof(struct jffs2_unknown_node));
 			} else if (jeb->first_node) {
 				pr_notice("CLEANMARKER node found at 0x%08x, not first node in block (0x%08x)\n",
 					  ofs, jeb->offset);
-				if ((err = jffs2_scan_dirty_space(c, jeb, PAD(sizeof(struct jffs2_unknown_node)))))
-					return err;
+				jffs2_scan_dirty_space(c, jeb, PAD(sizeof(struct jffs2_unknown_node)));
 				ofs += PAD(sizeof(struct jffs2_unknown_node));
 			} else {
 				jffs2_link_node_ref(c, jeb, ofs | REF_NORMAL, c->cleanmarker_size, NULL);
@@ -887,8 +867,7 @@ scan_more:
 		case JFFS2_NODETYPE_PADDING:
 			if (jffs2_sum_active())
 				jffs2_sum_add_padding_mem(s, je32_to_cpu(node->totlen));
-			if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)))))
-				return err;
+			jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)));
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
 
@@ -900,8 +879,7 @@ scan_more:
 				c->flags |= JFFS2_SB_FLAG_RO;
 				if (!(jffs2_is_readonly(c)))
 					return -EROFS;
-				if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)))))
-					return err;
+				jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)));
 				ofs += PAD(je32_to_cpu(node->totlen));
 				break;
 
@@ -913,8 +891,7 @@ scan_more:
 			case JFFS2_FEATURE_RWCOMPAT_DELETE:
 				jffs2_dbg(1, "Unknown but compatible feature node (0x%04x) found at offset 0x%08x\n",
 					  je16_to_cpu(node->nodetype), ofs);
-				if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)))))
-					return err;
+				jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(node->totlen)));
 				ofs += PAD(je32_to_cpu(node->totlen));
 				break;
 
@@ -1008,8 +985,9 @@ static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct jffs2_erasebloc
 		 * We believe totlen because the CRC on the node
 		 * _header_ was OK, just the node itself failed.
 		 */
-		return jffs2_scan_dirty_space(c, jeb,
+		jffs2_scan_dirty_space(c, jeb,
 					      PAD(je32_to_cpu(ri->totlen)));
+		return 0;
 	}
 
 	ic = jffs2_get_ino_cache(c, ino);
@@ -1043,7 +1021,6 @@ static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblo
 	struct jffs2_inode_cache *ic;
 	uint32_t checkedlen;
 	uint32_t crc;
-	int err;
 
 	jffs2_dbg(1, "%s(): Node at 0x%08x\n", __func__, ofs);
 
@@ -1055,8 +1032,7 @@ static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblo
 		pr_notice("%s(): Node CRC failed on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
 			  __func__, ofs, je32_to_cpu(rd->node_crc), crc);
 		/* We believe totlen because the CRC on the node _header_ was OK, just the node itself failed. */
-		if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(rd->totlen)))))
-			return err;
+		jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(rd->totlen)));
 		return 0;
 	}
 
@@ -1084,8 +1060,7 @@ static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblo
 		jffs2_free_full_dirent(fd);
 		/* FIXME: Why do we believe totlen? */
 		/* We believe totlen because the CRC on the node _header_ was OK, just the name failed. */
-		if ((err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(rd->totlen)))))
-			return err;
+		jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(rd->totlen)));
 		return 0;
 	}
 	ic = jffs2_scan_make_ino_cache(c, je32_to_cpu(rd->pino));
-- 
2.1.4
