Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIrz0-000170-6w
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 14:09:21 -0400
Message-ID: <43344342.8030303@mw-itcon.de>
Date: Fri, 23 Sep 2005 20:02:42 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [PATCH] fix for mtd partitions for erase_size != 2^X
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here a trivial patch,
which allows correct creation of mtd partitions, which have erase sizes
which are not a power of 2.

Best regards
Peter

Sorry, I didn't succeed to get the patch accepted by the mailing list as
attachment.

--- drivers/mtd/mtdpart.c.orig    2005-09-23 09:28:07.000000000 +0200
+++ drivers/mtd/mtdpart.c    2005-09-23 09:29:37.000000000 +0200
@@ -465,9 +465,9 @@
          if (slave->offset == MTDPART_OFS_APPEND)
              slave->offset = cur_offset;
          if (slave->offset == MTDPART_OFS_NXTBLK) {
-            u_int32_t emask = master->erasesize-1;
-            slave->offset = (cur_offset + emask) & ~emask;
-            if (slave->offset != cur_offset) {
+            slave->offset = cur_offset;
+            if ((cur_offset % master->erasesize) != 0) {
+                slave->offset = ((cur_offset / master->erasesize) + 1) 
* master->erasesize;
                  printk(KERN_NOTICE "Moving partition %d: "
                         "0x%08x -> 0x%08x\n", i,
                         cur_offset, slave->offset);
