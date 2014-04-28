From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 04/10] Documentation: mtd: add a new document for SPI NOR
 flash
Date: Mon, 28 Apr 2014 11:53:41 +0800
Message-ID: <1398657227-20721-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1398657227-20721-1-git-send-email-b32955@freescale.com>
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need a DT property to store the dummy cycles for DDR Quad read.
This is a common feature for the SPI NOR flash, such as Spansion and Micron
chips.

Add this file to describe this specific SPI NOR flash features which will
be referred by the SPI NOR flash drivers.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 .../devicetree/bindings/mtd/spi-nor-flash.txt      |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/spi-nor-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/spi-nor-flash.txt b/Documentation/devicetree/bindings/mtd/spi-nor-flash.txt
new file mode 100644
index 0000000..aba4d54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/spi-nor-flash.txt
@@ -0,0 +1,7 @@
+This file defines some DT properties for specific SPI NOR flash features.
+The SPI NOR controller drivers may refer to this file, such as fsl-quadspi.txt
+
+Optional properties:
+  - spi-nor,ddr-quad-read-dummy: The dummy cycles used by the DDR Quad read.
+                                 Please refer to the chip's datasheet. This
+                                 property can be 4 or 6 which is less then 8.
-- 
1.7.2.rc3
