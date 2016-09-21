Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeFr-0004GE-E7
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:55:51 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 35/46] mtd: nandsim: Make NANDSIM_MAX_DEVICES part of uapi
Date: Wed, 21 Sep 2016 11:55:27 +0200
Message-Id: <56bd5362ab035957676ff97306346657d482ed26.1474450296.git.dwalter@sigma-star.at>
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

...such that userspace very easy remove all nandsim instances.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 185ca4d..31a9f89 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -432,10 +432,8 @@ struct grave_page {
 	unsigned int reads_done;
 };
 
-#define NS_MAX_DEVICES 32
-
 /* MTD structure for NAND controller */
-static struct mtd_info *ns_mtds[NS_MAX_DEVICES];
+static struct mtd_info *ns_mtds[NANDSIM_MAX_DEVICES];
 static DEFINE_MUTEX(ns_mtd_mutex);
 
 static struct dentry *dfs_root;
@@ -2648,7 +2646,7 @@ static int ns_ctrl_destroy_instance(struct ns_destroy_instance_req *req)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 
-	if (id < 0 || id >= NS_MAX_DEVICES)
+	if (id < 0 || id >= NANDSIM_MAX_DEVICES)
 		return -EINVAL;
 
 	mutex_lock(&ns_mtd_mutex);
@@ -2758,13 +2756,13 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	}
 
 	mutex_lock(&ns_mtd_mutex);
-	for (i = 0; i < NS_MAX_DEVICES; i++) {
+	for (i = 0; i < NANDSIM_MAX_DEVICES; i++) {
 		if (!ns_mtds[i])
 			break;
 	}
 
-	if (i == NS_MAX_DEVICES) {
-		pr_err("Cannot allocate more than %i instances!\n", NS_MAX_DEVICES);
+	if (i == NANDSIM_MAX_DEVICES) {
+		pr_err("Cannot allocate more than %i instances!\n", NANDSIM_MAX_DEVICES);
 		retval = -ENFILE;
 		mutex_unlock(&ns_mtd_mutex);
 		goto error;
@@ -2984,7 +2982,7 @@ static void ns_destroy_all(void)
 	int i;
 
 	mutex_lock(&ns_mtd_mutex);
-	for (i = 0; i < NS_MAX_DEVICES; i++)
+	for (i = 0; i < NANDSIM_MAX_DEVICES; i++)
 		if (ns_mtds[i])
 			WARN_ON(ns_destroy_instance(ns_mtds[i]) != 0);
 	mutex_unlock(&ns_mtd_mutex);
-- 
2.8.3
