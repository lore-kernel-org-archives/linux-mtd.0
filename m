Received: from dakia2.marvell.com ([65.219.4.35])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsDJc-0000o8-6n
	for linux-mtd@lists.infradead.org; Sun, 05 Sep 2010 11:23:16 +0000
Received: from maili.marvell.com (maili.marvell.com [10.68.76.51]) by
	dakia2.marvell.com with ESMTP id tz75EfLAJuTxm8ZR for
	<linux-mtd@lists.infradead.org>;
	Sun, 05 Sep 2010 04:23:12 -0700 (PDT)
From: Saeed Bishara <saeed@marvell.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] cmd line partitions: use 64 bit variables to detect
	partitions/offsets larger than 4G.
Date: Sun,  5 Sep 2010 14:23:10 +0300
Message-Id: <1283685790-8619-1-git-send-email-saeed@marvell.com>
Cc: Saeed Bishara <saeed@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Saeed Bishara <saeed@marvell.com>
---
 drivers/mtd/cmdlinepart.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 1479da6..ae56c23 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -41,8 +41,8 @@
 
 
 /* special size referring to all the remaining space in a partition */
-#define SIZE_REMAINING UINT_MAX
-#define OFFSET_CONTINUOUS UINT_MAX
+#define SIZE_REMAINING LLONG_MAX
+#define OFFSET_CONTINUOUS LLONG_MAX
 
 struct cmdline_mtd_partition {
 	struct cmdline_mtd_partition *next;
@@ -74,8 +74,8 @@ static struct mtd_partition * newpart(char *s,
                                       int extra_mem_size)
 {
 	struct mtd_partition *parts;
-	unsigned long size;
-	unsigned long offset = OFFSET_CONTINUOUS;
+	unsigned long long size;
+	unsigned long long offset = OFFSET_CONTINUOUS;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -93,7 +93,7 @@ static struct mtd_partition * newpart(char *s,
 		size = memparse(s, &s);
 		if (size < PAGE_SIZE)
 		{
-			printk(KERN_ERR ERRP "partition size too small (%lx)\n", size);
+			printk(KERN_ERR ERRP "partition size too small (%llx)\n", size);
 			return NULL;
 		}
 	}
-- 
1.6.0.4
