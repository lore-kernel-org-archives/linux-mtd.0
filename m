Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ebDJu-00040k-25
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 22:33:36 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: add ->setup_data_interface() support for Marvell
 NFCv1
Date: Mon, 15 Jan 2018 23:32:54 +0100
Message-Id: <20180115223254.9351-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First generation of Marvell NAND flash controllers (eg. embedded in PXA
boards) did not make use of the NAND core hook ->setup_data_interface()
to setup controller timings. Add support for it.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/marvell_nand.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
index 10f108cc08e2..7db870ae1b07 100644
--- a/drivers/mtd/nand/marvell_nand.c
+++ b/drivers/mtd/nand/marvell_nand.c
@@ -379,6 +379,8 @@ struct marvell_nfc_timings {
  * return the number of clock periods.
  */
 #define TO_CYCLES(ps, period_ns) (DIV_ROUND_UP(ps / 1000, period_ns))
+#define TO_CYCLES64(ps, period_ns) (DIV_ROUND_UP_ULL(div_u64(ps, 1000), \
+						     period_ns))
 
 /**
  * NAND driver structure filled during the parsing of the ->exec_op() subop
@@ -2239,31 +2241,47 @@ static int marvell_nfc_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	nfc_tmg.tRHW = TO_CYCLES(max_t(int, sdr->tRHW_min, sdr->tCCS_min),
 				 period_ns);
 
-	/* Use WAIT_MODE (wait for RB line) instead of only relying on delays */
-	nfc_tmg.tR = TO_CYCLES(sdr->tWB_max, period_ns);
+	/*
+	 * NFCv2: Use WAIT_MODE (wait for RB line), do not rely only on delays.
+	 * NFCv1: No WAIT_MODE, tR must be maximal.
+	 */
+	if (nfc->caps->is_nfcv2)
+		nfc_tmg.tR = TO_CYCLES(sdr->tWB_max, period_ns);
+	else
+		nfc_tmg.tR = TO_CYCLES64(sdr->tR_max, period_ns) -
+			nfc_tmg.tCH - 3;
+
+	if (nfc_tmg.tR < 0)
+		return -EINVAL;
 
 	if (chipnr < 0)
 		return 0;
 
 	marvell_nand->ndtr0 =
 		NDTR0_TRP(nfc_tmg.tRP) |
-		NDTR0_TRH(nfc_tmg.tRH) |
 		NDTR0_ETRP(nfc_tmg.tRP) |
+		NDTR0_TRH(nfc_tmg.tRH) |
 		NDTR0_TWP(nfc_tmg.tWP) |
 		NDTR0_TWH(nfc_tmg.tWH) |
 		NDTR0_TCS(nfc_tmg.tCS) |
-		NDTR0_TCH(nfc_tmg.tCH) |
-		NDTR0_RD_CNT_DEL(read_delay) |
-		NDTR0_SELCNTR |
-		NDTR0_TADL(nfc_tmg.tADL);
+		NDTR0_TCH(nfc_tmg.tCH);
 
 	marvell_nand->ndtr1 =
 		NDTR1_TAR(nfc_tmg.tAR) |
 		NDTR1_TWHR(nfc_tmg.tWHR) |
-		NDTR1_TRHW(nfc_tmg.tRHW) |
-		NDTR1_WAIT_MODE |
 		NDTR1_TR(nfc_tmg.tR);
 
+	if (nfc->caps->is_nfcv2) {
+		marvell_nand->ndtr0 |=
+			NDTR0_RD_CNT_DEL(read_delay) |
+			NDTR0_SELCNTR |
+			NDTR0_TADL(nfc_tmg.tADL);
+
+		marvell_nand->ndtr1 |=
+			NDTR1_TRHW(nfc_tmg.tRHW) |
+			NDTR1_WAIT_MODE;
+	}
+
 	return 0;
 }
 
@@ -2398,8 +2416,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 
 	chip->exec_op = marvell_nfc_exec_op;
 	chip->select_chip = marvell_nfc_select_chip;
-	if (nfc->caps->is_nfcv2 &&
-	    !of_property_read_bool(np, "marvell,nand-keep-config"))
+	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
 		chip->setup_data_interface = marvell_nfc_setup_data_interface;
 
 	mtd = nand_to_mtd(chip);
-- 
2.11.0
