Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aarT0-00019o-Q3
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2016 21:04:27 +0000
Received: by mail-ig0-x231.google.com with SMTP id y8so27960870igp.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Mar 2016 13:04:06 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To: jorge.ramirez-ortiz@linaro.org, boris.brezillon@free-electrons.com,
 fcooper@ti.com, computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com
Subject: [PATCH] mtd: nand: tests: fix regression introduced in mtd_nandectest
Date: Tue,  1 Mar 2016 16:04:00 -0500
Message-Id: <1456866240-26119-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Offending Commit: 6e94119 "mtd: nand: return consistent error codes in
ecc.correct() implementations"

The new error code was not being handled properly in double bit error
detection.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mtd/tests/mtd_nandecctest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 7931615..88b6c81 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -187,7 +187,7 @@ static int double_bit_error_detect(void *error_data, void *error_ecc,
 	__nand_calculate_ecc(error_data, size, calc_ecc);
 	ret = __nand_correct_data(error_data, error_ecc, calc_ecc, size);
 
-	return (ret == -1) ? 0 : -EINVAL;
+	return (ret == -EBADMSG) ? 0 : -EINVAL;
 }
 
 static const struct nand_ecc_test nand_ecc_test[] = {
-- 
2.1.4
