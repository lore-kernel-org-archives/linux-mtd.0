Received: from mail.karo-electronics.de ([81.173.242.67])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6wwN-0004cX-Ma
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 06:09:48 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/25] mtd: nand: gpmi-nand: let the driver core handle pinctrl
Date: Wed,  7 Aug 2013 08:09:13 +0200
Message-Id: <1375855754-24876-1-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1375802039.30770.153.camel@sauron.fi.intel.com>
References: <1375802039.30770.153.camel@sauron.fi.intel.com>
To: <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

without this patch the driver fails to load with -EBUSY.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index b741a6c..f557a1d 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -520,7 +520,6 @@ err_clock:
 
 static int acquire_resources(struct gpmi_nand_data *this)
 {
-	struct pinctrl *pinctrl;
 	int ret;
 
 	ret = acquire_register_block(this, GPMI_NAND_GPMI_REGS_ADDR_RES_NAME);
@@ -539,19 +538,12 @@ static int acquire_resources(struct gpmi_nand_data *this)
 	if (ret)
 		goto exit_dma_channels;
 
-	pinctrl = devm_pinctrl_get_select_default(&this->pdev->dev);
-	if (IS_ERR(pinctrl)) {
-		ret = PTR_ERR(pinctrl);
-		goto exit_pin;
-	}
-
 	ret = gpmi_get_clks(this);
 	if (ret)
 		goto exit_clock;
 	return 0;
 
 exit_clock:
-exit_pin:
 	release_dma_channels(this);
 exit_dma_channels:
 	release_bch_irq(this);
-- 
1.7.2.5
