Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EzxpG-0005u0-0j
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2006 10:05:23 -0500
Message-ID: <43D0FC08.1010700@intel.com>
Date: Fri, 20 Jan 2006 18:04:40 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>, linux-mtd@lists.infradead.org
References: <43C783D9.1030700@inf.u-szeged.hu>
In-Reply-To: <43C783D9.1030700@inf.u-szeged.hu>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] JFFS2 kernel panics fixup on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I verified the latest CVS snapshot, it looks like it doesn't contain all 
neccessary fixes for Sibley.
I found why it happens,  after several replies of this message a part of 
the fix has been cut. So the only part of fixes has been posted.
At present time JFFS2 of the latest snapshot falls to the kernel panic 
on Sibley and has some issues on NAND.

Kernel panic message on Sibley

flash1: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
Write of 2556 bytes at 0x00000018 failed. returned -22, retlen 0
Not marking the space at 0x00000018 as dirty because the flash driver 
returned retlen zero
flash1: buffer write error (status 0x190)
jffs2_flush_wbuf(): Write failed with -22
Write of 2556 bytes at 0x00040030 failed. returned -22, retlen 0
Not marking the space at 0x00040030 as dirty because the flash driver 
returned retlen zero
jffs2_flash_writev(): Non-contiguous write to 0008008c
wbuf was previously 00080018-000800a4
kernel BUG at fs/jffs2/wbuf.c:675!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c3a0c000
[00000000] *pgd=a3a1c031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in:
CPU: 0
PC is at __bug+0x40/0x54
LR is at 0x1
pc : [<c0023ab4>]    lr : [<00000001>]    Not tainted
sp : c3813d60  ip : 60000093  fp : c3813d70
r10: c02c37b8  r9 : ffffffff  r8 : 00000000
r7 : 0008008c  r6 : c3894000  r5 : 0000008c  r4 : 00000000
r3 : 00000000  r2 : 00000000  r1 : 00008d3e  r0 : 00000001
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: 397F  Table: A3A0C000  DAC: 00000015
Process cp (pid: 773, stack limit = 0xc38121a4)
Stack: (0xc3813d60 to 0xc3814000)
3d60: 00000000 c3813dec c3813d74 c00c9954 c0023a80 00000000 00000001 
c3813e04
..........
3fe0: 00000000 bec7b600 0005f33c 000df2c4 60000010 002763c8 fdb6ffff 
bfffffff
Backtrace:                                                      
[<c0023a74>] (__bug+0x0/0x54) from [<c00c9954>] 
(jffs2_flash_writev+0x244/0x660)
 r4 = 00000000
[<c00c9714>] (jffs2_flash_writev+0x4/0x660) from [<c00c030c>] 
(jffs2_write_dnode+0x20c/0x4b8)
[<c00c0100>] (jffs2_write_dnode+0x0/0x4b8) from [<c00c6e64>] 
(jffs2_do_setattr+0x534/0x78c)
[<c00c6930>] (jffs2_do_setattr+0x0/0x78c) from [<c00c70d0>] 
(jffs2_setattr+0x14/0x18)
[<c00c70bc>] (jffs2_setattr+0x0/0x18) from [<c008d528>] 
(notify_change+0x13c/0x220)
[<c008d3ec>] (notify_change+0x0/0x220) from [<c006fd78>] 
(chown_common+0xc4/0xf8)
[<c006fcb4>] (chown_common+0x0/0xf8) from [<c006fdf0>] (sys_chown+0x44/0x58)
 r5 = 00000000  r4 = 00000000
[<c006fdac>] (sys_chown+0x0/0x58) from [<c001dcc0>] 
(ret_fast_syscall+0x0/0x2c)
 r7 = 000000D4  r6 = 00000003  r5 = 002763C8  r4 = 00000004
Code: 1b004144 e59f0014 eb004142 e3a03000 (e5833000)
 Segmentation fault


NAND issues:

If you try to do the following operations on NAND device:
mount -t jffs2 /dev/mtdblock9 /mnt
umount /mnt
mount -t jffs2 /dev/mtdblock9 /mnt
The following message will be returned:

mount -t jffs2 /dev/mtdblock9 /mnt
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 256
mount: Mounting /dev/mtdblock9 on /mnt failed: Input/output error


I prepared and verified the patch one more time. Applying the patch 
below fixes these issues.
If nobody complains, would somebody please put fixes below into MTD 
repository.

Thanks a lot,
Alexey


======================================================
diff -uNr a/fs/jffs2/erase.c b/fs/jffs2/erase.c
--- a/fs/jffs2/erase.c    2005-12-22 15:06:38.000000000 +0300
+++ b/fs/jffs2/erase.c    2005-12-22 15:05:24.000000000 +0300
@@ -391,7 +391,7 @@
         struct jffs2_raw_ebh ebh = {
             .magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
             .nodetype =     cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
-            .totlen =       cpu_to_je32(sizeof(struct jffs2_raw_ebh)),
+            .totlen =       cpu_to_je32(c->ebh_size),
             .reserved =     0,
             .compat_fset =  JFFS2_EBH_COMPAT_FSET,
             .incompat_fset = JFFS2_EBH_INCOMPAT_FSET,
diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c    2005-12-22 15:06:38.000000000 +0300
+++ b/fs/jffs2/wbuf.c    2005-12-22 15:05:24.000000000 +0300
@@ -583,6 +583,9 @@
         down(&c->alloc_sem);
     }
 
+#ifdef CONFIG_JFFS2_FORCED_BUFFER_FLUSH
+    jffs2_flush_wbuf_pad(c);
+#endif
     D1(printk(KERN_DEBUG "jffs2_flush_wbuf_gc() ends...\n"));
 
     up(&c->alloc_sem);
@@ -635,7 +638,7 @@
     /* Fixup the wbuf if we are moving to a new eraseblock.  The checks 
below
        fail for ECC'd NOR because cleanmarker == 16, so a block starts at
        xxx0010.  */
-    if (jffs2_nor_ecc(c)) {
+    if (jffs2_nor_ecc(c) || jffs2_nor_wbuf_flash(c)) {
         if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
             c->wbuf_ofs = PAGE_DIV(to);
             c->wbuf_len = PAGE_MOD(to);
@@ -997,7 +1000,7 @@
     uint32_t oob_nr, total_len;
     unsigned char *buf;
     int ret;
-    struct jffs2_unknown_node *n;
+    struct jffs2_unknown_node *n, un;
     struct jffs2_raw_ebh eh;
     uint32_t read_in = 0, i = 0, copy_len, node_crc;
 
@@ -1028,7 +1031,16 @@
         goto out;
     }
 
-    n = (struct jffs2_unknown_node *) &buf[c->fsdata_pos];
+    i = 0;
+    read_in = 0;
+    while (read_in < sizeof(struct jffs2_unknown_node)) {
+        copy_len = min_t(uint32_t, c->fsdata_len, sizeof(struct 
jffs2_unknown_node) - read_in);
+        memcpy((unsigned char *)&un + read_in, &buf[oob_size*i + 
c->fsdata_pos], copy_len);
+        read_in += copy_len;
+        i++;
+    }
+    n = &un;
+
     if (je16_to_cpu(n->magic) != JFFS2_MAGIC_BITMASK) {
         D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker_ebh(): 
Cleanmarker node not detected in block at %08x\n", jeb->offset));
         ret = 1;
@@ -1045,6 +1057,8 @@
         goto out;
     }else if (je16_to_cpu(n->nodetype) == 
JFFS2_NODETYPE_ERASEBLOCK_HEADER) {
         /* Read the scattered data(in buf[]) into struct jffs2_raw_ebh */
+        i = 0;
+        read_in = 0;
         while (read_in < sizeof(struct jffs2_raw_ebh)) {
             copy_len = min_t(uint32_t, c->fsdata_len, sizeof(struct 
jffs2_raw_ebh) - read_in);
             memcpy((unsigned char *)&eh + read_in, &buf[oob_size*i + 
c->fsdata_pos], copy_len);
@@ -1052,7 +1066,7 @@
             i++;
         }
 
-        node_crc = crc32(0, &eh, sizeof(struct jffs2_raw_ebh)-8);
+        node_crc = crc32(0, &eh + sizeof(struct jffs2_unknown_node) + 
4, sizeof(struct jffs2_raw_ebh) - sizeof(struct jffs2_unknown_node) - 4);
         if (node_crc != je32_to_cpu(eh.node_crc)) {
             ret = 1;
             goto out;
