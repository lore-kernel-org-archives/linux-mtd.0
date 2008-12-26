Received: from an-out-0708.google.com ([209.85.132.244])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LGCrv-0006SM-0f
	for linux-mtd@lists.infradead.org; Fri, 26 Dec 2008 13:36:47 +0000
Received: by an-out-0708.google.com with SMTP id d40so1083243and.27
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Dec 2008 05:36:46 -0800 (PST)
Message-ID: <910818750812260536ke7d67e5l587c7c18a2064bd@mail.gmail.com>
Date: Fri, 26 Dec 2008 08:36:45 -0500
From: "ARXX Dev Team" <arxxdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2 32-bit access issue
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

Our board has a PowerPC core inside Xilinx Virtex II Pro FPGA. We have
a Intel Strataflash attached to the FPGA accessed via a 16-bit
interface. Since our interface to the flash part is 16-bit wide and we
do not have any chip selects or other mechanisms to prevent 32-bit
accesses to the part, some of the jffs2 scanning/erasing code fails.
Hence we had to create the patch below to use MTD layer functions (or
simple 8/16 bit access code) to correctly access the part instead of
original jffs2 code that was accessing the flash directly 32-bit wide.
We are would like your opinion as well as find out if this fix (in
some form) needs to go back into jffs2 code for parts that cannot be
accessed 32-bit wide (or need to prevent 32-bit accesses).
we sincerely appreciate your help,
dev team


================= Start of Patch ===========================
diff -Naur linux-2.6.24_old/fs/jffs2/
erase.c linux-2.6.24_new/fs/jffs2/erase.c
--- linux-2.6.24_old/fs/jffs2/erase.c   2008-01-24 17:58:37.000000000 -0500
+++ linux-2.6.24_new/fs/jffs2/erase.c   2008-12-10 18:39:34.000000000 -0500
@@ -346,7 +346,20 @@
               wordebuf = ebuf-sizeof(*wordebuf);
               retlen /= sizeof(*wordebuf);
               do {
+#ifdef CONFIG_ARXXPPC
+       unsigned short* wordebuf16;
+       unsigned long testebuf;
+
+       ++wordebuf;
+       wordebuf16 = (unsigned short*)(wordebuf);
+       testebuf = *wordebuf16 & 0x0000ffff;
+       wordebuf16++;
+       testebuf |= ((*wordebuf16 & 0x0000ffff) << 16);
+
+       if (testebuf != ~0)
+#else
                  if (*++wordebuf != ~0)
+#endif /* CONFIG_ARXXPPC */
                          break;
               } while(--retlen);
               c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
@@ -382,7 +395,20 @@
               for (i=0; i<readlen; i += sizeof(unsigned long)) {
                       /* It's OK. We know it's properly aligned */
                       unsigned long *datum = ebuf + i;
+
+#ifdef CONFIG_ARXXPPC
+      unsigned short* datum16;
+      unsigned long  testdatum;
+
+      datum16 = (unsigned short*)(ebuf + i);
+      testdatum = *datum16 & 0x0000ffff;
+      datum16++;
+      testdatum |= ((*datum16 & 0x0000ffff) << 16);
+
+      if (testdatum + 1) {
+#else
                       if (*datum + 1) {
+#endif /* CONFIG_ARXXPPC */
                               *bad_offset += i;
                               printk(KERN_WARNING "Newly-erased block
contained word 0x%lx at
offset 0x%08x\n", *datum, *bad_offset);
                               goto fail;
diff -Naur linux-2.6.24_old/fs/jffs2/scan.c linux-2.6.24_new/fs/jffs2/scan.c
--- linux-2.6.24_old/fs/jffs2/scan.c    2008-01-24 17:58:37.000000000 -0500
+++ linux-2.6.24_new/fs/jffs2/scan.c    2008-12-10 18:46:46.000000000 -0500
@@ -35,7 +35,7 @@
 static uint32_t pseudo_random;

 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb,
-                                 unsigned char *buf, uint32_t
buf_size, struct jffs2_summary *s);
+                                 unsigned char *buf, uint32_t
flash_ofs, uint32_t buf_size,
struct jffs2_summary *s);

 /* These helper functions _must_ increase ofs and also do the
dirty/used space accounting.
 * Returning an error will abort the mount - bad checksums etc.
should just mark the space
@@ -144,7 +144,7 @@
               jffs2_sum_reset_collected(s);

               ret = jffs2_scan_eraseblock(c, jeb,
buf_size?flashbuf:(flashbuf+jeb->offset),
-                                               buf_size, s);
+
buf_size?0:jeb->offset, buf_size, s);

               if (ret < 0)
                       goto out;
@@ -295,8 +295,12 @@

 int jffs2_scan_classify_jeb(struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb)
 {
+#ifdef CONFIG_ARXXPPC
+  if((jeb->used_size + jeb->unchecked_size) == PAD(c->cleanmarker_size))
+#else
       if ((jeb->used_size + jeb->unchecked_size) ==
PAD(c->cleanmarker_size) && !jeb->dirty_size
           && (!jeb->first_node || !ref_next(jeb->first_node)) )
+#endif /* CONFIG_ARXXPPC */
               return BLK_STATE_CLEANMARKER;

       /* move blocks with max 4 byte dirty space to cleanlist */
@@ -429,13 +433,15 @@
 /* Called with 'buf_size == 0' if buf is in fact a pointer _directly_ into
   the flash, XIP-style */
 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb,
-                                 unsigned char *buf, uint32_t
buf_size, struct jffs2_summary *s) {
-       struct jffs2_unknown_node *node;
+                                 unsigned char *buf, uint32_t
flash_ofs, uint32_t buf_size,
struct jffs2_summary *s) {
+       struct jffs2_unknown_node nodebuffer;
+  struct jffs2_unknown_node *node = &nodebuffer;
       struct jffs2_unknown_node crcnode;
       uint32_t ofs, prevofs;
       uint32_t hdr_crc, buf_ofs, buf_len;
       int err;
       int noise = 0;
+  struct jffs2_unknown_node *nodeptr;


 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
@@ -631,7 +637,16 @@
                       buf_ofs = ofs;
               }

-               node = (struct jffs2_unknown_node *)&buf[ofs-buf_ofs];
+    nodeptr = (struct jffs2_unknown_node *)&buf[ofs-buf_ofs];
+    err = jffs2_fill_scan_buf(c, &nodebuffer,
+                              flash_ofs + ofs - buf_ofs,
+                              sizeof(nodebuffer));
+    if(err)
+    {
+      printk("%s:%d error reading flash[%d]\n", __FUNCTION__, __LINE__, err);
+      return err;
+    }
+

               if (*(uint32_t *)(&buf[ofs-buf_ofs]) == 0xffffffff) {
                       uint32_t inbuf_ofs;
@@ -773,7 +788,7 @@
                               buf_ofs = ofs;
                               node = (void *)buf;
                       }
-                       err = jffs2_scan_inode_node(c, jeb, (void
*)node, ofs, s);
+                       err = jffs2_scan_inode_node(c, jeb, (void
*)nodeptr, ofs, s);
                       if (err) return err;
                       ofs += PAD(je32_to_cpu(node->totlen));
                       break;
@@ -789,7 +804,7 @@
                               buf_ofs = ofs;
                               node = (void *)buf;
                       }
-                       err = jffs2_scan_dirent_node(c, jeb, (void
*)node, ofs, s);
+                       err = jffs2_scan_dirent_node(c, jeb, (void
*)nodeptr, ofs, s);
                       if (err) return err;
                       ofs += PAD(je32_to_cpu(node->totlen));
                       break;
@@ -945,10 +960,22 @@
 }

 static int jffs2_scan_inode_node(struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb,
-                                struct jffs2_raw_inode *ri, uint32_t
ofs, struct jffs2_summary *s)
+                                struct jffs2_raw_inode *ri_unused,
uint32_t ofs, struct jffs2_summary *s)
 {
       struct jffs2_inode_cache *ic;
-       uint32_t crc, ino = je32_to_cpu(ri->ino);
+       uint32_t crc, ino;
+  struct jffs2_raw_inode node;
+  struct jffs2_raw_inode *ri = &node;
+  int err;
+
+  err = jffs2_fill_scan_buf(c, ri, ofs, sizeof(struct jffs2_raw_inode));
+  if(err)
+  {
+    printk("%s:%d err[%d]\n", __FUNCTION__, __LINE__, err);
+    return err;
+  }
+
+  ino = je32_to_cpu(ri->ino);

       D1(printk(KERN_DEBUG "jffs2_scan_inode_node(): Node at 0x%08x\n", ofs));

@@ -1000,15 +1027,24 @@
 }

 static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb,
-                                 struct jffs2_raw_dirent *rd,
uint32_t ofs, struct jffs2_summary *s)
+                                 struct jffs2_raw_dirent *rdptr,
uint32_t ofs, struct jffs2_summary *s)
 {
       struct jffs2_full_dirent *fd;
       struct jffs2_inode_cache *ic;
       uint32_t checkedlen;
       uint32_t crc;
       int err;
+  struct jffs2_raw_dirent rdbuf;
+  struct jffs2_raw_dirent *rd = &rdbuf;

       D1(printk(KERN_DEBUG "jffs2_scan_dirent_node(): Node at 0x%08x\n", ofs));
+
+  err = jffs2_fill_scan_buf(c, &rdbuf, ofs, sizeof(rdbuf));
+  if(err)
+  {
+    printk("%s:%d error reading flash[%d]\n", __FUNCTION__, __LINE__, err);
+    return err;
+  }

       /* We don't get here unless the node is still valid, so we don't have to
          mask in the ACCURATE bit any more. */
@@ -1026,7 +1062,11 @@
       pseudo_random += je32_to_cpu(rd->version);

       /* Should never happen. Did. (OLPC trac #4184)*/
+#ifdef CONFIG_ARXXPPC
+  checkedlen = rd->nsize;
+#else
       checkedlen = strnlen(rd->name, rd->nsize);
+#endif /* CONFIG_ARXXPPC */
       if (checkedlen < rd->nsize) {
               printk(KERN_ERR "Dirent at %08x has zeroes in name. Truncating to
%d chars\n",
                      ofs, checkedlen);
@@ -1035,7 +1075,23 @@
       if (!fd) {
               return -ENOMEM;
       }
-       memcpy(&fd->name, rd->name, checkedlen);
+
+  {
+    char* src = rdptr->name;
+    char* dst = &fd->name[0];
+    int i = 0;
+    int j = 0;
+
+    while(i < checkedlen)
+    {
+      dst[i] = src[i];
+      ++i;
+
+      j = 0;
+      while(j++ < 1000);
+    }
+  }
+
       fd->name[checkedlen] = 0;

       crc = crc32(0, fd->name, rd->nsize);


=========== End of Patch ==============================
