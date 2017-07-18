Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXGmb-0003mM-VE
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 00:54:39 +0000
Received: by mail-qk0-x241.google.com with SMTP id q66so778063qki.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 17:54:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: stefan@agner.ch, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 1/2] mtd: nand: vf610: Check the return value from
 clk_prepare_enable()
Date: Mon, 17 Jul 2017 21:54:07 -0300
Message-Id: <1500339248-18132-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

clk_prepare_enable() may fail, so we should better check its return value
and propagate it in the case of error.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- None

 drivers/mtd/nand/vf610_nfc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 744ab10..9e49672 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -814,12 +814,16 @@ static int vf610_nfc_suspend(struct device *dev)
 
 static int vf610_nfc_resume(struct device *dev)
 {
+	int err;
+
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
 
 	pinctrl_pm_select_default_state(dev);
 
-	clk_prepare_enable(nfc->clk);
+	err = clk_prepare_enable(nfc->clk);
+	if (err)
+		return err;
 
 	vf610_nfc_preinit_controller(nfc);
 	vf610_nfc_init_controller(nfc);
-- 
2.7.4
