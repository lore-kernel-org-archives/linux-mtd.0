Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnka-0002f4-Ic
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:57:56 +0000
Received: by mail-wi0-f171.google.com with SMTP id hm4so408205wib.10
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/47] mtd: nand: stm_nand_bch: scan for NAND devices
Date: Thu,  1 May 2014 10:56:20 +0100
Message-Id: <1398938214-17847-14-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the core nand_scan_ident() routine to locate connected NAND chips.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 8a63c4a..2670cec 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -532,6 +532,7 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 	struct nandi_info *info;
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
+	int err;
 
 	nandi = nandi_init_resources(pdev);
 	if (IS_ERR(nandi)) {
@@ -556,6 +557,10 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 
 	nandi_set_mtd_defaults(nandi, mtd, chip);
 
+	err = nand_scan_ident(mtd, 1, NULL);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -563,6 +568,8 @@ static int stm_nand_bch_remove(struct platform_device *pdev)
 {
 	struct nandi_controller *nandi = platform_get_drvdata(pdev);
 
+	nand_release(&nandi->info.mtd);
+
 	nandi_clk_disable(nandi);
 
 	return 0;
-- 
1.8.3.2
