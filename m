Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0GER-0000FZ-D8
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 13:58:08 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	mACDvxPf001624
	for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2008 15:58:02 +0200
Message-ID: <491AE2CF.3010901@nokia.com>
Date: Wed, 12 Nov 2008 16:06:07 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] [NAND] nandsim: add option to use a file to cache pages
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new module parameter 'cache_file' which causes nandsim
to use that file instead of memory to cache nand data.
Using a file allows the simulation of NAND that is bigger
than the available memory.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/nand/nandsim.c |  285 ++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 261 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index ae7c577..1045de9 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -38,6 +38,8 @@
 #include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/random.h>
+#include <linux/fs.h>
+#include <linux/pagemap.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -100,6 +102,7 @@ static unsigned int bitflips = 0;
 static char *gravepages = NULL;
 static unsigned int rptwear = 0;
 static unsigned int overridesize = 0;
+static char *cache_file = NULL;
 
 module_param(first_id_byte,  uint, 0400);
 module_param(second_id_byte, uint, 0400);
@@ -122,12 +125,13 @@ module_param(bitflips,       uint, 0400);
 module_param(gravepages,     charp, 0400);
 module_param(rptwear,        uint, 0400);
 module_param(overridesize,   uint, 0400);
+module_param(cache_file,     charp, 0400);
 
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
 MODULE_PARM_DESC(third_id_byte,  "The third byte returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(fourth_id_byte, "The fourth byte returned by NAND Flash 'read ID' command");
-MODULE_PARM_DESC(access_delay,   "Initial page access delay (microiseconds)");
+MODULE_PARM_DESC(access_delay,   "Initial page access delay (microseconds)");
 MODULE_PARM_DESC(programm_delay, "Page programm delay (microseconds");
 MODULE_PARM_DESC(erase_delay,    "Sector erase delay (milliseconds)");
 MODULE_PARM_DESC(output_cycle,   "Word output (from flash) time (nanodeconds)");
@@ -153,6 +157,7 @@ MODULE_PARM_DESC(rptwear,        "Number of erases inbetween reporting wear, if
 MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the ID bytes. "
 				 "The size is specified in erase blocks and as the exponent of a power of two"
 				 " e.g. 5 means a size of 32 erase blocks");
+MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of memory");
 
 /* The largest possible page size */
 #define NS_LARGEST_PAGE_SIZE	2048
@@ -266,6 +271,9 @@ MODULE_PARM_DESC(overridesize,   "Specifies the NAND Flash size overriding the I
  */
 #define NS_MAX_PREVSTATES 1
 
+/* Maximum page cache pages needed to read or write a NAND page to the cache_file */
+#define NS_MAX_HELD_PAGES 16
+
 /*
  * A union to represent flash memory contents and flash buffer.
  */
@@ -335,6 +343,13 @@ struct nandsim {
                 int ale; /* address Latch Enable */
                 int wp;  /* write Protect */
         } lines;
+
+	/* Fields needed when using a cache file */
+	struct file *cfile; /* Open file */
+	unsigned char *pages_written; /* Which pages have been written */
+	void *file_buf;
+	struct page *held_pages[NS_MAX_HELD_PAGES];
+	int held_cnt;
 };
 
 /*
@@ -427,11 +442,43 @@ static u_char ns_verify_buf[NS_LARGEST_PAGE_SIZE];
  */
 static int alloc_device(struct nandsim *ns)
 {
-	int i;
+	struct file *cfile;
+	int i, err;
+
+	if (cache_file) {
+		cfile = filp_open(cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0600);
+		if (IS_ERR(cfile))
+			return PTR_ERR(cfile);
+		if (!cfile->f_op || (!cfile->f_op->read && !cfile->f_op->aio_read)) {
+			NS_ERR("alloc_device: cache file not readable\n");
+			err = -EINVAL;
+			goto err_close;
+		}
+		if (!cfile->f_op->write && !cfile->f_op->aio_write) {
+			NS_ERR("alloc_device: cache file not writeable\n");
+			err = -EINVAL;
+			goto err_close;
+		}
+		ns->pages_written = vmalloc(ns->geom.pgnum);
+		if (!ns->pages_written) {
+			NS_ERR("alloc_device: unable to allocate pages written array\n");
+			err = -ENOMEM;
+			goto err_close;
+		}
+		ns->file_buf = kmalloc(ns->geom.pgszoob, GFP_KERNEL);
+		if (!ns->file_buf) {
+			NS_ERR("alloc_device: unable to allocate file buf\n");
+			err = -ENOMEM;
+			goto err_free;
+		}
+		ns->cfile = cfile;
+		memset(ns->pages_written, 0, ns->geom.pgnum);
+		return 0;
+	}
 
 	ns->pages = vmalloc(ns->geom.pgnum * sizeof(union ns_mem));
 	if (!ns->pages) {
-		NS_ERR("alloc_map: unable to allocate page array\n");
+		NS_ERR("alloc_device: unable to allocate page array\n");
 		return -ENOMEM;
 	}
 	for (i = 0; i < ns->geom.pgnum; i++) {
@@ -439,6 +486,12 @@ static int alloc_device(struct nandsim *ns)
 	}
 
 	return 0;
+
+err_free:
+	vfree(ns->pages_written);
+err_close:
+	filp_close(cfile, NULL);
+	return err;
 }
 
 /*
@@ -448,6 +501,13 @@ static void free_device(struct nandsim *ns)
 {
 	int i;
 
+	if (ns->cfile) {
+		kfree(ns->file_buf);
+		vfree(ns->pages_written);
+		filp_close(ns->cfile, NULL);
+		return;
+	}
+
 	if (ns->pages) {
 		for (i = 0; i < ns->geom.pgnum; i++) {
 			if (ns->pages[i].byte)
@@ -1211,6 +1271,97 @@ static int find_operation(struct nandsim *ns, uint32_t flag)
 	return -1;
 }
 
+static void put_pages(struct nandsim *ns)
+{
+	int i;
+
+	for (i = 0; i < ns->held_cnt; i++)
+		page_cache_release(ns->held_pages[i]);
+}
+
+/* Get page cache pages in advance to provide NOFS memory allocation */
+static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t pos)
+{
+	pgoff_t index, start_index, end_index;
+	struct page *page;
+	struct address_space *mapping = file->f_mapping;
+
+	start_index = pos >> PAGE_CACHE_SHIFT;
+	end_index = (pos + count - 1) >> PAGE_CACHE_SHIFT;
+	if (end_index - start_index + 1 > NS_MAX_HELD_PAGES)
+		return -EINVAL;
+	ns->held_cnt = 0;
+	for (index = start_index; index <= end_index; index++) {
+		page = find_get_page(mapping, index);
+		if (page == NULL) {
+			page = find_or_create_page(mapping, index, GFP_NOFS);
+			if (page == NULL) {
+				write_inode_now(mapping->host, 1);
+				page = find_or_create_page(mapping, index, GFP_NOFS);
+			}
+			if (page == NULL) {
+				put_pages(ns);
+				return -ENOMEM;
+			}
+			unlock_page(page);
+		}
+		ns->held_pages[ns->held_cnt++] = page;
+	}
+	return 0;
+}
+
+static int set_memalloc(void)
+{
+	if (current->flags & PF_MEMALLOC)
+		return 0;
+	current->flags |= PF_MEMALLOC;
+	return 1;
+}
+
+static void clear_memalloc(int memalloc)
+{
+	if (memalloc)
+		current->flags &= ~PF_MEMALLOC;
+}
+
+static ssize_t read_file(struct nandsim *ns, struct file *file, void *buf, size_t count, loff_t *pos)
+{
+	mm_segment_t old_fs;
+	ssize_t tx;
+	int err, memalloc;
+
+	err = get_pages(ns, file, count, *pos);
+	if (err)
+		return err;
+	old_fs = get_fs();
+	set_fs(get_ds());
+	memalloc = set_memalloc();
+	tx = vfs_read(file, (char __user *)buf, count, pos);
+	clear_memalloc(memalloc);
+	set_fs(old_fs);
+	put_pages(ns);
+	return tx;
+}
+
+static ssize_t write_file(struct nandsim *ns, struct file *file, void *buf, size_t count, loff_t *pos)
+{
+	mm_segment_t old_fs;
+	ssize_t tx;
+	int err, memalloc;
+
+	err = get_pages(ns, file, count, *pos);
+	if (err)
+		return err;
+	old_fs = get_fs();
+	set_fs(get_ds());
+	memalloc = set_memalloc();
+	tx = vfs_write(file, (char __user *)buf, count, pos);
+	clear_memalloc(memalloc);
+	set_fs(old_fs);
+	put_pages(ns);
+	return tx;
+}
+
 /*
  * Returns a pointer to the current page.
  */
@@ -1227,6 +1378,38 @@ static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
 	return NS_GET_PAGE(ns)->byte + ns->regs.column + ns->regs.off;
 }
 
+int do_read_error(struct nandsim *ns, int num)
+{
+	unsigned int page_no = ns->regs.row;
+
+	if (read_error(page_no)) {
+		int i;
+		memset(ns->buf.byte, 0xFF, num);
+		for (i = 0; i < num; ++i)
+			ns->buf.byte[i] = random32();
+		NS_WARN("simulating read error in page %u\n", page_no);
+		return 1;
+	}
+	return 0;
+}
+
+void do_bit_flips(struct nandsim *ns, int num)
+{
+	if (bitflips && random32() < (1 << 22)) {
+		int flips = 1;
+		if (bitflips > 1)
+			flips = (random32() % (int) bitflips) + 1;
+		while (flips--) {
+			int pos = random32() % (num * 8);
+			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
+			NS_WARN("read_page: flipping bit %d in page %d "
+				"reading from %d ecc: corrected=%u failed=%u\n",
+				pos, ns->regs.row, ns->regs.column + ns->regs.off,
+				nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
+		}
+	}
+}
+
 /*
  * Fill the NAND buffer with data read from the specified page.
  */
@@ -1234,36 +1417,40 @@ static void read_page(struct nandsim *ns, int num)
 {
 	union ns_mem *mypage;
 
+	if (ns->cfile) {
+		if (!ns->pages_written[ns->regs.row]) {
+			NS_DBG("read_page: page %d not written\n", ns->regs.row);
+			memset(ns->buf.byte, 0xFF, num);
+		} else {
+			loff_t pos;
+			ssize_t tx;
+
+			NS_DBG("read_page: page %d written, reading from %d\n",
+				ns->regs.row, ns->regs.column + ns->regs.off);
+			if (do_read_error(ns, num))
+				return;
+			pos = (loff_t)ns->regs.row * ns->geom.pgszoob + ns->regs.column + ns->regs.off;
+			tx = read_file(ns, ns->cfile, ns->buf.byte, num, &pos);
+			if (tx != num) {
+				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				return;
+			}
+			do_bit_flips(ns, num);
+		}
+		return;
+	}
+
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
 		NS_DBG("read_page: page %d not allocated\n", ns->regs.row);
 		memset(ns->buf.byte, 0xFF, num);
 	} else {
-		unsigned int page_no = ns->regs.row;
 		NS_DBG("read_page: page %d allocated, reading from %d\n",
 			ns->regs.row, ns->regs.column + ns->regs.off);
-		if (read_error(page_no)) {
-			int i;
-			memset(ns->buf.byte, 0xFF, num);
-			for (i = 0; i < num; ++i)
-				ns->buf.byte[i] = random32();
-			NS_WARN("simulating read error in page %u\n", page_no);
+		if (do_read_error(ns, num))
 			return;
-		}
 		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
-		if (bitflips && random32() < (1 << 22)) {
-			int flips = 1;
-			if (bitflips > 1)
-				flips = (random32() % (int) bitflips) + 1;
-			while (flips--) {
-				int pos = random32() % (num * 8);
-				ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
-				NS_WARN("read_page: flipping bit %d in page %d "
-					"reading from %d ecc: corrected=%u failed=%u\n",
-					pos, ns->regs.row, ns->regs.column + ns->regs.off,
-					nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
-			}
-		}
+		do_bit_flips(ns, num);
 	}
 }
 
@@ -1275,6 +1462,15 @@ static void erase_sector(struct nandsim *ns)
 	union ns_mem *mypage;
 	int i;
 
+	if (ns->cfile) {
+		for (i = 0; i < ns->geom.pgsec; i++)
+			if (ns->pages_written[ns->regs.row + i]) {
+				NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
+				ns->pages_written[ns->regs.row + i] = 0;
+			}
+		return;
+	}
+
 	mypage = NS_GET_PAGE(ns);
 	for (i = 0; i < ns->geom.pgsec; i++) {
 		if (mypage->byte != NULL) {
@@ -1295,6 +1491,47 @@ static int prog_page(struct nandsim *ns, int num)
 	union ns_mem *mypage;
 	u_char *pg_off;
 
+	if (ns->cfile) {
+		loff_t off, pos;
+		ssize_t tx;
+		int all;
+
+		NS_DBG("prog_page: writing page %d\n", ns->regs.row);
+		pg_off = ns->file_buf + ns->regs.column + ns->regs.off;
+		off = (loff_t)ns->regs.row * ns->geom.pgszoob + ns->regs.column + ns->regs.off;
+		if (!ns->pages_written[ns->regs.row]) {
+			all = 1;
+			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
+		} else {
+			all = 0;
+			pos = off;
+			tx = read_file(ns, ns->cfile, pg_off, num, &pos);
+			if (tx != num) {
+				NS_ERR("prog_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				return -1;
+			}
+		}
+		for (i = 0; i < num; i++)
+			pg_off[i] &= ns->buf.byte[i];
+		if (all) {
+			pos = (loff_t)ns->regs.row * ns->geom.pgszoob;
+			tx = write_file(ns, ns->cfile, ns->file_buf, ns->geom.pgszoob, &pos);
+			if (tx != ns->geom.pgszoob) {
+				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				return -1;
+			}
+			ns->pages_written[ns->regs.row] = 1;
+		} else {
+			pos = off;
+			tx = write_file(ns, ns->cfile, pg_off, num, &pos);
+			if (tx != num) {
+				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
+				return -1;
+			}
+		}
+		return 0;
+	}
+
 	mypage = NS_GET_PAGE(ns);
 	if (mypage->byte == NULL) {
 		NS_DBG("prog_page: allocating page %d\n", ns->regs.row);
-- 
1.5.4.3
