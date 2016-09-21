Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme9z-0007kY-N5
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:49:50 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 14/46] mtd: nandsim: Add simulator id to MTD parition name
Date: Wed, 21 Sep 2016 11:49:23 +0200
Message-Id: <ab8adec7a59e14b6ccf7d4a1d763aa3be11a8f37.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

...also don't use spaces in the name. It allows
UBI attach via MTD name to function correctly.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index bef5afa..2e02089 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -732,9 +732,9 @@ static void free_device(struct nandsim *ns)
 	}
 }
 
-static char __init *get_partition_name(int i)
+static char *get_partition_name(struct nandsim *ns, int i)
 {
-	return kasprintf(GFP_KERNEL, "NAND simulator partition %d", i);
+	return kasprintf(GFP_KERNEL, "nandsim%d_%d", ns->index, i);
 }
 
 /*
@@ -818,7 +818,7 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 			NS_ERR("bad partition size.\n");
 			return -EINVAL;
 		}
-		ns->partitions[i].name   = get_partition_name(i);
+		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
 			NS_ERR("unable to allocate memory.\n");
 			return -ENOMEM;
@@ -834,7 +834,7 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 			NS_ERR("too many partitions.\n");
 			return -EINVAL;
 		}
-		ns->partitions[i].name   = get_partition_name(i);
+		ns->partitions[i].name = get_partition_name(ns, i);
 		if (!ns->partitions[i].name) {
 			NS_ERR("unable to allocate memory.\n");
 			return -ENOMEM;
-- 
2.8.3
