Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN39-0007TK-Sb
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/9] mtd: devices: add const qualifiers
Date: Tue, 12 Mar 2013 13:08:27 +0200
Message-Id: <1363086508-2405-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
References: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Be a bit stricter and add few more 'const' qualifiers.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/bcm47xxsflash.c |    2 +-
 drivers/mtd/devices/docg3.c         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 9526628..f86a787 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -10,7 +10,7 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Serial flash driver for BCMA bus");
 
-static const char *probes[] = { "bcm47xxpart", NULL };
+static const char * const probes[] = { "bcm47xxpart", NULL };
 
 static int bcm47xxsflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 			      size_t *retlen, u_char *buf)
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 8510ccb..a8caad2 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -123,7 +123,7 @@ static inline void doc_flash_address(struct docg3 *docg3, u8 addr)
 	doc_writeb(docg3, addr, DOC_FLASHADDRESS);
 }
 
-static char const *part_probes[] = { "cmdlinepart", "saftlpart", NULL };
+static char const * const part_probes[] = { "cmdlinepart", "saftlpart", NULL };
 
 static int doc_register_readb(struct docg3 *docg3, int reg)
 {
-- 
1.7.10.4
