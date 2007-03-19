Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTFRo-0007BF-0v
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 06:51:01 -0400
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2JAoFGX024105
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 12:50:35 +0200
Message-ID: <45FE6AA7.7000200@nokia.com>
Date: Mon, 19 Mar 2007 12:49:11 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] NAND: Enhance nandsim to allow arbitrary NAND size
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A new module parameter has been added called 'overridesize',
which overrides the size that would be determined by the
ID bytes. 'overridesize' is specified in erase blocks and
as the exponent of a power of two e.g. 5 means a size of
32 erase blocks.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |   21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 13c5927..c34fa87 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -100,6 +100,7 @@ static char *weakpages = NULL;
 static unsigned int bitflips = 0;
 static char *gravepages = NULL;
 static unsigned int rptwear = 0;
+static unsigned int overridesize = 0;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -121,8 +122,9 @@ module_param(weakpages,      charp, 0400
 module_param(bitflips,       uint, 0400);
 module_param(gravepages,     charp, 0400);
 module_param(rptwear,        uint, 0400);
+module_param(overridesize,   uint, 0400);
 
-MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash 'read ID' command (manufaturer ID)");
+MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
 MODULE_PARM_DESC(third_id_byte,  "The third byte returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(fourth_id_byte, "The fourth byte returned by NAND Flash 'read ID' command");
@@ -149,6 +151,9 @@ MODULE_PARM_DESC(gravepages,     "Pages 
 				 " separated by commas e.g. 1401:2 means page 1401"
 				 " can be read only twice before failing");
 MODULE_PARM_DESC(rptwear,        "Number of erases inbetween reporting wear, if not zero");
+MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the ID bytes. "
+				 "The size is specified in erase blocks and as the exponent of a power of two"
+				 " e.g. 5 means a size of 32 erase blocks");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	2048
@@ -1958,6 +1963,8 @@ static int __init ns_init_module(void)
 	chip->verify_buf = ns_nand_verify_buf;
 	chip->read_word  = ns_nand_read_word;
 	chip->ecc.mode   = NAND_ECC_SOFT;
+	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
+	/* and 'badblocks' parameters to work */
 	chip->options   |= NAND_SKIP_BBTSCAN;
 
 	/*
@@ -1998,6 +2005,18 @@ static int __init ns_init_module(void)
 		goto error;
 	}
 
+	if (overridesize) {
+		u_int32_t new_size = nsmtd->erasesize << overridesize;
+		if (new_size >> overridesize != nsmtd->erasesize) {
+			NS_ERR("overridesize is too big\n");
+			goto err_exit;
+		}
+		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
+		nsmtd->size = new_size;
+		chip->chipsize = new_size;
+		chip->chip_shift = ffs(new_size) - 1;
+	}
+
 	if ((retval = setup_wear_reporting(nsmtd)) != 0)
 		goto err_exit;
 
-- 
1.4.3
