Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9y2K-0006w0-DU
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 13:56:25 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so873615pdi.19
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 06:56:02 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH -next 1/4] mtd: pagetest: remove always true condition
Date: Thu, 15 Aug 2013 22:55:06 +0900
Message-Id: <1376574909-7507-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
References: <1376574909-7507-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Vikram Narayanan <vikram186@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove useless checks just after checking 'err' is not zero.  These
checks should have been removed when converting to use mtdtest_read().

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Vikram Narayanan <vikram186@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/pagetest.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 22cc38c..8318976 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -272,7 +272,7 @@ static int erasecrosstest(void)
 	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
-		return err ? err : -1;
+		return err;
 	}
 
 	pr_info("verifying 1st page of block %d\n", ebnum);
@@ -308,7 +308,7 @@ static int erasecrosstest(void)
 	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
-		return err ? err : -1;
+		return err;
 	}
 
 	pr_info("verifying 1st page of block %d\n", ebnum);
@@ -361,7 +361,7 @@ static int erasetest(void)
 	if (err) {
 		pr_err("error: read failed at %#llx\n",
 		       (long long)addr0);
-		return err ? err : -1;
+		return err;
 	}
 
 	pr_info("verifying 1st page of block %d is all 0xff\n",
-- 
1.8.3.1
