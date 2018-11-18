Received: from youngberry.canonical.com ([91.189.89.112])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOQ4K-0006KE-TR
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2018 16:37:10 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nftl: clean up indentation, remove extraneous tabs
Date: Sun, 18 Nov 2018 16:36:56 +0000
Message-Id: <20181118163656.30698-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

The hunk of code is indented too much by one level, fix this by
removing the extraneous tabs. Also terminate block comment using
the recommended coding style to clean up checkpatch warning.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nftlmount.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 91b7fb326f9a..334aa5b3a655 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -346,25 +346,26 @@ int NFTL_formatblock(struct NFTLrecord *nftl, int block)
 		goto fail;
 	}
 
-		/* increase and write Wear-Leveling info */
-		nb_erases = le32_to_cpu(uci.WearInfo);
-		nb_erases++;
-
-		/* wrap (almost impossible with current flash) or free block */
-		if (nb_erases == 0)
-			nb_erases = 1;
-
-		/* check the "freeness" of Erase Unit before updating metadata
-		 * FixMe:  is this check really necessary ? since we have check the
-		 *         return code after the erase operation. */
-		if (check_free_sectors(nftl, instr->addr, nftl->EraseSize, 1) != 0)
-			goto fail;
-
-		uci.WearInfo = le32_to_cpu(nb_erases);
-		if (nftl_write_oob(mtd, block * nftl->EraseSize + SECTORSIZE +
-				   8, 8, &retlen, (char *)&uci) < 0)
-			goto fail;
-		return 0;
+	/* increase and write Wear-Leveling info */
+	nb_erases = le32_to_cpu(uci.WearInfo);
+	nb_erases++;
+
+	/* wrap (almost impossible with current flash) or free block */
+	if (nb_erases == 0)
+		nb_erases = 1;
+
+	/* check the "freeness" of Erase Unit before updating metadata
+	 * FixMe:  is this check really necessary ? since we have check the
+	 *         return code after the erase operation.
+	 */
+	if (check_free_sectors(nftl, instr->addr, nftl->EraseSize, 1) != 0)
+		goto fail;
+
+	uci.WearInfo = le32_to_cpu(nb_erases);
+	if (nftl_write_oob(mtd, block * nftl->EraseSize + SECTORSIZE +
+			   8, 8, &retlen, (char *)&uci) < 0)
+		goto fail;
+	return 0;
 fail:
 	/* could not format, update the bad block table (caller is responsible
 	   for setting the ReplUnitTable to BLOCK_RESERVED on failure) */
-- 
2.19.1
