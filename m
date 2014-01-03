Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz0z1-0002IX-1O
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 09:23:59 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: add Intel manufacturer ID
Date: Fri, 3 Jan 2014 16:50:39 +0800
Message-ID: <1388739039-13584-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1388043465-17441-1-git-send-email-b32955@freescale.com>
References: <1388043465-17441-1-git-send-email-b32955@freescale.com>
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

Add the Intel manufacturer Id.
Tested with Intel JS29F32G08ACMD1(4096 + 224) which is ONFI 2.0 compliant
nand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_ids.c |    1 +
 include/linux/mtd/nand.h    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index d3dbf59..3d7c89f 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -173,6 +173,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_MACRONIX, "Macronix"},
 	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_SANDISK, "SanDisk"},
+	{NAND_MFR_INTEL, "Intel"},
 	{0x0, "Unknown"}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6ccc3ef..773bd93 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -675,6 +675,7 @@ struct nand_chip {
 #define NAND_MFR_MACRONIX	0xc2
 #define NAND_MFR_EON		0x92
 #define NAND_MFR_SANDISK	0x45
+#define NAND_MFR_INTEL		0x89
 
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
-- 
1.7.2.rc3
