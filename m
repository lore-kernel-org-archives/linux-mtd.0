Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OZN-0001dX-0G
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:18:02 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 09/14] mtd: nand: report ECC errors properly when reading BBT
Date: Wed, 7 Sep 2011 13:13:36 -0700
Message-ID: <1315426421-16243-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of just printing a warning when encountering ECC errors, we
should return a proper error status and print a more informative
warning. Later, we will handle these error messages in the upper layers
of the BBT scan.

Note that this patch makes our check for ECC error codes a little bit
more restrictive, leaving all unrecognized errors to the generic "else"
clause. This shouldn't cause problems and could even be a benefit.

This code is based on some findings reported by Matthieu Castet.

Reported-by: Matthieu CASTET <matthieu.castet@parrot.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 9d4f889..37df614 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -178,7 +178,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
 static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		struct nand_bbt_descr *td, int offs)
 {
-	int res, i, j, act = 0;
+	int res, ret = 0, i, j, act = 0;
 	struct nand_chip *this = mtd->priv;
 	size_t retlen, len, totlen;
 	loff_t from;
@@ -204,11 +204,18 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		}
 		res = mtd->read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
-			if (retlen != len) {
-				pr_info("nand_bbt: error reading bad block table\n");
+			if (is_uncorrected_ecc_error(res)) {
+				pr_info("nand_bbt: ECC error in BBT at "
+					"0x%012llx\n", from & ~mtd->writesize);
+				return res;
+			} else if (is_corrected_ecc_error(res)) {
+				pr_info("nand_bbt: corrected error in BBT at "
+					"0x%012llx\n", from & ~mtd->writesize);
+				ret = res;
+			} else {
+				pr_info("nand_bbt: error reading BBT\n");
 				return res;
 			}
-			pr_warn("nand_bbt: ECC error while reading bad block table\n");
 		}
 
 		/* Analyse data */
@@ -242,7 +249,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		totlen -= len;
 		from += len;
 	}
-	return 0;
+	return ret;
 }
 
 /**
-- 
1.7.5.4
