Received: from mms1.broadcom.com ([216.31.210.17])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2Td1-0008KH-Vq
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 21:31:05 +0000
From: "Al Cooper" <alcooperx@gmail.com>
To: dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtd_torturetest can cause stack overflows
Date: Mon, 4 Feb 2013 16:29:50 -0500
Message-ID: <1360013390-30179-1-git-send-email-alcooperx@gmail.com>
In-Reply-To: <y>
References: <y>
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
 drivers/mtd/tests/mtd_torturetest.c |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
index c4cde1e..a777cc8 100644
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
@@ -273,6 +273,12 @@ static int __init tort_init(void)
 		goto out_patt_FF;
 	}
 
+	bad_ebs = kmalloc(sizeof(*bad_ebs) * ebcnt, GFP_KERNEL);
+	if (!bad_ebs) {
+		pr_err("error: cannot allocate memory\n");
+		goto out_check_buf;
+	}
+
 	err = 0;
 
 	/* Initialize patterns */
@@ -394,6 +400,8 @@ out:
 
 	pr_info("finished after %u erase cycles\n",
 	       erase_cycles);
+	kfree(bad_ebs);
+out_check_buf:
 	kfree(check_buf);
 out_patt_FF:
 	kfree(patt_FF);
-- 
1.7.6
