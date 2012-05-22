Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWq7o-0005v5-NB
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 14:31:49 +0000
Received: by dadm1 with SMTP id m1so9457565dad.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2012 07:31:46 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/2] mtd: nand: add Eon Silicon Solutions manufacturer ID
Date: Tue, 22 May 2012 07:30:47 -0700
Message-Id: <1337697048-4577-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eon's new NAND flash: EN27LN1G08.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_ids.c |    1 +
 include/linux/mtd/nand.h    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 621b70b..509a9f6 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -176,6 +176,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_MICRON, "Micron"},
 	{NAND_MFR_AMD, "AMD"},
 	{NAND_MFR_MACRONIX, "Macronix"},
+	{NAND_MFR_EON, "Eon"},
 	{0x0, "Unknown"}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 57977c6..53dcf49 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -559,6 +559,7 @@ struct nand_chip {
 #define NAND_MFR_MICRON		0x2c
 #define NAND_MFR_AMD		0x01
 #define NAND_MFR_MACRONIX	0xc2
+#define NAND_MFR_EON		0x92
 
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
-- 
1.7.5.4.2.g519b1
