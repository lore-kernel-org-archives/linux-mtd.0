Received: from mail74c50.megamailservers.eu ([91.136.10.84]
 helo=mail92c50.megamailservers.eu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaMdF-0008Bp-TY
 for linux-mtd@lists.infradead.org; Fri, 21 Dec 2018 15:22:41 +0000
Received: from mail.kenjo.org (c-4b63235c.042-336-73746f34.bbcust.telenor.se
 [92.35.99.75]) (authenticated bits=0)
 by mail92c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id wBLFMHRv011516
 for <linux-mtd@lists.infradead.org>; Fri, 21 Dec 2018 15:22:19 +0000
Received: from filer.kenjo.org ([172.16.2.6])
 by mail.kenjo.org with esmtp (Exim 4.89)
 (envelope-from <kenjo@kenjo.org>) id 1gaMcz-00045A-1n
 for linux-mtd@lists.infradead.org; Fri, 21 Dec 2018 16:22:17 +0100
Received: from kenjo by filer.kenjo.org with local (Exim 4.89)
 (envelope-from <kenjo@filer.kenjo.org>) id 1gaMcy-000082-OR
 for linux-mtd@lists.infradead.org; Fri, 21 Dec 2018 16:22:16 +0100
To: <linux-mtd@lists.infradead.org>
Message-Id: <E1gaMcy-000082-OR@filer.kenjo.org>
From: kenneth johansson <kenjo@kenjo.org>
Date: Fri, 21 Dec 2018 16:22:16 +0100
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 9815710fa078241c683de1b49d9a0c9631502e17 Mon Sep 17 00:00:00 2001
From: Kenneth Johansson <kenjo@kenjo.org>
Date: Fri, 21 Dec 2018 15:46:24 +0100
Subject: [PATCH] mtd: rawnand: nandsim: Add support to disable subpage writes.
X-IMAPbase: 1545405463 2
Status: O
X-UID: 1

This is needed if you try to use an already existing ubifs image that
is created for hardware that do not support subpage write.

It is not enough that you can select what nandchip to emulate as the
subpage support might not exist in the actual nand driver.

Signed-off-by: Kenneth Johansson <ken@kenjo.org>
---
 drivers/mtd/nand/raw/nandsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index c452819..858ef30b 100644
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
 
+	/* turn off subpage to be able to read ubifs images created for hardware without subpage support */
+	if (no_subpage)
+		chip->options   |= NAND_NO_SUBPAGE_WRITE;
+
 	switch (bbt) {
 	case 2:
 		 chip->bbt_options |= NAND_BBT_NO_OOB;
-- 
2.7.4
