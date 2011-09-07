Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OXx-0001W3-6J
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:16:33 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 05/14] mtd: nand: remove unnecessary variable
Date: Wed, 7 Sep 2011 13:13:32 -0700
Message-ID: <1315426421-16243-6-git-send-email-computersforpeace@gmail.com>
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

`writeops' is unnecessary in the function `nand_update_bbt()'

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 03d76c5..b493f51 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1171,7 +1171,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 {
 	struct nand_chip *this = mtd->priv;
-	int len, res = 0, writeops = 0;
+	int len, res = 0;
 	int chip, chipsel;
 	uint8_t *buf;
 	struct nand_bbt_descr *td = this->bbt_td;
@@ -1187,8 +1187,6 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	if (!buf)
 		return -ENOMEM;
 
-	writeops = md != NULL ? 0x03 : 0x01;
-
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
 		chip = (int)(offs >> this->chip_shift);
@@ -1203,13 +1201,13 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 		md->version[chip]++;
 
 	/* Write the bad block table to the device? */
-	if ((writeops & 0x01) && (td->options & NAND_BBT_WRITE)) {
+	if (td->options & NAND_BBT_WRITE) {
 		res = write_bbt(mtd, buf, td, md, chipsel);
 		if (res < 0)
 			goto out;
 	}
 	/* Write the mirror bad block table to the device? */
-	if ((writeops & 0x02) && md && (md->options & NAND_BBT_WRITE)) {
+	if (md && (md->options & NAND_BBT_WRITE)) {
 		res = write_bbt(mtd, buf, md, td, chipsel);
 	}
 
-- 
1.7.5.4
