Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeAd-0008RH-N7
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:50:40 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 17/46] mtd: nandsim: Allow external backends
Date: Wed, 21 Sep 2016 11:50:04 +0200
Message-Id: <5d7d64cbb45a2bd58bcd26e8c84a964cedc76356.1474450296.git.dwalter@sigma-star.at>
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

This turns nandsim into a mini framework to allow
backends implemented in different drivers.
i.e. virtio or usermodelinux.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 124 +++++++++++++++++---------------------------
 include/linux/mtd/nandsim.h |  83 +++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+), 77 deletions(-)
 create mode 100644 include/linux/mtd/nandsim.h

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index e333c5c..21a6e1a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -36,6 +36,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_bch.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/nandsim.h>
 #include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/random.h>
@@ -294,42 +295,11 @@ MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default val
 /* Maximum page cache pages needed to read or write a NAND page to the cache_file */
 #define NS_MAX_HELD_PAGES 16
 
-struct nandsim_params {
-	unsigned int access_delay;
-	unsigned int program_delay;
-	unsigned int erase_delay;
-	unsigned int output_cycle;
-	unsigned int input_cycle;
-	unsigned int bus_width;
-	unsigned int do_delays;
-	unsigned long *parts;
-	unsigned int parts_num;
-	char *badblocks;
-	char *weakblocks;
-	char *weakpages;
-	unsigned int bitflips;
-	char *gravepages;
-	unsigned int overridesize;
-	char *cache_file;
-	unsigned int bbt;
-	unsigned int bch;
-	unsigned char *id_bytes;
-	struct ns_backend_ops *bops;
-};
-
 struct nandsim_debug_info {
 	struct dentry *dfs_root;
 	struct dentry *dfs_wear_report;
 };
 
-/*
- * A union to represent flash memory contents and flash buffer.
- */
-union ns_mem {
-	u_char *byte;    /* for byte access */
-	uint16_t *word;  /* for 16-bit word access */
-};
-
 struct ns_ram_data {
 	/* The simulated NAND flash pages array */
 	union ns_mem *pages;
@@ -367,35 +337,8 @@ struct nandsim {
 
 	/* Internal buffer of page + OOB size bytes */
 	union ns_mem buf;
-
-	/* NAND flash "geometry" */
-	struct {
-		uint64_t totsz;     /* total flash size, bytes */
-		uint32_t secsz;     /* flash sector (erase block) size, bytes */
-		uint pgsz;          /* NAND flash page size, bytes */
-		uint oobsz;         /* page OOB area size, bytes */
-		uint64_t totszoob;  /* total flash size including OOB, bytes */
-		uint pgszoob;       /* page size including OOB , bytes*/
-		uint secszoob;      /* sector size including OOB, bytes */
-		uint pgnum;         /* total number of pages */
-		uint pgsec;         /* number of pages per sector */
-		uint secshift;      /* bits number in sector size */
-		uint pgshift;       /* bits number in page size */
-		uint pgaddrbytes;   /* bytes per page address */
-		uint secaddrbytes;  /* bytes per sector address */
-		uint idbytes;       /* the number ID bytes that this chip outputs */
-	} geom;
-
-	/* NAND flash internal registers */
-	struct {
-		unsigned command; /* the command register */
-		u_char   status;  /* the status register */
-		uint     row;     /* the page number */
-		uint     column;  /* the offset within page */
-		uint     count;   /* internal counter */
-		uint     num;     /* number of bytes which must be processed */
-		uint     off;     /* fixed page offset */
-	} regs;
+	struct nandsim_geom geom;
+	struct nandsim_regs regs;
 
 	/* NAND flash lines state */
         struct {
@@ -427,14 +370,6 @@ struct nandsim {
 	struct nandsim_debug_info dbg;
 };
 
-struct ns_backend_ops {
-	void (*erase_sector)(struct nandsim *ns);
-	int (*prog_page)(struct nandsim *ns, int num);
-	void (*read_page)(struct nandsim *ns, int num);
-	int (*init)(struct nandsim *ns, struct nandsim_params *nsparam);
-	void (*destroy)(struct nandsim *ns);
-};
-
 static struct ns_backend_ops ns_ram_bops;
 static struct ns_backend_ops ns_cachefile_bops;
 
@@ -736,6 +671,36 @@ err_close:
 	return err;
 }
 
+struct nandsim_geom *nandsim_get_geom(struct nandsim *ns)
+{
+	return &ns->geom;
+}
+EXPORT_SYMBOL_GPL(nandsim_get_geom);
+
+struct nandsim_regs *nandsim_get_regs(struct nandsim *ns)
+{
+	return &ns->regs;
+}
+EXPORT_SYMBOL_GPL(nandsim_get_regs);
+
+void nandsim_set_backend_data(struct nandsim *ns, void *data)
+{
+	ns->backend_data = data;
+}
+EXPORT_SYMBOL_GPL(nandsim_set_backend_data);
+
+void *nandsim_get_backend_data(struct nandsim *ns)
+{
+	return ns->backend_data;
+}
+EXPORT_SYMBOL_GPL(nandsim_get_backend_data);
+
+union ns_mem *nandsim_get_buf(struct nandsim *ns)
+{
+	return &ns->buf;
+}
+EXPORT_SYMBOL_GPL(nandsim_get_buf);
+
 static void ns_ram_destroy(struct nandsim *ns)
 {
 	struct ns_ram_data *data = ns->backend_data;
@@ -2396,7 +2361,7 @@ static struct miscdevice nandsim_ctrl_cdev = {
 	.fops = &nansim_ctrl_fops,
 };
 
-static int ns_new_instance(struct nandsim_params *nsparam)
+struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
@@ -2406,7 +2371,7 @@ static int ns_new_instance(struct nandsim_params *nsparam)
 
 	if (nsparam->bus_width != 8 && nsparam->bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", nsparam->bus_width);
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	/* Allocate and initialize mtd_info, nand_chip and nandsim structures */
@@ -2414,7 +2379,7 @@ static int ns_new_instance(struct nandsim_params *nsparam)
 		       GFP_KERNEL);
 	if (!chip) {
 		NS_ERR("unable to allocate core structures.\n");
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	mutex_lock(&ns_mtd_mutex);
@@ -2588,7 +2553,7 @@ static int ns_new_instance(struct nandsim_params *nsparam)
 	if (retval != 0)
 		goto err_exit;
 
-        return 0;
+	return nsmtd;
 
 err_exit:
 	free_nandsim(nand);
@@ -2599,10 +2564,11 @@ error:
 	free_lists(nand);
 	kfree(chip);
 
-	return retval;
+	return ERR_PTR(retval);
 }
+EXPORT_SYMBOL_GPL(ns_new_instance);
 
-static void ns_destroy_instance(struct mtd_info *nsmtd)
+void ns_destroy_instance(struct mtd_info *nsmtd)
 {
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
@@ -2616,6 +2582,7 @@ static void ns_destroy_instance(struct mtd_info *nsmtd)
 		kfree(ns->partitions[i].name);
 	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
 }
+EXPORT_SYMBOL_GPL(ns_destroy_instance);
 
 static void ns_destroy_all(void)
 {
@@ -2630,7 +2597,7 @@ static void ns_destroy_all(void)
 
 static int __init ns_init_default(void)
 {
-	int ret;
+	struct mtd_info *nsmtd;
 	struct nandsim_params *nsparam = kzalloc(sizeof(*nsparam), GFP_KERNEL);
 
 	if (!nsparam)
@@ -2661,10 +2628,13 @@ static int __init ns_init_default(void)
 	else
 		nsparam->bops = &ns_cachefile_bops;
 
-	ret = ns_new_instance(nsparam);
+	nsmtd = ns_new_instance(nsparam);
 	kfree(nsparam);
 
-	return ret;
+	if (IS_ERR(nsmtd))
+		return PTR_ERR(nsmtd);
+
+	return 0;
 }
 
 static int __init ns_init_module(void)
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
new file mode 100644
index 0000000..2d596ad
--- /dev/null
+++ b/include/linux/mtd/nandsim.h
@@ -0,0 +1,83 @@
+#ifndef __LINUX_NANDSIM_H__
+#define __LINUX_NANDSIM_H__
+
+#include <linux/mtd/mtd.h>
+
+struct nandsim_params {
+	unsigned int access_delay;
+	unsigned int program_delay;
+	unsigned int erase_delay;
+	unsigned int output_cycle;
+	unsigned int input_cycle;
+	unsigned int bus_width;
+	unsigned int do_delays;
+	unsigned long *parts;
+	unsigned int parts_num;
+	char *badblocks;
+	char *weakblocks;
+	char *weakpages;
+	unsigned int bitflips;
+	char *gravepages;
+	unsigned int overridesize;
+	char *cache_file;
+	unsigned int bbt;
+	unsigned int bch;
+	unsigned char *id_bytes;
+	struct ns_backend_ops *bops;
+};
+
+/* NAND flash "geometry" */
+struct nandsim_geom {
+	uint64_t totsz;     /* total flash size, bytes */
+	uint32_t secsz;     /* flash sector (erase block) size, bytes */
+	uint pgsz;          /* NAND flash page size, bytes */
+	uint oobsz;         /* page OOB area size, bytes */
+	uint64_t totszoob;  /* total flash size including OOB, bytes */
+	uint pgszoob;       /* page size including OOB , bytes*/
+	uint secszoob;      /* sector size including OOB, bytes */
+	uint pgnum;         /* total number of pages */
+	uint pgsec;         /* number of pages per sector */
+	uint secshift;      /* bits number in sector size */
+	uint pgshift;       /* bits number in page size */
+	uint pgaddrbytes;   /* bytes per page address */
+	uint secaddrbytes;  /* bytes per sector address */
+	uint idbytes;       /* the number ID bytes that this chip outputs */
+};
+
+/* NAND flash internal registers */
+struct nandsim_regs {
+	unsigned command; /* the command register */
+	u_char   status;  /* the status register */
+	uint     row;     /* the page number */
+	uint     column;  /* the offset within page */
+	uint     count;   /* internal counter */
+	uint     num;     /* number of bytes which must be processed */
+	uint     off;     /* fixed page offset */
+};
+
+/*
+ * A union to represent flash memory contents and flash buffer.
+ */
+union ns_mem {
+	u_char *byte;    /* for byte access */
+	uint16_t *word;  /* for 16-bit word access */
+};
+
+struct nandsim;
+struct ns_backend_ops {
+	void (*erase_sector)(struct nandsim *ns);
+	int (*prog_page)(struct nandsim *ns, int num);
+	void (*read_page)(struct nandsim *ns, int num);
+	int (*init)(struct nandsim *ns, struct nandsim_params *nsparam);
+	void (*destroy)(struct nandsim *ns);
+};
+
+struct mtd_info *ns_new_instance(struct nandsim_params *nsparam);
+void ns_destroy_instance(struct mtd_info *nsmtd);
+struct nandsim_geom *nandsim_get_geom(struct nandsim *ns);
+struct nandsim_regs *nandsim_get_regs(struct nandsim *ns);
+void nandsim_set_backend_data(struct nandsim *ns, void *data);
+void *nandsim_get_backend_data(struct nandsim *ns);
+union ns_mem *nandsim_get_buf(struct nandsim *ns);
+
+#endif /* __LINUX_NANDSIM_H__ */
-- 
2.8.3
