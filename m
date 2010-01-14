From: Baruch Siach <baruch@tkos.co.il>
To: Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH 1/3] mtd: mxc_nand: add MX25 to Kconfig
Date: Thu, 14 Jan 2010 11:24:13 +0200
Message-Id: <7f6094e5c907194486d288691db041455dd77eac.1263460321.git.baruch@tkos.co.il>
In-Reply-To: <cover.1263460321.git.baruch@tkos.co.il>
References: <cover.1263460321.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 677cd53..4f99274 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -444,7 +444,7 @@ config MTD_NAND_FSL_UPM
 
 config MTD_NAND_MXC
 	tristate "MXC NAND support"
-	depends on ARCH_MX2 || ARCH_MX3
+	depends on ARCH_MX2 || ARCH_MX25 || ARCH_MX3
 	help
 	  This enables the driver for the NAND flash controller on the
 	  MXC processors.
-- 
1.6.5
