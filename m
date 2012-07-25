From: Fabio Estevam <festevam@gmail.com>
To: b32955@freescale.com
Subject: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
Date: Wed, 25 Jul 2012 08:18:20 -0300
Message-Id: <1343215100-24005-3-git-send-email-festevam@gmail.com>
In-Reply-To: <1343215100-24005-1-git-send-email-festevam@gmail.com>
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Let MXS_DMA be selected by default.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v1:
- No changes. Newly introduced in this series
 arch/arm/configs/imx_v6_v7_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index f725b96..3c9f32f 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -192,6 +192,7 @@ CONFIG_RTC_DRV_MC13XXX=y
 CONFIG_RTC_DRV_MXC=y
 CONFIG_DMADEVICES=y
 CONFIG_IMX_SDMA=y
+CONFIG_MXS_DMA=y
 CONFIG_COMMON_CLK_DEBUG=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT2_FS=y
-- 
1.7.1
