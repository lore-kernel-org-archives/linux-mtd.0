Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fabYX-0003aR-HZ
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 06:46:27 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nftl: remove redundant variable nb_erases
Date: Wed,  4 Jul 2018 07:46:09 +0100
Message-Id: <20180704064609.13369-1-colin.king@canonical.com>
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

Variable nb_erases is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'nb_erases' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nftlmount.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 27184e3874db..91b7fb326f9a 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -577,7 +577,7 @@ static int get_fold_mark(struct NFTLrecord *nftl, unsigned int block)
 int NFTL_mount(struct NFTLrecord *s)
 {
 	int i;
-	unsigned int first_logical_block, logical_block, rep_block, nb_erases, erase_mark;
+	unsigned int first_logical_block, logical_block, rep_block, erase_mark;
 	unsigned int block, first_block, is_first_block;
 	int chain_length, do_format_chain;
 	struct nftl_uci0 h0;
@@ -621,7 +621,6 @@ int NFTL_mount(struct NFTLrecord *s)
 
 				logical_block = le16_to_cpu ((h0.VirtUnitNum | h0.SpareVirtUnitNum));
 				rep_block = le16_to_cpu ((h0.ReplUnitNum | h0.SpareReplUnitNum));
-				nb_erases = le32_to_cpu (h1.WearInfo);
 				erase_mark = le16_to_cpu ((h1.EraseMark | h1.EraseMark1));
 
 				is_first_block = !(logical_block >> 15);
-- 
2.17.1
