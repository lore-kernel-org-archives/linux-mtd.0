Received: from mail.karo-electronics.de ([81.173.242.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wv4xJ-0005EA-PT
 for linux-mtd@lists.infradead.org; Thu, 12 Jun 2014 13:22:15 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>,
 Russell King <linux@arm.linux.org.uk>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, Jingoo Han <jg1.han@samsung.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Subject: [PATCHv4 1/5] mtd: gpmi: remove useless (void *) type casts and
 spaces between type casts and variables
Date: Thu, 12 Jun 2014 15:20:41 +0200
Message-Id: <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index f638cd8..31032b1 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1180,7 +1180,7 @@ static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 		/* Handle block mark swapping. */
 		block_mark_swapping(this,
-				(void *) payload_virt, (void *) auxiliary_virt);
+				(void *)payload_virt, (void *)auxiliary_virt);
 	} else {
 		/*
 		 * If control arrives here, we're not doing block mark swapping,
@@ -1760,16 +1760,16 @@ err_out:
 static const struct of_device_id gpmi_nand_id_table[] = {
 	{
 		.compatible = "fsl,imx23-gpmi-nand",
-		.data = (void *)&gpmi_devdata_imx23,
+		.data = &gpmi_devdata_imx23,
 	}, {
 		.compatible = "fsl,imx28-gpmi-nand",
-		.data = (void *)&gpmi_devdata_imx28,
+		.data = &gpmi_devdata_imx28,
 	}, {
 		.compatible = "fsl,imx6q-gpmi-nand",
-		.data = (void *)&gpmi_devdata_imx6q,
+		.data = &gpmi_devdata_imx6q,
 	}, {
 		.compatible = "fsl,imx6sx-gpmi-nand",
-		.data = (void *)&gpmi_devdata_imx6sx,
+		.data = &gpmi_devdata_imx6sx,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
-- 
1.7.10.4
