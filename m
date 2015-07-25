Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ0bF-00083o-Oc
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 14:38:57 +0000
Received: by pachj5 with SMTP id hj5so28258923pac.3
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 07:38:33 -0700 (PDT)
From: Joseph East <eastyjr@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joseph East <eastyjr@gmail.com>
Subject: [PATCH V2 4/4] mtd: bcm47xxpart.c: Adding Belkin TRX signatures (Play
 max series)
Date: Sun, 26 Jul 2015 00:07:43 +0930
Message-Id: <1437835063-58407-5-git-send-email-eastyjr@gmail.com>
In-Reply-To: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
References: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/bcm47xxpart.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index ef6db73..669e24b 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -45,6 +45,10 @@
 #define TRX_MAGIC			0x30524448
 #define SHSQ_MAGIC			0x71736873	/* shsq (weird ZTE H218N endianness) */
 #define UBI_EC_MAGIC			0x23494255	/* UBI# */
+#define BELKIN_F7D3301_MAGIC		0x20100322	/* Belkin TRX */
+#define BELKIN_F7D3302_MAGIC		0x20090928
+#define BELKIN_F7D4302_MAGIC		0x20101006
+#define BELKIN_F7D4401_MAGIC		0x00018517
 
 struct trx_header {
 	uint32_t magic;
@@ -55,6 +59,19 @@ struct trx_header {
 	uint32_t offset[3];
 } __packed;
 
+static bool is_trx_magic(uint32_t magic) {
+	switch (magic) {
+	case TRX_MAGIC:
+	case BELKIN_F7D3301_MAGIC:
+	case BELKIN_F7D3302_MAGIC:
+	case BELKIN_F7D4302_MAGIC:
+	case BELKIN_F7D4401_MAGIC:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void bcm47xxpart_add_part(struct mtd_partition *part, const char *name,
 				 u64 offset, uint32_t mask_flags)
 {
@@ -189,7 +206,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* TRX */
-		if (buf[0x000 / 4] == TRX_MAGIC) {
+		if (is_trx_magic(buf[0x000 / 4])) {
 			if (BCM47XXPART_MAX_PARTS - curr_part < 4) {
 				pr_warn("Not enough partitions left to register trx, scanning stopped!\n");
 				break;
-- 
2.4.6
