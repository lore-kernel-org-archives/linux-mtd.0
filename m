Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZd1C-0000lc-L1
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 09:49:51 +0000
Received: by mail-wi0-f170.google.com with SMTP id hi2so970395wib.5
 for <linux-mtd@lists.infradead.org>; Thu, 02 Oct 2014 02:49:28 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: bcm47xxpart: alloc memory for more partitions
Date: Thu,  2 Oct 2014 11:48:46 +0200
Message-Id: <1412243326-6742-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is needed for some new Netgear devices (e.g. R6250).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 8057f52..f2db4d7 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -15,8 +15,12 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
-/* 10 parts were found on sflash on Netgear WNDR4500 */
-#define BCM47XXPART_MAX_PARTS		12
+/*
+ * NAND flash on Netgear R6250 was verified to contain 15 partitions.
+ * This will result in allocating too big array for some old devices, but the
+ * memory will be freed soon anyway (see mtd_device_parse_register).
+ */
+#define BCM47XXPART_MAX_PARTS		20
 
 /*
  * Amount of bytes we read when analyzing each block of flash memory.
-- 
1.8.4.5
