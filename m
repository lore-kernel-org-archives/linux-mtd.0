Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyb-0008WH-9t
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:27 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/46] mtd: nandsim: Print backend name
Date: Wed, 31 Aug 2016 09:28:32 +0200
Message-Id: <20160831072853.27822-26-dwalter@sigma-star.at>
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

...useful to figure what backend is currently in use.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 4 ++++
 include/linux/mtd/nandsim.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 47d8d41..838e5de 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -976,6 +976,7 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 
 	ns->bops = nsparam->bops;
 
+	NS_INFO("Using backend: %s\n", ns->bops->name);
 	if ((ret = ns->bops->init(ns, nsparam)) != 0) {
 		NS_ERR("Unable to initialize simulator backend: %i\n", ret);
 		return ret;
@@ -1880,6 +1881,7 @@ static struct ns_backend_ops ns_ram_bops = {
 	.read_page = ns_ram_read_page,
 	.init = ns_ram_init,
 	.destroy = ns_ram_destroy,
+	.name = "ram",
 };
 
 static struct ns_backend_ops ns_cachefile_bops = {
@@ -1888,6 +1890,7 @@ static struct ns_backend_ops ns_cachefile_bops = {
 	.read_page = ns_cachefile_read_page,
 	.init = ns_cachefile_init,
 	.destroy = ns_cachefile_destroy,
+	.name = "cache_file",
 };
 
 static struct ns_backend_ops ns_file_bops = {
@@ -1896,6 +1899,7 @@ static struct ns_backend_ops ns_file_bops = {
 	.read_page = ns_file_read_page,
 	.init = ns_file_init,
 	.destroy = ns_file_destroy,
+	.name = "file",
 };
 
 /*
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index a0ca0fb..d71a02f 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -72,6 +72,7 @@ struct ns_backend_ops {
 	void (*read_page)(struct nandsim *ns, int num);
 	int (*init)(struct nandsim *ns, struct nandsim_params *nsparam);
 	void (*destroy)(struct nandsim *ns);
+	char *name;
 };
 
 struct mtd_info *ns_new_instance(struct nandsim_params *nsparam);
-- 
2.8.3
