Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TyGvN-0001Zr-Nv
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 07:08:38 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 2/3] mtd: add a new table for the unparsable nand chips
Date: Thu, 24 Jan 2013 14:11:40 +0800
Message-ID: <1359007901-26464-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1359007901-26464-1-git-send-email-b32955@freescale.com>
References: <1359007901-26464-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have 4 Toshiba nand chips which can not be parsed out by the
id data.  Add a new table for the unparsable nand chips.

It makes mess if we add these entries to the nand_flash_ids table.
The entries in the nand_flash_ids stands for a class of nand chips.
But the unparsable nand chips are just some singular chips.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_ids.c |   22 ++++++++++++++++++++++
 include/linux/mtd/nand.h    |    1 +
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 9dc2e54..c1e32d2 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -11,6 +11,28 @@
 #include <linux/module.h>
 #include <linux/mtd/nand.h>
 #include <linux/sizes.h>
+#include <linux/sizes.h>
+
+/* This table uses the full ID data as the keyword. */
+struct nand_flash_dev nand_flash_full_ids[] = {
+	/* TOSHIBA */
+	{"TC58NVG2S0F 4G 3.3V 8-bit ",
+		{0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08},
+			SZ_4K, SZ_512, SZ_256K, 0, 8, 224},
+	{"TC58NVG3S0F 8G 3.3V 8-bit ",
+		{0x98, 0xd3, 0x90, 0x26, 0x76, 0x15, 0x02, 0x08},
+			SZ_4K, SZ_1K, SZ_256K, 0, 8, 232},
+	{"TC58NVG5D2 32G 3.3V 8-bit ",
+		{0x98, 0xd7, 0x94, 0x32, 0x76, 0x56, 0x09, 0x00},
+			SZ_8K, SZ_4K, SZ_1M, 0, 8, 640},
+	{"TC58NVG6D2 64G 3.3V 8-bit ",
+		{0x98, 0xde, 0x94, 0x82, 0x76, 0x56, 0x04, 0x20},
+			SZ_8K, SZ_8K, SZ_2M, 0, 8, 640},
+
+	/* end here */
+	{NULL,}
+};
+
 
 /*
 *	Chip ID list
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5293447..346a389 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -620,6 +620,7 @@ struct nand_manufacturers {
 };
 
 extern struct nand_flash_dev nand_flash_ids[];
+extern struct nand_flash_dev nand_flash_full_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
 extern int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd);
-- 
1.7.0.4
