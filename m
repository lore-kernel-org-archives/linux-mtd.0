Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6ogx-0005iP-K9
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 18:40:01 +0000
Received: by vws8 with SMTP id 8so5311339vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 11:39:58 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] MTD: Retry Read/Write Transfer Buffer Allocations
Date: Mon,  4 Apr 2011 11:39:49 -0700
Message-Id: <1301942389-10393-1-git-send-email-marathon96@gmail.com>
In-Reply-To: <1301707797-9458-1-git-send-email-marathon96@gmail.com>
References: <1301707797-9458-1-git-send-email-marathon96@gmail.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As promised, this is the alternate, work-in-progress implementation of
this patch using the more complex get_user_pages and iovecs to perform
a user-requested read or write operation, reusing the buffer passed
from user-space.

As implemented below, reads work 100% of the time for the few test
cases I've thrown at it (fw_printenv and nanddump). However, writes
will not work in this implementation unless the size and offset meet
the alignment requirements stipulated by nand_do_write_ops. Addressing
this will require deblocking the head and tail of the transfer.

I see this as a follow on, interative approach to the simpler,
short-term patch submitted by Jarkko and myself. Hopefully, we can
upstream that patch now and follow up with this later when complete.

Comments and tweaks welcomed.

Best,

Grant

---
 drivers/mtd/mtdchar.c |  342 ++++++++++++++++++++++++++++++++++++++-----------
 1 files changed, 265 insertions(+), 77 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 145b3d0d..cd33128 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -51,6 +51,18 @@ struct mtd_file_info {
 	enum mtd_file_modes mode;
 };
 
+/*
+ * Data structure to handle scatter/gather transfer pages and
+ * page extents for user-space read and write requests.
+ */
+struct mtd_xio {
+	bool write;
+	struct page **pages;
+	unsigned long npages;
+	struct iovec *iovecs;
+	unsigned long niovecs;
+};
+
 static loff_t mtd_lseek (struct file *file, loff_t offset, int orig)
 {
 	struct mtd_file_info *mfi = file->private_data;
@@ -166,60 +178,170 @@ static int mtd_close(struct inode *inode, struct file *file)
 	return 0;
 } /* mtd_close */
 
-/* FIXME: This _really_ needs to die. In 2.5, we should lock the
-   userspace buffer down and use it directly with readv/writev.
-*/
-#define MAX_KMALLOC_SIZE 0x20000
+static inline bool pages_are_adjacent(struct page *first, struct page *second)
+{
+    return ((page_address(first) + PAGE_SIZE) == page_address(second));
+}
 
-static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t *ppos)
+static void pages_to_iovecs(size_t len, unsigned long off, struct page **pages, unsigned long npages, struct iovec *iovecs, unsigned long *niovecsp)
 {
-	struct mtd_file_info *mfi = file->private_data;
-	struct mtd_info *mtd = mfi->mtd;
-	size_t retlen=0;
-	size_t total_retlen=0;
-	int ret=0;
-	int len;
-	char *kbuf;
+	unsigned long iovec_len = 0;
+	size_t head_len, tail_len;
+	struct page *last_page, *curr_page;
+	void *address;
+	unsigned long p, v;
 
-	DEBUG(MTD_DEBUG_LEVEL0,"MTD_read\n");
+	/* Handle the head. */
 
-	if (*ppos + count > mtd->size)
-		count = mtd->size - *ppos;
+	head_len = min_t(size_t, len, PAGE_SIZE - off);
+	tail_len = (len - head_len) % PAGE_SIZE;
 
-	if (!count)
-		return 0;
+	iovecs[0].iov_base = page_address(pages[0]) + off;
+	iovecs[0].iov_len  = head_len;
 
-	/* FIXME: Use kiovec in 2.5 to lock down the user's buffers
-	   and pass them directly to the MTD functions */
+	/* Handle the body + tail. */
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
+	for (v = 0, p = 1; p < npages; p++) {
+		last_page = pages[p - 1];
+		curr_page = pages[p];
+		address = page_address(curr_page);
 
-	if (!kbuf)
-		return -ENOMEM;
+		if (!pages_are_adjacent(last_page, curr_page)) {
+		    iovecs[++v].iov_base = address;
+		}
+
+		iovecs[v].iov_len += PAGE_SIZE;
+	}
+
+	/* Fix-up the tail length. */
+
+	iovecs[v].iov_len -= (PAGE_SIZE - tail_len);
+
+	*niovecsp = v + 1;
+
+	for (v = 0; v < *niovecsp; v++) {
+		iovec_len += iovecs[v].iov_len;
+	}
+}
+
+static void put_pages(struct page **pages, unsigned long npages, bool write)
+{
+	unsigned long p;
+	struct page *page;
+
+	for (p = 0; p < npages; p++) {
+		page = pages[p];
+		if (write)
+			set_page_dirty_lock(page);
+		put_page(page);
+	}
+}
+
+static int mtd_get_user_pages(struct mtd_xio *mxio, void __user *base, size_t len, bool write)
+{
+	unsigned long ustart, off, npages, uend, niovecs;
+	struct page **pages;
+	struct iovec *iovecs;
+	int status;
+
+	if (unlikely(!access_ok(write ? VERIFY_WRITE : VERIFY_READ, base, len))) {
+		status = -EFAULT;
+		goto done;
+	}
+
+	ustart = (unsigned long)base & PAGE_MASK;
+	off = (unsigned long)base & ~PAGE_MASK;
+	npages = (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	uend = (unsigned long)(base + len);
+
+	niovecs = npages;
+
+	pages = kmalloc(npages * sizeof (struct page *), GFP_KERNEL);
+	if (!pages) {
+		status = -ENOMEM;
+		goto done;
+	}
+
+	iovecs = kzalloc(niovecs * sizeof (struct iovec), GFP_KERNEL);
+	if (!iovecs) {
+		status = -ENOMEM;
+		goto done_free_pages;
+	}
+
+	status = get_user_pages_fast(ustart, npages, write, pages);
+	if (status < 0)
+		goto done_free_iovecs;
+
+	if (status != npages) {
+		npages = status;
+		status = -EFAULT;
+		goto done_pages;
+	}
+
+	pages_to_iovecs(len, off, pages, npages, iovecs, &niovecs);
+
+	mxio->write	= write;
+	mxio->pages	= pages;
+	mxio->npages	= npages;
+	mxio->iovecs	= iovecs;
+	mxio->niovecs	= niovecs;
+
+	return status;
+
+ done_pages:
+	put_pages(pages, npages, write);
+
+ done_free_iovecs:
+	kfree(iovecs);
+
+ done_free_pages:
+	kfree(pages);
+
+ done:
+	return status;
+}
+
+static void mtd_put_user_pages(struct mtd_xio *mxio)
+{
+	if (!mxio)
+		return;
+
+	if (mxio->npages && mxio->pages) {
+		put_pages(mxio->pages, mxio->npages, mxio->write);
+		kfree(mxio->pages);
+	}
+
+	if (mxio->niovecs && mxio->iovecs) {
+		kfree(mxio->iovecs);
+	}
+}
+
+static ssize_t mtd_do_read(struct file *file, char __kernel *buf, size_t count, loff_t *ppos)
+{
+	struct mtd_file_info *mfi = file->private_data;
+	struct mtd_info *mtd = mfi->mtd;
+	size_t retlen=0;
+	size_t total_retlen=0;
+	int ret=0;
+	int len;
 
 	while (count) {
 
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
-		else
-			len = count;
+		len = count;
 
 		switch (mfi->mode) {
 		case MTD_MODE_OTP_FACTORY:
-			ret = mtd->read_fact_prot_reg(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd->read_fact_prot_reg(mtd, *ppos, len, &retlen, buf);
 			break;
 		case MTD_MODE_OTP_USER:
-			ret = mtd->read_user_prot_reg(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd->read_user_prot_reg(mtd, *ppos, len, &retlen, buf);
 			break;
 		case MTD_MODE_RAW:
 		{
 			struct mtd_oob_ops ops;
 
 			ops.mode = MTD_OOB_RAW;
-			ops.datbuf = kbuf;
+			ops.datbuf = buf;
 			ops.oobbuf = NULL;
 			ops.len = len;
 
@@ -228,7 +350,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 			break;
 		}
 		default:
-			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd->read(mtd, *ppos, len, &retlen, buf);
 		}
 		/* Nand returns -EBADMSG on ecc errors, but it returns
 		 * the data. For our userspace tools it is important
@@ -241,12 +363,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 		 */
 		if (!ret || (ret == -EUCLEAN) || (ret == -EBADMSG)) {
 			*ppos += retlen;
-			if (copy_to_user(buf, kbuf, retlen)) {
-				kfree(kbuf);
-				return -EFAULT;
-			}
-			else
-				total_retlen += retlen;
+			total_retlen += retlen;
 
 			count -= retlen;
 			buf += retlen;
@@ -254,56 +371,26 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 				count = 0;
 		}
 		else {
-			kfree(kbuf);
 			return ret;
 		}
 
 	}
 
-	kfree(kbuf);
 	return total_retlen;
-} /* mtd_read */
+}
 
-static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count,loff_t *ppos)
+static ssize_t mtd_do_write(struct file *file, const char __kernel *buf, size_t count, loff_t *ppos)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
-	char *kbuf;
 	size_t retlen;
 	size_t total_retlen=0;
 	int ret=0;
 	int len;
 
-	DEBUG(MTD_DEBUG_LEVEL0,"MTD_write\n");
-
-	if (*ppos == mtd->size)
-		return -ENOSPC;
-
-	if (*ppos + count > mtd->size)
-		count = mtd->size - *ppos;
-
-	if (!count)
-		return 0;
-
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
-
-	if (!kbuf)
-		return -ENOMEM;
-
 	while (count) {
 
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
-		else
-			len = count;
-
-		if (copy_from_user(kbuf, buf, len)) {
-			kfree(kbuf);
-			return -EFAULT;
-		}
+	    	len = count;
 
 		switch (mfi->mode) {
 		case MTD_MODE_OTP_FACTORY:
@@ -314,7 +401,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 				ret = -EOPNOTSUPP;
 				break;
 			}
-			ret = mtd->write_user_prot_reg(mtd, *ppos, len, &retlen, kbuf);
+			ret = mtd->write_user_prot_reg(mtd, *ppos, len, &retlen, (char __kernel *)buf);
 			break;
 
 		case MTD_MODE_RAW:
@@ -322,7 +409,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 			struct mtd_oob_ops ops;
 
 			ops.mode = MTD_OOB_RAW;
-			ops.datbuf = kbuf;
+			ops.datbuf = (char __kernel *)buf;
 			ops.oobbuf = NULL;
 			ops.len = len;
 
@@ -332,7 +419,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 		}
 
 		default:
-			ret = (*(mtd->write))(mtd, *ppos, len, &retlen, kbuf);
+			ret = (*(mtd->write))(mtd, *ppos, len, &retlen, buf);
 		}
 		if (!ret) {
 			*ppos += retlen;
@@ -341,13 +428,114 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 			buf += retlen;
 		}
 		else {
-			kfree(kbuf);
 			return ret;
 		}
 	}
 
-	kfree(kbuf);
 	return total_retlen;
+}
+
+typedef ssize_t (*mtd_io_fn_t)(struct file *, char *, size_t, loff_t *);
+
+static ssize_t mtd_do_loop_readv_writev(struct file *file, const struct iovec *iov, unsigned long iovcnt, loff_t *ppos, mtd_io_fn_t fn)
+{
+	const struct iovec *vector = iov;
+	ssize_t ret = 0;
+
+	while (iovcnt > 0) {
+		void *base;
+		size_t len;
+		ssize_t nr;
+
+		base = vector->iov_base;
+		len = vector->iov_len;
+		vector++;
+		iovcnt--;
+
+		nr = fn(file, base, len, ppos);
+
+		if (nr < 0) {
+			if (!ret)
+				ret = nr;
+			break;
+		}
+		ret += nr;
+		if (nr != len)
+			break;
+	}
+
+	return ret;
+}
+
+static ssize_t mtd_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct mtd_file_info *mfi = file->private_data;
+	struct mtd_info *mtd = mfi->mtd;
+	ssize_t ret;
+	size_t total_retlen=0;
+	struct mtd_xio mxio;
+
+	DEBUG(MTD_DEBUG_LEVEL0,"MTD_read\n");
+
+	if (*ppos + count > mtd->size)
+		count = mtd->size - *ppos;
+
+	if (!count)
+		return 0;
+
+	ret = mtd_get_user_pages(&mxio, buf, count, false);
+	if (ret < 0)
+	    goto done_put_pages;
+
+	total_retlen = mtd_do_loop_readv_writev(file,
+						mxio.iovecs,
+						mxio.niovecs,
+						ppos,
+						mtd_do_read);
+
+	ret = total_retlen;
+
+ done_put_pages:
+	mtd_put_user_pages(&mxio);
+
+	return ret;
+} /* mtd_read */
+
+static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct mtd_file_info *mfi = file->private_data;
+	struct mtd_info *mtd = mfi->mtd;
+	ssize_t ret;
+	size_t total_retlen=0;
+	struct mtd_xio mxio;
+
+	DEBUG(MTD_DEBUG_LEVEL0,"MTD_write\n");
+
+	if (*ppos == mtd->size)
+		return -ENOSPC;
+
+	if (*ppos + count > mtd->size)
+		count = mtd->size - *ppos;
+
+	if (!count)
+		return 0;
+
+	ret = mtd_get_user_pages(&mxio, (void __user *)buf, count, true);
+	if (ret < 0)
+	    goto done_put_pages;
+
+	total_retlen = mtd_do_loop_readv_writev(file,
+						mxio.iovecs,
+						mxio.niovecs,
+						ppos,
+						(mtd_io_fn_t)mtd_do_write);
+
+	ret = total_retlen;
+
+ done_put_pages:
+	mtd_put_user_pages(&mxio);
+
+	return ret;
 } /* mtd_write */
 
 /*======================================================================
