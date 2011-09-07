Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OWO-0001Pp-Ry
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:14:57 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 01/14] mtd: nand: refactor scanning code
Date: Wed, 7 Sep 2011 13:13:28 -0700
Message-ID: <1315426421-16243-2-git-send-email-computersforpeace@gmail.com>
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

A few pieces of code are unnecessarily duplicated. For easier
maintenance, we should fix this.

This should have no functional effect.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   26 +++++++-------------------
 1 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c488bcb..cbf9b69 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -306,28 +306,16 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	ops.ooboffs = 0;
 	ops.ooblen = mtd->oobsize;
 
-
 	while (len > 0) {
-		if (len <= mtd->writesize) {
-			ops.oobbuf = buf + len;
-			ops.datbuf = buf;
-			ops.len = len;
-			res = mtd->read_oob(mtd, offs, &ops);
-
-			/* Ignore ECC errors when checking for BBM */
-			if (res != -EUCLEAN && res != -EBADMSG)
-				return res;
-			return 0;
-		} else {
-			ops.oobbuf = buf + mtd->writesize;
-			ops.datbuf = buf;
-			ops.len = mtd->writesize;
-			res = mtd->read_oob(mtd, offs, &ops);
+		ops.datbuf = buf;
+		ops.len = min(len, (size_t)mtd->writesize);
+		ops.oobbuf = buf + ops.len;
 
-			/* Ignore ECC errors when checking for BBM */
-			if (res && res != -EUCLEAN && res != -EBADMSG)
-				return res;
-		}
+		res = mtd->read_oob(mtd, offs, &ops);
+
+		/* Ignore ECC errors when checking for BBM */
+		if (res && res != -EUCLEAN && res != -EBADMSG)
+			return res;
 
 		buf += mtd->oobsize + mtd->writesize;
 		len -= mtd->writesize;
-- 
1.7.5.4
