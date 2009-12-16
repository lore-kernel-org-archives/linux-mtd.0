Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKuUF-0003rO-P1
	for linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 14:04:24 +0000
Received: by ewy21 with SMTP id 21so1302710ewy.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Dec 2009 06:04:18 -0800 (PST)
From: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix mtd readtest, speedtest and stresstest for NOR devices
Date: Wed, 16 Dec 2009 15:04:06 +0100
Message-Id: <1260972246-15345-1-git-send-email-mts@doredevelopment.dk>
Cc: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>

Ignore previous patch. mtd->writesize is 1 for NOR devices, use pgsize as it will be 512 for NOR devices and writesize if writesize != 1. 

Signed-off-by: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
---
 drivers/mtd/tests/mtd_readtest.c   |    2 +-
 drivers/mtd/tests/mtd_speedtest.c  |    2 +-
 drivers/mtd/tests/mtd_stresstest.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 402137f..25c5dd0 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -188,7 +188,7 @@ static int __init mtd_readtest_init(void)
 	tmp = mtd->size;
 	do_div(tmp, mtd->erasesize);
 	ebcnt = tmp;
-	pgcnt = mtd->erasesize / mtd->writesize;
+	pgcnt = mtd->erasesize / pgsize;
 
 	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index c5bb159..2c1c625 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -344,7 +344,7 @@ static int __init mtd_speedtest_init(void)
 	tmp = mtd->size;
 	do_div(tmp, mtd->erasesize);
 	ebcnt = tmp;
-	pgcnt = mtd->erasesize / mtd->writesize;
+	pgcnt = mtd->erasesize / pgsize;
 
 	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 48672f7..a99d3cd 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -269,7 +269,7 @@ static int __init mtd_stresstest_init(void)
 	tmp = mtd->size;
 	do_div(tmp, mtd->erasesize);
 	ebcnt = tmp;
-	pgcnt = mtd->erasesize / mtd->writesize;
+	pgcnt = mtd->erasesize / pgsize;
 
 	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
-- 
1.5.4.3
