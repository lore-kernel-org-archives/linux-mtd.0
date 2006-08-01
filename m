Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G7uae-0001EB-Eo
	for linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 09:47:45 -0400
Subject: [PATCH] JFFS2 superblock support
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: dwmw2@infradead.org
Content-Type: multipart/mixed; boundary="=-PZv0aeYDU26ACsOhQr0z"
Date: Tue, 01 Aug 2006 17:46:41 +0400
Message-Id: <1154440001.30995.7.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PZv0aeYDU26ACsOhQr0z
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

David,

here is the patch which adds superblock node support to JFFS2 (we talked
about this). The superblock node has no useful data so far - this patch
just adds general support.

The next steps are:

1. useful data to SB and probably corresponding ioctl() interfaces which
change these data.
3. update mtdutils correspondingly;

I'm only planning to add reserved size to the SB.

Comments?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.

--=-PZv0aeYDU26ACsOhQr0z
Content-Disposition: attachment; filename=add-superblock.diff
Content-Type: text/x-patch; name=add-superblock.diff; charset=KOI8-R
Content-Transfer-Encoding: 7bit

Index: mtd-2.6.git-sb/include/linux/jffs2.h
===================================================================
--- mtd-2.6.git-sb.orig/include/linux/jffs2.h	2006-07-31 12:40:37.000000000 +0400
+++ mtd-2.6.git-sb/include/linux/jffs2.h	2006-08-01 14:40:43.000000000 +0400
@@ -67,6 +67,7 @@
 
 #define JFFS2_NODETYPE_XATTR (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 8)
 #define JFFS2_NODETYPE_XREF (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 9)
+#define JFFS2_NODETYPE_SB (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 10)
 
 /* XATTR Related */
 #define JFFS2_XPREFIX_USER		1	/* for "user." */
@@ -163,6 +164,18 @@
 	uint8_t data[0];
 };
 
+/* JFFS2 superblock */
+struct jffs2_raw_sb
+{
+	jint16_t magic;
+	jint16_t nodetype; 	/* = JFFS2_NODETYPE_SB */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	jint32_t version;
+	jint32_t pad[127];      /* reserved for future usage */
+	jint32_t node_crc; 	/* superblock contents' CRC */
+};
+
 struct jffs2_raw_xattr {
 	jint16_t magic;
 	jint16_t nodetype;	/* = JFFS2_NODETYPE_XATTR */
@@ -208,6 +221,7 @@
 {
 	struct jffs2_raw_inode i;
 	struct jffs2_raw_dirent d;
+	struct jffs2_raw_sb b;
 	struct jffs2_raw_xattr x;
 	struct jffs2_raw_xref r;
 	struct jffs2_raw_summary s;
Index: mtd-2.6.git-sb/fs/jffs2/jffs2_fs_sb.h
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/jffs2_fs_sb.h	2006-07-31 12:40:23.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/jffs2_fs_sb.h	2006-08-01 12:15:48.000000000 +0400
@@ -82,6 +82,9 @@
 	struct list_head bad_list;		/* Bad blocks. */
 	struct list_head bad_used_list;		/* Bad blocks with valid data in. */
 
+	struct jffs2_raw_node_ref *rsb_ref;	/* On-flash SB node reference */
+	uint32_t sb_node_version;		/* Version of the superblock node */
+
 	spinlock_t erase_completion_lock;	/* Protect free_list and erasing_list
 						   against erase completion handler */
 	wait_queue_head_t erase_wait;		/* For waiting for erases to complete */
Index: mtd-2.6.git-sb/fs/jffs2/scan.c
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/scan.c	2006-07-31 12:56:44.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/scan.c	2006-08-01 17:04:27.000000000 +0400
@@ -46,6 +46,8 @@
 				 struct jffs2_raw_inode *ri, uint32_t ofs, struct jffs2_summary *s);
 static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				 struct jffs2_raw_dirent *rd, uint32_t ofs, struct jffs2_summary *s);
+static int jffs2_scan_sb_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+			      struct jffs2_raw_sb *rsb, uint32_t ofs, struct jffs2_summary *s);
 
 static inline int min_free(struct jffs2_sb_info *c)
 {
@@ -820,6 +822,15 @@
 			break;
 #endif	/* CONFIG_JFFS2_FS_XATTR */
 
+		case JFFS2_NODETYPE_SB:
+			D1(printk(KERN_DEBUG "superblock node found at 0x%08x\n", ofs));
+			err = jffs2_scan_sb_node(c, jeb, (void *)node, ofs, s);
+			if (err)
+				return err;
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+
+
 		case JFFS2_NODETYPE_CLEANMARKER:
 			D1(printk(KERN_DEBUG "CLEANMARKER node found at 0x%08x\n", ofs));
 			if (je32_to_cpu(node->totlen) != c->cleanmarker_size) {
@@ -1054,6 +1065,47 @@
 	return 0;
 }
 
+static int jffs2_scan_sb_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+			      struct jffs2_raw_sb *rsb, uint32_t ofs, struct jffs2_summary *s)
+{
+	uint32_t crc;
+	int err = 0;
+	struct jffs2_raw_node_ref *ref;
+
+	D1(printk(KERN_DEBUG "jffs2_scan_sb_node(): Node at 0x%08x\n", ofs));
+
+	crc = crc32(0, rsb, sizeof(struct jffs2_raw_sb)-4);
+	if (crc != je32_to_cpu(rsb->node_crc)) {
+		printk(KERN_NOTICE "jffs2_scan_sb_node(): Node CRC failed on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+		       ofs, je32_to_cpu(rsb->node_crc), crc);
+		err = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(rsb->totlen)));
+		if (err)
+			return err;
+		return 0;
+	}
+
+	ref = jffs2_link_node_ref(c, jeb, ofs | REF_PRISTINE,
+				  PAD(je32_to_cpu(rsb->totlen)), NULL);
+	if (IS_ERR(ref))
+		return PTR_ERR(ref);
+
+	if (c->rsb_ref && je32_to_cpu(rsb->version) <= c->sb_node_version) {
+		/* We already a newer node */
+		jffs2_mark_node_obsolete(c, ref);
+		return 0;
+	}
+
+	if (c->rsb_ref)
+		jffs2_mark_node_obsolete(c, c->rsb_ref);
+	c->rsb_ref = ref;
+	c->sb_node_version = je32_to_cpu(rsb->version);
+
+	if (jffs2_sum_active())
+		jffs2_sum_add_sb_mem(s, rsb, ofs - jeb->offset);
+
+	return 0;
+}
+
 static int count_list(struct list_head *l)
 {
 	uint32_t count = 0;
Index: mtd-2.6.git-sb/fs/jffs2/gc.c
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/gc.c	2006-08-01 12:31:10.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/gc.c	2006-08-01 17:44:46.000000000 +0400
@@ -259,7 +259,7 @@
 		/* Inode-less node. Clean marker, snapshot or something like that */
 		spin_unlock(&c->erase_completion_lock);
 		if (ref_flags(raw) == REF_PRISTINE) {
-			/* It's an unknown node with JFFS2_FEATURE_RWCOMPAT_COPY */
+			/* It's SB or an unknown node with JFFS2_FEATURE_RWCOMPAT_COPY */
 			jffs2_garbage_collect_pristine(c, NULL, raw);
 		} else {
 			/* Just mark it obsolete */
@@ -528,6 +528,7 @@
 					  struct jffs2_raw_node_ref *raw)
 {
 	union jffs2_node_union *node;
+	struct jffs2_raw_node_ref *new_raw;
 	size_t retlen;
 	int ret;
 	uint32_t phys_ofs, alloclen;
@@ -608,6 +609,18 @@
 			}
 		}
 		break;
+
+	case JFFS2_NODETYPE_SB:
+		BUG_ON(c->rsb_ref != raw);
+
+		crc = crc32(0, node, sizeof(node->b)-4);
+		if (je32_to_cpu(node->b.node_crc) != crc) {
+			printk(KERN_WARNING "SB node CRC failed at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
+			       ref_offset(raw), je32_to_cpu(node->b.node_crc), crc);
+			goto bail;
+		}
+		break;
+
 	default:
 		/* If it's inode-less, we don't _know_ what it is. Just copy it intact */
 		if (ic) {
@@ -662,7 +675,15 @@
 			ret = -EIO;
 		goto out_node;
 	}
-	jffs2_add_physical_node_ref(c, phys_ofs | REF_PRISTINE, rawlen, ic);
+
+	new_raw = jffs2_add_physical_node_ref(c, phys_ofs | REF_PRISTINE, rawlen, ic);
+	if (IS_ERR(new_raw)) {
+		ret = PTR_ERR(new_raw);
+		goto out_node;
+	}
+
+	if (je16_to_cpu(node->u.nodetype) == JFFS2_NODETYPE_SB)
+		c->rsb_ref = new_raw;
 
 	jffs2_mark_node_obsolete(c, raw);
 	D1(printk(KERN_DEBUG "WHEEE! GC REF_PRISTINE node at 0x%08x succeeded\n", ref_offset(raw)));
Index: mtd-2.6.git-sb/fs/jffs2/build.c
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/build.c	2006-08-01 13:02:34.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/build.c	2006-08-01 14:17:52.000000000 +0400
@@ -163,7 +163,12 @@
 	jffs2_build_xattr_subsystem(c);
 	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
 
-	dbg_fsbuild("FS build complete\n");
+	/* Create superblock if it doesn't exist */
+	if (!c->rsb_ref && !(c->flags & JFFS2_SB_FLAG_RO)) {
+		printk(KERN_NOTICE "JFFS2: create superblock\n");
+		if (jffs2_write_sb(c))
+			JFFS2_WARNING("cannot write superblock node\n");
+	}
 
 	/* Rotate the lists by some number to ensure wear levelling */
 	jffs2_rotate_lists(c);
Index: mtd-2.6.git-sb/fs/jffs2/nodelist.h
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/nodelist.h	2006-08-01 13:06:37.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/nodelist.h	2006-08-01 13:07:04.000000000 +0400
@@ -369,6 +369,7 @@
 int jffs2_write_inode_range(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			    struct jffs2_raw_inode *ri, unsigned char *buf,
 			    uint32_t offset, uint32_t writelen, uint32_t *retlen);
+int jffs2_write_sb(struct jffs2_sb_info *c);
 int jffs2_do_create(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, struct jffs2_inode_info *f,
 		    struct jffs2_raw_inode *ri, const char *name, int namelen);
 int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, const char *name,
Index: mtd-2.6.git-sb/fs/jffs2/write.c
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/write.c	2006-07-31 12:40:23.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/write.c	2006-08-01 17:44:51.000000000 +0400
@@ -402,6 +402,55 @@
 	return ret;
 }
 
+int jffs2_write_sb(struct jffs2_sb_info *c)
+{
+	struct jffs2_raw_sb *rsb;
+	struct jffs2_raw_node_ref *ref;
+	int ret;
+	size_t len;
+	uint32_t off;
+
+	rsb = kzalloc(sizeof(struct jffs2_raw_sb), GFP_KERNEL);
+	if (!rsb)
+		return -ENOMEM;
+
+	ret = jffs2_reserve_space(c, sizeof(struct jffs2_raw_sb), &len,
+				  ALLOC_NORMAL, JFFS2_SUMMARY_SB_SIZE);
+	if (ret)
+		goto out_free;
+
+	rsb->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rsb->nodetype = cpu_to_je16(JFFS2_NODETYPE_SB);
+	rsb->totlen = cpu_to_je32(sizeof(struct jffs2_raw_sb));
+	rsb->hdr_crc = cpu_to_je32(crc32(0, rsb, sizeof(struct jffs2_unknown_node)-4));
+
+	c->sb_node_version += 1;
+	rsb->version = cpu_to_je32(c->sb_node_version);
+	rsb->node_crc = cpu_to_je32(crc32(0, rsb, sizeof(struct jffs2_raw_sb)-4));
+
+	off = write_ofs(c);
+	ret = jffs2_flash_write(c, off, sizeof(struct jffs2_raw_sb),
+				&len, (unsigned char *)rsb);
+	if (ret)
+		goto out_complete;
+
+	ref = jffs2_add_physical_node_ref(c, off | REF_PRISTINE, sizeof(struct jffs2_raw_sb), NULL);
+	if (IS_ERR(ref)) {
+		ret = PTR_ERR(ref);
+		goto out_complete;
+	}
+
+	if (c->rsb_ref)
+		jffs2_mark_node_obsolete(c, c->rsb_ref);
+	c->rsb_ref = ref;
+
+out_complete:
+	jffs2_complete_reservation(c);
+out_free:
+	kfree(rsb);
+	return ret;
+}
+
 int jffs2_do_create(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f, struct jffs2_inode_info *f, struct jffs2_raw_inode *ri, const char *name, int namelen)
 {
 	struct jffs2_raw_dirent *rd;
Index: mtd-2.6.git-sb/fs/jffs2/summary.c
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/summary.c	2006-08-01 14:39:33.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/summary.c	2006-08-01 17:45:16.000000000 +0400
@@ -82,6 +82,12 @@
 			dbg_summary("dirent (%u) added to summary\n",
 						je32_to_cpu(item->d.ino));
 			break;
+		case JFFS2_NODETYPE_SB:
+			s->sum_size += JFFS2_SUMMARY_SB_SIZE;
+			s->sum_num++;
+			dbg_summary("superblock (ver %u) added to summary\n",
+						je32_to_cpu(item->b.version));
+			break;
 #ifdef CONFIG_JFFS2_FS_XATTR
 		case JFFS2_NODETYPE_XATTR:
 			s->sum_size += JFFS2_SUMMARY_XATTR_SIZE;
@@ -155,6 +161,25 @@
 	return jffs2_sum_add_mem(s, (union jffs2_sum_mem *)temp);
 }
 
+int jffs2_sum_add_sb_mem(struct jffs2_summary *s, struct jffs2_raw_sb *rsb, uint32_t ofs)
+{
+	struct jffs2_sum_sb_mem *temp;
+
+	temp = kmalloc(sizeof(struct jffs2_sum_sb_mem), GFP_KERNEL);
+	if (!temp)
+		return -ENOMEM;
+
+	dbg_summary("add SB ver %d\n", je32_to_cpu(rsb->version));
+
+	temp->nodetype = rsb->nodetype;
+	temp->totlen = rsb->totlen;
+	temp->offset = cpu_to_je32(ofs);	/* relative from the begining of the jeb */
+	temp->version = rsb->version;
+	temp->next = NULL;
+
+	return jffs2_sum_add_mem(s, (union jffs2_sum_mem *)temp);
+}
+
 #ifdef CONFIG_JFFS2_FS_XATTR
 int jffs2_sum_add_xattr_mem(struct jffs2_summary *s, struct jffs2_raw_xattr *rx, uint32_t ofs)
 {
@@ -307,6 +332,22 @@
 
 			return jffs2_sum_add_mem(c->summary, (union jffs2_sum_mem *)temp);
 		}
+
+		case JFFS2_NODETYPE_SB: {
+			struct jffs2_sum_sb_mem *temp;
+			temp = kmalloc(sizeof(struct jffs2_sum_sb_mem), GFP_KERNEL);
+			if (!temp)
+				goto no_mem;
+
+			temp->nodetype = node->b.nodetype;
+			temp->version = node->b.version;
+			temp->totlen = node->b.totlen;
+			temp->offset = cpu_to_je32(ofs);
+			temp->next = NULL;
+
+			return jffs2_sum_add_mem(c->summary, (union jffs2_sum_mem *)temp);
+		}
+
 #ifdef CONFIG_JFFS2_FS_XATTR
 		case JFFS2_NODETYPE_XATTR: {
 			struct jffs2_sum_xattr_mem *temp;
@@ -464,6 +505,38 @@
 
 				break;
 			}
+
+			case JFFS2_NODETYPE_SB: {
+				struct jffs2_sum_sb_flash *spsb = sp;
+				struct jffs2_raw_node_ref *ref;
+
+				dbg_summary("Superblock at 0x%08x-0x%08x\n",
+					    jeb->offset + je32_to_cpu(spsb->offset),
+					    jeb->offset + je32_to_cpu(spsb->offset) + je32_to_cpu(spsb->totlen));
+
+				sp += JFFS2_SUMMARY_SB_SIZE;
+
+				ref = sum_link_node_ref(c, jeb, je32_to_cpu(spsb->offset) | REF_PRISTINE,
+						  PAD(je32_to_cpu(spsb->totlen)), NULL);
+				if (IS_ERR(ref))
+					return PTR_ERR(ref);
+
+				if (c->rsb_ref && je32_to_cpu(spsb->version) <= c->sb_node_version) {
+					/* We already a newer node */
+					jffs2_mark_node_obsolete(c, ref);
+					break;
+				} else {
+					if (c->rsb_ref)
+						jffs2_mark_node_obsolete(c, c->rsb_ref);
+					c->rsb_ref = ref;
+					c->sb_node_version = je32_to_cpu(spsb->version);
+				}
+
+				/* TODO: add actual contents reading here */
+
+				break;
+			}
+
 #ifdef CONFIG_JFFS2_FS_XATTR
 			case JFFS2_NODETYPE_XATTR: {
 				struct jffs2_xattr_datum *xd;
@@ -709,6 +782,20 @@
 
 				break;
 			}
+
+			case JFFS2_NODETYPE_SB: {
+				struct jffs2_sum_sb_flash *ssb_ptr = wpage;
+
+				ssb_ptr->nodetype = temp->b.nodetype;
+				ssb_ptr->version = temp->b.version;
+				ssb_ptr->offset = temp->b.offset;
+				ssb_ptr->totlen = temp->b.totlen;
+
+				wpage += JFFS2_SUMMARY_SB_SIZE;
+
+				break;
+			}
+
 #ifdef CONFIG_JFFS2_FS_XATTR
 			case JFFS2_NODETYPE_XATTR: {
 				struct jffs2_sum_xattr_flash *sxattr_ptr = wpage;
Index: mtd-2.6.git-sb/fs/jffs2/summary.h
===================================================================
--- mtd-2.6.git-sb.orig/fs/jffs2/summary.h	2006-08-01 14:39:55.000000000 +0400
+++ mtd-2.6.git-sb/fs/jffs2/summary.h	2006-08-01 15:19:47.000000000 +0400
@@ -28,6 +28,7 @@
 #define JFFS2_SUMMARY_NOSUM_SIZE 0xffffffff
 #define JFFS2_SUMMARY_INODE_SIZE (sizeof(struct jffs2_sum_inode_flash))
 #define JFFS2_SUMMARY_DIRENT_SIZE(x) (sizeof(struct jffs2_sum_dirent_flash) + (x))
+#define JFFS2_SUMMARY_SB_SIZE (sizeof(struct jffs2_sum_sb_flash))
 #define JFFS2_SUMMARY_XATTR_SIZE (sizeof(struct jffs2_sum_xattr_flash))
 #define JFFS2_SUMMARY_XREF_SIZE (sizeof(struct jffs2_sum_xref_flash))
 
@@ -60,6 +61,15 @@
 	uint8_t name[0];	/* dirent name */
 } __attribute__((packed));
 
+struct jffs2_sum_sb_flash
+{
+	jint16_t nodetype;	/* == JFFS2_NODETYPE_SB */
+	jint32_t inode;		/* inode number */
+	jint32_t version;	/* SB version */
+	jint32_t offset;	/* offset on jeb */
+	jint32_t totlen; 	/* length */
+} __attribute__((packed));
+
 struct jffs2_sum_xattr_flash
 {
 	jint16_t nodetype;	/* == JFFS2_NODETYPE_XATR */
@@ -80,6 +90,7 @@
 	struct jffs2_sum_unknown_flash u;
 	struct jffs2_sum_inode_flash i;
 	struct jffs2_sum_dirent_flash d;
+	struct jffs2_sum_sb_flash b;
 	struct jffs2_sum_xattr_flash x;
 	struct jffs2_sum_xref_flash r;
 };
@@ -116,6 +127,15 @@
 	uint8_t name[0];	/* dirent name */
 } __attribute__((packed));
 
+struct jffs2_sum_sb_mem
+{
+	union jffs2_sum_mem *next;
+	jint16_t nodetype;
+	jint32_t version;
+	jint32_t offset;
+	jint32_t totlen;
+} __attribute__((packed));
+
 struct jffs2_sum_xattr_mem
 {
 	union jffs2_sum_mem *next;
@@ -138,6 +158,7 @@
 	struct jffs2_sum_unknown_mem u;
 	struct jffs2_sum_inode_mem i;
 	struct jffs2_sum_dirent_mem d;
+	struct jffs2_sum_sb_mem b;
 	struct jffs2_sum_xattr_mem x;
 	struct jffs2_sum_xref_mem r;
 };
@@ -180,6 +201,7 @@
 int jffs2_sum_add_padding_mem(struct jffs2_summary *s, uint32_t size);
 int jffs2_sum_add_inode_mem(struct jffs2_summary *s, struct jffs2_raw_inode *ri, uint32_t ofs);
 int jffs2_sum_add_dirent_mem(struct jffs2_summary *s, struct jffs2_raw_dirent *rd, uint32_t ofs);
+int jffs2_sum_add_sb_mem(struct jffs2_summary *s, struct jffs2_raw_sb *rsb, uint32_t ofs);
 int jffs2_sum_add_xattr_mem(struct jffs2_summary *s, struct jffs2_raw_xattr *rx, uint32_t ofs);
 int jffs2_sum_add_xref_mem(struct jffs2_summary *s, struct jffs2_raw_xref *rr, uint32_t ofs);
 int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
@@ -200,6 +222,7 @@
 #define jffs2_sum_add_padding_mem(a,b)
 #define jffs2_sum_add_inode_mem(a,b,c)
 #define jffs2_sum_add_dirent_mem(a,b,c)
+#define jffs2_sum_add_sb_mem(a,b,c)
 #define jffs2_sum_add_xattr_mem(a,b,c)
 #define jffs2_sum_add_xref_mem(a,b,c)
 #define jffs2_sum_scan_sumnode(a,b,c,d,e) (0)

--=-PZv0aeYDU26ACsOhQr0z--
