Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VuRSi-0006Bx-Hh
 for linux-mtd@lists.infradead.org; Sat, 21 Dec 2013 18:39:45 +0000
Received: by mail-ee0-f43.google.com with SMTP id c13so1614705eek.16
 for <linux-mtd@lists.infradead.org>; Sat, 21 Dec 2013 10:39:22 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/2] mtd: bcm47xxpart: find boot partition by CFE magic
Date: Sat, 21 Dec 2013 19:39:11 +0100
Message-Id: <1387651152-3884-1-git-send-email-zajec5@gmail.com>
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

Some devices have even nicer-to-recognize CFE thanks to the magic.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
This patch adds one line wider than 80 chars, however this improves code
readability thanks to keeping one rule per line. I hope this can be
accepted in this case.
---
Both patches were verified with
./verify ../linux/l2-mtd/ mips-bcm47xx_defconfig < patch
---
 drivers/mtd/bcm47xxpart.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 931746d..b72a3ac 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -23,10 +23,11 @@
  * Amount of bytes we read when analyzing each block of flash memory.
  * Set it big enough to allow detecting partition and reading important data.
  */
-#define BCM47XXPART_BYTES_TO_READ	0x404
+#define BCM47XXPART_BYTES_TO_READ	0x4e8
 
 /* Magics */
 #define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
+#define CFE_MAGIC			0x43464531	/* 1EFC */
 #define FACTORY_MAGIC			0x59544346	/* FCTY */
 #define POT_MAGIC1			0x54544f50	/* POTT */
 #define POT_MAGIC2			0x504f		/* OP */
@@ -102,8 +103,9 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 
-		/* CFE has small NVRAM at 0x400 */
-		if (buf[0x400 / 4] == NVRAM_HEADER) {
+		/* Magic or small NVRAM at 0x400 */
+		if ((buf[0x4e0 / 4] == CFE_MAGIC && buf[0x4e4 / 4] == CFE_MAGIC) ||
+		    (buf[0x400 / 4] == NVRAM_HEADER)) {
 			bcm47xxpart_add_part(&parts[curr_part++], "boot",
 					     offset, MTD_WRITEABLE);
 			continue;
-- 
1.7.10.4
