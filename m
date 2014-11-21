Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrstk-0005m8-ND
 for linux-mtd@lists.infradead.org; Fri, 21 Nov 2014 18:25:37 +0000
Received: by mail-pd0-f180.google.com with SMTP id p10so5783312pdj.11
 for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2014 10:25:15 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: tests: abort torturetest on erase errors
Date: Fri, 21 Nov 2014 10:24:29 -0800
Message-Id: <1416594269-4647-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The torture test should quit once it actually induces an error in the
flash. This step was accidentally removed during refactoring.

Without this fix, the torturetest just continues infinitely, or until
the maximum cycle count is reached. e.g.:

   ...
   [ 7619.218171] mtd_test: error -5 while erasing EB 100
   [ 7619.297981] mtd_test: error -5 while erasing EB 100
   [ 7619.377953] mtd_test: error -5 while erasing EB 100
   [ 7619.457998] mtd_test: error -5 while erasing EB 100
   [ 7619.537990] mtd_test: error -5 while erasing EB 100
   ...

Fixes: 6cf78358c94f ("mtd: mtd_torturetest: use mtd_test helpers")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: <stable@vger.kernel.org>
---
 drivers/mtd/tests/torturetest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index eeab96973cf0..b55bc52a1340 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -264,7 +264,9 @@ static int __init tort_init(void)
 		int i;
 		void *patt;
 
-		mtdtest_erase_good_eraseblocks(mtd, bad_ebs, eb, ebcnt);
+		err = mtdtest_erase_good_eraseblocks(mtd, bad_ebs, eb, ebcnt);
+		if (err)
+			goto out;
 
 		/* Check if the eraseblocks contain only 0xFF bytes */
 		if (check) {
-- 
1.9.1
