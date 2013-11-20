Received: from mail-db8lp0189.outbound.messaging.microsoft.com
 ([213.199.154.189] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj3tr-0007k4-NF
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 09:16:44 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
Date: Wed, 20 Nov 2013 16:52:49 +0800
Message-ID: <1384937569-23893-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, dedekind1@gmail.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, sourav.poddar@ti.com,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This chip supports the quad read.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7dc2c14..720899b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -941,6 +941,7 @@ static const struct spi_device_id m25p_ids[] = {
 	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
+	{ "s25fl128s",	INFO(0x012018, 0x4d01,  64 * 1024, 256, M25P80_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, M25P80_QUAD_READ) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
-- 
1.7.2.rc3
