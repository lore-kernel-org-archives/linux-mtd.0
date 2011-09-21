Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6BjS-0000Du-BN
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 01:36:15 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 10/14] mtd: nand: scrub BBT on ECC errors
Date: Tue, 20 Sep 2011 18:35:34 -0700
Message-ID: <1316568934-21582-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-11-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-11-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that `read_bbt()' returns ECC error codes properly, we handle those
codes when checking the integrity of our flash-based BBT.

The modifications can be described by this new policy:

*) On any uncorrected ECC error, we invalidate the corresponding table
   and retry our version-checking integrity logic.
*) On corrected bitflips, we mark both tables for re-writing to flash
   (a.k.a. scrubbing).

Current integrity checks (i.e., comparing version numbers, etc.) should
take care of all the cases that result in rescanning the device for bad
blocks or falling back to the BBT as found in the mirror descriptor.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: change to `mtd_is_*' prefix

 drivers/mtd/nand/nand_bbt.c |   29 ++++++++++++++++++++++++-----
 1 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 0ed8591..11185aa 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -882,7 +882,7 @@ static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *b
  */
 static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
 {
-	int i, chips, writeops, create, chipsel, res;
+	int i, chips, writeops, create, chipsel, res, res2;
 	struct nand_chip *this = mtd->priv;
 	struct nand_bbt_descr *td = this->bbt_td;
 	struct nand_bbt_descr *md = this->bbt_md;
@@ -899,6 +899,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 		create = 0;
 		rd = NULL;
 		rd2 = NULL;
+		res = res2 = 0;
 		/* Per chip or per device? */
 		chipsel = (td->options & NAND_BBT_PERCHIP) ? i : -1;
 		/* Mirrored table available? */
@@ -951,11 +952,29 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 		}
 
 		/* Read back first? */
-		if (rd)
-			read_abs_bbt(mtd, buf, rd, chipsel);
+		if (rd) {
+			res = read_abs_bbt(mtd, buf, rd, chipsel);
+			if (mtd_is_eccerr(res)) {
+				/* Mark table as invalid */
+				rd->pages[i] = -1;
+				i--;
+				continue;
+			}
+		}
 		/* If they weren't versioned, read both */
-		if (rd2)
-			read_abs_bbt(mtd, buf, rd2, chipsel);
+		if (rd2) {
+			res2 = read_abs_bbt(mtd, buf, rd2, chipsel);
+			if (mtd_is_eccerr(res2)) {
+				/* Mark table as invalid */
+				rd2->pages[i] = -1;
+				i--;
+				continue;
+			}
+		}
+
+		/* Scrub the flash table(s)? */
+		if (mtd_is_bitflip(res) || mtd_is_bitflip(res2))
+			writeops = 0x03;
 
 		/* Write the bad block table to the device? */
 		if ((writeops & 0x01) && (td->options & NAND_BBT_WRITE)) {
-- 
1.7.5.4
