Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyB-0004st-Pl
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:01 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/46] mtd: nandsim: Add helper functions for pointer magic
Date: Wed, 31 Aug 2016 09:28:17 +0200
Message-Id: <20160831072853.27822-11-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index fda670b..f26e983 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -461,6 +461,18 @@ struct grave_page {
 /* MTD structure for NAND controller */
 static struct mtd_info *ns_mtds[NS_MAX_DEVICES];
 
+static inline struct nandsim *chip_to_ns(struct nand_chip *chip)
+{
+	return (struct nandsim *)(chip + 1);
+}
+
+static inline struct mtd_info *ns_to_mtd(struct nandsim *ns)
+{
+	struct nand_chip *chip = ((struct nand_chip *)ns - 1);
+
+	return nand_to_mtd(chip);
+}
+
 static int nandsim_debugfs_show(struct seq_file *m, void *private)
 {
 	struct nandsim *ns = (struct nandsim *)m->private;
@@ -1462,8 +1474,7 @@ static int do_read_error(struct nandsim *ns, int num)
 
 static void do_bit_flips(struct nandsim *ns, int num)
 {
-	struct nand_chip *chip = ((struct nand_chip *)ns - 1);
-	struct mtd_info *nsmtd = nand_to_mtd(chip);
+	struct mtd_info *nsmtd = ns_to_mtd(ns);
 
 	if (ns->bitflips && prandom_u32() < (1 << 22)) {
 		int flips = 1;
@@ -2300,7 +2311,7 @@ static int __init ns_init_default(void)
 
 	WARN_ON(ns_mtds[0]);
 	nsmtd = ns_mtds[0] = nand_to_mtd(chip);
-	nand = (struct nandsim *)(chip + 1);
+	nand = chip_to_ns(chip);
 	nand_set_controller_data(chip, (void *)nand);
 
 	INIT_LIST_HEAD(&nand->weak_blocks);
-- 
2.8.3
