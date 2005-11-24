Received: from mba.ocn.ne.jp ([210.190.142.172] helo=smtp.mba.ocn.ne.jp)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfKtx-00072B-Op
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 12:28:57 -0500
Date: Fri, 25 Nov 2005 02:28:02 +0900 (JST)
Message-Id: <20051125.022802.112626259.anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
Subject: [PATCH] [MTD] cmdlinepart: allow zero offset value
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current cmdlinepart.c uses offset value 0 to specify continuous
partition.  This prevents creating a second partition starting at 0.

For example, I can split 4MB device using "mtdparts=id:2M,2M", but I
can not do "mtdparts=id:2M@2M,2M@0".  In this case, I wanted to swap
mtd0 and mtd1 by command line.

This patch introduce special OFFSET_CONTINUOUS value for continuous
partition and allow 0 for offset value.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 6b8bb2e..123cfe0 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -43,6 +43,7 @@
 
 /* special size referring to all the remaining space in a partition */
 #define SIZE_REMAINING 0xffffffff
+#define OFFSET_CONTINUOUS 0xffffffff
 
 struct cmdline_mtd_partition {
 	struct cmdline_mtd_partition *next;
@@ -75,7 +76,7 @@ static struct mtd_partition * newpart(ch
 {
 	struct mtd_partition *parts;
 	unsigned long size;
-	unsigned long offset = 0;
+	unsigned long offset = OFFSET_CONTINUOUS;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -314,7 +315,7 @@ static int parse_cmdline_partitions(stru
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
