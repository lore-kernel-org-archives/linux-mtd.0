Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw60O-00062B-6C
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 08:09:20 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: add SanDisk manufacturer ID
Date: Thu, 26 Dec 2013 15:37:45 +0800
Message-ID: <1388043465-17441-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the manufactor ID for SanDisk.
Make preparation for SanDisk SDTNRGAMA-008G.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_ids.c |    1 +
 include/linux/mtd/nand.h    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index a87b0a3..136a463 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -169,6 +169,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_AMD, "AMD/Spansion"},
 	{NAND_MFR_MACRONIX, "Macronix"},
 	{NAND_MFR_EON, "Eon"},
+	{NAND_MFR_SANDISK, "SanDisk"},
 	{0x0, "Unknown"}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index f3ea8da..c13fbf3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -600,6 +600,7 @@ struct nand_chip {
 #define NAND_MFR_AMD		0x01
 #define NAND_MFR_MACRONIX	0xc2
 #define NAND_MFR_EON		0x92
+#define NAND_MFR_SANDISK	0x45
 
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
-- 
1.7.2.rc3
