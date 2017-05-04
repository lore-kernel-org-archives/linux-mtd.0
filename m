Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6FbY-0006oM-Jq
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 12:11:36 +0000
From: Colin King <colin.king@canonical.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: make nand_ooblayout_lp_hamming_ops static
Date: Thu,  4 May 2017 13:11:00 +0100
Message-Id: <20170504121100.2709-1-colin.king@canonical.com>
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

nand_ooblayout_lp_hamming_ops can be made static as it does not need to be
in global scope.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d474378ed810..d3a735012b81 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -202,7 +202,7 @@ static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
+static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
 	.ecc = nand_ooblayout_ecc_lp_hamming,
 	.free = nand_ooblayout_free_lp_hamming,
 };
-- 
2.11.0
