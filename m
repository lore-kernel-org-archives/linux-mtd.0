Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZmgR-0000IA-3u
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 19:36:48 +0000
From: David Mosberger <davidm@egauge.net>
To: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dedekind1@gmail.com, gsi@denx.de, pekon@ti.com
Subject: [PATCH v5 4/5] mtd: nand: Allocate extra buffers needed for on-die
 ECC controller.
Date: Mon, 14 Apr 2014 13:35:33 -0600
Message-Id: <1397504134-32178-5-git-send-email-davidm@egauge.net>
In-Reply-To: <1397504134-32178-1-git-send-email-davidm@egauge.net>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To avoid unnecessary rewrites, it is necessary to count the number of
actual bitflips that occurred when the NAND_STATUS_REWRITE bit is set.
This patch introduces the extra buffers needed to implement that
counting.  The actual counting is in the next patch.

Signed-off-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |   13 ++++++++++++-
 include/linux/mtd/nand.h     |    2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7092875..84409db 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3939,13 +3939,24 @@ int nand_scan_tail(struct mtd_info *mtd)
 			!(chip->bbt_options & NAND_BBT_USE_FLASH));
 
 	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		size_t on_die_bufsz = 0;
+
+		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
+			on_die_bufsz = 2*(mtd->writesize + mtd->oobsize);
+
 		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
-				+ mtd->oobsize * 3, GFP_KERNEL);
+				+ mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
 		if (!nbuf)
 			return -ENOMEM;
 		nbuf->ecccalc = (uint8_t *)(nbuf + 1);
 		nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
 		nbuf->databuf = nbuf->ecccode + mtd->oobsize;
+		if (chip->ecc.mode == NAND_ECC_HW_ON_DIE) {
+			nbuf->chkbuf = (nbuf->databuf + mtd->writesize
+					+ mtd->oobsize);
+			nbuf->rawbuf = (nbuf->chkbuf + mtd->writesize
+					+ mtd->oobsize);
+		}
 
 		chip->buffers = nbuf;
 	} else {
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index d09f0a0..7725bbc 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -533,6 +533,8 @@ struct nand_buffers {
 	uint8_t	*ecccalc;
 	uint8_t	*ecccode;
 	uint8_t *databuf;
+	uint8_t *chkbuf;
+	uint8_t *rawbuf;
 };
 
 /**
-- 
1.7.9.5
