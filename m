Received: from khitomer.mortis.eu ([185.27.175.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y7qZh-0007LZ-NP
 for linux-mtd@lists.infradead.org; Sun, 04 Jan 2015 19:10:54 +0000
From: Giel van Schijndel <me@mortis.eu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Fix error-code overwrite bug
Date: Sun,  4 Jan 2015 19:04:22 +0100
Message-Id: <1420394662-20011-1-git-send-email-me@mortis.eu>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Giel van Schijndel <me@mortis.eu>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't overwrite the returned error code with the boolean test used by
the if-statement (otherwise it'd be 1 or 0 always, 1 in the if-block).
---
 drivers/mtd/nftlmount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 51b9d6a..1cbeb6b 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -91,7 +91,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
 		/* To be safer with BIOS, also use erase mark as discriminant */
 		if ((ret = nftl_read_oob(mtd, block * nftl->EraseSize +
 					 SECTORSIZE + 8, 8, &retlen,
-					 (char *)&h1) < 0)) {
+					 (char *)&h1)) < 0) {
 			printk(KERN_WARNING "ANAND header found at 0x%x in mtd%d, but OOB data read failed (err %d)\n",
 			       block * nftl->EraseSize, nftl->mbd.mtd->index, ret);
 			continue;
-- 
2.1.4
