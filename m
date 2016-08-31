Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyb-0008WG-CJ
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:28 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/46] mtd: nandsim: Unify file backend init logic
Date: Wed, 31 Aug 2016 09:28:30 +0200
Message-Id: <20160831072853.27822-24-dwalter@sigma-star.at>
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

file and cache file backend do more or less the same,
so share some code.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 102 ++++++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 78c3ee4..f936157 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -312,6 +312,7 @@ struct ns_ram_data {
 
 struct ns_cachefile_data {
 	struct file *cfile; /* Open file */
+	bool file_opened; /* False when we operate on an already opened file */
 	unsigned long *pages_written; /* Which pages have been written */
 	void *file_buf;
 	struct page *held_pages[NS_MAX_HELD_PAGES];
@@ -637,25 +638,70 @@ static int ns_ram_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	return 0;
 }
 
-static int ns_cachefile_init(struct nandsim *ns, struct nandsim_params *nsparam)
+static struct file *get_file_from_nsparam(struct nandsim_params *nsparam, bool *opened)
 {
-	struct file *cfile;
 	int err;
-	struct ns_cachefile_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
+	struct file *file;
+	struct inode *inode;
 
-	cfile = filp_open(nsparam->cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0600);
-	if (IS_ERR(cfile))
-		return PTR_ERR(cfile);
-	if (!(cfile->f_mode & FMODE_CAN_READ)) {
+	if (nsparam->cache_file) {
+		file = filp_open(nsparam->cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0600);
+		if (IS_ERR(file))
+			return file;
+
+		*opened = true;
+	} else {
+		file = fget(nsparam->file_fd);
+		if (!file)
+			return ERR_PTR(-EBADF);
+
+		*opened = false;
+	}
+
+	inode = file->f_mapping->host;
+	if (!S_ISREG(inode->i_mode) && !S_ISBLK(inode->i_mode)) {
+		NS_ERR("alloc_device: Backend file is not a regular file nor a block device\n");
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (!(file->f_mode & FMODE_CAN_READ)) {
 		NS_ERR("alloc_device: cache file not readable\n");
 		err = -EINVAL;
-		goto err_close;
+		goto out;
 	}
-	if (!(cfile->f_mode & FMODE_CAN_WRITE)) {
+
+	if (!(file->f_mode & FMODE_CAN_WRITE)) {
 		NS_ERR("alloc_device: cache file not writeable\n");
 		err = -EINVAL;
-		goto err_close;
+		goto out;
 	}
+
+	return file;
+
+out:
+	if (*opened)
+		filp_close(file, NULL);
+	else
+		fput(file);
+
+	return ERR_PTR(err);
+}
+
+static int ns_cachefile_init(struct nandsim *ns, struct nandsim_params *nsparam)
+{
+	int err;
+	struct ns_cachefile_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
+
+	if (!data)
+		return -ENOMEM;
+
+	data->cfile = get_file_from_nsparam(nsparam, &data->file_opened);
+	if (IS_ERR(data->cfile)) {
+		err = PTR_ERR(data->cfile);
+		goto out;
+	}
+
 	data->pages_written = vzalloc(BITS_TO_LONGS(ns->geom.pgnum) *
 				    sizeof(unsigned long));
 	if (!data->pages_written) {
@@ -669,7 +715,6 @@ static int ns_cachefile_init(struct nandsim *ns, struct nandsim_params *nsparam)
 		err = -ENOMEM;
 		goto err_free;
 	}
-	data->cfile = cfile;
 
 	ns->backend_data = data;
 
@@ -678,15 +723,16 @@ static int ns_cachefile_init(struct nandsim *ns, struct nandsim_params *nsparam)
 err_free:
 	vfree(data->pages_written);
 err_close:
-	filp_close(cfile, NULL);
+	filp_close(data->cfile, NULL);
+out:
+	kfree(data);
 	return err;
 }
 
 static int ns_file_init(struct nandsim *ns, struct nandsim_params *nsparam)
 {
 	int ret;
-	struct file *file;
-	struct inode *inode;
+	bool dummy;
 	struct ns_file_data *data = kzalloc(sizeof(*data), GFP_KERNEL);
 
 	if (!data) {
@@ -694,27 +740,12 @@ static int ns_file_init(struct nandsim *ns, struct nandsim_params *nsparam)
 		goto out;
 	}
 
-	file = fget(nsparam->file_fd);
-	if (!file) {
-		ret = -EBADF;
+	data->file = get_file_from_nsparam(nsparam, &dummy);
+	if (IS_ERR(data->file)) {
+		ret = PTR_ERR(data->file);
 		goto out_free;
 	}
 
-	inode = file->f_mapping->host;
-	if (!S_ISREG(inode->i_mode) && !S_ISBLK(inode->i_mode)) {
-		NS_ERR("alloc_device: Backend file is not a regular file nor a block device\n");
-		ret = -EINVAL;
-		goto out_put;
-	}
-
-	if (!(file->f_mode & FMODE_WRITE)) {
-		NS_ERR("alloc_device: Backend file is not writeable\n");
-		ret = -EINVAL;
-		goto out_put;
-	}
-
-	data->file = file;
-
 	data->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
 	if (!data->file_buf) {
 		NS_ERR("alloc_device: unable to allocate file buf\n");
@@ -728,7 +759,7 @@ static int ns_file_init(struct nandsim *ns, struct nandsim_params *nsparam)
 	return ret;
 
 out_put:
-	fput(file);
+	fput(data->file);
 out_free:
 	kfree(data);
 out:
@@ -792,7 +823,10 @@ static void ns_cachefile_destroy(struct nandsim *ns)
 
 	kfree(data->file_buf);
 	vfree(data->pages_written);
-	filp_close(data->cfile, NULL);
+	if (data->file_opened)
+		filp_close(data->cfile, NULL);
+	else
+		fput(data->cfile);
 	kfree(data);
 }
 
-- 
2.8.3
