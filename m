Received: from mail.ispras.ru ([83.149.199.45])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ekHAZ-0006LH-WA
 for linux-mtd@lists.infradead.org; Fri, 09 Feb 2018 22:29:25 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, Stefan Agner <stefan@agner.ch>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH v4 3/3] mtd: nand: vf610: check mtd_device_register() return
 code
Date: Sat, 10 Feb 2018 01:28:36 +0300
Message-Id: <1518215316-21504-4-git-send-email-khoroshilov@ispras.ru>
In-Reply-To: <1518215316-21504-1-git-send-email-khoroshilov@ispras.ru>
References: <1518215316-21504-1-git-send-email-khoroshilov@ispras.ru>
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
 drivers/mtd/nand/vf610_nfc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 9cc5992e88c8..64fed3d9e3d4 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -782,8 +782,13 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mtd);
 
 	/* Register device in MTD */
-	return mtd_device_register(mtd, NULL, 0);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err)
+		goto err_cleanup_nand;
+	return 0;
 
+err_cleanup_nand:
+	nand_cleanup(chip);
 err_disable_clk:
 	clk_disable_unprepare(nfc->clk);
 	return err;
-- 
2.7.4
