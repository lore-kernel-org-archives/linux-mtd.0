Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXD4L-00046C-3w
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 20:56:42 +0000
Received: by mail-qt0-x241.google.com with SMTP id 19so209257qty.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 13:56:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: stefan@agner.ch, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] mtd: nand: vf610: Check the return value from
 clk_prepare_enable()
Date: Mon, 17 Jul 2017 17:55:59 -0300
Message-Id: <1500324959-7682-1-git-send-email-festevam@gmail.com>
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
