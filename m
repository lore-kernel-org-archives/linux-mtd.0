Received: from mail.karo-electronics.de ([81.173.242.67])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6x2V-0004oQ-RO
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 06:16:08 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH/RESEND 1/2] mtd: nand: gpmi-nand: janitorial cleanup: (commas
 after last element of struct initializer)
Date: Wed,  7 Aug 2013 08:15:37 +0200
Message-Id: <1375856138-3698-2-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1375802039.30770.153.camel@sauron.fi.intel.com>
References: <1375802039.30770.153.camel@sauron.fi.intel.com>
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


Acked-by: Huang Shijie <b32955@freescale.com>
Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index f557a1d..4f7ec59 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1569,19 +1569,19 @@ static const struct platform_device_id gpmi_ids[] = {
 	{ .name = "imx23-gpmi-nand", .driver_data = IS_MX23, },
 	{ .name = "imx28-gpmi-nand", .driver_data = IS_MX28, },
 	{ .name = "imx6q-gpmi-nand", .driver_data = IS_MX6Q, },
-	{},
+	{}
 };
 
 static const struct of_device_id gpmi_nand_id_table[] = {
 	{
 		.compatible = "fsl,imx23-gpmi-nand",
-		.data = (void *)&gpmi_ids[IS_MX23]
+		.data = (void *)&gpmi_ids[IS_MX23],
 	}, {
 		.compatible = "fsl,imx28-gpmi-nand",
-		.data = (void *)&gpmi_ids[IS_MX28]
+		.data = (void *)&gpmi_ids[IS_MX28],
 	}, {
 		.compatible = "fsl,imx6q-gpmi-nand",
-		.data = (void *)&gpmi_ids[IS_MX6Q]
+		.data = (void *)&gpmi_ids[IS_MX6Q],
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
-- 
1.7.2.5
