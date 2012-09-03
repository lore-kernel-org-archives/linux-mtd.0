Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WGT-0007DY-0f
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:00:30 +0000
Received: by pbbrq8 with SMTP id rq8so8483394pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 06:00:25 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 01/11] mtd: mtd_nandecctest: remove unnecessary srandom32()
 call
Date: Mon,  3 Sep 2012 21:59:56 +0900
Message-Id: <1346677206-13621-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
References: <1346677206-13621-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is unnecessary for this driver to call srandom32() in module_init.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
No changes from previous version

 drivers/mtd/tests/mtd_nandecctest.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 70d6d7d..4d7b171 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -66,8 +66,6 @@ static int nand_ecc_test(const size_t size)
 
 static int __init ecc_test_init(void)
 {
-	srandom32(jiffies);
-
 	nand_ecc_test(256);
 	nand_ecc_test(512);
 
-- 
1.7.11.4
