Received: from gw03.mail.saunalahti.fi ([195.197.172.111])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8blN-0008TS-Mw
 for linux-mtd@lists.infradead.org; Tue, 06 Jan 2015 21:34:06 +0000
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: ntfl: reorganize operations in condition check
Date: Tue,  6 Jan 2015 23:33:34 +0200
Message-Id: <1420580014-25215-1-git-send-email-andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
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

Cc: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/mtd/nftlmount.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 51b9d6a..557dfa2 100644
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
-- 
1.8.3.101.g727a46b
