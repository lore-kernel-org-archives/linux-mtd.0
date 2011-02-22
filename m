Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Prppz-0005aS-JT
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2011 10:51:24 +0000
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/1] omap3: nand: report corrected ecc errors
From: John Ogness <john.ogness@linutronix.de>
Date: Tue, 22 Feb 2011 11:50:56 +0100
Message-ID: <87oc64qr5b.fsf@vostro.fn.ogness.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Ogness <john.ogness@linutronix.de>

The number of corrected ECC errors should be reported since other MTD
systems make use of this information (such as UBI data scrubbing).

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
Patch against linux-next-20110221.

 drivers/mtd/nand/omap2.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 4e33972..a58465c 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -773,7 +773,7 @@ static int omap_compare_ecc(u8 *ecc_data1,	/* read from NAND memory */
 
 		page_data[find_byte] ^= (1 << find_bit);
 
-		return 0;
+		return 1;
 	default:
 		if (isEccFF) {
 			if (ecc_data2[0] == 0 &&
@@ -803,6 +803,7 @@ static int omap_correct_data(struct mtd_info *mtd, u_char *dat,
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 							mtd);
 	int blockCnt = 0, i = 0, ret = 0;
+	int stat = 0;
 
 	/* Ex NAND_ECC_HW12_2048 */
 	if ((info->nand.ecc.mode == NAND_ECC_HW) &&
@@ -816,12 +817,13 @@ static int omap_correct_data(struct mtd_info *mtd, u_char *dat,
 			ret = omap_compare_ecc(read_ecc, calc_ecc, dat);
 			if (ret < 0)
 				return ret;
+			stat += ret;
 		}
 		read_ecc += 3;
 		calc_ecc += 3;
 		dat      += 512;
 	}
-	return 0;
+	return stat;
 }
 
 /**
-- 
1.5.6.5
