Received: from mail228c50.megamailservers.eu ([91.136.10.238]
 helo=mail36c50.megamailservers.eu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gagZx-0001RB-Dn
 for linux-mtd@lists.infradead.org; Sat, 22 Dec 2018 12:40:31 +0000
Received: from mail.kenjo.org (c-4b63235c.042-336-73746f34.bbcust.telenor.se
 [92.35.99.75]) (authenticated bits=0)
 by mail36c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id wBMCeDwF028765
 for <linux-mtd@lists.infradead.org>; Sat, 22 Dec 2018 12:40:14 +0000
From: Kenneth Johansson <ken@kenjo.org>
To: linux-mtd@lists.infradead.org
Cc: Kenneth Johansson <ken@kenjo.org>
Subject: [PATCH v2] mtd: rawnand: nandsim: Add support to disable subpage
 writes.
Date: Sat, 22 Dec 2018 13:40:08 +0100
Message-Id: <20181222124008.28046-1-ken@kenjo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is needed if you try to use an already existing ubifs image that
is created for hardware that do not support subpage write.

It is not enough that you can select what nandchip to emulate as the
subpage support might not exist in the actual nand driver.

Signed-off-by: Kenneth Johansson <ken@kenjo.org>
---
 drivers/mtd/nand/raw/nandsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index c452819..3e9eaa2 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -110,6 +110,7 @@ static unsigned int overridesize = 0;
 static char *cache_file = NULL;
 static unsigned int bbt;
 static unsigned int bch;
+static unsigned int no_subpage;
 static u_char id_bytes[8] = {
 	[0] = CONFIG_NANDSIM_FIRST_ID_BYTE,
 	[1] = CONFIG_NANDSIM_SECOND_ID_BYTE,
@@ -142,6 +143,7 @@ module_param(overridesize,   uint, 0400);
 module_param(cache_file,     charp, 0400);
 module_param(bbt,	     uint, 0400);
 module_param(bch,	     uint, 0400);
+module_param(no_subpage,     uint, 0400);
 
 MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
@@ -177,6 +179,7 @@ MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of mem
 MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in data area");
 MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 				 "be correctable in 512-byte blocks");
+MODULE_PARM_DESC(no_subpage,	 "Disable use of subpage write");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	4096
@@ -2260,6 +2263,10 @@ static int __init ns_init_module(void)
 	/* and 'badblocks' parameters to work */
 	chip->options   |= NAND_SKIP_BBTSCAN;
 
+	/* turn off subpage to be able to simulate using a nand controller without subpage support */
+	if (no_subpage)
+		chip->options   |= NAND_NO_SUBPAGE_WRITE;
+
 	switch (bbt) {
 	case 2:
 		 chip->bbt_options |= NAND_BBT_NO_OOB;
-- 
2.7.4
