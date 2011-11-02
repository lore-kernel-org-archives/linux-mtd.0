Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RLhWr-0004an-4C
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2011 20:35:21 +0000
Received: by qap15 with SMTP id 15so645051qap.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Nov 2011 13:35:19 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] mtd: nand: add 512 Mbit device code (Macronix)
Date: Wed,  2 Nov 2011 13:34:43 -0700
Message-Id: <1320266084-18131-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1320266084-18131-1-git-send-email-computersforpeace@gmail.com>
References: <1320266084-18131-1-git-send-email-computersforpeace@gmail.com>
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

Macronix MX30LF1208AA is a 512 Mbit NAND with device code 0xF0.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_ids.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 56c688d..af4fe8c 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -73,11 +73,12 @@ struct nand_flash_dev nand_flash_ids[] = {
 #define LP_OPTIONS (NAND_SAMSUNG_LP_OPTIONS | NAND_NO_READRDY | NAND_NO_AUTOINCR)
 #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
-	/*512 Megabit */
+	/* 512 Megabit */
 	{"NAND 64MiB 1,8V 8-bit",	0xA2, 0,  64, 0, LP_OPTIONS},
 	{"NAND 64MiB 1,8V 8-bit",	0xA0, 0,  64, 0, LP_OPTIONS},
 	{"NAND 64MiB 3,3V 8-bit",	0xF2, 0,  64, 0, LP_OPTIONS},
 	{"NAND 64MiB 3,3V 8-bit",	0xD0, 0,  64, 0, LP_OPTIONS},
+	{"NAND 64MiB 3,3V 8-bit",	0xF0, 0,  64, 0, LP_OPTIONS},
 	{"NAND 64MiB 1,8V 16-bit",	0xB2, 0,  64, 0, LP_OPTIONS16},
 	{"NAND 64MiB 1,8V 16-bit",	0xB0, 0,  64, 0, LP_OPTIONS16},
 	{"NAND 64MiB 3,3V 16-bit",	0xC2, 0,  64, 0, LP_OPTIONS16},
-- 
1.7.5.4
