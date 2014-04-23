Received: from mail-bn1ln0141.outbound.protection.outlook.com
 ([2a01:111:f400:7c10::141] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcsGJ-0006Q2-9B
 for linux-mtd@lists.infradead.org; Wed, 23 Apr 2014 08:10:36 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] Documentation: mtd: update the document for m25p80
Date: Wed, 23 Apr 2014 15:12:47 +0800
Message-ID: <1398237167-23881-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, linux-doc@vger.kernel.org,
 devicetree-discuss@lists.ozlabs.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The m25p80.c has used the SPI NOR framework now, and the m25p_ids has
been moved to spi-nor.c and renamed to spi_nor_ids.

This patch updates the document for m25p80.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 Documentation/devicetree/bindings/mtd/m25p80.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
index 6d3d576..4611aa8 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
@@ -5,8 +5,8 @@ Required properties:
   representing partitions.
 - compatible : Should be the manufacturer and the name of the chip. Bear in mind
                the DT binding is not Linux-only, but in case of Linux, see the
-               "m25p_ids" table in drivers/mtd/devices/m25p80.c for the list of
-               supported chips.
+               "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c for the list
+               of supported chips.
 - reg : Chip-Select number
 - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
 
-- 
1.7.2.rc3
