Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY0uc-0002MP-DP
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 21:19:35 +0000
Received: by mail-pb0-f45.google.com with SMTP id ro12so557694pbb.4
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2013 14:19:12 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: tests: don't print error messages when out-of-memory
Date: Thu,  2 May 2013 14:18:51 -0700
Message-Id: <1367529531-17254-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These strings are now unnecessary and discouraged in the kernel. The
kernel will have plenty of big scary messages if kmalloc fails. These
now only serve to bloat the module.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/tests/mtd_oobtest.c     | 12 +++---------
 drivers/mtd/tests/mtd_pagetest.c    | 20 +++++---------------
 drivers/mtd/tests/mtd_readtest.c    | 12 +++---------
 drivers/mtd/tests/mtd_speedtest.c   |  8 ++------
 drivers/mtd/tests/mtd_stresstest.c  |  8 ++------
 drivers/mtd/tests/mtd_subpagetest.c | 12 +++---------
 6 files changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index 3e24b37..ab81e9a 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -320,10 +320,8 @@ static int scan_for_bad_eraseblocks(void)
 	int i, bad = 0;
 
 	bbt = kmalloc(ebcnt, GFP_KERNEL);
-	if (!bbt) {
-		pr_err("error: cannot allocate memory\n");
+	if (!bbt)
 		return -ENOMEM;
-	}
 
 	pr_info("scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
@@ -380,15 +378,11 @@ static int __init mtd_oobtest_init(void)
 
 	err = -ENOMEM;
 	readbuf = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!readbuf) {
-		pr_err("error: cannot allocate memory\n");
+	if (!readbuf)
 		goto out;
-	}
 	writebuf = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!writebuf) {
-		pr_err("error: cannot allocate memory\n");
+	if (!writebuf)
 		goto out;
-	}
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 0c1140b..acd991f 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -191,10 +191,8 @@ static int crosstest(void)
 
 	pr_info("crosstest\n");
 	pp1 = kmalloc(pgsize * 4, GFP_KERNEL);
-	if (!pp1) {
-		pr_err("error: cannot allocate memory\n");
+	if (!pp1)
 		return -ENOMEM;
-	}
 	pp2 = pp1 + pgsize;
 	pp3 = pp2 + pgsize;
 	pp4 = pp3 + pgsize;
@@ -456,10 +454,8 @@ static int scan_for_bad_eraseblocks(void)
 	int i, bad = 0;
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt) {
-		pr_err("error: cannot allocate memory\n");
+	if (!bbt)
 		return -ENOMEM;
-	}
 
 	pr_info("scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
@@ -516,20 +512,14 @@ static int __init mtd_pagetest_init(void)
 	err = -ENOMEM;
 	bufsize = pgsize * 2;
 	writebuf = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!writebuf) {
-		pr_err("error: cannot allocate memory\n");
+	if (!writebuf)
 		goto out;
-	}
 	twopages = kmalloc(bufsize, GFP_KERNEL);
-	if (!twopages) {
-		pr_err("error: cannot allocate memory\n");
+	if (!twopages)
 		goto out;
-	}
 	boundary = kmalloc(bufsize, GFP_KERNEL);
-	if (!boundary) {
-		pr_err("error: cannot allocate memory\n");
+	if (!boundary)
 		goto out;
-	}
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 266de04..2cdd0c4 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -143,10 +143,8 @@ static int scan_for_bad_eraseblocks(void)
 	int i, bad = 0;
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt) {
-		pr_err("error: cannot allocate memory\n");
+	if (!bbt)
 		return -ENOMEM;
-	}
 
 	if (!mtd_can_have_bb(mtd))
 		return 0;
@@ -204,15 +202,11 @@ static int __init mtd_readtest_init(void)
 
 	err = -ENOMEM;
 	iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!iobuf) {
-		pr_err("error: cannot allocate memory\n");
+	if (!iobuf)
 		goto out;
-	}
 	iobuf1 = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!iobuf1) {
-		pr_err("error: cannot allocate memory\n");
+	if (!iobuf1)
 		goto out;
-	}
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index a6ce9c1..20b63d1 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -313,10 +313,8 @@ static int scan_for_bad_eraseblocks(void)
 	int i, bad = 0;
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt) {
-		pr_err("error: cannot allocate memory\n");
+	if (!bbt)
 		return -ENOMEM;
-	}
 
 	if (!mtd_can_have_bb(mtd))
 		goto out;
@@ -384,10 +382,8 @@ static int __init mtd_speedtest_init(void)
 
 	err = -ENOMEM;
 	iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!iobuf) {
-		pr_err("error: cannot allocate memory\n");
+	if (!iobuf)
 		goto out;
-	}
 
 	prandom_bytes(iobuf, mtd->erasesize);
 
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 787f539..3a95e61 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -202,10 +202,8 @@ static int scan_for_bad_eraseblocks(void)
 	int i, bad = 0;
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt) {
-		pr_err("error: cannot allocate memory\n");
+	if (!bbt)
 		return -ENOMEM;
-	}
 
 	if (!mtd_can_have_bb(mtd))
 		return 0;
@@ -276,10 +274,8 @@ static int __init mtd_stresstest_init(void)
 	readbuf = vmalloc(bufsize);
 	writebuf = vmalloc(bufsize);
 	offsets = kmalloc(ebcnt * sizeof(int), GFP_KERNEL);
-	if (!readbuf || !writebuf || !offsets) {
-		pr_err("error: cannot allocate memory\n");
+	if (!readbuf || !writebuf || !offsets)
 		goto out;
-	}
 	for (i = 0; i < ebcnt; i++)
 		offsets[i] = mtd->erasesize;
 	prandom_bytes(writebuf, bufsize);
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index aade56f..e41a04f 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -333,10 +333,8 @@ static int scan_for_bad_eraseblocks(void)
 	int i, bad = 0;
 
 	bbt = kzalloc(ebcnt, GFP_KERNEL);
-	if (!bbt) {
-		pr_err("error: cannot allocate memory\n");
+	if (!bbt)
 		return -ENOMEM;
-	}
 
 	pr_info("scanning for bad eraseblocks\n");
 	for (i = 0; i < ebcnt; ++i) {
@@ -393,15 +391,11 @@ static int __init mtd_subpagetest_init(void)
 	err = -ENOMEM;
 	bufsize = subpgsize * 32;
 	writebuf = kmalloc(bufsize, GFP_KERNEL);
-	if (!writebuf) {
-		pr_info("error: cannot allocate memory\n");
+	if (!writebuf)
 		goto out;
-	}
 	readbuf = kmalloc(bufsize, GFP_KERNEL);
-	if (!readbuf) {
-		pr_info("error: cannot allocate memory\n");
+	if (!readbuf)
 		goto out;
-	}
 
 	err = scan_for_bad_eraseblocks();
 	if (err)
-- 
1.8.2.1
