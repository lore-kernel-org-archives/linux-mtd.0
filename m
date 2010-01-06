Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSSVA-0005Pb-9y
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 09:48:32 +0000
Received: by ewy21 with SMTP id 21so9675513ewy.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 01:48:26 -0800 (PST)
From: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] tests: Fix read, speed and stress tests on NOR flash
Date: Wed,  6 Jan 2010 10:48:18 +0100
Message-Id: <1262771298-11320-1-git-send-email-mts.doredevelopment@gmail.com>
Cc: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Before using block_isbad() check if mtd->block_isbad() is defined.
Calculating pgcnt must be done using pgsize defined to 512 on 
NOR and mtd->writesize for NAND, not using  mtd->writesize directly.

Previous Patch sendt Dec 16, 2009 did not include check on block_isbad, please ignore

Signed-off-by: Morten Thunberg Svendsen <mts.doredevelopment@gmail.com>
---
 drivers/mtd/tests/mtd_readtest.c   |    6 +++++-
 drivers/mtd/tests/mtd_speedtest.c  |    7 ++++++-
 drivers/mtd/tests/mtd_stresstest.c |    6 +++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 79fc453..25c5dd0 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -147,6 +147,10 @@ static int scan_for_bad_eraseblocks(void)
 	}
 	memset(bbt, 0 , ebcnt);
 
+	/* NOR flash does not implement block_isbad */
+	if (mtd->block_isbad == NULL)
+		return 0;
+
 	printk(PRINT_PREF "scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		bbt[i] = is_block_bad(i) ? 1 : 0;
@@ -184,7 +188,7 @@ static int __init mtd_readtest_init(void)
 	tmp = mtd->size;
 	do_div(tmp, mtd->erasesize);
 	ebcnt = tmp;
-	pgcnt = mtd->erasesize / mtd->writesize;
+	pgcnt = mtd->erasesize / pgsize;
 
 	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 141363a..7fbb51d 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -301,6 +301,10 @@ static int scan_for_bad_eraseblocks(void)
 	}
 	memset(bbt, 0 , ebcnt);
 
+	/* NOR flash does not implement block_isbad */
+	if (mtd->block_isbad == NULL)
+		goto out;
+
 	printk(PRINT_PREF "scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		bbt[i] = is_block_bad(i) ? 1 : 0;
@@ -309,6 +313,7 @@ static int scan_for_bad_eraseblocks(void)
 		cond_resched();
 	}
 	printk(PRINT_PREF "scanned %d eraseblocks, %d are bad\n", i, bad);
+out:
 	goodebcnt = ebcnt - bad;
 	return 0;
 }
@@ -340,7 +345,7 @@ static int __init mtd_speedtest_init(void)
 	tmp = mtd->size;
 	do_div(tmp, mtd->erasesize);
 	ebcnt = tmp;
-	pgcnt = mtd->erasesize / mtd->writesize;
+	pgcnt = mtd->erasesize / pgsize;
 
 	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 6392047..a99d3cd 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -227,6 +227,10 @@ static int scan_for_bad_eraseblocks(void)
 	}
 	memset(bbt, 0 , ebcnt);
 
+	/* NOR flash does not implement block_isbad */
+	if (mtd->block_isbad == NULL)
+		return 0;
+
 	printk(PRINT_PREF "scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
 		bbt[i] = is_block_bad(i) ? 1 : 0;
@@ -265,7 +269,7 @@ static int __init mtd_stresstest_init(void)
 	tmp = mtd->size;
 	do_div(tmp, mtd->erasesize);
 	ebcnt = tmp;
-	pgcnt = mtd->erasesize / mtd->writesize;
+	pgcnt = mtd->erasesize / pgsize;
 
 	printk(PRINT_PREF "MTD device size %llu, eraseblock size %u, "
 	       "page size %u, count of eraseblocks %u, pages per "
-- 
1.6.3.3
