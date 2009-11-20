Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NBWUf-0000r9-Hq
	for linux-mtd@lists.infradead.org; Fri, 20 Nov 2009 16:38:02 +0000
Date: Fri, 20 Nov 2009 17:37:44 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] fio infrastructure
Message-ID: <20091120163744.GB1716@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I really wish I could have tested this with working hardware, but the
gods are against that idea.  So here is a patch anyway.

Main idea is to have three asynchonous operations for read, write and
erase.  The old erase method already has an asynchronous interface, so
arguably I could have reused that.  But for consistency and because no
existing driver actually worked asynchronously, I decided to add a new
method for erase as well.

Each operation works on the smallest possible entity - either a page or
a block.  If and when hardware arrives that performs better when using
larger operations, we can still change that.

The wait_multiple_* code is can be used to send off a lot of IO at once
and wait for it all to finish.

Comments?

Jörn

-- 
To my face you have the audacity to advise me to become a thief - the worst
kind of thief that is conceivable, a thief of spiritual things, a thief of
ideas! It is insufferable, intolerable!
-- M. Binet in Scarabouche

FIO or Flash IO is loosely based on bio.  Like bios, fios are
asynchronous and can be queued, reordered, etc.  Unlike bios, fios are
tiny operations - single page read, single page write, single block
erase.  To group larger operations, the wait_multiple infrastructure
can be used.
---
 drivers/mtd/mtdcore.c   |   25 +++++++++++++++++++++++
 include/linux/mtd/mtd.h |   51 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 467a4f1..04ac1a0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -44,6 +44,31 @@ EXPORT_SYMBOL_GPL(mtd_table);
 static LIST_HEAD(mtd_notifiers);
 
 
+void wait_multiple_init(struct wait_multiple *wm_data, int count)
+{
+	kref_set(&wm_data->refcount, count);
+	init_completion(&wm_data->complete);
+	wm_data->err = 0;
+}
+
+void wait_multiple_release(struct kref *kref)
+{
+	struct wait_multiple *wm_data;
+
+	wm_data = container_of(kref, struct wait_multiple, refcount);
+	complete(&wm_data->complete);
+}
+
+void wait_multiple_complete(struct fio *fio)
+{
+	struct wait_multiple *wm_data = fio->fi_private;
+
+	if (fio->fi_err && !wm_data->err)
+		wm_data->err = fio->fi_err;
+	kref_put(&wm_data->refcount, wait_multiple_release);
+	free_fio(fio);
+}
+
 #if defined(CONFIG_MTD_CHAR) || defined(CONFIG_MTD_CHAR_MODULE)
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 #else
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0f32a9b..3f0a65e 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -48,6 +48,52 @@ struct erase_info {
 	struct erase_info *next;
 };
 
+enum fio_type {
+	FIO_READ_OOB	= 1,
+	FIO_READ	= 2,
+	FIO_WRITE	= 3,
+	FIO_ERASE	= 4,
+};
+
+/*
+ * A fio does one thing and does it well - asynchronously and out of order.
+ * One thing means a single small operation, a page read, a page write or a
+ * block erase.
+ */
+struct fio;
+typedef void (fio_end_io_t) (struct fio *fio);
+struct fio {
+	struct list_head fi_list;
+	enum fio_type	 fi_type;
+	struct mtd_info	*fi_mtd;
+	u64		 fi_ofs;
+	void		*fi_private;
+	fio_end_io_t	*fi_end_io;
+	int		 fi_err;
+	struct kref	 fi_refcount;
+	struct page	*fi_page;
+};
+
+static inline struct fio *alloc_fio(gfp_t gfp_mask)
+{
+	return kzalloc(sizeof(struct fio), gfp_mask);
+}
+
+static inline void free_fio(struct fio *fio)
+{
+	kfree(fio);
+}
+
+struct wait_multiple {
+	struct completion complete;
+	struct kref refcount;
+	int err;
+};
+
+void wait_multiple_init(struct wait_multiple *wm_data, int count);
+void wait_multiple_release(struct kref *kref);
+void wait_multiple_complete(struct fio *fio);
+
 struct mtd_erase_region_info {
 	uint64_t offset;			/* At which this region starts, from the beginning of the MTD */
 	uint32_t erasesize;		/* For this region */
@@ -181,6 +227,11 @@ struct mtd_info {
 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
+	void (*fio_read)(struct fio *fio);
+	void (*fio_write)(struct fio *fio);
+	/* XXX  Caller has to check for bad blocks manually. */
+	void (*fio_erase)(struct fio *fio);
+
 	/* In blackbox flight recorder like scenarios we want to make successful
 	   writes in interrupt context. panic_write() is only intended to be
 	   called when its known the kernel is about to panic and we need the
-- 
1.6.2.1
