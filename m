Received: from mail-bl2nam02on0056.outbound.protection.outlook.com
 ([104.47.38.56] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a09LG-0002y4-1g
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 14:40:42 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <michals@xilinx.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <kalluripunnaiahchoudary@gmail.com>, <kpc528@gmail.com>, "Punnaiah Choudary
 Kalluri" <punnaia@xilinx.com>
Subject: [PATCH v5 3/3] mtd: nand: Add macro definition for nvddr interface
 mode
Date: Sat, 21 Nov 2015 20:10:11 +0530
Message-ID: <1448116811-9960-1-git-send-email-punnaia@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added macro definition for nvddr data interface mode field in
the sub feature parameter of onfi timing mode configuration.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
Changes in v5:
- None
Changes in v4:
- New change
---
 include/linux/mtd/nand.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5a9d1d4..1a8614f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -215,6 +215,9 @@ struct nand_chip;
 #define ONFI_TIMING_MODE_5		(1 << 5)
 #define ONFI_TIMING_MODE_UNKNOWN	(1 << 6)
 
+/* ONFI data interface mode */
+#define ONFI_DATA_INTERFACE_NVDDR	(1 << 4)
+
 /* ONFI feature address */
 #define ONFI_FEATURE_ADDR_TIMING_MODE	0x1
 
-- 
2.1.2
