From: Murali Nalajala <mnalajal@codeaurora.org>
To: dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: Allow NAND chip ids to be included standalone.
Date: Tue,  1 Mar 2011 06:17:29 +0530
Message-Id: <1298940450-27365-1-git-send-email-mnalajal@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Murali Nalajala <mnalajal@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dima Zavin <dima@android.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lets non-standard NAND drivers take advantage of known NAND
chip information.

Signed-off-by: Dima Zavin <dima@android.com>
Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
---
 drivers/mtd/nand/Kconfig |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index c895922..782275e 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1,3 +1,10 @@
+config MTD_NAND_IDS
+	tristate "Include chip ids for known NAND devices."
+	depends on MTD
+	help
+	  Useful for NAND drivers that do not use the NAND subsystem but
+	  still like to take advantage of the known chip information.
+
 config MTD_NAND_ECC
 	tristate
 
@@ -123,9 +130,6 @@ config MTD_NAND_OMAP_PREFETCH_DMA
 	 or in DMA interrupt mode.
 	 Say y for DMA mode or MPU mode will be used
 
-config MTD_NAND_IDS
-	tristate
-
 config MTD_NAND_RICOH
 	tristate "Ricoh xD card reader"
 	default n
-- 
1.7.1.1

--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
