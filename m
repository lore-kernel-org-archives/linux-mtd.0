Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXGme-0003mV-2e
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 00:54:41 +0000
Received: by mail-qt0-x242.google.com with SMTP id l55so753278qtl.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 17:54:19 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: stefan@agner.ch, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 2/2] mtd: nand: vf610: Remove unneeded
 pinctrl_pm_select_default_state()
Date: Mon, 17 Jul 2017 21:54:08 -0300
Message-Id: <1500339248-18132-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1500339248-18132-1-git-send-email-festevam@gmail.com>
References: <1500339248-18132-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

pinctrl_pm_select_default_state() is already the default pinctrl state and
since pinctrl_pm_select_sleep_state() is not used in this driver, there
is no need to explicitly call pinctrl_pm_select_default_state().

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Newly introduced

 drivers/mtd/nand/vf610_nfc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 9e49672..b88a0c91 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -34,7 +34,6 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of_device.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -819,8 +818,6 @@ static int vf610_nfc_resume(struct device *dev)
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
 
-	pinctrl_pm_select_default_state(dev);
-
 	err = clk_prepare_enable(nfc->clk);
 	if (err)
 		return err;
-- 
2.7.4
