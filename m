Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RLhWh-0004WW-Qz
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2011 20:35:13 +0000
Received: by pzk33 with SMTP id 33so1252612pzk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Nov 2011 13:35:08 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] mtd: nand: add Macronix manufacturer
Date: Wed,  2 Nov 2011 13:34:42 -0700
Message-Id: <1320266084-18131-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Macronix is produing SLC NAND MX30LF1208AA, so add their manufacturer
code to the manufacturer lists.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_ids.c |    1 +
 include/linux/mtd/nand.h    |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 00cf1b0..56c688d 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -176,6 +176,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_HYNIX, "Hynix"},
 	{NAND_MFR_MICRON, "Micron"},
 	{NAND_MFR_AMD, "AMD"},
+	{NAND_MFR_MACRONIX, "Macronix"},
 	{0x0, "Unknown"}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 904131b..63b5a8b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -555,6 +555,7 @@ struct nand_chip {
 #define NAND_MFR_HYNIX		0xad
 #define NAND_MFR_MICRON		0x2c
 #define NAND_MFR_AMD		0x01
+#define NAND_MFR_MACRONIX	0xc2
 
 /**
  * struct nand_flash_dev - NAND Flash Device ID Structure
-- 
1.7.5.4
