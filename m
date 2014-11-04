Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xljro-0004N2-Nu
 for linux-mtd@lists.infradead.org; Tue, 04 Nov 2014 19:34:13 +0000
Received: by mail-pd0-f177.google.com with SMTP id v10so14032281pde.8
 for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2014 11:33:51 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: add ATC manufacturer info
Date: Tue,  4 Nov 2014 11:32:45 -0800
Message-Id: <1415129565-26791-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested with ATC AFND1G08U3, 128MiB NAND.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_ids.c | 1 +
 include/linux/mtd/nand.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index fbde89105245..97e612960b7d 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -178,6 +178,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_EON, "Eon"},
 	{NAND_MFR_SANDISK, "SanDisk"},
 	{NAND_MFR_INTEL, "Intel"},
+	{NAND_MFR_ATC, "ATC"},
 	{0x0, "Unknown"}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e4d451e4600b..22f4854b3be1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -723,6 +723,7 @@ struct nand_chip {
 #define NAND_MFR_EON		0x92
 #define NAND_MFR_SANDISK	0x45
 #define NAND_MFR_INTEL		0x89
+#define NAND_MFR_ATC		0x9b
 
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
-- 
1.9.1
