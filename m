Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXnsI-0001U8-TK
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 12:47:00 +0000
Subject: [PATCH 2/3] mtd/nftlmount: Delete eight unwanted spaces behind
 function names
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <57d4cbcf-c99c-f3d5-e2bf-f67873f321ea@users.sourceforge.net>
Message-ID: <0095db26-a0ff-a400-3509-6085d701ecab@users.sourceforge.net>
Date: Sat, 6 Jan 2018 13:46:39 +0100
MIME-Version: 1.0
In-Reply-To: <57d4cbcf-c99c-f3d5-e2bf-f67873f321ea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 12:55:23 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: space prohibited between function name and open parenthesis '('

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nftlmount.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 6b9634a70229..d1eaa87c88ba 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -314,7 +314,7 @@ int NFTL_formatblock(struct NFTLrecord *nftl, int block)
 			  8, &retlen, (char *)&uci) < 0)
 		goto default_uci1;
 
-	erase_mark = le16_to_cpu ((uci.EraseMark | uci.EraseMark1));
+	erase_mark = le16_to_cpu(uci.EraseMark | uci.EraseMark1);
 	if (erase_mark != ERASE_MARK) {
 	default_uci1:
 		uci.EraseMark = cpu_to_le16(ERASE_MARK);
@@ -501,11 +501,12 @@ static int check_and_mark_free_block(struct NFTLrecord *nftl, int block)
 			  &retlen, (char *)&h1) < 0)
 		return -1;
 
-	erase_mark = le16_to_cpu ((h1.EraseMark | h1.EraseMark1));
+	erase_mark = le16_to_cpu(h1.EraseMark | h1.EraseMark1);
 	if (erase_mark != ERASE_MARK) {
 		/* if no erase mark, the block must be totally free. This is
 		   possible in two cases : empty filesystem or interrupted erase (very unlikely) */
-		if (check_free_sectors (nftl, block * nftl->EraseSize, nftl->EraseSize, 1) != 0)
+		if (check_free_sectors(nftl, block * nftl->EraseSize,
+				       nftl->EraseSize, 1) != 0)
 			return -1;
 
 		/* free block : write erase mark */
@@ -521,8 +522,9 @@ static int check_and_mark_free_block(struct NFTLrecord *nftl, int block)
 		/* if erase mark present, need to skip it when doing check */
 		for (i = 0; i < nftl->EraseSize; i += SECTORSIZE) {
 			/* check free sector */
-			if (check_free_sectors (nftl, block * nftl->EraseSize + i,
-						SECTORSIZE, 0) != 0)
+			if (check_free_sectors(nftl,
+					       block * nftl->EraseSize + i,
+					       SECTORSIZE, 0) != 0)
 				return -1;
 
 			if (nftl_read_oob(mtd, block * nftl->EraseSize + i,
@@ -608,10 +610,13 @@ int NFTL_mount(struct NFTLrecord *s)
 					break;
 				}
 
-				logical_block = le16_to_cpu ((h0.VirtUnitNum | h0.SpareVirtUnitNum));
-				rep_block = le16_to_cpu ((h0.ReplUnitNum | h0.SpareReplUnitNum));
-				nb_erases = le32_to_cpu (h1.WearInfo);
-				erase_mark = le16_to_cpu ((h1.EraseMark | h1.EraseMark1));
+				logical_block = le16_to_cpu(h0.VirtUnitNum |
+							    h0.SpareVirtUnitNum);
+				rep_block = le16_to_cpu(h0.ReplUnitNum |
+							h0.SpareReplUnitNum);
+				nb_erases = le32_to_cpu(h1.WearInfo);
+				erase_mark = le16_to_cpu(h1.EraseMark |
+							 h1.EraseMark1);
 
 				is_first_block = !(logical_block >> 15);
 				logical_block = logical_block & 0x7fff;
-- 
2.15.1
