From: Thomas Abraham <thomas.abraham@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: Add support for Winbond W25Q80BW
Date: Wed, 09 May 2012 04:04:54 +0530
Message-id: <1336516494-22791-1-git-send-email-thomas.abraham@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org,
 mike@steroidmicros.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Winbond W25Q80BW is a 8Mbit serial flash memory device.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1924d24..dbd44b1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -728,6 +728,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1) },
-- 
1.6.6.rc2
