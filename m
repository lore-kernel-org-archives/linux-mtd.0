Received: from conuserg-11.nifty.com ([210.131.2.78])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOC-00025d-3v
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 19/39] mtd: nand: denali: perform erased check against raw
 transferred page
Date: Sun, 27 Nov 2016 03:06:05 +0900
Message-Id: <1480183585-592-20-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The erased page check must be done against the raw transferred data.
The current first call of is_erase() is against the data after ECC
correction.  I saw cases where not all of the data in the page are
0xFF after they are manipulated by the ECC correction engine.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f035dac..ae44c01 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1168,6 +1168,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		INTR_STATUS__DMA_CMD_COMP | INTR_STATUS__ECC_UNCOR_ERR :
 		INTR_STATUS__ECC_TRANSACTION_DONE | INTR_STATUS__ECC_ERR;
 	bool check_erased_page = false;
+	int ret;
 
 	if (page != denali->page) {
 		dev_err(denali->dev,
@@ -1206,7 +1207,9 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		 * error.
 		 */
 
-		read_oob_data(mtd, chip->oob_poi, denali->page);
+		ret = denali_read_page_raw(mtd, chip, buf, 1, denali->page);
+		if (ret < 0)
+			return ret;
 
 		/* check ECC failures that may have occurred on erased pages */
 		if (!is_erased(buf, mtd->writesize) ||
-- 
2.7.4
