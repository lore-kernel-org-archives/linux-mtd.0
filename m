Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ0bC-00082T-H2
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 14:38:54 +0000
Received: by padck2 with SMTP id ck2so28309746pad.0
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 07:38:29 -0700 (PDT)
From: Joseph East <eastyjr@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joseph East <eastyjr@gmail.com>
Subject: [PATCH V2 3/4] mtd: bcm47xxpart.c: Adding T_Meter partition detection
Date: Sun, 26 Jul 2015 00:07:42 +0930
Message-Id: <1437835063-58407-4-git-send-email-eastyjr@gmail.com>
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
 drivers/mtd/bcm47xxpart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index a27d185..ef6db73 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -39,6 +39,7 @@
 #define NVRAM_HEADER			0x48534C46	/* FLSH */
 #define POT_MAGIC1			0x54544f50	/* POTT */
 #define POT_MAGIC2			0x504f		/* OP */
+#define T_METER_MAGIC			0x4D540000	/* MT */
 #define ML_MAGIC1			0x39685a42
 #define ML_MAGIC2			0x26594131
 #define TRX_MAGIC			0x30524448
@@ -178,6 +179,15 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 
+		/* T_Meter */
+		if ((le32_to_cpu(buf[0x000 / 4]) & 0xFFFF0000) == T_METER_MAGIC &&
+		    (le32_to_cpu(buf[0x030 / 4]) & 0xFFFF0000) == T_METER_MAGIC &&
+		    (le32_to_cpu(buf[0x060 / 4]) & 0xFFFF0000) == T_METER_MAGIC) {
+			bcm47xxpart_add_part(&parts[curr_part++], "T_Meter", offset,
+					     MTD_WRITEABLE);
+			continue;
+		}
+
 		/* TRX */
 		if (buf[0x000 / 4] == TRX_MAGIC) {
 			if (BCM47XXPART_MAX_PARTS - curr_part < 4) {
-- 
2.4.6
