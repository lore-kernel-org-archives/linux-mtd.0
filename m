Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CU51Y-00011b-Gc
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 10:13:54 -0500
Message-ID: <419A1942.20803@inf.u-szeged.hu>
Date: Tue, 16 Nov 2004 16:14:10 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------080208060307020202000002"
Cc: dwmw2@infradead.org
Subject: JFFS2 full summary support (mount time speed up for NAND)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------080208060307020202000002
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dear All,

We've finished implementing the summary support for JFFS2. It makes the 
mounting of NAND filesystem much-much faster.

The idea was described before: make some summary information into the 
end of every erase blocks (stored in a RWCOMPAT_DELETE node), so at 
mount time it is enough to read the last few page of eraseblock.

The previous version of our patch supported to generate summary info 
only in image creation time. Now it adds the ability to generate this 
information dimamically, and stores the needed information of every type 
of node.

Certainly the support of it only optional (can be selected by kconfig). 
The usage of it the same as before:

1. generate image as usual
(e.g.: mkfs.jffs2 -r/flash -oimage.jffs2 -n -p -e128KiB)
2. add summary information to the image
(e.g.: sumtool -iimage.jffs2 -oimagesum.jffs2 -e128KiB)
3. write it to the flash as before
(e.g.: nandwrite /dev/mtd0 imagesum.jffs2)
4. compile a new kernel with CONFIG_JFFS2_SUMMARY

David, may I commit it?

Regards,
Ferenc

--------------080208060307020202000002
Content-Type: text/x-patch;
 name="jffs2-summary-20041116.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2-summary-20041116.patch"

diff --unified --recursive --new-file mtd2/fs/Kconfig mtd/fs/Kconfig
--- mtd2/fs/Kconfig	2004-11-03 13:57:37.000000000 +0100
+++ mtd/fs/Kconfig	2004-11-15 11:51:33.000000000 +0100
@@ -77,6 +77,19 @@
 		 ECC for JFFS2.  This type of flash chip is not common, however it is
 		 available from STMicro.
 
+config JFFS2_SUMMARY
+        bool "JFFS2 summary support (EXPERIMENTAL)" 
+        depends on JFFS2_FS
+        default n
+        help 
+          This feature makes it possible to use summary information
+          for faster filesystem mount - specially on NAND.
+
+          The summary information can be inserted into a filesystem image
+          by the utility 'sumtool'.
+
+          If unsure, say 'N'.
+
 config JFFS2_COMPRESSION_OPTIONS
 	bool "Advanced compression options for JFFS2"
 	default n
diff --unified --recursive --new-file mtd2/fs/jffs2/Makefile.common mtd/fs/jffs2/Makefile.common
--- mtd2/fs/jffs2/Makefile.common	2004-11-03 13:57:38.000000000 +0100
+++ mtd/fs/jffs2/Makefile.common	2004-11-15 11:51:33.000000000 +0100
@@ -16,3 +16,4 @@
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
+jffs2-$(CONFIG_JFFS2_SUMMARY)   += summary.o
diff --unified --recursive --new-file mtd2/fs/jffs2/build.c mtd/fs/jffs2/build.c
--- mtd2/fs/jffs2/build.c	2003-10-28 18:02:44.000000000 +0100
+++ mtd/fs/jffs2/build.c	2004-11-15 11:51:33.000000000 +0100
@@ -310,6 +310,10 @@
 		c->blocks[i].used_size = 0;
 		c->blocks[i].first_node = NULL;
 		c->blocks[i].last_node = NULL;
+#ifdef CONFIG_JFFS2_SUMMARY	
+		c->blocks[i].sum_collected = NULL;
+#endif
+		
 	}
 
 	init_MUTEX(&c->alloc_sem);
diff --unified --recursive --new-file mtd2/fs/jffs2/dir.c mtd/fs/jffs2/dir.c
--- mtd2/fs/jffs2/dir.c	2004-10-19 09:48:44.000000000 +0200
+++ mtd/fs/jffs2/dir.c	2004-11-15 11:51:33.000000000 +0100
@@ -22,6 +22,7 @@
 #include <linux/time.h>
 #include "nodelist.h"
 
+
 /* Urgh. Please tell me there's a nicer way of doing these. */
 #include <linux/version.h>
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,48)
@@ -314,7 +315,7 @@
 	 * Just the node will do for now, though 
 	 */
 	namelen = dentry->d_name.len;
-	ret = jffs2_reserve_space(c, sizeof(*ri) + strlen(target), &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*ri) + strlen(target), &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 
 	if (ret) {
 		jffs2_free_raw_inode(ri);
@@ -360,7 +361,7 @@
 	up(&f->sem);
 
 	jffs2_complete_reservation(c);
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
 		/* Eep. */
 		jffs2_clear_inode(inode);
@@ -445,7 +446,7 @@
 	 * Just the node will do for now, though 
 	 */
 	namelen = dentry->d_name.len;
-	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 
 	if (ret) {
 		jffs2_free_raw_inode(ri);
@@ -488,7 +489,7 @@
 	up(&f->sem);
 
 	jffs2_complete_reservation(c);
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
 		/* Eep. */
 		jffs2_clear_inode(inode);
@@ -597,7 +598,7 @@
 	 * Just the node will do for now, though 
 	 */
 	namelen = dentry->d_name.len;
-	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 
 	if (ret) {
 		jffs2_free_raw_inode(ri);
@@ -642,7 +643,7 @@
 	up(&f->sem);
 
 	jffs2_complete_reservation(c);
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
 		/* Eep. */
 		jffs2_clear_inode(inode);
@@ -796,4 +797,3 @@
 
 	return 0;
 }
-
diff --unified --recursive --new-file mtd2/fs/jffs2/file.c mtd/fs/jffs2/file.c
--- mtd2/fs/jffs2/file.c	2004-03-19 17:41:09.000000000 +0100
+++ mtd/fs/jffs2/file.c	2004-11-15 11:51:33.000000000 +0100
@@ -22,6 +22,7 @@
 #include <linux/jffs2.h>
 #include "nodelist.h"
 
+
 extern int generic_file_open(struct inode *, struct file *) __attribute__((weak));
 extern loff_t generic_file_llseek(struct file *file, loff_t offset, int origin) __attribute__((weak));
 
@@ -135,7 +136,7 @@
 		D1(printk(KERN_DEBUG "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
 			  (unsigned int)inode->i_size, pageofs));
 
-		ret = jffs2_reserve_space(c, sizeof(ri), &phys_ofs, &alloc_len, ALLOC_NORMAL);
+		ret = jffs2_reserve_space(c, sizeof(ri), &phys_ofs, &alloc_len, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 		if (ret)
 			return ret;
 
diff --unified --recursive --new-file mtd2/fs/jffs2/fs.c mtd/fs/jffs2/fs.c
--- mtd2/fs/jffs2/fs.c	2004-11-03 13:57:39.000000000 +0100
+++ mtd/fs/jffs2/fs.c	2004-11-15 11:51:33.000000000 +0100
@@ -73,7 +73,7 @@
 		return -ENOMEM;
 	}
 		
-	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 	if (ret) {
 		jffs2_free_raw_inode(ri);
 		if (S_ISLNK(inode->i_mode & S_IFMT))
diff --unified --recursive --new-file mtd2/fs/jffs2/gc.c mtd/fs/jffs2/gc.c
--- mtd2/fs/jffs2/gc.c	2004-11-13 11:59:22.000000000 +0100
+++ mtd/fs/jffs2/gc.c	2004-11-15 11:51:33.000000000 +0100
@@ -506,7 +506,7 @@
 	   don't want to force wastage of the end of a block if splitting would
 	   work. */
 	ret = jffs2_reserve_space_gc(c, min_t(uint32_t, sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN, 
-					      rawlen), &phys_ofs, &alloclen);
+					      rawlen), &phys_ofs, &alloclen, rawlen); /* this is not optimal yet */
 	if (ret)
 		return ret;
 
@@ -614,7 +614,7 @@
 			ACCT_SANITY_CHECK(c,jeb);
 			D1(ACCT_PARANOIA_CHECK(jeb));
 
-			ret = jffs2_reserve_space_gc(c, rawlen, &phys_ofs, &dummy);
+			ret = jffs2_reserve_space_gc(c, rawlen, &phys_ofs, &dummy, rawlen); /* this is not optimal yet */
 
 			if (!ret) {
 				D1(printk(KERN_DEBUG "Allocated space at 0x%08x to retry failed write.\n", phys_ofs));
@@ -692,7 +692,7 @@
 
 	}
 	
-	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &phys_ofs, &alloclen);
+	ret = jffs2_reserve_space_gc(c, sizeof(ri) + mdatalen, &phys_ofs, &alloclen, JFFS2_SUMMARY_INODE_SIZE);
 	if (ret) {
 		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_metadata failed: %d\n",
 		       sizeof(ri)+ mdatalen, ret);
@@ -759,7 +759,7 @@
 	rd.node_crc = cpu_to_je32(crc32(0, &rd, sizeof(rd)-8));
 	rd.name_crc = cpu_to_je32(crc32(0, fd->name, rd.nsize));
 	
-	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &phys_ofs, &alloclen);
+	ret = jffs2_reserve_space_gc(c, sizeof(rd)+rd.nsize, &phys_ofs, &alloclen, JFFS2_SUMMARY_DIRENT_SIZE(rd.nsize));
 	if (ret) {
 		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_dirent failed: %d\n",
 		       sizeof(rd)+rd.nsize, ret);
@@ -961,7 +961,7 @@
 	ri.data_crc = cpu_to_je32(0);
 	ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
 
-	ret = jffs2_reserve_space_gc(c, sizeof(ri), &phys_ofs, &alloclen);
+	ret = jffs2_reserve_space_gc(c, sizeof(ri), &phys_ofs, &alloclen, JFFS2_SUMMARY_INODE_SIZE);
 	if (ret) {
 		printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_hole failed: %d\n",
 		       sizeof(ri), ret);
@@ -1186,7 +1186,7 @@
 		uint32_t cdatalen;
 		uint16_t comprtype = JFFS2_COMPR_NONE;
 
-		ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen);
+		ret = jffs2_reserve_space_gc(c, sizeof(ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen, JFFS2_SUMMARY_INODE_SIZE);
 
 		if (ret) {
 			printk(KERN_WARNING "jffs2_reserve_space_gc of %zd bytes for garbage_collect_dnode failed: %d\n",
@@ -1243,4 +1243,3 @@
 	jffs2_gc_release_page(c, pg_ptr, &pg);
 	return ret;
 }
-
diff --unified --recursive --new-file mtd2/fs/jffs2/nodelist.h mtd/fs/jffs2/nodelist.h
--- mtd2/fs/jffs2/nodelist.h	2004-11-14 18:07:07.000000000 +0100
+++ mtd/fs/jffs2/nodelist.h	2004-11-15 11:51:33.000000000 +0100
@@ -20,6 +20,7 @@
 #include <linux/jffs2.h>
 #include <linux/jffs2_fs_sb.h>
 #include <linux/jffs2_fs_i.h>
+#include "summary.h"
 
 #ifdef __ECOS
 #include "os-ecos.h"
@@ -211,6 +212,10 @@
 	int bad_count;
 	uint32_t offset;		/* of this block in the MTD */
 
+#ifdef CONFIG_JFFS2_SUMMARY	
+	struct jffs2_sum_info *sum_collected;
+#endif
+	
 	uint32_t unchecked_size;
 	uint32_t used_size;
 	uint32_t dirty_size;
@@ -417,8 +422,8 @@
 
 /* nodemgmt.c */
 int jffs2_thread_should_wake(struct jffs2_sb_info *c);
-int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio);
-int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len);
+int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio, uint32_t sumsize);
+int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize);
 int jffs2_add_physical_node_ref(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *new);
 void jffs2_complete_reservation(struct jffs2_sb_info *c);
 void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *raw);
@@ -480,6 +485,10 @@
 /* scan.c */
 int jffs2_scan_medium(struct jffs2_sb_info *c);
 void jffs2_rotate_lists(struct jffs2_sb_info *c);
+int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
+				uint32_t ofs, uint32_t len);
+struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino);
+
 
 /* build.c */
 int jffs2_do_mount_fs(struct jffs2_sb_info *c);
diff --unified --recursive --new-file mtd2/fs/jffs2/nodemgmt.c mtd/fs/jffs2/nodemgmt.c
--- mtd2/fs/jffs2/nodemgmt.c	2004-10-07 17:08:47.000000000 +0200
+++ mtd/fs/jffs2/nodemgmt.c	2004-11-15 11:51:33.000000000 +0100
@@ -38,9 +38,9 @@
  *	for the requested allocation.
  */
 
-static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len);
+static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize);
 
-int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio)
+int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, int prio, uint32_t sumsize)
 {
 	int ret = -EAGAIN;
 	int blocksneeded = c->resv_blocks_write;
@@ -129,7 +129,7 @@
 			spin_lock(&c->erase_completion_lock);
 		}
 
-		ret = jffs2_do_reserve_space(c, minsize, ofs, len);
+		ret = jffs2_do_reserve_space(c, minsize, ofs, len, sumsize);
 		if (ret) {
 			D1(printk(KERN_DEBUG "jffs2_reserve_space: ret is %d\n", ret));
 		}
@@ -140,7 +140,7 @@
 	return ret;
 }
 
-int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len)
+int jffs2_reserve_space_gc(struct jffs2_sb_info *c, uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
 {
 	int ret = -EAGAIN;
 	minsize = PAD(minsize);
@@ -149,7 +149,7 @@
 
 	spin_lock(&c->erase_completion_lock);
 	while(ret == -EAGAIN) {
-		ret = jffs2_do_reserve_space(c, minsize, ofs, len);
+		ret = jffs2_do_reserve_space(c, minsize, ofs, len, sumsize);
 		if (ret) {
 		        D1(printk(KERN_DEBUG "jffs2_reserve_space_gc: looping, ret is %d\n", ret));
 		}
@@ -159,50 +159,112 @@
 }
 
 /* Called with alloc sem _and_ erase_completion_lock */
-static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len)
+static int jffs2_do_reserve_space(struct jffs2_sb_info *c,  uint32_t minsize, uint32_t *ofs, uint32_t *len, uint32_t sumsize)
 {
 	struct jffs2_eraseblock *jeb = c->nextblock;
+	uint32_t nofree_size;
 	
  restart:
-	if (jeb && minsize > jeb->free_size) {
-		/* Skip the end of this block and file it as having some dirty space */
-		/* If there's a pending write to it, flush now */
-		if (jffs2_wbuf_dirty(c)) {
-			spin_unlock(&c->erase_completion_lock);
-			D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));			    
-			jffs2_flush_wbuf_pad(c);
-			spin_lock(&c->erase_completion_lock);
-			jeb = c->nextblock;
-			goto restart;
-		}
-		c->wasted_size += jeb->free_size;
-		c->free_size -= jeb->free_size;
-		jeb->wasted_size += jeb->free_size;
-		jeb->free_size = 0;
+	nofree_size = 0;
+	
+#ifdef CONFIG_JFFS2_SUMMARY
+
+	if (sumsize != JFFS2_SUMMARY_NOSUM_SIZE) {
+		int ret;
+                if (jeb) {
+                        if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;
+                        nofree_size = sumsize + jeb->sum_collected->sum_size + JFFS2_SUMMARY_FRAME_SIZE;
+                }
 		
-		/* Check, if we have a dirty block now, or if it was dirty already */
-		if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
-			c->dirty_size += jeb->wasted_size;
-			c->wasted_size -= jeb->wasted_size;
-			jeb->dirty_size += jeb->wasted_size;
-			jeb->wasted_size = 0;
-			if (VERYDIRTY(c, jeb->dirty_size)) {
-				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
+		D1(printk(KERN_DEBUG "JFFS2: minsize %d , jeb->free(%d) , sum_collected->size(%d) , sumsize(%d)\n",minsize,jeb->free_size,jeb->sum_collected->sum_size,sumsize));
+		
+		if (jeb && (minsize + jeb->sum_collected->sum_size + sumsize + JFFS2_SUMMARY_FRAME_SIZE > jeb->free_size)) {
+			D1(printk(KERN_DEBUG "JFFS2: generating summary for 0x%08x.\n", jeb->offset));
+			if (jeb->sum_collected->sum_size == JFFS2_SUMMARY_NOSUM_SIZE) {
+				sumsize = JFFS2_SUMMARY_NOSUM_SIZE;
+				jffs2_sum_clean_collected(jeb);
+				goto restart;
+			}
+			
+			ret = jffs2_sum_write_sumnode(c);
+			
+			if (ret)
+				return ret;
+			
+			if (jeb->sum_collected->sum_size == JFFS2_SUMMARY_NOSUM_SIZE) { //jffs2_write_sumnode can't write out the summary information
+				sumsize = JFFS2_SUMMARY_NOSUM_SIZE;
+				jffs2_sum_clean_collected(jeb);
+				goto restart;
+			}
+			
+			/* Check, if we have a dirty block now, or if it was dirty already */
+			if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
+				c->dirty_size += jeb->wasted_size;
+				c->wasted_size -= jeb->wasted_size;
+				jeb->dirty_size += jeb->wasted_size;
+				jeb->wasted_size = 0;
+				if (VERYDIRTY(c, jeb->dirty_size)) {
+					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
+					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
+					list_add_tail(&jeb->list, &c->very_dirty_list);
+				} else {
+					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
+					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
+					list_add_tail(&jeb->list, &c->dirty_list);
+				}
+			} else { 
+				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
 				  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
-				list_add_tail(&jeb->list, &c->very_dirty_list);
-			} else {
-				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
+				list_add_tail(&jeb->list, &c->clean_list);
+			}
+			c->nextblock = jeb = NULL;
+		}
+	}
+	else {	
+#endif			
+		if (jeb && minsize > jeb->free_size) {
+			/* Skip the end of this block and file it as having some dirty space */
+			/* If there's a pending write to it, flush now */
+			
+			if (jffs2_wbuf_dirty(c)) {
+				spin_unlock(&c->erase_completion_lock);
+				D1(printk(KERN_DEBUG "jffs2_do_reserve_space: Flushing write buffer\n"));			    
+				jffs2_flush_wbuf_pad(c);
+				spin_lock(&c->erase_completion_lock);
+				jeb = c->nextblock;
+				goto restart;
+			}
+			
+			c->wasted_size += jeb->free_size;
+			c->free_size -= jeb->free_size;
+			jeb->wasted_size += jeb->free_size;
+			jeb->free_size = 0;
+			
+			/* Check, if we have a dirty block now, or if it was dirty already */
+			if (ISDIRTY (jeb->wasted_size + jeb->dirty_size)) {
+				c->dirty_size += jeb->wasted_size;
+				c->wasted_size -= jeb->wasted_size;
+				jeb->dirty_size += jeb->wasted_size;
+				jeb->wasted_size = 0;
+				if (VERYDIRTY(c, jeb->dirty_size)) {
+					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to very_dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
+					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
+					list_add_tail(&jeb->list, &c->very_dirty_list);
+				} else {
+					D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to dirty_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
+					  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
+					list_add_tail(&jeb->list, &c->dirty_list);
+				}
+			} else { 
+				D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
 				  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
-				list_add_tail(&jeb->list, &c->dirty_list);
+				list_add_tail(&jeb->list, &c->clean_list);
 			}
-		} else { 
-			D1(printk(KERN_DEBUG "Adding full erase block at 0x%08x to clean_list (free 0x%08x, dirty 0x%08x, used 0x%08x\n",
-			  jeb->offset, jeb->free_size, jeb->dirty_size, jeb->used_size));
-			list_add_tail(&jeb->list, &c->clean_list);
+			c->nextblock = jeb = NULL;
 		}
-		c->nextblock = jeb = NULL;
+#ifdef CONFIG_JFFS2_SUMMARY
 	}
-	
+#endif	
 	if (!jeb) {
 		struct list_head *next;
 		/* Take the next block off the 'free' list */
@@ -266,7 +328,7 @@
 	/* OK, jeb (==c->nextblock) is now pointing at a block which definitely has
 	   enough space */
 	*ofs = jeb->offset + (c->sector_size - jeb->free_size);
-	*len = jeb->free_size;
+	*len = jeb->free_size - nofree_size;
 
 	if (c->cleanmarker_size && jeb->used_size == c->cleanmarker_size &&
 	    !jeb->first_node->next_in_ino) {
diff --unified --recursive --new-file mtd2/fs/jffs2/os-linux.h mtd/fs/jffs2/os-linux.h
--- mtd2/fs/jffs2/os-linux.h	2004-11-04 23:10:28.000000000 +0100
+++ mtd/fs/jffs2/os-linux.h	2004-11-15 11:51:33.000000000 +0100
@@ -100,7 +100,13 @@
 #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
 
 #if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC)
+
+#ifndef CONFIG_JFFS2_SUMMARY
 #define jffs2_can_mark_obsolete(c) (1)
+#else
+#define jffs2_can_mark_obsolete(c) (0)
+#endif
+
 #define jffs2_cleanmarker_oob(c) (0)
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
 
@@ -121,7 +127,12 @@
 
 #else /* NAND and/or ECC'd NOR support present */
 
+#ifndef CONFIG_JFFS2_SUMMARY
 #define jffs2_can_mark_obsolete(c) ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & MTD_ECC)) || c->mtd->type == MTD_RAM)
+#else
+#define jffs2_can_mark_obsolete(c) (0)
+#endif
+
 #define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
 
 #define jffs2_flash_write_oob(c, ofs, len, retlen, buf) ((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
@@ -218,5 +229,3 @@
 
 
 #endif /* __JFFS2_OS_LINUX_H__ */
-
-
diff --unified --recursive --new-file mtd2/fs/jffs2/scan.c mtd/fs/jffs2/scan.c
--- mtd2/fs/jffs2/scan.c	2004-11-03 13:57:39.000000000 +0100
+++ mtd/fs/jffs2/scan.c	2004-11-16 13:41:41.000000000 +0100
@@ -18,22 +18,10 @@
 #include <linux/crc32.h>
 #include <linux/compiler.h>
 #include "nodelist.h"
+#include "summary.h"
 
 #define EMPTY_SCAN_SIZE 1024
 
-#define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
-		c->free_size -= _x; c->dirty_size += _x; \
-		jeb->free_size -= _x ; jeb->dirty_size += _x; \
-		}while(0)
-#define USED_SPACE(x) do { typeof(x) _x = (x); \
-		c->free_size -= _x; c->used_size += _x; \
-		jeb->free_size -= _x ; jeb->used_size += _x; \
-		}while(0)
-#define UNCHECKED_SPACE(x) do { typeof(x) _x = (x); \
-		c->free_size -= _x; c->unchecked_size += _x; \
-		jeb->free_size -= _x ; jeb->unchecked_size += _x; \
-		}while(0)
-
 #define noisy_printk(noise, args...) do { \
 	if (*(noise)) { \
 		printk(KERN_NOTICE args); \
@@ -58,13 +46,6 @@
 static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				 struct jffs2_raw_dirent *rd, uint32_t ofs);
 
-#define BLK_STATE_ALLFF		0
-#define BLK_STATE_CLEAN		1
-#define BLK_STATE_PARTDIRTY	2
-#define BLK_STATE_CLEANMARKER	3
-#define BLK_STATE_ALLDIRTY	4
-#define BLK_STATE_BADBLOCK	5
-
 static inline int min_free(struct jffs2_sb_info *c)
 {
 	uint32_t min = 2 * sizeof(struct jffs2_raw_inode);
@@ -260,7 +241,7 @@
 	return ret;
 }
 
-static int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
+int jffs2_fill_scan_buf (struct jffs2_sb_info *c, unsigned char *buf,
 				uint32_t ofs, uint32_t len)
 {
 	int ret;
@@ -289,6 +270,11 @@
 	uint32_t hdr_crc, buf_ofs, buf_len;
 	int err;
 	int noise = 0;
+	
+#ifdef CONFIG_JFFS2_SUMMARY
+	struct jffs2_sum_marker *sm;
+#endif	
+	
 #ifdef CONFIG_JFFS2_FS_NAND
 	int cleanmarkerfound = 0;
 #endif
@@ -314,10 +300,54 @@
 		}
 	}
 #endif
+	
+#ifdef CONFIG_JFFS2_SUMMARY	
+	sm = (struct jffs2_sum_marker *)kmalloc(sizeof(struct jffs2_sum_marker), GFP_KERNEL);
+	if (!sm) {
+	    return -ENOMEM;
+	}
+	
+	err = jffs2_fill_scan_buf(c, (unsigned char *) sm, jeb->offset + c->sector_size - sizeof(struct jffs2_sum_marker), sizeof(struct jffs2_sum_marker));
+	
+	if (err) {
+		kfree(sm);
+	        return err;
+	}
+	
+	if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC ) {
+
+		if(je32_to_cpu(sm->erase_size) == c->sector_size) {
+			int ret = jffs2_sum_scan_sumnode(c,jeb,je32_to_cpu(sm->offset),&pseudo_random);
+			
+			if (ret) {
+				kfree(sm);
+				return ret;
+			}
+		}
+		
+		printk(KERN_WARNING "FS erase_block_size != JFFS2 erase_block_size => skipping summary information\n");
+		
+	}
+	
+	kfree(sm);
+	
+	ofs = jeb->offset;
+	prevofs = jeb->offset - 1;
+	
+#endif
+	
 	buf_ofs = jeb->offset;
 
 	if (!buf_size) {
 		buf_len = c->sector_size;
+		
+#ifdef CONFIG_JFFS2_SUMMARY
+		/* must reread because of summary test */
+		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
+		if (err)
+			return err;
+#endif
+
 	} else {
 		buf_len = EMPTY_SCAN_SIZE;
 		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
@@ -359,6 +389,8 @@
 
 	noise = 10;
 
+	D1(printk(KERN_DEBUG "JFFS2: no summary found in jeb 0x%08x. Apply original scan.\n",jeb->offset));
+
 scan_more:	
 	while(ofs < jeb->offset + c->sector_size) {
 
@@ -574,6 +606,9 @@
 			break;
 
 		case JFFS2_NODETYPE_PADDING:
+#ifdef CONFIG_JFFS2_SUMMARY
+	                jffs2_sum_add_padding_mem(jeb,je32_to_cpu(node->totlen));
+#endif
 			DIRTY_SPACE(PAD(je32_to_cpu(node->totlen)));
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
@@ -637,7 +672,7 @@
 		return BLK_STATE_ALLDIRTY;
 }
 
-static struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino)
+struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino)
 {
 	struct jffs2_inode_cache *ic;
 
@@ -731,6 +766,11 @@
 	pseudo_random += je32_to_cpu(ri->version);
 
 	UNCHECKED_SPACE(PAD(je32_to_cpu(ri->totlen)));
+	
+#ifdef CONFIG_JFFS2_SUMMARY
+	jffs2_sum_add_inode_mem(jeb,ri,ofs);
+#endif
+	
 	return 0;
 }
 
@@ -809,6 +849,10 @@
 	USED_SPACE(PAD(je32_to_cpu(rd->totlen)));
 	jffs2_add_fd_to_list(c, fd, &ic->scan_dents);
 
+#ifdef CONFIG_JFFS2_SUMMARY
+	jffs2_sum_add_dirent_mem(jeb,rd,ofs);
+#endif
+	
 	return 0;
 }
 
diff --unified --recursive --new-file mtd2/fs/jffs2/summary.c mtd/fs/jffs2/summary.c
--- mtd2/fs/jffs2/summary.c	1970-01-01 01:00:00.000000000 +0100
+++ mtd/fs/jffs2/summary.c	2004-11-16 13:40:40.000000000 +0100
@@ -0,0 +1,720 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.
+ *
+ * Copyright (C) 2004  Ferenc Havasi <havasi@inf.u-szeged.hu>,
+ *                     Zoltan Sogor <weth@inf.u-szeged.hu>,
+ *                     Patrik Kluba <pajko@halom.u-szeged.hu>,
+ *                     University of Szeged, Hungary
+ *
+ * For licensing information, see the file 'LICENCE' in this directory.
+ *
+ * $Id$
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/pagemap.h>
+#include <linux/crc32.h>
+#include <linux/compiler.h>
+#include <linux/vmalloc.h>
+#include "nodelist.h"
+
+int jffs2_sum_init(struct jffs2_sb_info *c) 
+{
+        c->summary_buf = (jint32_t *) vmalloc(c->sector_size);
+        if (!c->summary_buf) {
+		printk(KERN_WARNING "JFFS2: can't allocate memory to dump summary information!\n");
+                return 1;
+        }
+        return 0;
+}
+
+void jffs2_sum_exit(struct jffs2_sb_info *c) 
+{
+        if (c->summary_buf) {
+                vfree(c->summary_buf);
+                c->summary_buf = NULL;
+        }
+}
+
+int jffs2_sum_care_sum_collected(struct jffs2_eraseblock *jeb)
+{
+	if (!jeb->sum_collected) {
+		jeb->sum_collected = (struct jffs2_sum_info *) kmalloc(sizeof(struct jffs2_sum_info), GFP_KERNEL);
+	
+		if (!jeb->sum_collected)
+			return -ENOMEM;
+			
+		jeb->sum_collected->sum_list = NULL;
+		jeb->sum_collected->sum_num = 0;
+		jeb->sum_collected->sum_size = 0; 
+		jeb->sum_collected->sum_padded = 0; 
+	}
+        return 0;
+}
+
+static int jffs2_sum_add_mem(struct jffs2_eraseblock *jeb, union jffs2_sum_mem *item) 
+{
+	
+	union jffs2_sum_mem *walk;
+        int ret;
+	
+        if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;
+	
+	if (!jeb->sum_collected->sum_list) {
+		jeb->sum_collected->sum_list = (union jffs2_sum_mem *) item;
+	} 
+	else {
+		walk = jeb->sum_collected->sum_list;
+		
+		while (walk->u.next) {
+			walk = walk->u.next;
+		}
+		walk->u.next = (union jffs2_sum_mem *) item;
+	}
+	switch (je16_to_cpu(item->u.nodetype)) {
+    	    case JFFS2_NODETYPE_INODE:
+		jeb->sum_collected->sum_size += JFFS2_SUMMARY_INODE_SIZE;
+		jeb->sum_collected->sum_num++;
+		break;
+    	    case JFFS2_NODETYPE_DIRENT:
+		jeb->sum_collected->sum_size += JFFS2_SUMMARY_DIRENT_SIZE(item->d.nsize);
+		jeb->sum_collected->sum_num++;
+		break;
+	    default:
+		printk(KERN_WARNING "__jffs2_add_sum_mem(): UNKNOWN node type %d\n", je16_to_cpu(item->u.nodetype));
+		return 1;
+	}
+	return 0;
+}
+
+void jffs2_sum_clean_all_info(struct jffs2_sb_info *c)
+{
+	int i;
+	
+	for (i=0; i<c->nr_blocks; i++) {
+		struct jffs2_eraseblock *jeb = &c->blocks[i];
+		
+		jffs2_sum_clean_collected(jeb);
+		kfree(jeb->sum_collected);
+		jeb->sum_collected = NULL;
+	}
+}
+	
+/* These 3 functions are called from scan.c to collect summary info for not closed jeb */
+
+int jffs2_sum_add_padding_mem(struct jffs2_eraseblock *jeb, uint32_t size)
+{
+        int ret;
+	
+        if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;
+        jeb->sum_collected->sum_padded += size;
+        return 0;
+}
+
+int jffs2_sum_add_inode_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_inode *ri, uint32_t ofs) 
+{
+	
+	struct jffs2_sum_inode_mem *temp = (struct jffs2_sum_inode_mem *) kmalloc(sizeof(struct jffs2_sum_inode_mem), GFP_KERNEL);
+	
+	if (!temp)
+		return -ENOMEM;
+
+        ofs -= jeb->offset;
+	
+	temp->nodetype = ri->nodetype;
+	temp->inode = ri->ino;
+	temp->version = ri->version;
+	temp->offset = cpu_to_je32(ofs); 
+	temp->totlen = ri->totlen;
+	temp->next = NULL;
+	
+	return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
+}
+
+int jffs2_sum_add_dirent_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_dirent *rd, uint32_t ofs) 
+{
+	
+	struct jffs2_sum_dirent_mem *temp = (struct jffs2_sum_dirent_mem *) 
+			kmalloc(sizeof(struct jffs2_sum_dirent_mem) + rd->nsize, GFP_KERNEL);
+	
+	if (!temp)
+		return -ENOMEM;
+	
+        ofs -= jeb->offset;
+
+	temp->nodetype = rd->nodetype;
+	temp->totlen = rd->totlen;
+	temp->offset = cpu_to_je32(ofs);
+	temp->pino = rd->pino;
+	temp->version = rd->version;
+	temp->ino = rd->ino;
+	temp->nsize = rd->nsize;
+	temp->type = rd->type;
+	temp->next = NULL;
+	
+	memcpy(temp->name, rd->name, rd->nsize);
+
+	return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
+}
+
+/* Cleanup every collected summary information */
+
+void jffs2_sum_clean_collected(struct jffs2_eraseblock *jeb) 
+{
+	
+	union jffs2_sum_mem *temp;
+	
+	if(jeb && jeb->sum_collected){
+		
+		while(jeb->sum_collected->sum_list){
+			temp = jeb->sum_collected->sum_list;
+			jeb->sum_collected->sum_list = jeb->sum_collected->sum_list->u.next;
+			kfree(temp);
+			jeb->sum_collected->sum_num--;
+		}
+		
+		if(jeb->sum_collected->sum_num != 0){
+			printk(KERN_WARNING "Ooops, something wrong happened! sum_num != 0, but sum_list = null ???");
+			jeb->sum_collected->sum_num = 0;
+		}
+	}	
+}
+
+/* Called from wbuf.c to collect writed node info */
+
+int jffs2_sum_add_kvec(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count, uint32_t ofs)
+{
+	union jffs2_node_union *node;
+	struct jffs2_eraseblock *jeb;	
+        int ret;
+	
+	node = (union jffs2_node_union *) invecs[0].iov_base;
+	jeb = &c->blocks[ofs / c->sector_size];
+        ofs -= jeb->offset;
+       
+        if ((ret=jffs2_sum_care_sum_collected(jeb))) return ret;        
+	
+	switch(je16_to_cpu(node->u.nodetype)){
+		case JFFS2_NODETYPE_INODE : {
+			struct jffs2_sum_inode_mem *temp = (struct jffs2_sum_inode_mem *) 
+				kmalloc(sizeof(struct jffs2_sum_inode_mem), GFP_KERNEL);
+			
+			if (!temp)
+				return -ENOMEM;
+
+			temp->nodetype = node->i.nodetype;
+			temp->inode = node->i.ino;
+			temp->version = node->i.version;
+			temp->offset = cpu_to_je32(ofs); 
+			temp->totlen = node->i.totlen;
+			temp->next = NULL;
+						
+			return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
+			
+			break;
+		}
+		
+		case JFFS2_NODETYPE_DIRENT : {
+			struct jffs2_sum_dirent_mem *temp = (struct jffs2_sum_dirent_mem *) 
+				kmalloc(sizeof(struct jffs2_sum_dirent_mem) + node->d.nsize, GFP_KERNEL);
+			
+			if (!temp)
+				return -ENOMEM;
+			
+			temp->nodetype = node->d.nodetype;
+			temp->totlen = node->d.totlen;
+			temp->offset = cpu_to_je32(ofs);
+			temp->pino = node->d.pino;
+			temp->version = node->d.version;
+			temp->ino = node->d.ino;
+			temp->nsize = node->d.nsize;
+			temp->type = node->d.type;
+			temp->next = NULL;
+			
+			memcpy(temp->name,invecs[1].iov_base,node->d.nsize);
+			
+			return jffs2_sum_add_mem(jeb, (union jffs2_sum_mem *)temp);
+			
+			break;
+		}
+		
+		case JFFS2_NODETYPE_PADDING : {
+			D1(printk(KERN_DEBUG "jffs2_sum_add_kvec(): Node PADDING\n"));
+                        jeb->sum_collected->sum_padded += je32_to_cpu(node->u.totlen);
+			break;
+		}
+		
+		case JFFS2_NODETYPE_CLEANMARKER : {
+			D1(printk(KERN_DEBUG "jffs2_sum_add_kvec(): Node CLEANMARKER\n"));
+			break;
+		}
+		
+		case JFFS2_NODETYPE_SUMMARY : {
+			D1(printk(KERN_DEBUG "jffs2_sum_add_kvec(): Node SUMMARY\n"));
+			break;
+		}
+		
+		default : {
+			printk(KERN_WARNING "jffs2_sum_add_kvec(): Node not supported\n");
+			BUG();
+			break;
+		}
+	}
+	
+	return 0;
+}
+
+/* Process the summary information - called from jffs2_scan_eraseblock() */
+
+int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t ofs, uint32_t *pseudo_random)
+{
+	
+	struct jffs2_unknown_node crcnode;
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_raw_node_ref *cache_ref;
+	struct jffs2_inode_cache *ic;
+	struct jffs2_full_dirent *fd;
+		
+	int i, err;
+	int bad_sum = 0;
+	int sumsize;
+	uint32_t ino;
+	uint32_t crc;
+	struct jffs2_summary_node *summary;
+		
+	sumsize = c->sector_size - ofs;
+	ofs += jeb->offset;
+	
+	D1(printk(KERN_DEBUG "JFFS2: summary found for 0x%08x at 0x%08x (0x%x bytes)\n", jeb->offset, ofs, sumsize));
+	
+	summary = (struct jffs2_summary_node *) kmalloc(sumsize, GFP_KERNEL);
+		
+	if (!summary) {
+			return -ENOMEM;
+	}
+	
+	err = jffs2_fill_scan_buf(c, (unsigned char *)summary, ofs, sumsize);
+	
+	if (err) {
+			kfree(summary);
+			return err;
+	}
+
+	/* OK, now check for node validity and CRC */
+	crcnode.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	crcnode.nodetype = cpu_to_je16(JFFS2_NODETYPE_SUMMARY);
+	crcnode.totlen = summary->totlen;
+	crc = crc32(0, &crcnode, sizeof(crcnode)-4);
+	
+	if (je32_to_cpu(summary->hdr_crc) != crc) {
+			D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node header is corrupt (bad CRC or no summary at all)\n"));
+			bad_sum = 1;
+	}
+	
+	if ((!bad_sum) && (je32_to_cpu(summary->totlen) != sumsize)) {
+			D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node is corrupt (wrong erasesize?)\n"));
+			bad_sum = 1;
+	}
+	
+	crc = crc32(0, summary, sizeof(struct jffs2_summary_node)-8);
+		
+	if ((!bad_sum) && (je32_to_cpu(summary->node_crc) != crc)) {
+			D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node is corrupt (bad CRC)\n"));
+			bad_sum = 1;
+	}
+	
+	crc = crc32(0, summary->sum, sumsize - sizeof(struct jffs2_summary_node));
+
+	if ((!bad_sum) && (je32_to_cpu(summary->sum_crc) != crc)) {
+			D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node data is corrupt (bad CRC)\n"));
+			bad_sum = 1;
+	}
+	
+	if (!bad_sum) {
+		
+		struct jffs2_sum_unknown_flash *sp;
+		sp = (struct jffs2_sum_unknown_flash *) summary->sum;
+
+		if ( je32_to_cpu(summary->cln_mkr) ) {
+			
+			D1(printk(KERN_DEBUG "Summary : CLEANMARKER node \n"));
+			
+			if (je32_to_cpu(summary->cln_mkr) != c->cleanmarker_size) {
+				D1(printk(KERN_DEBUG "CLEANMARKER node has totlen 0x%x != normal 0x%x\n", 
+				   je32_to_cpu(summary->cln_mkr), c->cleanmarker_size));
+				UNCHECKED_SPACE( PAD(je32_to_cpu(summary->cln_mkr)) );
+			} 
+			else if (jeb->first_node) {
+				D1(printk(KERN_DEBUG "CLEANMARKER node not first node in block (0x%08x)\n", jeb->offset);
+				UNCHECKED_SPACE( PAD(je32_to_cpu(summary->cln_mkr))));
+			} 
+			else {
+				struct jffs2_raw_node_ref *marker_ref = jffs2_alloc_raw_node_ref();
+					
+				if (!marker_ref) {
+					D1(printk(KERN_NOTICE "Failed to allocate node ref for clean marker\n"));
+					kfree(summary);
+					return -ENOMEM;
+				}
+				
+				marker_ref->next_in_ino = NULL;
+				marker_ref->next_phys = NULL;
+				marker_ref->flash_offset = jeb->offset | REF_NORMAL;
+				marker_ref->__totlen = je32_to_cpu(summary->cln_mkr);
+				jeb->first_node = jeb->last_node = marker_ref;
+			
+				USED_SPACE( PAD(je32_to_cpu(summary->cln_mkr)) );
+								
+			}
+		}
+
+		if ( je32_to_cpu(summary->padded) ) {
+                        DIRTY_SPACE(je32_to_cpu(summary->padded));
+                }
+		
+		for(i = 0; i < je16_to_cpu(summary->sum_num); i++) {
+			
+			D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Processing summary information %d\n", i));
+			uint8_t *temp8ptr = NULL;
+			
+			switch (je16_to_cpu(sp->nodetype)) {
+				
+				case JFFS2_NODETYPE_INODE : {
+					struct jffs2_sum_inode_flash *spi;
+					spi = (struct jffs2_sum_inode_flash *) sp;
+						
+					ino = je32_to_cpu(spi->inode);
+					D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Inode at 0x%08x\n", jeb->offset + je32_to_cpu(spi->offset)));
+					raw = jffs2_alloc_raw_node_ref();
+					if (!raw) {
+						printk(KERN_NOTICE "jffs2_scan_eraseblock(): allocation of node reference failed\n");
+						kfree(summary);
+						return -ENOMEM;
+					}
+		
+					ic = jffs2_get_ino_cache(c, ino);
+					if (!ic) {
+						ic = jffs2_scan_make_ino_cache(c, ino);
+						if (!ic) {
+							printk(KERN_NOTICE "jffs2_scan_eraseblock(): scan_make_ino_cache failed\n");
+							jffs2_free_raw_node_ref(raw);
+							kfree(summary);
+							return -ENOMEM;
+						}
+					}
+						
+					raw->flash_offset = (jeb->offset + je32_to_cpu(spi->offset)) | REF_UNCHECKED;
+					raw->__totlen = PAD(je32_to_cpu(spi->totlen));
+					raw->next_phys = NULL;
+					raw->next_in_ino = ic->nodes;
+						
+					ic->nodes = raw;
+					if (!jeb->first_node)
+							jeb->first_node = raw;
+					if (jeb->last_node)
+							jeb->last_node->next_phys = raw;
+					jeb->last_node = raw;
+						
+					*pseudo_random += je32_to_cpu(spi->version);
+					UNCHECKED_SPACE(PAD(je32_to_cpu(spi->totlen)));
+					
+					temp8ptr = (uint8_t *) sp;
+					temp8ptr += JFFS2_SUMMARY_INODE_SIZE;
+					sp = (struct jffs2_sum_unknown_flash *) temp8ptr;
+					
+					break;
+				}
+					
+				case JFFS2_NODETYPE_DIRENT : {
+					struct jffs2_sum_dirent_flash *spd;
+					spd = (struct jffs2_sum_dirent_flash *) sp;
+					
+					fd = jffs2_alloc_full_dirent(spd->nsize+1);
+					if (!fd) {
+						kfree(summary);
+						return -ENOMEM;
+					}
+					
+					memcpy(&fd->name, spd->name, spd->nsize);
+					fd->name[spd->nsize] = 0;
+					
+					raw = jffs2_alloc_raw_node_ref();
+					if (!raw) {
+						jffs2_free_full_dirent(fd);
+						printk(KERN_NOTICE "jffs2_scan_dirent_node(): allocation of node reference failed\n");
+						kfree(summary);
+						return -ENOMEM;
+					}
+					
+					ic = jffs2_scan_make_ino_cache(c, je32_to_cpu(spd->pino));
+					if (!ic) {
+						jffs2_free_full_dirent(fd);
+						jffs2_free_raw_node_ref(raw);
+						kfree(summary);
+						return -ENOMEM;
+					}
+					
+					raw->__totlen = PAD(je32_to_cpu(spd->totlen));
+					raw->flash_offset = (jeb->offset + je32_to_cpu(spd->offset)) | REF_PRISTINE;
+					raw->next_phys = NULL;
+					raw->next_in_ino = ic->nodes;
+					ic->nodes = raw;
+					if (!jeb->first_node)
+						jeb->first_node = raw;
+					if (jeb->last_node)
+						jeb->last_node->next_phys = raw;
+					jeb->last_node = raw;
+				
+					fd->raw = raw;
+					fd->next = NULL;
+					fd->version = je32_to_cpu(spd->version);
+					fd->ino = je32_to_cpu(spd->ino);
+					fd->nhash = full_name_hash(fd->name, spd->nsize);
+					fd->type = spd->type;
+					USED_SPACE(PAD(je32_to_cpu(spd->totlen)));
+					jffs2_add_fd_to_list(c, fd, &ic->scan_dents);
+					
+					*pseudo_random += je32_to_cpu(spd->version);
+					
+					temp8ptr = (uint8_t *) sp;
+					temp8ptr += JFFS2_SUMMARY_DIRENT_SIZE(spd->nsize); 
+					sp = (struct jffs2_sum_unknown_flash *) temp8ptr;
+					
+					break;
+				}
+				
+				default : {
+					printk(KERN_WARNING "Kernel doesn't support this type of node !!! Exiting");
+					return -EIO;
+					break;			
+				}
+			}
+		}
+		
+		kfree(summary);
+
+		/* for ACCT_PARANOIA_CHECK */
+		cache_ref = jffs2_alloc_raw_node_ref();
+		
+		if (!cache_ref) {
+			printk(KERN_NOTICE "Failed to allocate node ref for cache\n");
+			return -ENOMEM;
+		}
+		
+		cache_ref->next_in_ino = NULL;
+		cache_ref->next_phys = NULL;
+		cache_ref->flash_offset = ofs | REF_NORMAL;
+		cache_ref->__totlen = sumsize;
+		
+		if (!jeb->first_node)
+			jeb->first_node = cache_ref;
+		if (jeb->last_node)
+			jeb->last_node->next_phys = cache_ref;
+		jeb->last_node = cache_ref;
+		
+		USED_SPACE(sumsize);
+
+                jeb->wasted_size += jeb->free_size;
+                c->wasted_size += jeb->free_size;
+                c->free_size -= jeb->free_size;
+                jeb->free_size = 0;
+
+		/* somebody check this and all of space accounting in summary support */
+
+		if ((jeb->used_size + jeb->unchecked_size) == PAD(c->cleanmarker_size) && !jeb->dirty_size 
+			&& (!jeb->first_node || !jeb->first_node->next_in_ino) ) { 
+				return BLK_STATE_CLEANMARKER; 
+			}		
+		/* move blocks with max 4 byte dirty space to cleanlist */	
+		else if (!ISDIRTY(c->sector_size - (jeb->used_size + jeb->unchecked_size))) {
+			c->dirty_size -= jeb->dirty_size;
+			c->wasted_size += jeb->dirty_size; 
+			jeb->wasted_size += jeb->dirty_size;
+			jeb->dirty_size = 0;
+			return BLK_STATE_CLEAN;
+		}
+		else if (jeb->used_size || jeb->unchecked_size) { 
+				return BLK_STATE_PARTDIRTY; 
+		}
+		else { 
+				return BLK_STATE_ALLDIRTY; 
+		}
+	}
+	
+	return 0;
+}
+
+/* Write out summary information - called from jffs2_do_reserve_space */
+
+int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
+{
+	struct jffs2_summary_node isum;
+	union jffs2_sum_mem *temp;
+	jint32_t offset;
+	jint32_t *wpage;
+	uint8_t *tempptr;
+	int datasize;
+	int infosize;
+	int padsize;
+	size_t retlen;
+	int ret;
+	struct jffs2_eraseblock *jeb;
+	struct kvec vecs[2];	
+	jint32_t magic = cpu_to_je32(JFFS2_SUM_MAGIC);
+		
+	D2(printk(KERN_DEBUG "jffs2_sum_write_sumnode()\n"));
+	
+	jeb = c->nextblock;
+	
+	if (!jeb->sum_collected->sum_num || !jeb->sum_collected->sum_list) {
+		printk(KERN_WARNING "JFFS2: jffs2_sum_write_sumnode(): empty summary info!!!\n");
+		BUG(); 
+	}
+	
+	datasize = jeb->sum_collected->sum_size + sizeof(struct jffs2_sum_marker);
+	infosize = sizeof(struct jffs2_summary_node) + datasize;
+	padsize = jeb->free_size - infosize;
+	infosize += padsize; datasize += padsize;
+	offset = cpu_to_je32(c->sector_size - jeb->free_size);
+	
+	if (padsize < 0) { // if jeb hasn't got enought free space for summary
+		
+		union jffs2_sum_mem *temp;	
+		
+		while(jeb->sum_collected->sum_list){ //cleanup sum_list
+			temp = jeb->sum_collected->sum_list;
+			jeb->sum_collected->sum_list = jeb->sum_collected->sum_list->u.next;
+			kfree(temp);
+			jeb->sum_collected->sum_num--;
+		}
+		
+		jeb->sum_collected->sum_list = NULL;
+		jeb->sum_collected->sum_num = 0;
+		jeb->sum_collected->sum_size = JFFS2_SUMMARY_NOSUM_SIZE; // don't try to write out summary for this node
+		
+		printk(KERN_WARNING "JFFS2: not enough space for summary, padsize = %d\n",padsize);
+                return 0;
+	}
+			
+	memset(c->summary_buf, 0xff, datasize);
+	memset(&isum, 0, sizeof(isum));
+	
+	isum.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	isum.nodetype = cpu_to_je16(JFFS2_NODETYPE_SUMMARY);
+	isum.totlen = cpu_to_je32(infosize);
+	isum.hdr_crc = cpu_to_je32(crc32(0, &isum, sizeof(struct jffs2_unknown_node) - 4));
+        isum.padded = cpu_to_je32(jeb->sum_collected->sum_padded);
+		
+	if (c->cleanmarker_size) {
+		isum.cln_mkr = cpu_to_je32(c->cleanmarker_size);	
+	}
+	else{
+		isum.cln_mkr = cpu_to_je32(0);
+	}
+	
+	isum.sum_num = cpu_to_je16(jeb->sum_collected->sum_num);
+	wpage = c->summary_buf;
+	
+		
+	while (jeb->sum_collected->sum_num) { // write sum_data 
+		
+
+		switch(je16_to_cpu(jeb->sum_collected->sum_list->u.nodetype)){
+			
+			case JFFS2_NODETYPE_INODE : {
+				jint16_t *temp16ptr = (jint16_t *)wpage;
+				
+				*(temp16ptr++) = jeb->sum_collected->sum_list->i.nodetype;
+				wpage = (jint32_t *) temp16ptr;
+				
+				*(wpage++) = jeb->sum_collected->sum_list->i.inode;
+				*(wpage++) = jeb->sum_collected->sum_list->i.version;
+				*(wpage++) = jeb->sum_collected->sum_list->i.offset;
+				*(wpage++) = jeb->sum_collected->sum_list->i.totlen;
+				break;
+			}
+			
+			case JFFS2_NODETYPE_DIRENT : {
+				jint16_t *temp16ptr = (jint16_t *) wpage;
+				uint8_t *temp8ptr = NULL;
+				
+				*(temp16ptr++) = jeb->sum_collected->sum_list->d.nodetype;
+				wpage = (jint32_t *) temp16ptr;
+				
+				*(wpage++) = jeb->sum_collected->sum_list->d.totlen;
+				*(wpage++) = jeb->sum_collected->sum_list->d.offset;
+				*(wpage++) = jeb->sum_collected->sum_list->d.pino;
+				*(wpage++) = jeb->sum_collected->sum_list->d.version;
+				*(wpage++) = jeb->sum_collected->sum_list->d.ino;
+				
+				temp8ptr = (uint8_t *) wpage;
+				*(temp8ptr++) = jeb->sum_collected->sum_list->d.nsize;
+				*(temp8ptr++) = jeb->sum_collected->sum_list->d.type;
+								
+				memcpy(temp8ptr,jeb->sum_collected->sum_list->d.name,jeb->sum_collected->sum_list->d.nsize);
+				temp8ptr += jeb->sum_collected->sum_list->d.nsize;
+				wpage = (jint32_t *) temp8ptr;
+				
+				break;
+			}
+			
+			default : {
+				printk(KERN_WARNING "Unknown node in summary information!!!\n");
+				BUG();
+			}
+		}
+		
+		temp = jeb->sum_collected->sum_list;
+		jeb->sum_collected->sum_list = jeb->sum_collected->sum_list->u.next;
+		kfree(temp);
+		
+		jeb->sum_collected->sum_num--;
+	}
+	
+	jeb->sum_collected->sum_size = 0;
+	
+	tempptr = (uint8_t *) wpage;
+	tempptr += padsize;
+	wpage = (jint32_t *) tempptr;
+	
+	*(wpage++) = offset;
+	*(wpage++) = cpu_to_je32(c->sector_size);
+	*(wpage++) = magic;
+	isum.sum_crc = cpu_to_je32(crc32(0, c->summary_buf, datasize));
+	isum.node_crc = cpu_to_je32(crc32(0, &isum, sizeof(isum) - 8));
+	
+	vecs[0].iov_base = &isum;
+	vecs[0].iov_len = sizeof(isum);
+	vecs[1].iov_base = c->summary_buf;
+	vecs[1].iov_len = datasize;
+			
+	D1(printk(KERN_DEBUG "JFFS2: writing out data to flash to pos : 0x%08x\n",jeb->offset + c->sector_size - jeb->free_size));
+	
+	spin_unlock(&c->erase_completion_lock);
+	ret = jffs2_flash_writev(c, vecs, 2, jeb->offset + c->sector_size - jeb->free_size, &retlen, 0);
+	spin_lock(&c->erase_completion_lock);
+
+	
+	if (ret || (retlen != infosize)) {
+		printk(KERN_WARNING "JFFS2: write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n", 
+		      infosize, jeb->offset + c->sector_size - jeb->free_size, ret, retlen);
+
+		jeb->sum_collected->sum_size = JFFS2_SUMMARY_NOSUM_SIZE;
+				
+		WASTED_SPACE(infosize);
+		
+		return 0;
+	}	
+	
+	/*spin_unlock(&c->erase_completion_lock);
+	jffs2_flush_wbuf_pad(c); // summary filled the wbuf
+	spin_lock(&c->erase_completion_lock);*/
+
+	WASTED_SPACE(infosize);
+	
+	return 0;	
+}
diff --unified --recursive --new-file mtd2/fs/jffs2/summary.h mtd/fs/jffs2/summary.h
--- mtd2/fs/jffs2/summary.h	1970-01-01 01:00:00.000000000 +0100
+++ mtd/fs/jffs2/summary.h	2004-11-15 11:51:33.000000000 +0100
@@ -0,0 +1,158 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.
+ *
+ * Copyright (C) 2004  Ferenc Havasi <havasi@inf.u-szeged.hu>,
+ *                     Zoltan Sogor <weth@inf.u-szeged.hu>,
+ *                     Patrik Kluba <pajko@halom.u-szeged.hu>,
+ *                     University of Szeged, Hungary
+ *
+ * For licensing information, see the file 'LICENCE' in this directory.
+ *
+ * $Id$
+ *
+ */
+
+#ifndef JFFS2_SUMMARY_H
+#define JFFS2_SUMMARY_H
+
+#include <linux/uio.h>
+#include <linux/jffs2.h>
+
+#define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
+		c->free_size -= _x; c->dirty_size += _x; \
+		jeb->free_size -= _x ; jeb->dirty_size += _x; \
+		}while(0)
+#define USED_SPACE(x) do { typeof(x) _x = (x); \
+		c->free_size -= _x; c->used_size += _x; \
+		jeb->free_size -= _x ; jeb->used_size += _x; \
+		}while(0)
+#define WASTED_SPACE(x) do { typeof(x) _x = (x); \
+		c->free_size -= _x; c->wasted_size += _x; \
+		jeb->free_size -= _x ; jeb->wasted_size += _x; \
+		}while(0)
+#define UNCHECKED_SPACE(x) do { typeof(x) _x = (x); \
+		c->free_size -= _x; c->unchecked_size += _x; \
+		jeb->free_size -= _x ; jeb->unchecked_size += _x; \
+		}while(0)
+
+#define BLK_STATE_ALLFF		0
+#define BLK_STATE_CLEAN		1
+#define BLK_STATE_PARTDIRTY	2
+#define BLK_STATE_CLEANMARKER	3
+#define BLK_STATE_ALLDIRTY	4
+#define BLK_STATE_BADBLOCK	5
+
+#define JFFS2_SUMMARY_NOSUM_SIZE 0xffffffff
+#define JFFS2_SUMMARY_INODE_SIZE (sizeof(struct jffs2_sum_inode_flash))
+#define JFFS2_SUMMARY_DIRENT_SIZE(x) (sizeof(struct jffs2_sum_dirent_flash) + (x))
+
+struct jffs2_sum_unknown_flash
+{
+	jint16_t nodetype;	/* node type	*/
+};
+
+struct jffs2_sum_inode_flash
+{
+	jint16_t nodetype;	/* node type	*/
+	jint32_t inode;		/* inode number */
+	jint32_t version;	/* inode version */
+	jint32_t offset;	/* offset on jeb */
+	jint32_t totlen; 	/* record length */
+} __attribute__((packed));
+
+struct jffs2_sum_dirent_flash
+{
+	jint16_t nodetype;	/* == JFFS_NODETYPE_DIRENT */
+	jint32_t totlen;	/* record length */
+	jint32_t offset;	/* ofset on jeb */
+	jint32_t pino;		/* parent inode */
+	jint32_t version;	/* dirent version */
+	jint32_t ino; 		/* == zero for unlink */
+	uint8_t nsize;		/* dirent name size */
+	uint8_t type;		/* dirent type */
+	uint8_t name[0];	/* dirent name */
+} __attribute__((packed));
+
+union jffs2_sum_flash{
+	struct jffs2_sum_unknown_flash u;
+	struct jffs2_sum_inode_flash i;
+	struct jffs2_sum_dirent_flash d; 
+};
+
+/* list version of jffs2_sum_*flash for kernel and sumtool */
+struct jffs2_sum_unknown_mem
+{
+	union jffs2_sum_mem *next;
+	jint16_t nodetype;	/* node type	*/
+	
+};
+
+struct jffs2_sum_inode_mem
+{
+	union jffs2_sum_mem *next;
+	jint16_t nodetype;	/* node type	*/
+	jint32_t inode;		/* inode number */
+	jint32_t version;	/* inode version */
+	jint32_t offset;	/* offset on jeb */
+	jint32_t totlen; 	/* record length */
+} __attribute__((packed));
+
+struct jffs2_sum_dirent_mem
+{
+	union jffs2_sum_mem *next;
+	jint16_t nodetype;	/* == JFFS_NODETYPE_DIRENT */
+	jint32_t totlen;	/* record length */
+	jint32_t offset;	/* ofset on jeb */
+	jint32_t pino;		/* parent inode */
+	jint32_t version;	/* dirent version */
+	jint32_t ino; 		/* == zero for unlink */
+	uint8_t nsize;		/* dirent name size */
+	uint8_t type;		/* dirent type */
+	uint8_t name[0];	/* dirent name */
+} __attribute__((packed));
+
+union jffs2_sum_mem 
+{
+	struct jffs2_sum_unknown_mem u;
+	struct jffs2_sum_inode_mem i;
+	struct jffs2_sum_dirent_mem d; 
+};
+
+struct jffs2_sum_info
+{
+	uint32_t sum_size;
+	uint32_t sum_num;
+        uint32_t sum_padded;
+	union jffs2_sum_mem *sum_list;
+};
+
+struct jffs2_sum_marker
+{
+	jint32_t offset;
+	jint32_t erase_size;
+	jint32_t magic;
+};
+
+#define JFFS2_SUMMARY_FRAME_SIZE (sizeof(struct jffs2_summary_node)+sizeof(struct jffs2_sum_marker)+3)
+	
+#if !(defined(SUM_TOOL) || defined(JFFS2DUMP))
+
+int jffs2_sum_init(struct jffs2_sb_info *c);
+void jffs2_sum_exit(struct jffs2_sb_info *c);
+
+int jffs2_sum_care_sum_collected(struct jffs2_eraseblock *jeb);
+
+void jffs2_sum_clean_collected(struct jffs2_eraseblock *jeb);
+void jffs2_sum_clean_all_info(struct jffs2_sb_info *c); /* clean up all summary information in all jeb (umount) */
+
+int jffs2_sum_add_padding_mem(struct jffs2_eraseblock *jeb, uint32_t size);
+int jffs2_sum_add_inode_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_inode *ri, uint32_t ofs);	
+int jffs2_sum_add_dirent_mem(struct jffs2_eraseblock *jeb, struct jffs2_raw_dirent *rd, uint32_t ofs);	
+int jffs2_sum_add_kvec(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count,  uint32_t to);	
+
+int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t ofs, uint32_t *pseudo_random);
+int jffs2_sum_write_sumnode(struct jffs2_sb_info *c);	
+
+#endif
+
+#endif /* JFFS2_SUMMARY_H */
diff --unified --recursive --new-file mtd2/fs/jffs2/super-v24.c mtd/fs/jffs2/super-v24.c
--- mtd2/fs/jffs2/super-v24.c	2004-07-16 17:17:57.000000000 +0200
+++ mtd/fs/jffs2/super-v24.c	2004-11-15 11:51:33.000000000 +0100
@@ -24,6 +24,7 @@
 #include <linux/mtd/mtd.h>
 #include "compr.h"
 #include "nodelist.h"
+#include "summary.h"
 
 #ifndef MTD_BLOCK_MAJOR
 #define MTD_BLOCK_MAJOR 31
@@ -72,6 +73,9 @@
 		put_mtd_device(c->mtd);
 		return NULL;
 	}
+#ifdef CONFIG_JFFS2_SUMMARY
+        jffs2_sum_init(c);
+#endif
 
 	return sb;
 }
@@ -88,6 +92,10 @@
 	down(&c->alloc_sem);
 	jffs2_flush_wbuf_pad(c);
 	up(&c->alloc_sem);
+#ifdef CONFIG_JFFS2_SUMMARY
+        jffs2_sum_clean_all_info(c);
+        jffs2_sum_exit(c);
+#endif
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
 	kfree(c->blocks);
@@ -110,6 +118,9 @@
 #ifdef CONFIG_JFFS2_FS_NAND
 	       " (NAND)"
 #endif
+#ifdef CONFIG_JFFS2_SUMMARY
+	       " (SUMMARY)"
+#endif
 	       " (C) 2001-2003 Red Hat, Inc.\n");
 
 #ifdef JFFS2_OUT_OF_KERNEL
diff --unified --recursive --new-file mtd2/fs/jffs2/super.c mtd/fs/jffs2/super.c
--- mtd2/fs/jffs2/super.c	2004-11-12 03:42:17.000000000 +0100
+++ mtd/fs/jffs2/super.c	2004-11-15 11:51:33.000000000 +0100
@@ -152,6 +152,10 @@
 		return ERR_PTR(ret);
 	}
 
+#ifdef CONFIG_JFFS2_SUMMARY
+        jffs2_sum_init(c);
+#endif
+
 	sb->s_flags |= MS_ACTIVE;
 	return sb;
 
@@ -275,6 +279,10 @@
 	down(&c->alloc_sem);
 	jffs2_flush_wbuf_pad(c);
 	up(&c->alloc_sem);
+#ifdef CONFIG_JFFS2_SUMMARY
+        jffs2_sum_clean_all_info(c);
+        jffs2_sum_exit(c);
+#endif
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
 	kfree(c->blocks);
@@ -309,6 +317,9 @@
 #ifdef CONFIG_JFFS2_FS_NAND
 	       " (NAND)"
 #endif
+#ifdef CONFIG_JFFS2_SUMMARY
+               " (SUMMARY) "
+#endif
 	       " (C) 2001-2003 Red Hat, Inc.\n");
 
 	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
diff --unified --recursive --new-file mtd2/fs/jffs2/wbuf.c mtd/fs/jffs2/wbuf.c
--- mtd2/fs/jffs2/wbuf.c	2004-11-05 13:41:10.000000000 +0100
+++ mtd/fs/jffs2/wbuf.c	2004-11-15 11:51:33.000000000 +0100
@@ -256,7 +256,7 @@
 
 
 	/* ... and get an allocation of space from a shiny new block instead */
-	ret = jffs2_reserve_space_gc(c, end-start, &ofs, &len);
+	ret = jffs2_reserve_space_gc(c, end-start, &ofs, &len, JFFS2_SUMMARY_NOSUM_SIZE);
 	if (ret) {
 		printk(KERN_WARNING "Failed to allocate space for wbuf recovery. Data loss ensues.\n");
 		if (buf)
@@ -583,9 +583,15 @@
 	uint32_t outvec_to = to;
 
 	/* If not NAND flash, don't bother */
-	if (!c->wbuf)
+	if (!c->wbuf){
+#ifdef CONFIG_JFFS2_SUMMARY
+		D1(printk("JFFS2.summary: NOT NAND MEMORY\n"));
+		if(jffs2_sum_add_kvec(c,invecs,count,(uint32_t) to)){
+			printk("jffs2_sum_add_kvec(): MEMORY ALLOCATION ERROR!");
+		}	
+#endif
 		return jffs2_flash_direct_writev(c, invecs, count, to, retlen);
-	
+	}
 	/* If wbuf_ofs is not initialized, set it to target address */
 	if (c->wbuf_ofs == 0xFFFFFFFF) {
 		c->wbuf_ofs = PAGE_DIV(to);
@@ -783,6 +789,12 @@
 alldone:
 	*retlen = donelen;
 
+#ifdef CONFIG_JFFS2_SUMMARY
+	if(jffs2_sum_add_kvec(c,invecs,count,(uint32_t) to)){
+		printk("jffs2_sum_add_kvec(): MEMORY ALLOCATION ERROR!");
+	}
+#endif
+	
 	if (c->wbuf_len && ino)
 		jffs2_wbuf_dirties_inode(c, ino);
 
diff --unified --recursive --new-file mtd2/fs/jffs2/write.c mtd/fs/jffs2/write.c
--- mtd2/fs/jffs2/write.c	2004-11-13 11:44:26.000000000 +0100
+++ mtd/fs/jffs2/write.c	2004-11-15 11:51:33.000000000 +0100
@@ -173,13 +173,13 @@
 			D1(ACCT_PARANOIA_CHECK(jeb));
 
 			if (alloc_mode == ALLOC_GC) {
-				ret = jffs2_reserve_space_gc(c, sizeof(*ri) + datalen, &flash_ofs, &dummy);
+				ret = jffs2_reserve_space_gc(c, sizeof(*ri) + datalen, &flash_ofs, &dummy, JFFS2_SUMMARY_INODE_SIZE);
 			} else {
 				/* Locking pain */
 				up(&f->sem);
 				jffs2_complete_reservation(c);
 			
-				ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &flash_ofs, &dummy, alloc_mode);
+				ret = jffs2_reserve_space(c, sizeof(*ri) + datalen, &flash_ofs, &dummy, alloc_mode, JFFS2_SUMMARY_INODE_SIZE);
 				down(&f->sem);
 			}
 
@@ -308,13 +308,13 @@
 			D1(ACCT_PARANOIA_CHECK(jeb));
 
 			if (alloc_mode == ALLOC_GC) {
-				ret = jffs2_reserve_space_gc(c, sizeof(*rd) + namelen, &flash_ofs, &dummy);
+				ret = jffs2_reserve_space_gc(c, sizeof(*rd) + namelen, &flash_ofs, &dummy, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 			} else {
 				/* Locking pain */
 				up(&f->sem);
 				jffs2_complete_reservation(c);
 			
-				ret = jffs2_reserve_space(c, sizeof(*rd) + namelen, &flash_ofs, &dummy, alloc_mode);
+				ret = jffs2_reserve_space(c, sizeof(*rd) + namelen, &flash_ofs, &dummy, alloc_mode, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 				down(&f->sem);
 			}
 
@@ -371,7 +371,7 @@
 	retry:
 		D2(printk(KERN_DEBUG "jffs2_commit_write() loop: 0x%x to write to 0x%x\n", writelen, offset));
 
-		ret = jffs2_reserve_space(c, sizeof(*ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen, ALLOC_NORMAL);
+		ret = jffs2_reserve_space(c, sizeof(*ri) + JFFS2_MIN_DATA_LEN, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 		if (ret) {
 			D1(printk(KERN_DEBUG "jffs2_reserve_space returned %d\n", ret));
 			break;
@@ -458,7 +458,7 @@
 	/* Try to reserve enough space for both node and dirent. 
 	 * Just the node will do for now, though 
 	 */
-	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*ri), &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
 	D1(printk(KERN_DEBUG "jffs2_do_create(): reserved 0x%x bytes\n", alloclen));
 	if (ret) {
 		up(&f->sem);
@@ -487,7 +487,7 @@
 
 	up(&f->sem);
 	jffs2_complete_reservation(c);
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 		
 	if (ret) {
 		/* Eep. */
@@ -557,7 +557,7 @@
 		if (!rd)
 			return -ENOMEM;
 
-		ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_DELETION);
+		ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_DELETION, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 		if (ret) {
 			jffs2_free_raw_dirent(rd);
 			return ret;
@@ -663,7 +663,7 @@
 	if (!rd)
 		return -ENOMEM;
 
-	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL);
+	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen, ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
 		jffs2_free_raw_dirent(rd);
 		return ret;
diff --unified --recursive --new-file mtd2/include/linux/jffs2.h mtd/include/linux/jffs2.h
--- mtd2/include/linux/jffs2.h	2004-05-25 13:31:55.000000000 +0200
+++ mtd/include/linux/jffs2.h	2004-11-15 11:51:33.000000000 +0100
@@ -28,6 +28,9 @@
 #define JFFS2_EMPTY_BITMASK 0xffff
 #define JFFS2_DIRTY_BITMASK 0x0000
 
+/* Summary node MAGIC marker */
+#define JFFS2_SUM_MAGIC	0x02851885 
+
 /* We only allow a single char for length, and 0xFF is empty flash so
    we don't want it confused with a real length. Hence max 254.
 */
@@ -62,6 +65,8 @@
 #define JFFS2_NODETYPE_CLEANMARKER (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 #define JFFS2_NODETYPE_PADDING (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 4)
 
+#define JFFS2_NODETYPE_SUMMARY (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 6)
+
 // Maybe later...
 //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 //#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
@@ -148,10 +153,24 @@
 	uint8_t data[0];
 } __attribute__((packed));
 
+struct jffs2_summary_node{
+    jint16_t magic;
+	jint16_t nodetype; 	/* = JFFS2_NODETYPE_INODE_SUM */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	jint16_t sum_num;	/* number of sum entries*/
+	jint32_t cln_mkr;	/* clean marker size, 0 = no cleanmarker */
+        jint32_t padded;        /* sum of the size of padding nodes */
+	jint32_t sum_crc;	/* summary information crc */
+	jint32_t node_crc; 	/* node crc */
+	jint32_t sum[0]; 	/* inode summary info */
+} __attribute__((packed));
+
 union jffs2_node_union {
 	struct jffs2_raw_inode i;
 	struct jffs2_raw_dirent d;
 	struct jffs2_unknown_node u;
+	struct jffs2_summary_node s;
 };
 
 #endif /* __LINUX_JFFS2_H__ */
diff --unified --recursive --new-file mtd2/include/linux/jffs2_fs_sb.h mtd/include/linux/jffs2_fs_sb.h
--- mtd2/include/linux/jffs2_fs_sb.h	2004-11-03 13:57:39.000000000 +0100
+++ mtd/include/linux/jffs2_fs_sb.h	2004-11-15 11:51:33.000000000 +0100
@@ -109,6 +109,9 @@
 	uint32_t fsdata_pos;
 	uint32_t fsdata_len;
 #endif
+#ifdef CONFIG_JFFS2_SUMMARY
+        jint32_t *summary_buf;
+#endif
 
 	/* OS-private pointer for getting back to master superblock info */
 	void *os_priv;
diff --unified --recursive --new-file mtd2/util/Makefile mtd/util/Makefile
--- mtd2/util/Makefile	2004-07-13 19:49:43.000000000 +0200
+++ mtd/util/Makefile	2004-11-15 11:51:33.000000000 +0100
@@ -13,7 +13,7 @@
 TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	mkfs.jffs ftl_check mkfs.jffs2 flash_lock flash_unlock \
 	flash_info mtd_debug flashcp nandwrite jffs2dump \
-	nftldump nftl_format docfdisk #jffs2reader
+	nftldump nftl_format docfdisk sumtool #jffs2reader
 
 SYMLINKS = compr_lzari.c compr_lzo.c
 
@@ -48,6 +48,10 @@
 jffs2dump: jffs2dump.o crc32.o
 	$(CC) $(LDFLAGS) -o $@ $^
 
+sumtool: sumtool.o crc32.o
+	$(CC) $(LDFLAGS) -o $@ $^
+	
+
 install: ${TARGETS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m0755 -oroot -groot ${TARGETS} ${DESTDIR}/${SBINDIR}/
diff --unified --recursive --new-file mtd2/util/jffs2dump.c mtd/util/jffs2dump.c
--- mtd2/util/jffs2dump.c	2004-06-19 00:11:48.000000000 +0200
+++ mtd/util/jffs2dump.c	2004-11-15 11:51:33.000000000 +0100
@@ -35,6 +35,10 @@
 #include <getopt.h>
 #include "crc32.h"
 
+#define CONFIG_JFFS2_SUMMARY
+#define JFFS2DUMP
+#include "../fs/jffs2/summary.h"
+
 #define PROGRAM "jffs2dump"
 #define VERSION "1.0"
 
@@ -177,7 +181,7 @@
  */
 void do_dumpcontent (void) 
 {
-	char			*p = data;
+	char			*p = data, *p_free_begin;
 	union jffs2_node_union 	*node;
 	int			empty = 0, dirty = 0;
 	char			name[256];
@@ -186,16 +190,21 @@
 	int			bitchbitmask = 0;
 	int			obsolete;
 
+	p_free_begin = NULL;
 	while ( p < (data + imglen)) {
 		node = (union jffs2_node_union*) p;
 		
 		/* Skip empty space */
+		if (!p_free_begin) p_free_begin = p;
 		if (je16_to_cpu (node->u.magic) == 0xFFFF && je16_to_cpu (node->u.nodetype) == 0xFFFF) {
 			p += 4;
 			empty += 4;
 			continue;
 		}
-		
+
+		if (p != p_free_begin) printf("Empty space found from 0x%08x to 0x%08x\n", p_free_begin-data, p-data);
+		p_free_begin = NULL;
+
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
 			if (!bitchbitmask++)
     			    printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
@@ -277,7 +286,110 @@
 
 			p += PAD(je32_to_cpu (node->d.totlen));						
 			break;
-	
+
+		case JFFS2_NODETYPE_SUMMARY:{
+			
+			int i;
+			struct jffs2_sum_marker * sm;
+			
+			printf ("%8s Inode Sum  node at 0x%08x, totlen 0x%08x, sum_num  %5d, cleanmarker size %5d\n",
+					obsolete ? "Obsolete" : "",
+					p - data,
+					je32_to_cpu (node->s.totlen),
+					je16_to_cpu (node->s.sum_num),
+					je32_to_cpu (node->s.cln_mkr));
+
+			crc = crc32 (0, node, sizeof (struct jffs2_summary_node) - 8);
+			if (crc != je32_to_cpu (node->s.node_crc)) {
+				printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.node_crc), crc);
+				p += PAD(je32_to_cpu (node->s.totlen));
+				dirty += PAD(je32_to_cpu (node->s.totlen));;
+				continue;
+			}
+			
+			crc = crc32(0, p + sizeof (struct jffs2_summary_node),  je32_to_cpu (node->s.totlen) - sizeof(struct jffs2_summary_node));
+			if (crc != je32_to_cpu(node->s.sum_crc)) {
+				printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->s.sum_crc), crc);
+				p += PAD(je32_to_cpu (node->s.totlen));
+				dirty += PAD(je32_to_cpu (node->s.totlen));;
+				continue;
+			}
+
+			if(verbose){
+				struct jffs2_sum_unknown_flash *sp;
+				uint8_t *temp8ptr = NULL;
+				sp = (struct jffs2_sum_unknown_flash *) (p + sizeof (struct jffs2_summary_node));
+					
+				for(i = 0; i < je16_to_cpu (node->s.sum_num); i++){
+					
+					switch(je16_to_cpu(sp->nodetype)){
+						case JFFS2_NODETYPE_INODE : {
+							
+							struct jffs2_sum_inode_flash *spi;
+							spi = (struct jffs2_sum_inode_flash *) sp;
+								
+							printf ("%14s #ino  %5d,  version %5d, offset 0x%08x, totlen 0x%08x\n",
+							"",
+							je32_to_cpu (spi->inode),
+							je32_to_cpu (spi->version),
+							je32_to_cpu (spi->offset), 
+							je32_to_cpu (spi->totlen));
+							
+							temp8ptr = (uint8_t *) sp;
+							temp8ptr += JFFS2_SUMMARY_INODE_SIZE;
+							sp = (struct jffs2_sum_unknown_flash *) temp8ptr;
+							
+							break;	
+						}
+						
+						case JFFS2_NODETYPE_DIRENT : {
+							
+							char name[255];
+							struct jffs2_sum_dirent_flash *spd;
+							spd = (struct jffs2_sum_dirent_flash *) sp;
+							
+							memcpy(name,spd->name,spd->nsize);
+							name [spd->nsize] = 0x0;
+							
+							printf ("%14s dirent offset 0x%08x, totlen 0x%08x, #pino  %5d,  version %5d, #ino  %8d, nsize %8d, name %s \n",
+							"",
+							je32_to_cpu (spd->offset), 
+							je32_to_cpu (spd->totlen),
+							je32_to_cpu (spd->pino),
+							je32_to_cpu (spd->version),
+							je32_to_cpu (spd->ino),
+							spd->nsize,
+							name);
+							
+							temp8ptr = (uint8_t *) sp;
+							temp8ptr += JFFS2_SUMMARY_DIRENT_SIZE(spd->nsize); 
+							sp = (struct jffs2_sum_unknown_flash *) temp8ptr;
+							
+							break;
+						}
+						
+						default : {
+							break;
+						}
+					}	
+				}
+				
+				
+				sm = (struct jffs2_sum_marker *) ((char *)p + je32_to_cpu(node->s.totlen) - sizeof(struct jffs2_sum_marker));
+				
+				printf("%14s Sum Node Offset  0x%08x, Erase_block_size 0x%08x, Magic 0x%08x, Padded size 0x%08x\n" ,
+					"",
+					je32_to_cpu(sm->offset),
+					je32_to_cpu(sm->erase_size),
+					je32_to_cpu(sm->magic),
+                                        je32_to_cpu(node->s.padded));
+			}
+			
+			p += PAD(je32_to_cpu (node->s.totlen));
+			break;
+			
+		}
+			
 		case JFFS2_NODETYPE_CLEANMARKER:
 			if (verbose) {
 				printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n", 
diff --unified --recursive --new-file mtd2/util/sumtool.c mtd/util/sumtool.c
--- mtd2/util/sumtool.c	1970-01-01 01:00:00.000000000 +0100
+++ mtd/util/sumtool.c	2004-11-15 11:51:33.000000000 +0100
@@ -0,0 +1,847 @@
+/*
+ *  sumtool.c
+ *
+ *  Copyright (C) 2004 Zoltan Sogor <weth@inf.u-szeged.hu>,
+ *                     Ferenc Havasi <havasi@inf.u-szeged.hu>,
+ *                     Patrik Kluba <pajko@halom.u-szeged.hu>,
+ *                     University of Szeged, Hungary
+ *
+ * $Id: sumtool.c,v 1.2 2004/10/20 09:56:08 hafy Exp $
+ * 
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+ *
+ * Overview:
+ *   This is a utility to reorder nodes and insert inode summary information
+ *   into JFFS2 image for faster mount time - specially on NAND.
+ *
+ */
+
+#include <errno.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <time.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/param.h>
+#include <asm/types.h>
+#include <dirent.h>
+#include <mtd/jffs2-user.h>
+#include <endian.h>
+#include <byteswap.h>
+#include <getopt.h>
+#include "crc32.h"
+
+#define CONFIG_JFFS2_SUMMARY
+#define SUM_TOOL
+#include "../fs/jffs2/summary.h"
+
+
+#define PAD(x) (((x)+3)&~3)
+
+static const char *const app_name = "sumtool";
+
+static struct jffs2_sum_info *sum_collected = NULL;/* summary info list */
+
+static int verbose = 0;
+static int add_cleanmarkers = 1;			/* add cleanmarker to output */
+static int use_input_cleanmarker_size = 1;	/* use input file's cleanmarker size (default) */
+static int found_cleanmarkers = 0;			/* cleanmarker found in input file */
+static struct jffs2_unknown_node cleanmarker;
+static int cleanmarker_size = sizeof(cleanmarker);
+static const char *short_options = "o:i:e:hvVblnc:";
+static int erase_block_size = 65536;
+static int target_endian = __BYTE_ORDER;
+static int out_fd = -1;
+static int in_fd = -1;
+
+static uint8_t *data_buffer = NULL; 	/* buffer for inodes */
+static unsigned int data_ofs = 0;	 	/* inode buffer offset */
+
+static uint8_t *file_buffer = NULL;		/* file buffer contains the actual erase block*/
+static unsigned int file_ofs = 0;		/* position in the buffer */
+
+static struct option long_options[] = {
+	{"output", 1, NULL, 'o'},
+	{"input", 1, NULL, 'i'},
+	{"eraseblock", 1, NULL, 'e'},
+	{"help", 0, NULL, 'h'},
+	{"verbose", 0, NULL, 'v'},
+	{"version", 0, NULL, 'V'},
+	{"bigendian", 0, NULL, 'b'},
+	{"littleendian", 0, NULL, 'l'},	
+	{"no-cleanmarkers", 0, NULL, 'n'},
+	{"cleanmarker", 1, NULL, 'c'},
+	{NULL, 0, NULL, 0}
+};
+
+static char *helptext =
+	"Usage: sumtool [OPTIONS] -i inputfile -o outputfile\n"
+	"Convert the input JFFS2 file to a SUM-ed JFFS2 file\n\n"
+	"Options:\n"
+	"  -e, --eraseblock=SIZE     Use erase block size SIZE (default: 64KiB)\n"
+	"                            (usually 16KiB on NAND)\n"
+	"  -c, --cleanmarker=SIZE    Size of cleanmarker (default 12).\n"
+	"                            (usually 16 bytes on NAND, and will be set to\n"
+	"                            this value if left at the default 12). Will be\n"
+	"                            stored in OOB after each physical page composing\n"
+	"                            a physical erase block.\n"
+	"  -n, --no-cleanmarkers     Don't add a cleanmarker to every eraseblock\n"
+	"  -o, --output=FILE         Output to FILE \n"
+	"  -i, --input=FILE          Input from FILE \n"
+	"  -b, --bigendian	     Image is big endian\n"
+	"  -l  --littleendian        Image is little endian\n"
+	"  -h, --help                Display this help text\n"
+	"  -v, --verbose             Verbose operation\n"
+	"  -V, --version             Display version information\n\n";
+
+
+static char *revtext = "$Revision: 1.2 $";
+
+static unsigned char ffbuf[16] = {
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
+};
+
+static void verror_msg(const char *s, va_list p) {
+	fflush(stdout);
+	fprintf(stderr, "%s: ", app_name);
+	vfprintf(stderr, s, p);
+}
+
+static void error_msg_and_die(const char *s, ...) {
+	va_list p;
+
+	va_start(p, s);
+	verror_msg(s, p);
+	va_end(p);
+	putc('\n', stderr);
+	exit(EXIT_FAILURE);
+}
+
+static void vperror_msg(const char *s, va_list p) {
+	int err = errno;
+
+	if (s == 0)
+		s = "";
+	verror_msg(s, p);
+	if (*s)
+		s = ": ";
+	fprintf(stderr, "%s%s\n", s, strerror(err));
+}
+
+static void perror_msg_and_die(const char *s, ...) {
+	va_list p;
+
+	va_start(p, s);
+	vperror_msg(s, p);
+	va_end(p);
+	exit(EXIT_FAILURE);
+}
+
+
+
+static void full_write(void *target_buff, const void *buf, int len);
+
+void setup_cleanmarker() {
+
+	cleanmarker.magic    = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
+	cleanmarker.totlen   = cpu_to_je32(cleanmarker_size);
+	cleanmarker.hdr_crc  = cpu_to_je32(crc32(0, &cleanmarker, sizeof(struct jffs2_unknown_node)-4));
+}
+
+void process_options (int argc, char **argv){
+	int opt,c;
+	
+	while ((opt = getopt_long(argc, argv, short_options, long_options, &c)) >= 0) 
+	{
+		switch (opt) 
+		{
+			case 'o':
+				if (out_fd != -1) {
+					error_msg_and_die("output filename specified more than once");
+				}
+				out_fd = open(optarg, O_CREAT | O_TRUNC | O_RDWR, 0644);
+				if (out_fd == -1) {
+					perror_msg_and_die("open output file");
+				}
+				break;
+				
+			case 'i':
+				if (in_fd != -1) {
+					error_msg_and_die("input filename specified more than once");
+				}
+				in_fd = open(optarg, O_RDONLY);
+				if (in_fd == -1) {
+					perror_msg_and_die("open input file");
+				}
+				break;
+			case 'b':
+				target_endian = __BIG_ENDIAN;
+				break;
+			case 'l':
+				target_endian = __LITTLE_ENDIAN;
+				break;	
+			case 'h':
+			case '?':
+				error_msg_and_die(helptext);
+	
+			case 'v':
+				verbose = 1;
+				break;
+	
+			case 'V':
+				error_msg_and_die("revision %.*s\n",
+						(int) strlen(revtext) - 13, revtext + 11);
+	
+			case 'e': {
+				char *next;
+				unsigned units = 0;
+				erase_block_size = strtol(optarg, &next, 0);
+				if (!erase_block_size)
+					error_msg_and_die("Unrecognisable erase size\n");
+	
+				if (*next) {
+					if (!strcmp(next, "KiB")) {
+						units = 1024;
+					} else if (!strcmp(next, "MiB")) {
+						units = 1024 * 1024;
+					} else {
+						error_msg_and_die("Unknown units in erasesize\n");
+					}
+				} else {
+					if (erase_block_size < 0x1000)
+						units = 1024;
+					else
+						units = 1;
+				}
+				erase_block_size *= units;
+	
+				/* If it's less than 8KiB, they're not allowed */
+				if (erase_block_size < 0x2000) {
+					fprintf(stderr, "Erase size 0x%x too small. Increasing to 8KiB minimum\n",
+						erase_block_size);
+					erase_block_size = 0x2000;
+				}
+				break;
+			}
+
+			case 'n':
+				add_cleanmarkers = 0;
+				break;
+			case 'c':
+				cleanmarker_size = strtol(optarg, NULL, 0);
+			
+				if (cleanmarker_size < sizeof(cleanmarker)) {
+					error_msg_and_die("cleanmarker size must be >= 12");
+				}
+				if (cleanmarker_size >= erase_block_size) {
+					error_msg_and_die("cleanmarker size must be < eraseblock size");
+				}
+				
+				use_input_cleanmarker_size = 0;
+				found_cleanmarkers = 1;
+				setup_cleanmarker();
+				
+				break;
+			
+		}
+	}
+}
+
+
+void init_buffers() {
+	
+	data_buffer = malloc(erase_block_size);
+	
+	if (!data_buffer) {
+		perror("out of memory");
+		close (in_fd);
+		close (out_fd);
+		exit(1);
+	}
+		
+	file_buffer = malloc(erase_block_size);
+	
+	if (!file_buffer) {
+		perror("out of memory");
+		close (in_fd);
+		close (out_fd);
+		exit(1);
+	}
+}
+
+void init_sumlist(){
+	
+	sum_collected = (struct jffs2_sum_info *) malloc (sizeof(struct jffs2_sum_info));
+	
+	if (!sum_collected)
+		error_msg_and_die("Can't allocate memory for jffs2_sum_info!\n");
+	
+	sum_collected->sum_list = NULL;
+	sum_collected->sum_num = 0;
+	sum_collected->sum_size = 0; 
+
+}
+
+void clean_buffers() {
+	
+	if (data_buffer) 
+		free(data_buffer);
+	if (file_buffer)
+		free(file_buffer);
+}
+
+void clean_sumlist() {
+	
+	union jffs2_sum_mem *temp;
+	
+	if(sum_collected){
+		
+		while(sum_collected->sum_list){
+			temp = sum_collected->sum_list;
+			sum_collected->sum_list = sum_collected->sum_list->u.next;
+			free(temp);
+			sum_collected->sum_num--;
+		}
+		
+		if(sum_collected->sum_num != 0)
+			printf("Ooops, something wrong happened! sum_num != 0, but sum_list = null ???");
+		
+		free(sum_collected);
+	}	
+}
+
+int load_next_block() {
+	
+	int ret;
+	ret = read(in_fd, file_buffer, erase_block_size);
+	file_ofs = 0;
+	
+	if(verbose)
+		printf("Load next block : %d bytes read\n",ret);
+	
+	return ret;
+}
+
+void write_buff_to_file() {
+	
+	int ret;
+	int len = erase_block_size;
+	uint8_t *buf = NULL;
+	
+	buf = data_buffer;
+	while (len > 0) {
+		ret = write(out_fd, buf, len);
+	
+		if (ret < 0)
+			perror_msg_and_die("write");
+
+		if (ret == 0)
+			perror_msg_and_die("write returned zero");
+	
+		len -= ret;
+		buf += ret;
+	}
+	
+	data_ofs = 0;
+}
+
+void dump_sum_records() {
+	
+    struct jffs2_summary_node isum;
+    union jffs2_sum_mem *temp;
+	jint32_t offset;
+	jint32_t *wpage;
+	uint8_t *tempptr;
+	int datasize;
+	int infosize;
+	int padsize;
+	jint32_t magic = cpu_to_je32(JFFS2_SUM_MAGIC);
+	
+	if (!sum_collected->sum_num || !sum_collected->sum_list) 
+		return; 
+	
+	datasize = sum_collected->sum_size + sizeof(struct jffs2_sum_marker);
+	infosize = sizeof(struct jffs2_summary_node) + datasize;
+	padsize = erase_block_size - data_ofs - infosize;
+	infosize += padsize; datasize += padsize;
+	offset = cpu_to_je32(data_ofs);
+	
+	jint32_t *tpage = (jint32_t *) malloc(datasize);
+	
+	if(!tpage)
+		error_msg_and_die("Can't allocate memory to dump summary information!\n");
+	
+	memset(tpage, 0xff, datasize);
+	memset(&isum, 0, sizeof(isum));
+	
+	isum.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	isum.nodetype = cpu_to_je16(JFFS2_NODETYPE_SUMMARY);
+	isum.totlen = cpu_to_je32(infosize);
+	isum.hdr_crc = cpu_to_je32(crc32(0, &isum, sizeof(struct jffs2_unknown_node) - 4));
+        isum.padded = cpu_to_je32(0);
+		
+	if (add_cleanmarkers && found_cleanmarkers) {
+		isum.cln_mkr = cpu_to_je32(cleanmarker_size);	
+	}
+	else{
+		isum.cln_mkr = cpu_to_je32(0);
+	}
+	
+	isum.sum_num = cpu_to_je16(sum_collected->sum_num);
+	wpage = tpage;
+	
+		
+	while (sum_collected->sum_num) {
+		
+
+		switch(je16_to_cpu(sum_collected->sum_list->u.nodetype)){
+			
+			case JFFS2_NODETYPE_INODE : {
+				jint16_t *temp16ptr = (jint16_t *)wpage;
+				
+				*(temp16ptr++) = sum_collected->sum_list->i.nodetype;
+				wpage = (jint32_t *) temp16ptr;
+				
+				*(wpage++) = sum_collected->sum_list->i.inode;
+				*(wpage++) = sum_collected->sum_list->i.version;
+				*(wpage++) = sum_collected->sum_list->i.offset;
+				*(wpage++) = sum_collected->sum_list->i.totlen;
+				break;
+			}
+			
+			case JFFS2_NODETYPE_DIRENT : {
+				jint16_t *temp16ptr = (jint16_t *) wpage;
+				uint8_t *temp8ptr = NULL;
+				
+				*(temp16ptr++) = sum_collected->sum_list->d.nodetype;
+				wpage = (jint32_t *) temp16ptr;
+				
+				*(wpage++) = sum_collected->sum_list->d.totlen;
+				*(wpage++) = sum_collected->sum_list->d.offset;
+				*(wpage++) = sum_collected->sum_list->d.pino;
+				*(wpage++) = sum_collected->sum_list->d.version;
+				*(wpage++) = sum_collected->sum_list->d.ino;
+				
+				temp8ptr = (uint8_t *) wpage;
+				*(temp8ptr++) = sum_collected->sum_list->d.nsize;
+				*(temp8ptr++) = sum_collected->sum_list->d.type;
+				
+				memcpy(temp8ptr,sum_collected->sum_list->d.name,sum_collected->sum_list->d.nsize);
+				temp8ptr += sum_collected->sum_list->d.nsize;
+				wpage = (jint32_t *) temp8ptr;
+				
+				break;
+			}
+			
+			default : {
+				printf("This is not good for me!!!!\n");
+			}
+		}
+		
+		temp = sum_collected->sum_list;
+		sum_collected->sum_list = sum_collected->sum_list->u.next;
+		free(temp);
+		
+		sum_collected->sum_num--;
+	}
+	
+	sum_collected->sum_size = 0;
+	
+	tempptr = (uint8_t *) wpage;
+	tempptr += padsize;
+	wpage = (jint32_t *) tempptr;
+	
+	*(wpage++) = offset;
+	*(wpage++) = cpu_to_je32(erase_block_size);
+	*(wpage++) = magic;
+	isum.sum_crc = cpu_to_je32(crc32(0, tpage, datasize));
+	isum.node_crc = cpu_to_je32(crc32(0, &isum, sizeof(isum) - 8));
+	
+	full_write(data_buffer + data_ofs, &isum, sizeof(isum));
+	full_write(data_buffer + data_ofs, tpage, datasize);
+	
+	free(tpage);
+
+}
+
+static void full_write(void *target_buff, const void *buf, int len) {
+	
+	memcpy(target_buff, buf, len);
+	data_ofs += len;
+}
+
+static void pad(int req) {
+	while (req) {
+		if (req > sizeof(ffbuf)) {
+			full_write(data_buffer + data_ofs, ffbuf, sizeof(ffbuf));
+			req -= sizeof(ffbuf);
+		} else {
+			full_write(data_buffer + data_ofs, ffbuf, req);
+			req = 0;
+		}
+	}
+} 
+
+static inline void padword() {
+	
+	if (data_ofs % 4) {
+		full_write(data_buffer + data_ofs, ffbuf, 4 - (data_ofs % 4));
+	}
+} 
+
+
+static inline void pad_block_if_less_than(int req,int plus) {
+	
+    int datasize = req + plus + sum_collected->sum_size + sizeof(struct jffs2_summary_node) + 8;
+    datasize += (4 - (datasize % 4)) % 4;
+	
+    if (data_ofs + req > erase_block_size - datasize) {
+        dump_sum_records();
+		write_buff_to_file();
+    }
+		
+	if (add_cleanmarkers && found_cleanmarkers) {
+		if (!data_ofs) {
+			full_write(data_buffer, &cleanmarker, sizeof(cleanmarker));
+			pad(cleanmarker_size - sizeof(cleanmarker));
+			padword();
+		}
+	}
+}
+
+void flush_buffers() {
+	
+	if ((add_cleanmarkers == 1) && (found_cleanmarkers == 1)) { /* CLEANMARKER */
+		if (data_ofs != cleanmarker_size) {	/* INODE BUFFER */
+			
+		    int datasize = sum_collected->sum_size + sizeof(struct jffs2_summary_node) + 8;
+		    datasize += (4 - (datasize % 4)) % 4;
+			
+			/* If we have a full inode buffer, then write out inode and summary data  */
+		    if (data_ofs + sizeof(struct jffs2_raw_inode) + 2*JFFS2_MIN_DATA_LEN > erase_block_size - datasize) {
+		        dump_sum_records();
+				write_buff_to_file();
+		    }
+			/* else just write out inode data */
+			else{
+				pad(erase_block_size - data_ofs);
+				write_buff_to_file();
+			}
+		}
+	}
+	else { /* NO CLEANMARKER */
+		if (data_ofs != 0) { /* INODE BUFFER */
+			
+		    int datasize = sum_collected->sum_size + sizeof(struct jffs2_summary_node) + 8;
+		    datasize += (4 - (datasize % 4)) % 4;
+			
+			/* If we have a full inode buffer, then write out inode and summary data */
+		    if (data_ofs + sizeof(struct jffs2_raw_inode) + 2*JFFS2_MIN_DATA_LEN > erase_block_size - datasize) {
+		        dump_sum_records();
+				write_buff_to_file();
+		    }
+			/* Else just write out inode data */
+			else{
+				pad(erase_block_size - data_ofs);
+				write_buff_to_file();
+			}
+		}
+	}
+}
+
+int add_sum_mem(union jffs2_sum_mem *item) {
+	
+	union jffs2_sum_mem *walk;
+	
+	if (!sum_collected->sum_list) {
+		sum_collected->sum_list = (union jffs2_sum_mem *) item;
+	} 
+	else {
+		walk = sum_collected->sum_list;
+		
+		while (walk->u.next) {
+			walk = walk->u.next;
+		}
+		walk->u.next = (union jffs2_sum_mem *) item;
+	}
+	switch (je16_to_cpu(item->u.nodetype)) {
+    	case JFFS2_NODETYPE_INODE:
+			sum_collected->sum_size += JFFS2_SUMMARY_INODE_SIZE;
+			sum_collected->sum_num++;
+			break;
+		
+    	case JFFS2_NODETYPE_DIRENT:
+			sum_collected->sum_size += JFFS2_SUMMARY_DIRENT_SIZE(item->d.nsize);
+			sum_collected->sum_num++;
+			break;
+		
+	    default:
+			error_msg_and_die("__jffs2_add_sum_mem(): UNKNOWN node type %d\n", je16_to_cpu(item->u.nodetype));
+	}
+	return 0;
+}
+
+void add_sum_inode_mem(union jffs2_node_union *node) {
+	
+	struct jffs2_sum_inode_mem *temp = (struct jffs2_sum_inode_mem *) malloc(sizeof(struct jffs2_sum_inode_mem));
+	
+	if (!temp)
+		error_msg_and_die("Can't allocate memory for summary information!\n");
+	
+	temp->nodetype = node->i.nodetype;
+	temp->inode = node->i.ino;
+	temp->version = node->i.version;
+	temp->offset = cpu_to_je32(data_ofs); 
+	temp->totlen = node->i.totlen;
+	temp->next = NULL;
+
+	add_sum_mem((union jffs2_sum_mem *) temp);
+	
+}
+
+void add_sum_dirent_mem(union jffs2_node_union *node) {
+	
+	struct jffs2_sum_dirent_mem *temp = (struct jffs2_sum_dirent_mem *) 
+			malloc(sizeof(struct jffs2_sum_dirent_mem) + node->d.nsize);
+	
+	if (!temp)
+		error_msg_and_die("Can't allocate memory for summary information!\n");
+	
+	temp->nodetype = node->d.nodetype;
+	temp->totlen = node->d.totlen;
+	temp->offset = cpu_to_je32(data_ofs);
+	temp->pino = node->d.pino;
+	temp->version = node->d.version;
+	temp->ino = node->d.ino;
+	temp->nsize = node->d.nsize;
+	temp->type = node->d.type;
+	temp->next = NULL;
+	
+	memcpy(temp->name,node->d.name,node->d.nsize);
+
+	add_sum_mem((union jffs2_sum_mem *) temp);
+	
+}
+
+void write_dirent_to_buff(union jffs2_node_union *node) {
+	
+	pad_block_if_less_than(je32_to_cpu (node->d.totlen),JFFS2_SUMMARY_DIRENT_SIZE(node->d.nsize));
+	add_sum_dirent_mem(node);
+	full_write(data_buffer + data_ofs, &(node->d), je32_to_cpu (node->d.totlen));
+	padword();	
+}
+
+
+void write_inode_to_buff(union jffs2_node_union *node) {
+	
+	pad_block_if_less_than(je32_to_cpu (node->i.totlen),JFFS2_SUMMARY_INODE_SIZE);  
+	add_sum_inode_mem(node);	/* Add inode summary mem to summary list */
+	full_write(data_buffer + data_ofs, &(node->i), je32_to_cpu (node->i.totlen));	/* Write out the inode to inode_buffer */
+	padword();
+	
+}
+
+
+void create_summed_image(int inp_size) {
+	uint8_t		*p = file_buffer;
+	union jffs2_node_union 	*node;
+	uint32_t	crc;
+	uint16_t	type;
+	int		bitchbitmask = 0;
+	int		obsolete;
+	
+	char	name[256];
+	
+	while ( p < (file_buffer + inp_size)) {
+		
+		node = (union jffs2_node_union *) p;
+		
+		/* Skip empty space */
+		if (je16_to_cpu (node->u.magic) == 0xFFFF && je16_to_cpu (node->u.nodetype) == 0xFFFF) {
+			p += 4;
+			continue;
+		}
+		
+		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
+			if (!bitchbitmask++)
+    			    printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+			p += 4;
+			continue;
+		}
+		
+		bitchbitmask = 0;
+		
+		type = je16_to_cpu(node->u.nodetype);
+		if ((type & JFFS2_NODE_ACCURATE) != JFFS2_NODE_ACCURATE) {
+			obsolete = 1;
+			type |= JFFS2_NODE_ACCURATE;
+		} else
+			obsolete = 0;
+		
+		node->u.nodetype = cpu_to_je16(type);
+	    
+		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
+		if (crc != je32_to_cpu (node->u.hdr_crc)) {
+			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->u.hdr_crc), crc);
+			p += 4;
+			continue;
+		}
+		
+		switch(je16_to_cpu(node->u.nodetype)) {
+		
+			case JFFS2_NODETYPE_INODE:
+				if(verbose)
+					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
+						je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize), 
+						je32_to_cpu (node->i.csize), je32_to_cpu (node->i.dsize), je32_to_cpu (node->i.offset));
+	
+				crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
+				if (crc != je32_to_cpu (node->i.node_crc)) {
+					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.node_crc), crc);
+					p += PAD(je32_to_cpu (node->i.totlen));
+					continue;
+				}
+				
+				crc = crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
+				if (crc != je32_to_cpu(node->i.data_crc)) {
+					printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->i.data_crc), crc);
+					p += PAD(je32_to_cpu (node->i.totlen));
+					continue;
+				}
+				
+				write_inode_to_buff(node);
+				
+				p += PAD(je32_to_cpu (node->i.totlen));
+				break;
+				
+			case JFFS2_NODETYPE_DIRENT:
+				memcpy (name, node->d.name, node->d.nsize);
+				name [node->d.nsize] = 0x0;
+			
+				if(verbose)
+					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
+						je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino), 
+						node->d.nsize, name);
+	
+				crc = crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
+				if (crc != je32_to_cpu (node->d.node_crc)) {
+					printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.node_crc), crc);
+					p += PAD(je32_to_cpu (node->d.totlen));
+					continue;
+				}
+				
+				crc = crc32(0, p + sizeof (struct jffs2_raw_dirent), node->d.nsize);
+				if (crc != je32_to_cpu(node->d.name_crc)) {
+					printf ("Wrong name_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - file_buffer, je32_to_cpu (node->d.name_crc), crc);
+					p += PAD(je32_to_cpu (node->d.totlen));
+					continue;
+				}
+	
+				write_dirent_to_buff(node);
+				
+				p += PAD(je32_to_cpu (node->d.totlen));						
+				break;
+		
+			case JFFS2_NODETYPE_CLEANMARKER:
+				if (verbose) {
+					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}
+				
+				if(!found_cleanmarkers){
+					found_cleanmarkers = 1;
+					
+					if(add_cleanmarkers == 1 && use_input_cleanmarker_size == 1){
+						cleanmarker_size = je32_to_cpu (node->u.totlen);
+						setup_cleanmarker();
+					}
+				}			
+				
+				p += PAD(je32_to_cpu (node->u.totlen));						
+				break;
+		
+			case JFFS2_NODETYPE_PADDING:
+				if (verbose) {
+					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}		
+				p += PAD(je32_to_cpu (node->u.totlen));						
+				break;
+				
+			case 0xffff:
+				p += 4;
+				break;
+				
+			default:	
+				if (verbose) {
+					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}
+				
+				//write_unknown_to_buff(node);
+				
+				p += PAD(je32_to_cpu (node->u.totlen));						
+		}	
+	}
+}
+
+int main(int argc, char **argv) {
+	
+	int ret;
+	
+	process_options(argc,argv);
+	
+	if ((in_fd == -1) || (out_fd == -1))	{
+		
+		if(in_fd != -1)
+			close(in_fd);
+		if(out_fd != -1)
+			close(out_fd);
+		
+		error_msg_and_die("You must specify input and output files!\n");
+	}
+	
+	init_buffers();
+	init_sumlist();
+	
+	while ((ret = load_next_block())) {
+		create_summed_image(ret);	
+	}
+
+	flush_buffers();
+	clean_buffers();
+	clean_sumlist();
+	
+	if (in_fd != -1)
+		close(in_fd);
+	if (out_fd != -1)
+		close(out_fd);
+	
+	return 0;
+}

--------------080208060307020202000002--
