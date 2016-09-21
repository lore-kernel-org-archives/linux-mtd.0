Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeBY-0001R5-1M
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:51:32 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 20/46] mtd: nandsim: Implement preliminary constructor
 function
Date: Wed, 21 Sep 2016 11:51:01 +0200
Message-Id: <b0aeff63dac238f2f79d5a7c931153ba295ba958.1474450296.git.dwalter@sigma-star.at>
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

This function will be used later by the ioctl() interface
for creating new nandsim instances.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 41 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nandsim.h |  3 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 2e3c08e..344f5c4 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2470,6 +2470,45 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	return;
 }
 
+static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
+{
+	struct mtd_info *nsmtd;
+	struct nand_chip *chip;
+	struct nandsim *ns;
+	struct nandsim_params *nsparam = kzalloc(sizeof(*nsparam), GFP_KERNEL);
+
+	if (!nsparam)
+		return -ENOMEM;
+
+	memcpy(nsparam->id_bytes, req->id_bytes, sizeof(nsparam->id_bytes));
+	nsparam->bus_width = req->bus_width;
+	nsparam->file_fd = req->file_fd;
+
+	switch (req->backend) {
+		case NANDSIM_BACKEND_RAM:
+			nsparam->bops = &ns_ram_bops;
+		break;
+		case NANDSIM_BACKEND_FILE:
+			nsparam->bops = &ns_file_bops;
+		break;
+
+		default:
+			kfree(nsparam);
+			return -EINVAL;
+	}
+
+	nsmtd = ns_new_instance(nsparam);
+	kfree(nsparam);
+
+	if (IS_ERR(nsmtd))
+		return PTR_ERR(nsmtd);
+
+	chip = mtd_to_nand(nsmtd);
+	ns = nand_get_controller_data(chip);
+
+	return ns->index;
+}
+
 static long ns_ctrl_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -2764,7 +2803,7 @@ static int __init ns_init_default(void)
 	nsparam->cache_file = cache_file;
 	nsparam->bbt = bbt;
 	nsparam->bch = bch;
-	nsparam->id_bytes = id_bytes;
+	memcpy(nsparam->id_bytes, id_bytes, sizeof(nsparam->id_bytes));
 
 	if (!nsparam->cache_file)
 		nsparam->bops = &ns_ram_bops;
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index e3d2c9f..6e3b4a2 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -2,6 +2,7 @@
 #define __LINUX_NANDSIM_H__
 
 #include <linux/mtd/mtd.h>
+#include <mtd/nandsim-user.h>
 
 struct nandsim_params {
 	unsigned int access_delay;
@@ -22,7 +23,7 @@ struct nandsim_params {
 	char *cache_file;
 	unsigned int bbt;
 	unsigned int bch;
-	unsigned char *id_bytes;
+	unsigned char id_bytes[8];
 	unsigned int file_fd;
 	struct ns_backend_ops *bops;
 };
-- 
2.8.3
