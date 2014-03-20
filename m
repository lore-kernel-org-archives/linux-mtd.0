Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQctb-0000dr-RJ
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 13:20:32 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: omap: ecc.correct: omap_elm_correct_data: return
 number of bit-flips detected in erased-page
Date: Thu, 20 Mar 2014 18:49:58 +0530
Message-ID: <1395321598-4565-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
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

In current omap_elm_correct_data(), an erased-page is also identified based on
	'bitflip_count <= ecc.strength' per ecc-step (data+oob)
But bitflip_count is ignored, unless errors are detected in other ecc.steps.
------------------
  if (bitflip_count) {
        /*
         * number of 0-bits within ECC limits
         * So this may be an erased-page
         */
        stat += bitflip_count;
  }
  [...]
  /* Check if any error reported */
  if (!is_error_reported)
        return 0;
------------------

This patch returns bitflip_count found in erased-page to chip->ecc.read_page()

Reported-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 6f9b339..d161c9b 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1383,7 +1383,7 @@ static int omap_elm_correct_data(struct mtd_info *mtd, u_char *data,
 
 	/* Check if any error reported */
 	if (!is_error_reported)
-		return 0;
+		return stat;
 
 	/* Decode BCH error using ELM module */
 	elm_decode_bch_error_page(info->elm_dev, ecc_vec, err_vec);
-- 
1.8.5.1.163.gd7aced9
