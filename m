Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P10hj-0000k5-5a
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 17:44:32 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] mtd/nandsim: add module param for BBT handling
Date: Wed, 29 Sep 2010 19:43:54 +0200
Message-Id: <1285782234-32509-6-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
Cc: tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I used this to check the BBT on flash together with a hack in mtdchar in
order to read bad blocks.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nandsim.c |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index c25648b..a6a73aa 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -107,6 +107,7 @@ static char *gravepages = NULL;
 static unsigned int rptwear = 0;
 static unsigned int overridesize = 0;
 static char *cache_file = NULL;
+static unsigned int bbt;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -130,6 +131,7 @@ module_param(gravepages,     charp, 0400);
 module_param(rptwear,        uint, 0400);
 module_param(overridesize,   uint, 0400);
 module_param(cache_file,     charp, 0400);
+module_param(bbt,	     uint, 0400);
 
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
@@ -162,6 +164,7 @@ MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the I
 				 "The size is specified in erase blocks and as the exponent of a power of two"
 				 " e.g. 5 means a size of 32 erase blocks");
 MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of memory");
+MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in data area");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	4096
@@ -2264,6 +2267,18 @@ static int __init ns_init_module(void)
 	/* and 'badblocks' parameters to work */
 	chip->options   |= NAND_SKIP_BBTSCAN;
 
+	switch (bbt) {
+	case 2:
+		 chip->options |= NAND_USE_FLASH_BBT_NO_OOB;
+	case 1:
+		 chip->options |= NAND_USE_FLASH_BBT;
+	case 0:
+		break;
+	default:
+		NS_ERR("bbt has to be 0..2\n");
+		retval = -EINVAL;
+		goto error;
+	}
 	/*
 	 * Perform minimum nandsim structure initialization to handle
 	 * the initial ID read command correctly
@@ -2321,10 +2336,10 @@ static int __init ns_init_module(void)
 	if ((retval = init_nandsim(nsmtd)) != 0)
 		goto err_exit;
 
-	if ((retval = parse_badblocks(nand, nsmtd)) != 0)
+	if ((retval = nand_default_bbt(nsmtd)) != 0)
 		goto err_exit;
 
-	if ((retval = nand_default_bbt(nsmtd)) != 0)
+	if ((retval = parse_badblocks(nand, nsmtd)) != 0)
 		goto err_exit;
 
 	/* Register NAND partitions */
-- 
1.7.2.3
