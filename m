Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bO2h2-0007YY-HY
 for linux-mtd@lists.infradead.org; Fri, 15 Jul 2016 12:58:16 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: dedekind1@gmail.com, computersforpeace@gmail.com, david@sigma-star.at,
 Richard Weinberger <richard@nod.at>
Subject: [RFC][PATCH] ubi: Implement a read cache
Date: Fri, 15 Jul 2016 14:57:34 +0200
Message-Id: <1468587454-7590-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement a simple read cache such that small adjacent reads
with in the same NAND page can be cached.
When a read smaller than a NAND page is requested, UBI reads the full
page and caches it.
NAND core has already such a cache but it will go away soon.

To be able to benchmark better, there is also a debugfs file which reports
cache stats, misses, hits and no_query.
Misses and hits should be clear, no_query is incremented when the cache
cannot be used, i.e. for reads larger than a page size.

This patch is just a PoC.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
Hi!

This is an initial draft for a read cache implemented in UBI.

The cache sits in ubi_eba_read_leb() and is used when the read length is
smaller than a NAND page and does not cross a page boundary, this can be
improved later.
Currently the cache consists of 61 cache lines where the PEB acts
as selector.
Maybe less cache lines would also do it, this needs to be benchmarked
in more detail.

I did already some benchmarks.
The system I've used has a 4GiB MLC NAND with 16KiB page size.
Userspace is a Debian 8 with systemd.

The following tasks have been benchmarked so far.
1. system bootup (userspace time as reported by systemd-analyze)
2. walking /usr, since this involves a lot of TNC lookups this is interesting
3. removing a 1GiB file, it involves also a lot of TNC lookups

Baseline
========

1. bootup time: 18 seconds

2. time find /usr > /dev/null
real    0m19.869s
user    0m0.120s
sys     0m7.300s

3. time rm /root/viel
real    0m32.992s
user    0m0.000s
sys     0m12.380s

While the results for 1 and 2 are okay, we observe that removing the file
took a rather long time.
The NAND driver on this target supports subpage reads and therefore the NAND
page cache was never used.
Since removing a large file leads to a lot of TNC lookups UBIFS issues many
reads with a length around 200 bytes and the overhead of every single mtd_read()
kickes in.

Baseline + NAND cache (hence, subpage read support disabled in our driver)
==========================================================================

1. bootup time: 19,5 seconds

2. time find /usr > /dev/null
real    0m24.555s
user    0m0.150s
sys     0m8.220s

3. time rm /root/viel
real    0m5.327s
user    0m0.000s
sys     0m3.300s

We observe that the bootup took a little longer, but the jitter here is about one
second.
Walking /usr took about 5 seconds longer, not sure why. This needs more inspection.

The most interesting result is that removing the large file took only 5 seconds,
compared to 33 seconds this is huge speedup.
Since the znodes of the same file are adjacent data structures on the flash
the cache on NAND level helped a lot.

UBI read cache with 1 cache line
================================

1. bootup time: 19,5 seconds
cache usage:
hits: 1546
misses: 6887
no_query: 649


2. time find /usr > /dev/null
real    0m24.297s
user    0m0.100s
sys     0m7.800s

cache usage:
hits: 4068
misses: 17669
no_query: 107

3. time rm /root/viel
real    0m5.457s
user    0m0.000s
sys     0m2.730s

cache usage:
hits: 34517
misses: 2490
no_query: 212

The results are more or less the same as with caching on the NAND side.
So, we could drop the NAND cache and have it implemented in UBI.
As expected the cache brings us most while deleting large files.

UBI read cache with 61 cache lines
==================================

1. bootup time: 17,5 seconds
hits: 2991
misses: 5436
no_query: 649

2. time find /usr > /dev/null
real    0m20.557s
user    0m0.120s
sys     0m7.080s

hits: 7064
misses: 14145
no_query: 116

3. time rm /root/viel
real    0m5.244s
user    0m0.000s
sys     0m2.840s

hits: 34228
misses: 2248
no_query: 202

With more cache lines we can reduce the boot time a bit, we also observe
that, compared to a single line, the cache hit rate is better.
Same for walking /usr.
Removing a large file is also fast.
So, having more cache lines helps but we need to figure out first how
much lines make sense.

Thanks,
//richard
---
 drivers/mtd/ubi/build.c |   1 +
 drivers/mtd/ubi/debug.c |  31 +++++++++++-
 drivers/mtd/ubi/eba.c   | 122 ++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/io.c    |   4 ++
 drivers/mtd/ubi/ubi.h   |  21 +++++++++
 5 files changed, 173 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index d570f4a..e94b84e 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1137,6 +1137,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	uif_close(ubi);
 
 	ubi_wl_close(ubi);
+	ubi_eba_read_cache_destroy(ubi);
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 	put_mtd_device(ubi->mtd);
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 7f2328e..71e8a98 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -298,8 +298,28 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 		count = simple_read_from_buffer(user_buf, count, ppos,
 						buf, strlen(buf));
 		goto out;
-	}
-	else {
+	} else if (dent == d->dfs_read_cache_stats) {
+		char *tmp;
+
+		if (!ubi->read_cache) {
+			count = -EINVAL;
+			goto out;
+		}
+
+		tmp = kasprintf(GFP_KERNEL, "hits: %li\nmisses: %li\nno_query: %li\n",
+			ubi->read_cache->hit_count, ubi->read_cache->miss_count,
+			ubi->read_cache->no_query);
+
+		if (!tmp) {
+			count = -ENOMEM;
+			goto out;
+		}
+
+		count = simple_read_from_buffer(user_buf, count, ppos,
+						tmp, strlen(tmp));
+		kfree(tmp);
+		goto out;
+	} else {
 		count = -EINVAL;
 		goto out;
 	}
@@ -501,6 +521,13 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_trigger_leb_consolidation = dent;
+
+	fname = "read_cache_stats";
+	dent = debugfs_create_file(fname, S_IRUGO, d->dfs_dir, (void *)ubi_num,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_read_cache_stats = dent;
 	return 0;
 
 out_remove:
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 25f38f9..0c10ec1 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -365,6 +365,68 @@ out_unlock:
 	return err;
 }
 
+void ubi_eba_read_cache_flush(struct ubi_device *ubi, int pnum)
+{
+	struct ubi_read_cache *read_cache = ubi->read_cache;
+	struct ubi_read_cache_line *line;
+
+	if (!read_cache)
+		return;
+
+	line = &read_cache->lines[pnum % UBI_READ_CACHE_LINES];
+
+	mutex_lock(&line->line_lock);
+	if (line->pnum == pnum)
+		line->pnum = line->offset = -1;
+	mutex_unlock(&line->line_lock);
+}
+
+static int read_cache_init(struct ubi_device *ubi)
+{
+	int i;
+	struct ubi_read_cache_line *line;
+	struct ubi_read_cache *read_cache = kzalloc(sizeof(*read_cache),
+						    GFP_KERNEL);
+
+	if (!read_cache)
+		return -ENOMEM;
+
+	for (i = 0; i < UBI_READ_CACHE_LINES; i++) {
+		line = &read_cache->lines[i];
+
+		mutex_init(&line->line_lock);
+		line->buf = kmalloc(ubi->mtd->writesize, GFP_KERNEL);
+		line->pnum = line->offset = -1;
+		if (!line->buf)
+			goto err_nomem;
+	}
+
+	read_cache->buflen = ubi->mtd->writesize;
+
+	ubi->read_cache = read_cache;
+
+	return 0;
+
+err_nomem:
+	for (i = 0; i < UBI_READ_CACHE_LINES; i++) {
+		line = &read_cache->lines[i];
+		kfree(line->buf);
+	}
+
+	return -ENOMEM;
+}
+
+void ubi_eba_read_cache_destroy(struct ubi_device *ubi)
+{
+	int i;
+	struct ubi_read_cache *read_cache = ubi->read_cache;
+
+	for (i = 0; i < UBI_READ_CACHE_LINES; i++)
+		kfree(read_cache->lines[i].buf);
+
+	kfree(read_cache);
+}
+
 /**
  * ubi_eba_read_leb - read data.
  * @ubi: UBI device description object
@@ -388,9 +450,14 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		     void *buf, int offset, int len, int check)
 {
 	int err, pnum, scrub = 0, vol_id = vol->vol_id, loffs = 0, lpos = 0;
+	int read_len, read_offset, read_buf_offset = 0;
+	struct ubi_read_cache *read_cache = ubi->read_cache;
+	struct ubi_read_cache_line *line = NULL;
 	struct ubi_vid_hdr *vid_hdr;
 	uint32_t uninitialized_var(crc);
 	struct ubi_leb_desc *clebs;
+	bool cache_hit = false;
+	char *read_buf;
 
 	err = leb_read_lock(ubi, vol_id, lnum);
 	if (err)
@@ -490,10 +557,52 @@ retry:
 		ubi_free_vid_hdr(ubi, vid_hdr);
 	}
 
-	if (!clebs)
-		err = ubi_io_read_data(ubi, buf, pnum, offset, len);
-	else
-		err = ubi_io_raw_read(ubi, buf, pnum, offset + loffs, len);
+	/* We cache only reads that are smaller than page size and don't cross page boundaries */
+	if (len > read_cache->buflen || (offset % read_cache->buflen) + len > read_cache->buflen) {
+		read_buf = buf;
+		read_len = len;
+		read_offset = clebs ? offset + loffs : offset;
+		read_cache->no_query++;
+	} else {
+		line = &read_cache->lines[pnum % UBI_READ_CACHE_LINES];
+		mutex_lock(&line->line_lock);
+
+		read_buf = line->buf;
+		read_len = read_cache->buflen;
+
+		if (ALIGN(offset, read_len) == offset)
+			read_offset = offset;
+		else
+			read_offset = ALIGN(offset, read_len) - read_len;
+
+		read_buf_offset = offset - read_offset;
+
+		if (clebs)
+			read_offset += loffs;
+
+		if (line->pnum == pnum && line->offset == read_offset) {
+			read_cache->hit_count++;
+			cache_hit = true;
+		} else
+			read_cache->miss_count++;
+	}
+
+	if (!cache_hit) {
+		if (!clebs)
+			err = ubi_io_read_data(ubi, read_buf, pnum, read_offset, read_len);
+		else
+			err = ubi_io_raw_read(ubi, read_buf, pnum, read_offset, read_len);
+	}
+
+	if (line) {
+		memcpy(buf, read_buf + read_buf_offset, len);
+		if (!cache_hit) {
+			line->pnum = pnum;
+			line->offset = read_offset;
+		}
+
+		mutex_unlock(&line->line_lock);
+	}
 
 	if (err) {
 		if (err == UBI_IO_BITFLIPS)
@@ -1709,6 +1818,10 @@ int ubi_eba_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	mutex_init(&ubi->alc_mutex);
 	ubi->ltree = RB_ROOT;
 
+	err = read_cache_init(ubi);
+	if (err)
+		goto out;
+
 	ubi->global_sqnum = ai->max_sqnum + 1;
 	num_volumes = ubi->vtbl_slots + UBI_INT_VOL_COUNT;
 
@@ -1807,5 +1920,6 @@ out_free:
 		kfree(ubi->volumes[i]->eba_tbl);
 		ubi->volumes[i]->eba_tbl = NULL;
 	}
+out:
 	return err;
 }
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 21afe7e..23cdc74 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -301,6 +301,8 @@ int ubi_io_mtd_write(struct ubi_device *ubi, const void *buf, int pnum, int offs
 	int chunklen, err = 0, end = offset + len;
 	struct mtd_pairing_info info;
 
+	ubi_eba_read_cache_flush(ubi, pnum);
+
 	if (raw || mtd_pairing_groups_per_eb(ubi->mtd) == 1)
 		return mtd_write(ubi->mtd, addr + offset, len, written, buf);
 
@@ -488,6 +490,8 @@ static int do_sync_erase(struct ubi_device *ubi, int pnum)
 		return -EROFS;
 	}
 
+	ubi_eba_read_cache_flush(ubi, pnum);
+
 retry:
 	init_waitqueue_head(&wq);
 	memset(&ei, 0, sizeof(struct erase_info));
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 09654aa..2c1f1ffa 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -451,6 +451,24 @@ struct ubi_debug_info {
 	struct dentry *dfs_emulate_power_cut;
 	struct dentry *dfs_power_cut_min;
 	struct dentry *dfs_power_cut_max;
+	struct dentry *dfs_read_cache_stats;
+};
+
+#define UBI_READ_CACHE_LINES 61
+
+struct ubi_read_cache_line {
+	int pnum;
+	int offset;
+	void *buf;
+	struct mutex line_lock;
+};
+
+struct ubi_read_cache {
+	struct ubi_read_cache_line lines[UBI_READ_CACHE_LINES];
+	int buflen;
+	long hit_count;
+	long miss_count;
+	long no_query;
 };
 
 /**
@@ -602,6 +620,7 @@ struct ubi_device {
 	spinlock_t ltree_lock;
 	struct rb_root ltree;
 	struct mutex alc_mutex;
+	struct ubi_read_cache *read_cache;
 
 	int lebs_per_cpeb;
 	struct mutex conso_lock;
@@ -921,6 +940,8 @@ int ubi_eba_leb_write_lock_nested(struct ubi_device *ubi, int vol_id, int lnum,
 void ubi_eba_leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnum);
 int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 		   struct ubi_attach_info *ai_scan);
+void ubi_eba_read_cache_flush(struct ubi_device *ubi, int pnum);
+void ubi_eba_read_cache_destroy(struct ubi_device *ubi);
 
 /* consolidate.c */
 #ifdef CONFIG_MTD_UBI_CONSOLIDATE
-- 
2.7.3
