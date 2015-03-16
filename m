Received: from mailrelay118.isp.belgacom.be ([195.238.20.145])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXaZi-0000gk-M9
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 19:21:19 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/35 linux-next] mtd: constify of_device_id array
Date: Mon, 16 Mar 2015 20:20:28 +0100
Message-Id: <1426533651-25586-3-git-send-email-fabf@skynet.be>
In-Reply-To: <1426533651-25586-1-git-send-email-fabf@skynet.be>
References: <1426533469-25458-1-git-send-email-fabf@skynet.be>
 <1426533651-25586-1-git-send-email-fabf@skynet.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 Han Xu <han.xu@freescale.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_device_id is always used as const.
(See driver.of_match_table and open firmware functions)

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/devices/docg3.c       | 2 +-
 drivers/mtd/maps/physmap_of.c     | 4 ++--
 drivers/mtd/nand/mpc5121_nfc.c    | 2 +-
 drivers/mtd/spi-nor/fsl-quadspi.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 0310f91..008337e 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2117,7 +2117,7 @@ static int __exit docg3_release(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_OF
-static struct of_device_id docg3_dt_ids[] = {
+static const struct of_device_id docg3_dt_ids[] = {
 	{ .compatible = "m-systems,diskonchip-g3" },
 	{}
 };
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index ff26e97..774b32f 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -147,7 +147,7 @@ static void of_free_probes(const char * const *probes)
 		kfree(probes);
 }
 
-static struct of_device_id of_flash_match[];
+static const struct of_device_id of_flash_match[];
 static int of_flash_probe(struct platform_device *dev)
 {
 	const char * const *part_probe_types;
@@ -327,7 +327,7 @@ err_flash_remove:
 	return err;
 }
 
-static struct of_device_id of_flash_match[] = {
+static const struct of_device_id of_flash_match[] = {
 	{
 		.compatible	= "cfi-flash",
 		.data		= (void *)"cfi_probe",
diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 1f12e5b..2a49b53 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -837,7 +837,7 @@ static int mpc5121_nfc_remove(struct platform_device *op)
 	return 0;
 }
 
-static struct of_device_id mpc5121_nfc_match[] = {
+static const struct of_device_id mpc5121_nfc_match[] = {
 	{ .compatible = "fsl,mpc5121-nfc", },
 	{},
 };
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 1c7308c..3cd61e9 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -663,7 +663,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	return 0;
 }
 
-static struct of_device_id fsl_qspi_dt_ids[] = {
+static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
 	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
 	{ /* sentinel */ }
-- 
2.1.0
