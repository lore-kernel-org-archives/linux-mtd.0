Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcVWk-0004Ye-Ji
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 11:40:42 +0000
Received: by mail-pf0-x243.google.com with SMTP id 72so2106809pfl.4
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 04:39:34 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, narmstrong@baylibre.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] mtd: nand: vf610_nfc: Handle return value of
 clk_prepare_enable.
Date: Tue,  1 Aug 2017 17:09:18 +0530
Message-Id: <1501587558-21227-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clk_prepare_enable() can fail here and we must check its return value.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/nand/vf610_nfc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 744ab10..db03d4f 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -816,10 +816,13 @@ static int vf610_nfc_resume(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int ret;
 
 	pinctrl_pm_select_default_state(dev);
 
-	clk_prepare_enable(nfc->clk);
+	ret = clk_prepare_enable(nfc->clk);
+	if (ret)
+		return ret;
 
 	vf610_nfc_preinit_controller(nfc);
 	vf610_nfc_init_controller(nfc);
-- 
1.9.1
