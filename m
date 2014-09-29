From: Josh Wu <josh.wu@atmel.com>
To: <computersforpeace@gmail.com>, <akpm@linux-foundation.org>,
 <nicolas.ferre@atmel.com>
Subject: [PATCH] MAINTAINERS: add atmel nand driver maintainer entry
Date: Mon, 29 Sep 2014 16:36:03 +0800
Message-ID: <1411979763-1449-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds an entry in MAINTAINERS file for ATMEL nand driver.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3705430..1bdf3bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1698,6 +1698,12 @@ M:	Nicolas Ferre <nicolas.ferre@atmel.com>
 S:	Supported
 F:	drivers/net/ethernet/cadence/
 
+ATMEL NAND DRIVER
+M:	Josh Wu <josh.wu@atmel.com>
+L:	linux-mtd@lists.infradead.org
+S:	Supported
+F:	drivers/mtd/nand/atmel_nand*
+
 ATMEL SPI DRIVER
 M:	Nicolas Ferre <nicolas.ferre@atmel.com>
 S:	Supported
-- 
1.9.1
