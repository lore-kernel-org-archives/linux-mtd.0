Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5bcm-0007yB-LM
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 12:07:29 +0000
Received: by dajq27 with SMTP id q27so1923561daj.36
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 05:07:26 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/6] mtd: mtd_nandecctest: remove unnecessary srandom32()
 call
Date: Sun, 26 Aug 2012 21:06:43 +0900
Message-Id: <1345982808-11440-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1345982808-11440-1-git-send-email-akinobu.mita@gmail.com>
References: <1345982808-11440-1-git-send-email-akinobu.mita@gmail.com>
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
