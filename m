Received: from mba.ocn.ne.jp ([210.190.142.172] helo=smtp.mba.ocn.ne.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9Py4-0007DN-OW
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 15:16:09 +0100
Received: from localhost (p0749-ip01funabasi.chiba.ocn.ne.jp [61.119.147.241])
	by smtp.mba.ocn.ne.jp (Postfix) with ESMTP id E238D522D
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Oct 2003 23:14:57 +0900 (JST)
Date: Tue, 14 Oct 2003 23:31:56 +0900 (JST)
Message-Id: <20031014.233156.07647021.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [PATCH] cmdlinepart with zero offset value
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I sent this patch about two month ago but no response.  I will try
again.

I found that cmdlinepart.c can not handle zero offset value correctly
(ex. "mtdparts=id:2M@2M,2M@0").

This is a patch to fix it.  Also I removed including asm/setup.h since
some archs do not have it.  Please review my patch and apply if no
problem.  Thank you.

--- mtd-20030811/drivers/mtd/cmdlinepart.c	Fri May 30 07:00:05 2003
+++ mtd/drivers/mtd/cmdlinepart.c	Tue Aug 12 16:35:43 2003
@@ -29,7 +29,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/compatmac.h>
-#include <asm/setup.h>
 #include <linux/bootmem.h>
 
 /* error message prefix */
@@ -45,6 +44,7 @@
 
 /* special size referring to all the remaining space in a partition */
 #define SIZE_REMAINING 0xffffffff
+#define OFFSET_CONTINUOUS 0xffffffff
 
 struct cmdline_mtd_partition {
 	struct cmdline_mtd_partition *next;
@@ -77,7 +77,7 @@
 {
 	struct mtd_partition *parts;
 	unsigned long size;
-	unsigned long offset = 0;
+	unsigned long offset = OFFSET_CONTINUOUS;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -312,7 +312,7 @@
 		{
 			for(i = 0, offset = 0; i < part->num_parts; i++)
 			{
-				if (!part->parts[i].offset)
+				if (part->parts[i].offset == OFFSET_CONTINUOUS)
 				  part->parts[i].offset = offset;
 				else
 				  offset = part->parts[i].offset;
---
Atsushi Nemoto
