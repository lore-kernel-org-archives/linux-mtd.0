Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePDTr-0006fG-JO
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 20:18:17 +0000
From: Colin King <colin.king@canonical.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][mtd-next] mtd: nand: remove redundant check of len
Date: Wed, 13 Dec 2017 20:17:43 +0000
Message-Id: <20171213201743.27324-1-colin.king@canonical.com>
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

The check of len being zero is redundant as it has already been
sanity checked for this value at the start of the function. Hence
it is impossible for this test to be true and so the redundant
code can be removed.

Detected by CoverityScan, CID#1462748 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/nand_base.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index afd5e18db81c..9daaa23db943 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1507,10 +1507,6 @@ static int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 		};
 		struct nand_operation op = NAND_OPERATION(instrs);
 
-		/* Drop the DATA_IN instruction if len is set to 0. */
-		if (!len)
-			op.ninstrs--;
-
 		return nand_exec_op(chip, &op);
 	}
 
-- 
2.14.1
