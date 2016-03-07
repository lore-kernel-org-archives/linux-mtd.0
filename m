From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 Priit Laes <plaes@plaes.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-api@vger.kernel.org,
 Harvey Hunt <harvey.hunt@imgtec.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 03/52] mtd: mtdswap: remove useless if (!mtd->ecclayout)
 test
Date: Mon,  7 Mar 2016 10:46:53 +0100
Message-Id: <1457344062-11633-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1457344062-11633-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1457344062-11633-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the MTD device does not have OOB, the mtd->oobsize and mtd->oobavail
fields are set to zero, and we are testing those values in the following
test.
Remove the useless if (!mtd->ecclayout) test.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/mtdswap.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index d330eb1..cb06bdd 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1417,7 +1417,6 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	unsigned long part;
 	unsigned int eblocks, eavailable, bad_blocks, spare_cnt;
 	uint64_t swap_size, use_size, size_limit;
-	struct nand_ecclayout *oinfo;
 	int ret;
 
 	parts = &partitions[0];
@@ -1447,13 +1446,6 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		return;
 	}
 
-	oinfo = mtd->ecclayout;
-	if (!oinfo) {
-		printk(KERN_ERR "%s: mtd%d does not have OOB\n",
-			MTDSWAP_PREFIX, mtd->index);
-		return;
-	}
-
 	if (!mtd->oobsize || mtd->oobavail < MTDSWAP_OOBSIZE) {
 		printk(KERN_ERR "%s: Not enough free bytes in OOB, "
 			"%d available, %zu needed.\n",
-- 
2.1.4
