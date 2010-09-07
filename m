Received: from dakia2.marvell.com ([65.219.4.35])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OsunD-0003V6-Ps
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 09:48:48 +0000
Received: from maili.marvell.com (maili.marvell.com [10.68.76.51]) by
	dakia2.marvell.com with ESMTP id HGTUBljKCRbkjOYn for
	<linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 02:48:40 -0700 (PDT)
From: Saeed Bishara <saeed@marvell.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] cmd line partitions: use 64 bit variables to detect
	partitions/offsets larger than 4G.
Date: Tue,  7 Sep 2010 12:48:38 +0300
Message-Id: <1283852918-9141-1-git-send-email-saeed@marvell.com>
In-Reply-To: <1283849765.2979.22.camel@localhost>
References: <1283849765.2979.22.camel@localhost>
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
 drivers/mtd/cmdlinepart.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 1479da6..80036d1 100644
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
@@ -304,7 +304,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
                              struct mtd_partition **pparts,
                              unsigned long origin)
 {
-	unsigned long offset;
+	unsigned long long offset;
 	int i;
 	struct cmdline_mtd_partition *part;
 	const char *mtd_id = master->name;
-- 
1.6.0.4
