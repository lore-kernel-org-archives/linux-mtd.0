Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPdA5-0002jb-TY
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:16:22 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so1447669pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:16:21 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 08/10] mtd: gpmi-nand: utilize oob_requested parameter
Date: Wed,  2 May 2012 10:15:02 -0700
Message-Id: <1335978904-8005-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Wolfram Sang <w.sang@pengutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't read OOB if the caller didn't request it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   35 +++++++++++++++++--------------
 1 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index ec16f2e..805bcf3 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -907,22 +907,25 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->ecc_stats.corrected += corrected;
 	}
 
-	/*
-	 * It's time to deliver the OOB bytes. See gpmi_ecc_read_oob() for
-	 * details about our policy for delivering the OOB.
-	 *
-	 * We fill the caller's buffer with set bits, and then copy the block
-	 * mark to th caller's buffer. Note that, if block mark swapping was
-	 * necessary, it has already been done, so we can rely on the first
-	 * byte of the auxiliary buffer to contain the block mark.
-	 */
-	memset(chip->oob_poi, ~0, mtd->oobsize);
-	chip->oob_poi[0] = ((uint8_t *) auxiliary_virt)[0];
+	if (oob_required) {
+		/*
+		 * It's time to deliver the OOB bytes. See gpmi_ecc_read_oob()
+		 * for details about our policy for delivering the OOB.
+		 *
+		 * We fill the caller's buffer with set bits, and then copy the
+		 * block mark to th caller's buffer. Note that, if block mark
+		 * swapping was necessary, it has already been done, so we can
+		 * rely on the first byte of the auxiliary buffer to contain
+		 * the block mark.
+		 */
+		memset(chip->oob_poi, ~0, mtd->oobsize);
+		chip->oob_poi[0] = ((uint8_t *) auxiliary_virt)[0];
 
-	read_page_swap_end(this, buf, mtd->writesize,
-			this->payload_virt, this->payload_phys,
-			nfc_geo->payload_size,
-			payload_virt, payload_phys);
+		read_page_swap_end(this, buf, mtd->writesize,
+				this->payload_virt, this->payload_phys,
+				nfc_geo->payload_size,
+				payload_virt, payload_phys);
+	}
 exit_nfc:
 	return ret;
 }
-- 
1.7.5.4.2.g519b1
