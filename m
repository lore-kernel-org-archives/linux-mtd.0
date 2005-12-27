Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ErEYZ-0002rW-V8
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2005 13:08:01 +0000
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id jBRDKvMk012407
	for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2005 13:20:57 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005122716074916117
	for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2005 16:07:49 +0300
Message-ID: <43B13C9D.3000008@intel.com>
Date: Tue, 27 Dec 2005 16:07:41 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Belyakov@petasus.ims.intel.com, Kutergin@petasus.ims.intel.com,
	Alexander@petasus.ims.intel.com, Timofey@petasus.ims.intel.com
Subject: [PATCH] JFFS2 kernel panics fixup on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
 
We faced kernel panics on platforms with Sibley NOR chip. It is mostly 
concerned with introducing EBH in JFFS2 code.
We made some fixes for it:
Size of EBH is configured incorrectly for chips with programming 
regions. It should be equal page size. Write buffer offsets and lens 
should be page aligned.
There are several misprints in jffs2_scan_eraseblock() function with 
jffs2_flash_read_safe offsets.
Also there is incorrect OOB buffer assignment and EBH CRC check in 
jffs2_check_cleanmarker_ebh(), patch fixes mounting issues of JFFS2 we 
found on NAND devices.
 
Please find diff file below.
 
Thanks,
Alexey Korolev, Alexander Belyakov

======================================= 
 
diff -aur c/fs/jffs2/erase.c b/fs/jffs2/erase.c
--- c/fs/jffs2/erase.c 2005-12-23 16:43:09.000000000 +0300
+++ b/fs/jffs2/erase.c 2005-12-23 16:48:43.000000000 +0300
@@ -391,7 +391,7 @@
   struct jffs2_raw_ebh ebh = {
    .magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
    .nodetype =     cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
-   .totlen =       cpu_to_je32(sizeof(struct jffs2_raw_ebh)),
+   .totlen =       cpu_to_je32(c->ebh_size),
    .reserved =     0,
    .compat_fset =  JFFS2_EBH_COMPAT_FSET,
    .incompat_fset = JFFS2_EBH_INCOMPAT_FSET,
diff -aur c/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
--- c/fs/jffs2/nodelist.c 2005-12-23 16:43:09.000000000 +0300
+++ b/fs/jffs2/nodelist.c 2005-12-23 16:48:43.000000000 +0300
@@ -436,7 +436,7 @@
   * adding and jffs2_flash_read_end() interface. */
  if (c->mtd->point) {
   err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
-  if (!err && retlen < tn->csize) {
+  if (!err && retlen < len) {
    JFFS2_WARNING("MTD point returned len too short: %u instead of 
%u.\n", retlen, tn->csize);
    c->mtd->unpoint(c->mtd, buffer, ofs, len);
   } else if (err)
diff -aur c/fs/jffs2/scan.c b/fs/jffs2/scan.c
--- c/fs/jffs2/scan.c 2005-12-23 16:43:09.000000000 +0300
+++ b/fs/jffs2/scan.c 2005-12-23 16:48:43.000000000 +0300
@@ -454,7 +454,7 @@
    buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
    D1(printk(KERN_DEBUG "Fewer than %zd bytes (node header) left to end 
of buf. Reading 0x%x at 0x%08x\n",
       sizeof(struct jffs2_unknown_node), buf_len, ofs));
-   err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+   err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
    if (err)
     return err;
    buf_ofs = ofs;
@@ -511,7 +511,7 @@
     break;
    }
    D1(printk(KERN_DEBUG "Reading another 0x%x at 0x%08x\n", buf_len, ofs));
-   err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+   err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
    if (err)
     return err;
    buf_ofs = ofs;
@@ -587,7 +587,7 @@
     buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - 
ofs);
     D1(printk(KERN_DEBUG "Fewer than %zd bytes (inode node) left to end 
of buf. Reading 0x%x at 0x%08x\n",
        sizeof(struct jffs2_raw_inode), buf_len, ofs));
-    err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+    err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
     if (err)
      return err;
     buf_ofs = ofs;
@@ -603,7 +603,7 @@
     buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - 
ofs);
     D1(printk(KERN_DEBUG "Fewer than %d bytes (dirent node) left to end 
of buf. Reading 0x%x at 0x%08x\n",
        je32_to_cpu(node->totlen), buf_len, ofs));
-    err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+    err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
     if (err)
      return err;
     buf_ofs = ofs;
@@ -650,7 +650,7 @@
    } else {
     if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
      buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - 
ofs);
-     err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+     err = jffs2_flash_read_safe(c, ofs, buf_len, buf);
      if (err)
       return err;
      buf_ofs = ofs;
diff -aur c/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- c/fs/jffs2/wbuf.c 2005-12-23 16:43:09.000000000 +0300
+++ b/fs/jffs2/wbuf.c 2005-12-23 16:57:50.000000000 +0300
@@ -635,7 +635,7 @@
  /* Fixup the wbuf if we are moving to a new eraseblock.  The checks below
     fail for ECC'd NOR because cleanmarker == 16, so a block starts at
     xxx0010.  */
- if (jffs2_nor_ecc(c)) {
+ if (jffs2_nor_ecc(c) || jffs2_nor_wbuf_flash(c)) {
   if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
    c->wbuf_ofs = PAGE_DIV(to);
    c->wbuf_len = PAGE_MOD(to);
@@ -997,7 +997,7 @@
  uint32_t oob_nr, total_len;
  unsigned char *buf;
  int ret;
- struct jffs2_unknown_node *n;
+ struct jffs2_unknown_node *n, un;
  struct jffs2_raw_ebh eh;
  uint32_t read_in = 0, i = 0, copy_len, node_crc;
 
@@ -1028,7 +1028,16 @@
   goto out;
  }
 
- n = (struct jffs2_unknown_node *) &buf[c->fsdata_pos];
+ i = 0;
+ read_in = 0;
+ while (read_in < sizeof(struct jffs2_unknown_node)) {
+  copy_len = min_t(uint32_t, c->fsdata_len, sizeof(struct 
jffs2_unknown_node) - read_in);
+  memcpy((unsigned char *)&un + read_in, &buf[oob_size*i + 
c->fsdata_pos], copy_len);
+  read_in += copy_len;
+  i++;
+ }
+ n = &un;
+
  if (je16_to_cpu(n->magic) != JFFS2_MAGIC_BITMASK) {
   D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker_ebh(): 
Cleanmarker node not detected in block at %08x\n", jeb->offset));
   ret = 1;
@@ -1045,6 +1054,8 @@
   goto out;
  }else if (je16_to_cpu(n->nodetype) == JFFS2_NODETYPE_ERASEBLOCK_HEADER) {
   /* Read the scattered data(in buf[]) into struct jffs2_raw_ebh */
+  i = 0;
+  read_in = 0;
   while (read_in < sizeof(struct jffs2_raw_ebh)) {
    copy_len = min_t(uint32_t, c->fsdata_len, sizeof(struct 
jffs2_raw_ebh) - read_in);
    memcpy((unsigned char *)&eh + read_in, &buf[oob_size*i + 
c->fsdata_pos], copy_len);
@@ -1052,7 +1063,7 @@
    i++;
   }
 
-  node_crc = crc32(0, &eh, sizeof(struct jffs2_raw_ebh)-8);
+  node_crc = crc32(0, &eh + sizeof(struct jffs2_unknown_node) + 4, 
sizeof(struct jffs2_raw_ebh) - sizeof(struct jffs2_unknown_node) - 4);
   if (node_crc != je32_to_cpu(eh.node_crc)) {
    ret = 1;
    goto out;
