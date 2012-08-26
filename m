Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5bcm-0007yC-IK
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 12:07:29 +0000
Received: by pbbrq8 with SMTP id rq8so6170345pbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 26 Aug 2012 05:07:27 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/6] mtd: mtd_nandecctest: make module_init() return an
 error code if test fails
Date: Sun, 26 Aug 2012 21:06:44 +0900
Message-Id: <1345982808-11440-3-git-send-email-akinobu.mita@gmail.com>
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

Return an error code if test fails in order to detect a test case failure
by invoking tests repeatedly like this:

while sudo modprobe mtd_nandecctest; do
	sudo modprobe -r mtd_nandecctest
done

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/tests/mtd_nandecctest.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 4d7b171..f71ed92 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -66,10 +66,13 @@ static int nand_ecc_test(const size_t size)
 
 static int __init ecc_test_init(void)
 {
-	nand_ecc_test(256);
-	nand_ecc_test(512);
+	int err;
 
-	return 0;
+	err = nand_ecc_test(256);
+	if (err)
+		return err;
+
+	return nand_ecc_test(512);
 }
 
 static void __exit ecc_test_exit(void)
-- 
1.7.11.4
