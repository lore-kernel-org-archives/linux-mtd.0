Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2fPw-0000sF-Pv
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 10:06:21 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4] mtd: torturetest: add the support for random data pattern
Date: Tue, 5 Feb 2013 17:06:39 +0800
Message-ID: <1360055199-6679-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1360053050-18043-1-git-send-email-b32955@freescale.com>
References: <1360053050-18043-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ricard.wanderlof@axis.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new module parameter 'pattern'. The meaning of the pattern is:
  (1) pattern == 0 for 55/AA pattern.
  (2) pattern < 0 for random pattern.
  (3) pattern > 0 for random pattern too, the value of the pattern is used
      as the seed for the random generator.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
v1 --> v2:
   add seed support.

v2 --> v3:
   fix a type in pr_info

v3 --> v4:
   fix a confusing description.
---
 drivers/mtd/tests/mtd_torturetest.c |   82 +++++++++++++++++++++++++---------
 1 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index 516cf66..671e8dd 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -32,6 +32,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/random.h>
 
 #define RETRIES 3
 
@@ -64,6 +65,13 @@ module_param(cycles_count, uint, S_IRUGO);
 MODULE_PARM_DESC(cycles_count, "how many erase cycles to do "
 			       "(infinite by default)");
 
+static int pattern;
+module_param(pattern, int, S_IRUGO);
+MODULE_PARM_DESC(pattern, "0 for 55/AA pattern(default);"
+			"less then 0 for random pattern;"
+			"greater then 0 for random pattern too, "
+			"the value of the parameter is the seed.");
+
 static struct mtd_info *mtd;
 
 /* This buffer contains 0x555555...0xAAAAAA... pattern */
@@ -72,6 +80,8 @@ static unsigned char *patt_5A5;
 static unsigned char *patt_A5A;
 /* This buffer contains all 0xFF bytes */
 static unsigned char *patt_FF;
+/* This buffer contains the random data. */
+static unsigned char *patt_rd;
 /* This a temporary buffer is use when checking data */
 static unsigned char *check_buf;
 /* How many erase cycles were done */
@@ -228,6 +238,12 @@ static int __init tort_init(void)
 		pr_info("torturing just %d pages per eraseblock\n",
 			pgcnt);
 	pr_info("write verify %s\n", check ? "enabled" : "disabled");
+	if (pattern == 0)
+		pr_info("Test pattern is 55/AA.\n");
+	else if (pattern < 0)
+		pr_info("Test pattern is random.\n");
+	else
+		pr_info("Test pattern is random, seed is 0x%x.\n", pattern);
 
 	mtd = get_mtd_device(NULL, dev);
 	if (IS_ERR(mtd)) {
@@ -249,16 +265,24 @@ static int __init tort_init(void)
 	}
 
 	err = -ENOMEM;
-	patt_5A5 = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!patt_5A5) {
-		pr_err("error: cannot allocate memory\n");
-		goto out_mtd;
-	}
+	if (!pattern) {
+		patt_5A5 = kmalloc(mtd->erasesize, GFP_KERNEL);
+		if (!patt_5A5) {
+			pr_err("error: cannot allocate memory\n");
+			goto out_mtd;
+		}
 
-	patt_A5A = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!patt_A5A) {
-		pr_err("error: cannot allocate memory\n");
-		goto out_patt_5A5;
+		patt_A5A = kmalloc(mtd->erasesize, GFP_KERNEL);
+		if (!patt_A5A) {
+			pr_err("error: cannot allocate memory\n");
+			goto out_patt_5A5;
+		}
+	} else {
+		patt_rd = kmalloc(mtd->erasesize, GFP_KERNEL);
+		if (!patt_rd) {
+			pr_err("error: cannot allocate memory\n");
+			goto out_patt_rd;
+		}
 	}
 
 	patt_FF = kmalloc(mtd->erasesize, GFP_KERNEL);
@@ -277,14 +301,20 @@ static int __init tort_init(void)
 
 	/* Initialize patterns */
 	memset(patt_FF, 0xFF, mtd->erasesize);
-	for (i = 0; i < mtd->erasesize / pgsize; i++) {
-		if (!(i & 1)) {
-			memset(patt_5A5 + i * pgsize, 0x55, pgsize);
-			memset(patt_A5A + i * pgsize, 0xAA, pgsize);
-		} else {
-			memset(patt_5A5 + i * pgsize, 0xAA, pgsize);
-			memset(patt_A5A + i * pgsize, 0x55, pgsize);
+	if (!pattern) {
+		for (i = 0; i < mtd->erasesize / pgsize; i++) {
+			if (!(i & 1)) {
+				memset(patt_5A5 + i * pgsize, 0x55, pgsize);
+				memset(patt_A5A + i * pgsize, 0xAA, pgsize);
+			} else {
+				memset(patt_5A5 + i * pgsize, 0xAA, pgsize);
+				memset(patt_A5A + i * pgsize, 0x55, pgsize);
+			}
 		}
+	} else {
+		/* set the seed. */
+		if (pattern > 0)
+			prandom_seed(pattern);
 	}
 
 	/*
@@ -335,10 +365,15 @@ static int __init tort_init(void)
 			}
 
 			/* Write the pattern */
-			if ((eb + erase_cycles) & 1)
-				patt = patt_5A5;
-			else
-				patt = patt_A5A;
+			if (!pattern) {
+				if ((eb + erase_cycles) & 1)
+					patt = patt_5A5;
+				else
+					patt = patt_A5A;
+			} else {
+				patt = patt_rd;
+				prandom_bytes(patt, mtd->erasesize);
+			}
 			err = write_pattern(i, patt);
 			if (err)
 				goto out;
@@ -350,8 +385,9 @@ static int __init tort_init(void)
 				if (err) {
 					pr_info("verify failed for %s"
 					       " pattern\n",
-					       ((eb + erase_cycles) & 1) ?
-					       "0x55AA55..." : "0xAA55AA...");
+					       pattern ? "random pattern" :
+					       (((eb + erase_cycles) & 1) ?
+					       "0x55AA55..." : "0xAA55AA..."));
 					goto out;
 				}
 				cond_resched();
@@ -386,6 +422,8 @@ out_patt_A5A:
 	kfree(patt_A5A);
 out_patt_5A5:
 	kfree(patt_5A5);
+out_patt_rd:
+	kfree(patt_rd);
 out_mtd:
 	put_mtd_device(mtd);
 	if (err)
-- 
1.7.0.4
