Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecRax-0006Kv-Jh
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 08:00:20 +0000
From: Colin King <colin.king@canonical.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][V2] mtd: nand: marvell: remove redundant variable 'oob_len'
Date: Fri, 19 Jan 2018 07:59:54 +0000
Message-Id: <20180119075954.15009-1-colin.king@canonical.com>
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

Variable oob_len is assigned and never read, hence it is redundant and
can be removed.

Cleans up clang warnings:

drivers/mtd/nand/marvell_nand.c:1356:6: warning: Value stored to 'oob_len'
during its initialization is never read
drivers/mtd/nand/marvell_nand.c:1369:4: warning: Value stored to 'oob_len'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/marvell_nand.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
index 4bd53b360277..f15ab37edf4e 100644
--- a/drivers/mtd/nand/marvell_nand.c
+++ b/drivers/mtd/nand/marvell_nand.c
@@ -1353,7 +1353,6 @@ static int marvell_nfc_hw_ecc_bch_write_page_raw(struct mtd_info *mtd,
 	int data_len = lt->data_bytes;
 	int spare_len = lt->spare_bytes;
 	int ecc_len = lt->ecc_bytes;
-	int oob_len = spare_len + ecc_len;
 	int spare_offset = 0;
 	int ecc_offset = (lt->full_chunk_cnt * lt->spare_bytes) +
 		lt->last_spare_bytes;
@@ -1366,7 +1365,6 @@ static int marvell_nfc_hw_ecc_bch_write_page_raw(struct mtd_info *mtd,
 			data_len = lt->last_data_bytes;
 			spare_len = lt->last_spare_bytes;
 			ecc_len = lt->last_ecc_bytes;
-			oob_len = spare_len + ecc_len;
 		}
 
 		/* Point to the column of the next chunk */
-- 
2.15.1
