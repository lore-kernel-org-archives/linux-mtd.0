Received: from topsns.toshiba-tops.co.jp ([202.230.225.5])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19mTwC-0006Ed-JS
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2003 08:51:25 +0100
Received: from localhost (fragile [172.17.28.65])h7C7ocDV006107
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Aug 2003 16:50:38 +0900 (JST)
	(envelope-from anemo@mba.ocn.ne.jp)
Date: Tue, 12 Aug 2003 16:52:12 +0900 (JST)
Message-Id: <20030812.165212.25480742.nemoto@toshiba-tops.co.jp>
To: linux-mtd@lists.infradead.org
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: cmdlinepart with zero offset value
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found that cmdlinepart.c can not handle zero offset value correctly
(ex. "mtdparts=id:2M@2M,2M@0").

This is a patch to fix it.  Also I removed including asm/setup.h since
some archs does not have it.  Please apply.

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
