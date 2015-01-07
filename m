Received: from gw02.mail.saunalahti.fi ([195.197.172.116])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8xMY-0005wY-DN
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 20:37:56 +0000
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH v2] mtd: nftl: reorganize operations in condition check
Date: Wed,  7 Jan 2015 22:37:20 +0200
Message-Id: <1420663040-3857-1-git-send-email-andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>,
 Giel van Schijndel <me@mortis.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need to compare ret variable for negative value. The current code
assigns the boolean to the ret and prints it wrongly in the warning
message.

Reported-by: Andrey Karpov <karpov@viva64.com>
Cc: Giel van Schijndel <me@mortis.eu>
Cc: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/mtd/nftlmount.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 51b9d6a..a5dfbfb 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -89,9 +89,10 @@ static int find_boot_record(struct NFTLrecord *nftl)
 		}
 
 		/* To be safer with BIOS, also use erase mark as discriminant */
-		if ((ret = nftl_read_oob(mtd, block * nftl->EraseSize +
+		ret = nftl_read_oob(mtd, block * nftl->EraseSize +
 					 SECTORSIZE + 8, 8, &retlen,
-					 (char *)&h1) < 0)) {
+					 (char *)&h1);
+		if (ret < 0) {
 			printk(KERN_WARNING "ANAND header found at 0x%x in mtd%d, but OOB data read failed (err %d)\n",
 			       block * nftl->EraseSize, nftl->mbd.mtd->index, ret);
 			continue;
@@ -109,8 +110,9 @@ static int find_boot_record(struct NFTLrecord *nftl)
 		}
 
 		/* Finally reread to check ECC */
-		if ((ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
-				     &retlen, buf) < 0)) {
+		ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
+				&retlen, buf);
+		if (ret < 0) {
 			printk(KERN_NOTICE "ANAND header found at 0x%x in mtd%d, but ECC read failed (err %d)\n",
 			       block * nftl->EraseSize, nftl->mbd.mtd->index, ret);
 			continue;
@@ -228,9 +230,11 @@ device is already correct.
 The new DiskOnChip driver already scanned the bad block table.  Just query it.
 			if ((i & (SECTORSIZE - 1)) == 0) {
 				/* read one sector for every SECTORSIZE of blocks */
-				if ((ret = mtd->read(nftl->mbd.mtd, block * nftl->EraseSize +
-						     i + SECTORSIZE, SECTORSIZE, &retlen,
-						     buf)) < 0) {
+				ret = mtd->read(nftl->mbd.mtd,
+						block * nftl->EraseSize + i +
+						SECTORSIZE, SECTORSIZE,
+						&retlen, buf);
+				if (ret < 0) {
 					printk(KERN_NOTICE "Read of bad sector table failed (err %d)\n",
 					       ret);
 					kfree(nftl->ReplUnitTable);
-- 
1.8.3.101.g727a46b
