Received: from mms1.broadcom.com ([216.31.210.17])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2jSa-0000L3-6m
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 14:25:21 +0000
From: "Al Cooper" <alcooperx@gmail.com>
To: dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: mtd_torturetest can cause stack overflows
Date: Tue, 5 Feb 2013 09:08:10 -0500
Message-ID: <1360073290-4191-1-git-send-email-alcooperx@gmail.com>
In-Reply-To: <Y>
References: <Y>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Al Cooper <alcooperx@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_torturetest uses the module parm "ebcnt" to control the size of a
stack based array of int's. When "ebcnt" is large, Ex: 1000, it
causes stack overflows on systems with small kernel stacks. The fix
is to move the array from the stack to kmalloc memory.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/mtd/tests/mtd_torturetest.c |   25 +++++++++++--------------
 1 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index c4cde1e..3a9f6a6 100644
--- a/drivers/mtd/tests/mtd_torturetest.c
+++ b/drivers/mtd/tests/mtd_torturetest.c
@@ -208,7 +208,7 @@ static inline int write_pattern(int ebnum, void *buf)
 static int __init tort_init(void)
 {
 	int err = 0, i, infinite = !cycles_count;
-	int bad_ebs[ebcnt];
+	int *bad_ebs;
 
 	printk(KERN_INFO "\n");
 	printk(KERN_INFO "=================================================\n");
@@ -250,28 +250,24 @@ static int __init tort_init(void)
 
 	err = -ENOMEM;
 	patt_5A5 = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!patt_5A5) {
-		pr_err("error: cannot allocate memory\n");
+	if (!patt_5A5)
 		goto out_mtd;
-	}
 
 	patt_A5A = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!patt_A5A) {
-		pr_err("error: cannot allocate memory\n");
+	if (!patt_A5A)
 		goto out_patt_5A5;
-	}
 
 	patt_FF = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!patt_FF) {
-		pr_err("error: cannot allocate memory\n");
+	if (!patt_FF)
 		goto out_patt_A5A;
-	}
 
 	check_buf = kmalloc(mtd->erasesize, GFP_KERNEL);
-	if (!check_buf) {
-		pr_err("error: cannot allocate memory\n");
+	if (!check_buf)
 		goto out_patt_FF;
-	}
+
+	bad_ebs = kcalloc(ebcnt, sizeof(*bad_ebs), GFP_KERNEL);
+	if (!bad_ebs)
+		goto out_check_buf;
 
 	err = 0;
 
@@ -290,7 +286,6 @@ static int __init tort_init(void)
 	/*
 	 * Check if there is a bad eraseblock among those we are going to test.
 	 */
-	memset(&bad_ebs[0], 0, sizeof(int) * ebcnt);
 	if (mtd_can_have_bb(mtd)) {
 		for (i = eb; i < eb + ebcnt; i++) {
 			err = mtd_block_isbad(mtd, (loff_t)i * mtd->erasesize);
@@ -394,6 +389,8 @@ out:
 
 	pr_info("finished after %u erase cycles\n",
 	       erase_cycles);
+	kfree(bad_ebs);
+out_check_buf:
 	kfree(check_buf);
 out_patt_FF:
 	kfree(patt_FF);
-- 
1.7.6
