Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeAn-0000Ux-N5
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:50:49 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 18/46] mtd: nandsim: Add basic support for a file backend
Date: Wed, 21 Sep 2016 11:50:18 +0200
Message-Id: <19ca544d616d15c79f8450ab957b11cb8120e03f.1474450296.git.dwalter@sigma-star.at>
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

This is the first step to allow using a file as
backing store. Such that it is possible to directly
use nanddump images in nandsim.
The current file cache mode is not desiged for this
since it maintains an in memory list of erased block
to skipt 0xff reads/writes. Further more it utilizes
the page cache to be fast and caching only.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 143 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nandsim.h |   1 +
 2 files changed, 144 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 21a6e1a..2e3c08e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -49,6 +49,7 @@
 #include <linux/miscdevice.h>
 #include <linux/major.h>
 #include <linux/mutex.h>
+#include <linux/file.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -316,6 +317,12 @@ struct ns_cachefile_data {
 	int held_cnt;
 };
 
+struct ns_file_data {
+	struct file *file;
+	void *file_buf;
+	bool ro;
+};
+
 /*
  * The structure which describes all the internal simulator data.
  */
@@ -671,6 +678,59 @@ err_close:
 	return err;
 }
 
+static int ns_file_init(struct nandsim *ns, struct nandsim_params *nsparam)
+{
+	int ret;
+	struct file *file;
+	struct inode *inode;
+	struct ns_file_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
+
+	if (!data) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	file = fget(nsparam->file_fd);
+	if (!file) {
+		ret = -EBADF;
+		goto out_free;
+	}
+
+	inode = file->f_mapping->host;
+	if (!S_ISREG(inode->i_mode) && !S_ISBLK(inode->i_mode)) {
+		NS_ERR("alloc_device: Backend file is not a regular file nor a block device\n");
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	if (!(file->f_mode & FMODE_WRITE)) {
+		NS_ERR("alloc_device: Backend file is not writeable\n");
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	data->file = file;
+
+	data->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
+	if (!data->file_buf) {
+		NS_ERR("alloc_device: unable to allocate file buf\n");
+		ret = -ENOMEM;
+		goto out_put;
+	}
+
+	ns->backend_data = data;
+	ret = 0;
+
+	return ret;
+
+out_put:
+	fput(file);
+out_free:
+	kfree(data);
+out:
+	return ret;
+}
+
 struct nandsim_geom *nandsim_get_geom(struct nandsim *ns)
 {
 	return &ns->geom;
@@ -725,6 +785,15 @@ static void ns_cachefile_destroy(struct nandsim *ns)
 	filp_close(data->cfile, NULL);
 }
 
+static void ns_file_destroy(struct nandsim *ns)
+{
+	struct ns_file_data *data = ns->backend_data;
+
+	kfree(data->file_buf);
+	fput(data->file);
+	kfree(data);
+}
+
 static char *get_partition_name(struct nandsim *ns, int i)
 {
 	return kasprintf(GFP_KERNEL, "nandsim%d_%d", ns->index, i);
@@ -1587,6 +1656,22 @@ static void ns_cachefile_read_page(struct nandsim *ns, int num)
 	}
 }
 
+static void ns_file_read_page(struct nandsim *ns, int num)
+{
+	struct ns_file_data *data = ns->backend_data;
+	loff_t pos;
+	ssize_t tx;
+
+	NS_DBG("read_page: page %d written, reading from %d\n",
+		ns->regs.row, ns->regs.column + ns->regs.off);
+	pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
+	tx = kernel_read(data->file, pos, ns->buf.byte, num);
+	if (tx == 0)
+		memset(ns->buf.byte, 0xff, num);
+	else if (tx != num)
+		NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+}
+
 static void ns_ram_erase_sector(struct nandsim *ns)
 {
 	union ns_mem *mypage;
@@ -1617,6 +1702,24 @@ static void ns_cachefile_erase_sector(struct nandsim *ns)
 	}
 }
 
+static void ns_file_erase_sector(struct nandsim *ns)
+{
+	int i;
+	loff_t pos;
+	ssize_t tx;
+	struct ns_file_data *data = ns->backend_data;
+
+	memset(data->file_buf, 0xff, ns->geom.pgszoob);
+
+	for (i = 0; i < ns->geom.pgsec; i++) {
+		pos = (loff_t)(ns->regs.row + i) * ns->geom.pgszoob;
+		tx = kernel_write(data->file, data->file_buf, ns->geom.pgszoob, pos);
+		if (tx != ns->geom.pgszoob) {
+			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+		}
+	}
+}
+
 static int ns_ram_prog_page(struct nandsim *ns, int num)
 {
 	int i;
@@ -1690,6 +1793,39 @@ static int ns_cachefile_prog_page(struct nandsim *ns, int num)
 	return 0;
 }
 
+static int ns_file_prog_page(struct nandsim *ns, int num)
+{
+	int i;
+	loff_t off;
+	ssize_t tx;
+	u_char *pg_off;
+	struct ns_file_data *data = ns->backend_data;
+
+	NS_DBG("prog_page: writing page %d\n", ns->regs.row);
+
+	pg_off = data->file_buf + ns->regs.column + ns->regs.off;
+	off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
+
+	tx = kernel_read(data->file, off, pg_off, num);
+	if (tx == 0)
+		memset(pg_off, 0xff, num);
+	else if (tx != num) {
+		NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+		return -1;
+	}
+
+	for (i = 0; i < num; i++)
+		pg_off[i] &= ns->buf.byte[i];
+
+	tx = kernel_write(data->file, pg_off, num, off);
+	if (tx != num) {
+		NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+		return -1;
+	}
+
+	return 0;
+}
+
 static struct ns_backend_ops ns_ram_bops = {
 	.erase_sector = ns_ram_erase_sector,
 	.prog_page = ns_ram_prog_page,
@@ -1706,6 +1842,13 @@ static struct ns_backend_ops ns_cachefile_bops = {
 	.destroy = ns_cachefile_destroy,
 };
 
+static struct ns_backend_ops ns_file_bops = {
+	.erase_sector = ns_file_erase_sector,
+	.prog_page = ns_file_prog_page,
+	.read_page = ns_file_read_page,
+	.init = ns_file_init,
+	.destroy = ns_file_destroy,
+};
 
 /*
  * If state has any action bit, perform this action.
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index 2d596ad..e3d2c9f 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -23,6 +23,7 @@ struct nandsim_params {
 	unsigned int bbt;
 	unsigned int bch;
 	unsigned char *id_bytes;
+	unsigned int file_fd;
 	struct ns_backend_ops *bops;
 };
 
-- 
2.8.3
