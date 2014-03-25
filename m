Received: from mail-wg0-f43.google.com ([74.125.82.43])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbX-0007H7-RX
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:04 +0000
Received: by mail-wg0-f43.google.com with SMTP id x13so79946wgg.14
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 12/47] mtd: nand: stm_nand_bch: scan for NAND devices
Date: Tue, 25 Mar 2014 08:19:29 +0000
Message-Id: <1395735604-26706-13-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
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
index e1ebf92..1de13bd 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -374,6 +374,7 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 	struct nandi_info *info;
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
+	int err;
 
 	if (!pdata) {
 		dev_err(&pdev->dev, "no platform data found\n");
@@ -403,6 +404,10 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 
 	nandi_set_mtd_defaults(nandi, mtd, chip);
 
+	err = nand_scan_ident(mtd, 1, NULL);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -410,6 +415,8 @@ static int stm_nand_bch_remove(struct platform_device *pdev)
 {
 	struct nandi_controller *nandi = platform_get_drvdata(pdev);
 
+	nand_release(&nandi->info.mtd);
+
 	nandi_clk_disable(nandi);
 
 	return 0;
-- 
1.8.3.2
