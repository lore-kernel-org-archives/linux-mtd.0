Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OWt-0001Pp-90
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:15:27 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 02/14] mtd: nand: do not ignore all ECC errors
Date: Wed, 7 Sep 2011 13:13:29 -0700
Message-ID: <1315426421-16243-3-git-send-email-computersforpeace@gmail.com>
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

There are a few reasons not to ignore ECC errors here.

First, mtd->read_oob is being called in raw mode, so there should be no
error correction in the first place.

Second, if we change this such that there *is* error correction in this
function, then we will want to pass the error message upward.

In fact, the code I introduced to "ignore ECC errors" would have been
better if it had just placed this test down in `scan_block_full()' in
the first place. We would like to ignore ECC errors when we are simply
checking for bad block markers (e.g., factory marked), but we may not
want to ignore ECC errors when scanning OOB for a flash-based BBT
pattern (in `scan_read_raw()'; note that the return codes from
`scan_read_raw()' are not actually handled yet).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index cbf9b69..fcfaf06 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -313,8 +313,7 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 
 		res = mtd->read_oob(mtd, offs, &ops);
 
-		/* Ignore ECC errors when checking for BBM */
-		if (res && res != -EUCLEAN && res != -EBADMSG)
+		if (res)
 			return res;
 
 		buf += mtd->oobsize + mtd->writesize;
@@ -400,7 +399,8 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 	int ret, j;
 
 	ret = scan_read_raw_oob(mtd, buf, offs, readlen);
-	if (ret)
+	/* Ignore ECC errors when checking for BBM */
+	if (ret && ret != -EUCLEAN && ret != -EBADMSG)
 		return ret;
 
 	for (j = 0; j < len; j++, buf += scanlen) {
-- 
1.7.5.4
