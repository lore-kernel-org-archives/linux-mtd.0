Received: from mail-io0-x234.google.com ([2607:f8b0:4001:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2ZSW-0001rr-Mx
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2015 06:58:13 +0000
Received: by ioir85 with SMTP id r85so130505865ioi.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2015 22:57:51 -0800 (PST)
From: Nikolay Martynov <mar.kolya@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Nikolay Martynov <mar.kolya@gmail.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com
Subject: [PATCH] mtd: nandsim: use id_bytes exactly as passed
Date: Sat, 28 Nov 2015 01:57:04 -0500
Message-Id: <1448693824-8696-1-git-send-email-mar.kolya@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently when 5 bytes are passed as id_bytes the actual id
would be set to 6 bytes long. This means that it is not possible
to properly emulate chips with 5 bytes ids.

This patch addresses this problem

Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
---
 drivers/mtd/nand/nandsim.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 52c0c1a..4659540 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -107,6 +107,7 @@ static unsigned int overridesize = 0;
 static char *cache_file = NULL;
 static unsigned int bbt;
 static unsigned int bch;
+static unsigned int id_bytes_length;
 static u_char id_bytes[8] = {
 	[0] = CONFIG_NANDSIM_FIRST_ID_BYTE,
 	[1] = CONFIG_NANDSIM_SECOND_ID_BYTE,
@@ -115,7 +116,7 @@ static u_char id_bytes[8] = {
 	[4 ... 7] = 0xFF,
 };
 
-module_param_array(id_bytes, byte, NULL, 0400);
+module_param_array(id_bytes, byte, &id_bytes_length, 0400);
 module_param_named(first_id_byte, id_bytes[0], byte, 0400);
 module_param_named(second_id_byte, id_bytes[1], byte, 0400);
 module_param_named(third_id_byte, id_bytes[2], byte, 0400);
@@ -2288,14 +2289,14 @@ static int __init ns_init_module(void)
 	 * Perform minimum nandsim structure initialization to handle
 	 * the initial ID read command correctly
 	 */
-	if (id_bytes[6] != 0xFF || id_bytes[7] != 0xFF)
-		nand->geom.idbytes = 8;
-	else if (id_bytes[4] != 0xFF || id_bytes[5] != 0xFF)
-		nand->geom.idbytes = 6;
-	else if (id_bytes[2] != 0xFF || id_bytes[3] != 0xFF)
-		nand->geom.idbytes = 4;
-	else
-		nand->geom.idbytes = 2;
+	if (id_bytes_length > 0) {
+		nand->geom.idbytes = id_bytes_length;
+	} else {
+		if (id_bytes[2] != 0xFF || id_bytes[3] != 0xFF)
+			nand->geom.idbytes = 4;
+		else
+			nand->geom.idbytes = 2;
+	}
 	nand->regs.status = NS_STATUS_OK(nand);
 	nand->nxstate = STATE_UNKNOWN;
 	nand->options |= OPT_PAGE512; /* temporary value */
-- 
2.6.3
