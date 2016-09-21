Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeDK-00032t-FW
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:54:26 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 28/46] mtd: nandsim: Refine exports
Date: Wed, 21 Sep 2016 11:52:51 +0200
Message-Id: <956b8e8e90dbaa67a3695112bb8b8eeb866ca013.1474450296.git.dwalter@sigma-star.at>
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

Keep the file backend logic directly in nandsim such that
other users of only have to implement simple read/write
functions.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 101 +++++++++++++++++++++++++++++++++-----------
 include/linux/mtd/nandsim.h |  33 ++++++---------
 2 files changed, 88 insertions(+), 46 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index c93d946..cf2694f 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -302,6 +302,14 @@ struct nandsim_debug_info {
 	struct dentry *dfs_wear_report;
 };
 
+/*
+ * A union to represent flash memory contents and flash buffer.
+ */
+union ns_mem {
+	u_char *byte;    /* for byte access */
+	uint16_t *word;  /* for 16-bit word access */
+};
+
 struct ns_ram_data {
 	/* The simulated NAND flash pages array */
 	union ns_mem *pages;
@@ -350,7 +358,17 @@ struct nandsim {
 	/* Internal buffer of page + OOB size bytes */
 	union ns_mem buf;
 	struct nandsim_geom geom;
-	struct nandsim_regs regs;
+
+	/* NAND flash internal registers */
+	struct {
+		unsigned int command; /* the command register */
+		u_char   status;  /* the status register */
+		uint     row;     /* the page number */
+		uint     column;  /* the offset within page */
+		uint     count;   /* internal counter */
+		uint     num;     /* number of bytes which must be processed */
+		uint     off;     /* fixed page offset */
+	} regs;
 
 	/* NAND flash lines state */
         struct {
@@ -773,12 +791,6 @@ struct nandsim_geom *nandsim_get_geom(struct nandsim *ns)
 }
 EXPORT_SYMBOL_GPL(nandsim_get_geom);
 
-struct nandsim_regs *nandsim_get_regs(struct nandsim *ns)
-{
-	return &ns->regs;
-}
-EXPORT_SYMBOL_GPL(nandsim_get_regs);
-
 void nandsim_set_backend_data(struct nandsim *ns, void *data)
 {
 	ns->backend_data = data;
@@ -791,12 +803,6 @@ void *nandsim_get_backend_data(struct nandsim *ns)
 }
 EXPORT_SYMBOL_GPL(nandsim_get_backend_data);
 
-union ns_mem *nandsim_get_buf(struct nandsim *ns)
-{
-	return &ns->buf;
-}
-EXPORT_SYMBOL_GPL(nandsim_get_buf);
-
 static void ns_ram_destroy(struct nandsim *ns)
 {
 	struct ns_ram_data *data = ns->backend_data;
@@ -1706,9 +1712,10 @@ static void ns_cachefile_read_page(struct nandsim *ns, int num)
 	}
 }
 
-static void ns_file_read_page(struct nandsim *ns, int num)
+void __ns_file_read_page(struct nandsim *ns, int num,
+			 int (*read_fn)(struct nandsim *ns, char *addr,
+					unsigned long count, loff_t offset))
 {
-	struct ns_file_data *data = ns->backend_data;
 	loff_t pos;
 	ssize_t tx;
 
@@ -1734,12 +1741,26 @@ static void ns_file_read_page(struct nandsim *ns, int num)
 	}
 
 	pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
-	tx = kernel_read(data->file, pos, ns->buf.byte, num);
+	tx = read_fn(ns, ns->buf.byte, num, pos);
 	if (tx == 0)
 		memset(ns->buf.byte, 0xff, num);
 	else if (tx != num)
 		NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
 }
+EXPORT_SYMBOL_GPL(__ns_file_read_page);
+
+static inline int do_kernel_read(struct nandsim *ns, char *addr,
+				 unsigned long count, loff_t offset)
+{
+	struct ns_file_data *data = ns->backend_data;
+
+	return kernel_read(data->file, offset, addr, count);
+}
+
+static void ns_file_read_page(struct nandsim *ns, int num)
+{
+	__ns_file_read_page(ns, num, do_kernel_read);
+}
 
 static void ns_ram_erase_sector(struct nandsim *ns)
 {
@@ -1771,24 +1792,42 @@ static void ns_cachefile_erase_sector(struct nandsim *ns)
 	}
 }
 
-static void ns_file_erase_sector(struct nandsim *ns)
+static inline ssize_t do_kernel_write(struct nandsim *ns, const char *addr,
+				      size_t count, loff_t offset)
+{
+	struct ns_file_data *data = ns->backend_data;
+
+	return kernel_write(data->file, addr, count, offset);
+}
+
+
+void __ns_file_erase_sector(struct nandsim *ns, char *file_buf,
+			    ssize_t (*write_fn)(struct nandsim *ns, const char *buf,
+			    size_t count, loff_t pos))
 {
 	int i;
 	loff_t pos;
 	ssize_t tx;
 	unsigned int pagesz = ns->no_oob ? ns->geom.pgsz : ns->geom.pgszoob;
-	struct ns_file_data *data = ns->backend_data;
 
-	memset(data->file_buf, 0xff, pagesz);
+	memset(file_buf, 0xff, pagesz);
 
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		pos = (loff_t)(ns->regs.row + i) * pagesz;
-		tx = kernel_write(data->file, data->file_buf, pagesz, pos);
+		tx = write_fn(ns, file_buf, pagesz, pos);
 		if (tx != pagesz) {
 			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 		}
 	}
 }
+EXPORT_SYMBOL_GPL(__ns_file_erase_sector);
+
+static void ns_file_erase_sector(struct nandsim *ns)
+{
+	struct ns_file_data *data = ns->backend_data;
+
+	__ns_file_erase_sector(ns, data->file_buf, do_kernel_write);
+}
 
 static int ns_ram_prog_page(struct nandsim *ns, int num)
 {
@@ -1863,13 +1902,16 @@ static int ns_cachefile_prog_page(struct nandsim *ns, int num)
 	return 0;
 }
 
-static int ns_file_prog_page(struct nandsim *ns, int num)
+int __ns_file_prog_page(struct nandsim *ns, int num, char *file_buf,
+			int (*read_fn)(struct nandsim *ns, char *addr,
+				       unsigned long count, loff_t offset),
+			ssize_t (*write_fn)(struct nandsim *ns, const char *buf,
+					    size_t count, loff_t pos))
 {
 	int i;
 	loff_t off;
 	ssize_t tx;
 	u_char *pg_off;
-	struct ns_file_data *data = ns->backend_data;
 
 	NS_DBG("prog_page: writing page %d\n", ns->regs.row);
 
@@ -1885,10 +1927,10 @@ static int ns_file_prog_page(struct nandsim *ns, int num)
 			num -= pg_write_end - ns->geom.pgsz;
 	}
 
-	pg_off = data->file_buf + ns->regs.column + ns->regs.off;
+	pg_off = file_buf + ns->regs.column + ns->regs.off;
 	off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 
-	tx = kernel_read(data->file, off, pg_off, num);
+	tx = read_fn(ns, pg_off, num, off);
 	if (tx == 0)
 		memset(pg_off, 0xff, num);
 	else if (tx != num) {
@@ -1899,7 +1941,7 @@ static int ns_file_prog_page(struct nandsim *ns, int num)
 	for (i = 0; i < num; i++)
 		pg_off[i] &= ns->buf.byte[i];
 
-	tx = kernel_write(data->file, pg_off, num, off);
+	tx = write_fn(ns, pg_off, num, off);
 	if (tx != num) {
 		NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 		return -1;
@@ -1907,6 +1949,15 @@ static int ns_file_prog_page(struct nandsim *ns, int num)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(__ns_file_prog_page);
+
+static int ns_file_prog_page(struct nandsim *ns, int num)
+{
+	struct ns_file_data *data = ns->backend_data;
+
+	return __ns_file_prog_page(ns, num, data->file_buf, do_kernel_read,
+				   do_kernel_write);
+}
 
 static struct ns_backend_ops ns_ram_bops = {
 	.erase_sector = ns_ram_erase_sector,
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index 05ac7e3..85d4d7e 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -47,25 +47,6 @@ struct nandsim_geom {
 	uint idbytes;       /* the number ID bytes that this chip outputs */
 };
 
-/* NAND flash internal registers */
-struct nandsim_regs {
-	unsigned command; /* the command register */
-	u_char   status;  /* the status register */
-	uint     row;     /* the page number */
-	uint     column;  /* the offset within page */
-	uint     count;   /* internal counter */
-	uint     num;     /* number of bytes which must be processed */
-	uint     off;     /* fixed page offset */
-};
-
-/*
- * A union to represent flash memory contents and flash buffer.
- */
-union ns_mem {
-	u_char *byte;    /* for byte access */
-	uint16_t *word;  /* for 16-bit word access */
-};
-
 struct nandsim;
 struct ns_backend_ops {
 	void (*erase_sector)(struct nandsim *ns);
@@ -79,9 +60,19 @@ struct ns_backend_ops {
 struct mtd_info *ns_new_instance(struct nandsim_params *nsparam);
 int ns_destroy_instance(struct mtd_info *nsmtd);
 struct nandsim_geom *nandsim_get_geom(struct nandsim *ns);
-struct nandsim_regs *nandsim_get_regs(struct nandsim *ns);
 void nandsim_set_backend_data(struct nandsim *ns, void *data);
 void *nandsim_get_backend_data(struct nandsim *ns);
-union ns_mem *nandsim_get_buf(struct nandsim *ns);
 
+void __ns_file_read_page(struct nandsim *ns, int num,
+			 int (*read_fn)(struct nandsim *ns, char *addr,
+					unsigned long count, loff_t offset));
+
+int __ns_file_prog_page(struct nandsim *ns, int num, char *file_buf,
+			int (*read_fn)(struct nandsim *ns, char *addr,
+				       unsigned long count, loff_t offset),
+			ssize_t (*write_fn)(struct nandsim *ns, const char *buf,
+					    size_t count, loff_t pos));
+void __ns_file_erase_sector(struct nandsim *ns, char *file_buf,
+			    ssize_t (*write_fn)(struct nandsim *ns, const char *buf,
+						size_t count, loff_t pos));
 #endif /* __LINUX_NANDSIM_H__ */
-- 
2.8.3
