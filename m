Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyB-0004tD-Pm
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:01 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/46] mtd: nandsim: Add simulator id to MTD parition name
Date: Wed, 31 Aug 2016 09:28:21 +0200
Message-Id: <20160831072853.27822-15-dwalter@sigma-star.at>
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
