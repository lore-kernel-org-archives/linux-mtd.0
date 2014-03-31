Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUle8-0002J6-Ek
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 23:29:42 +0000
From: David Mosberger <davidm@egauge.net>
To: pekon@ti.com
Subject: [PATCH v4 4/5] mtd: nand: Allocate extra buffers needed for on-die
 ECC controller.
Date: Mon, 31 Mar 2014 17:28:56 -0600
Message-Id: <1396308537-16013-5-git-send-email-davidm@egauge.net>
In-Reply-To: <1396308537-16013-1-git-send-email-davidm@egauge.net>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>, gsi@denx.de,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
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
index 435ef44..834352a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3935,13 +3935,24 @@ int nand_scan_tail(struct mtd_info *mtd)
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
index dbb99b3..456809b 100644
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
