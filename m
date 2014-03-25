Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSLK3-0007ZD-58
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 06:58:56 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return detected
 bit-flips in erased-page
Date: Tue, 25 Mar 2014 12:28:19 +0530
Message-ID: <1395730699-14687-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fixes: commit 62116e5171e00f85a8d53f76e45b84423c89ff34
       mtd: nand: omap2: Support for hardware BCH error correction.

In omap_elm_correct_data(), if bitflip_count in an erased-page is within the
correctable limit (< ecc.strength), then it is not indicated back to the caller
ecc->read_page().
This mis-guides upper layers like MTD and UBIFS layer to assume erased-page as
perfectly clean and use it for writing even if actual bitflip_count was
dangerously high (bitflip_count > mtd->bitflip_threshold).

This patch fixes this above issue, by returning 'stats' to caller
ecc->read_page() under all scenarios.

Reported-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index dd8c0dc..c359af0 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1442,7 +1442,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 
 	/* Check if any error reported */
 	if (!is_error_reported)
-		return 0;
+		return stat;
 
 	/* Decode BCH error using ELM module */
 	elm_decode_bch_error_page(info->elm_dev, ecc_vec, err_vec);
-- 
1.8.5.1.163.gd7aced9
