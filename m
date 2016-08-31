Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyB-0004sk-Pj
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:03 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/46] mtd: nandsim: Kill global nsmtd
Date: Wed, 31 Aug 2016 09:28:15 +0200
Message-Id: <20160831072853.27822-9-dwalter@sigma-star.at>
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

Do it like UBI and support in future up to 32 instances.
For now we still keep a single instance and allow more when
all global state has been removed.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index c49999d..e24ef8c 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -448,8 +448,10 @@ struct grave_page {
 	unsigned int reads_done;
 };
 
+#define NS_MAX_DEVICES 32
+
 /* MTD structure for NAND controller */
-static struct mtd_info *nsmtd;
+static struct mtd_info *ns_mtds[NS_MAX_DEVICES];
 
 static int nandsim_debugfs_show(struct seq_file *m, void *private)
 {
@@ -1451,6 +1453,9 @@ static int do_read_error(struct nandsim *ns, int num)
 
 static void do_bit_flips(struct nandsim *ns, int num)
 {
+	struct nand_chip *chip = ((struct nand_chip *)ns - 1);
+	struct mtd_info *nsmtd = nand_to_mtd(chip);
+
 	if (bitflips && prandom_u32() < (1 << 22)) {
 		int flips = 1;
 		if (bitflips > 1)
@@ -2268,6 +2273,7 @@ static int __init ns_init_default(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
+	struct mtd_info *nsmtd;
 	int retval = -ENOMEM, i;
 
 	if (bus_width != 8 && bus_width != 16) {
@@ -2283,8 +2289,9 @@ static int __init ns_init_default(void)
 		return -ENOMEM;
 	}
 
-	nsmtd       = nand_to_mtd(chip);
-	nand        = (struct nandsim *)(chip + 1);
+	WARN_ON(ns_mtds[0]);
+	nsmtd = ns_mtds[0] = nand_to_mtd(chip);
+	nand = (struct nandsim *)(chip + 1);
 	nand_set_controller_data(chip, (void *)nand);
 
 	INIT_LIST_HEAD(&nand->weak_blocks);
@@ -2447,6 +2454,7 @@ error:
 
 static void __exit ns_cleanup_default(void)
 {
+	struct mtd_info *nsmtd = ns_mtds[0];
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
 	int i;
-- 
2.8.3
