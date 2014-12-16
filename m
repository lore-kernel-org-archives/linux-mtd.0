Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0nqN-0000sc-1L
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 08:50:59 +0000
Received: by mail-wi0-f181.google.com with SMTP id r20so11710725wiv.2
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 00:50:37 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH V2] mtd: bcm47xxpart: support SquashFS with an original magic
Date: Tue, 16 Dec 2014 09:50:25 +0100
Message-Id: <1418719825-21314-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1418715606-18949-1-git-send-email-zajec5@gmail.com>
References: <1418715606-18949-1-git-send-email-zajec5@gmail.com>
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

SquashFS is supposed to use magic defined as SQUASHFS_MAGIC. What we
were supporting so far (SQSH_MAGIC) is something ZTE specific.
This patch adds support for Xiaomi R1D.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V2: s/SQSH/SHSQ/ to emphase this weird endianness
---
 drivers/mtd/bcm47xxpart.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 4ad3928..c0720c1 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -15,6 +15,8 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
+#include <uapi/linux/magic.h>
+
 /*
  * NAND flash on Netgear R6250 was verified to contain 15 partitions.
  * This will result in allocating too big array for some old devices, but the
@@ -39,7 +41,7 @@
 #define ML_MAGIC1			0x39685a42
 #define ML_MAGIC2			0x26594131
 #define TRX_MAGIC			0x30524448
-#define SQSH_MAGIC			0x71736873	/* shsq */
+#define SHSQ_MAGIC			0x71736873	/* shsq (weird ZTE H218N endianness) */
 #define UBI_EC_MAGIC			0x23494255	/* UBI# */
 
 struct trx_header {
@@ -233,7 +235,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Squashfs on devices not using TRX */
-		if (buf[0x000 / 4] == SQSH_MAGIC) {
+		if (le32_to_cpu(buf[0x000 / 4]) == SQUASHFS_MAGIC ||
+		    buf[0x000 / 4] == SHSQ_MAGIC) {
 			bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
 					     offset, 0);
 			continue;
-- 
1.8.4.5
