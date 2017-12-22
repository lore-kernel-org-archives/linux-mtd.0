Received: from mail.ispras.ru ([83.149.199.45])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eSV6T-0007BU-5d
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 21:43:43 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Stefan Agner <stefan@agner.ch>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH] mtd: nand: vf610: fix error handling in vf610_nfc_probe()
Date: Sat, 23 Dec 2017 00:43:14 +0300
Message-Id: <1513978994-5739-1-git-send-email-khoroshilov@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

vf610_nfc_probe() misses error handling of mtd_device_register().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/mtd/nand/vf610_nfc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 8037d4b48a05..a4c181af74b3 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -782,7 +782,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mtd);
 
 	/* Register device in MTD */
-	return mtd_device_register(mtd, NULL, 0);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err)
+		goto error;
+	return 0;
 
 error:
 	of_node_put(nand_get_flash_node(chip));
-- 
2.7.4
