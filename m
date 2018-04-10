From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <david.oberhollenzer@sigma-star.at>, <boris.brezillon@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v2 1/3] libmtd: Add support to access OOB available size
Date: Tue, 10 Apr 2018 15:36:55 +0800
Message-ID: <1523345817-42627-2-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1523345817-42627-1-git-send-email-xiaolei.li@mediatek.com>
References: <1523345817-42627-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch exposes OOB available size to user. Then user can use
OOB free area according to OOB available size.

Steps to get OOB available size:
First, access /sys/class/mtd/mtdX/oobavail. If not exist, then
try to get ecc layout by ioctl "ECCGETLAYOUT". If none of them
work, set OOB available size to 0.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 include/libmtd.h    |  2 ++
 lib/libmtd.c        | 14 ++++++++++++++
 lib/libmtd_int.h    |  5 +++++
 lib/libmtd_legacy.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/include/libmtd.h b/include/libmtd.h
index db85fb4..cc24af8 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -66,6 +66,7 @@ struct mtd_info
  * @min_io_size: minimum input/output unit size
  * @subpage_size: sub-page size
  * @oob_size: OOB size (zero if the device does not have OOB area)
+ * @oobavail: free OOB size
  * @region_cnt: count of additional erase regions
  * @writable: zero if the device is read-only
  * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
@@ -84,6 +85,7 @@ struct mtd_dev_info
 	int min_io_size;
 	int subpage_size;
 	int oob_size;
+	int oobavail;
 	int region_cnt;
 	unsigned int writable:1;
 	unsigned int bb_allowed:1;
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 86c89ae..7382229 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -614,6 +614,10 @@ libmtd_t libmtd_open(void)
 	if (!lib->mtd_oob_size)
 		goto out_error;
 
+	lib->mtd_oobavail = mkpath(lib->mtd, MTD_OOBAVAIL);
+	if (!lib->mtd_oobavail)
+		goto out_error;
+
 	lib->mtd_region_cnt = mkpath(lib->mtd, MTD_REGION_CNT);
 	if (!lib->mtd_region_cnt)
 		goto out_error;
@@ -637,6 +641,7 @@ void libmtd_close(libmtd_t desc)
 	free(lib->mtd_flags);
 	free(lib->mtd_region_cnt);
 	free(lib->mtd_oob_size);
+	free(lib->mtd_oobavail);
 	free(lib->mtd_subpage_size);
 	free(lib->mtd_min_io_size);
 	free(lib->mtd_size);
@@ -769,6 +774,15 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 		return -1;
 	if (dev_read_pos_int(lib->mtd_oob_size, mtd_num, &mtd->oob_size))
 		return -1;
+	if (dev_read_pos_int(lib->mtd_oobavail, mtd_num, &mtd->oobavail)) {
+		/*
+		 * Fail to access oobavail sysfs file,
+		 * try ioctl ECCGETLAYOUT. */
+		mtd->oobavail = legacy_get_mtd_oobavail1(mtd_num);
+		/* Set 0 as default if can not get valid ecc layout */
+		if (mtd->oobavail < 0)
+			mtd->oobavail = 0;
+	}
 	if (dev_read_pos_int(lib->mtd_region_cnt, mtd_num, &mtd->region_cnt))
 		return -1;
 	if (dev_read_hex_int(lib->mtd_flags, mtd_num, &ret))
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index 03b0863..c0514d2 100644
--- a/lib/libmtd_int.h
+++ b/lib/libmtd_int.h
@@ -44,6 +44,7 @@ extern "C" {
 #define MTD_MIN_IO_SIZE  "writesize"
 #define MTD_SUBPAGE_SIZE "subpagesize"
 #define MTD_OOB_SIZE     "oobsize"
+#define MTD_OOBAVAIL     "oobavail"
 #define MTD_REGION_CNT   "numeraseregions"
 #define MTD_FLAGS        "flags"
 
@@ -63,6 +64,7 @@ extern "C" {
  * @mtd_min_io_size: minimum I/O unit size file pattern
  * @mtd_subpage_size: sub-page size file pattern
  * @mtd_oob_size: MTD device OOB size file pattern
+ * @mtd_oobavail: MTD device free OOB size file pattern
  * @mtd_region_cnt: count of additional erase regions file pattern
  * @mtd_flags: MTD device flags file pattern
  * @sysfs_supported: non-zero if sysfs is supported by MTD
@@ -92,6 +94,7 @@ struct libmtd
 	char *mtd_min_io_size;
 	char *mtd_subpage_size;
 	char *mtd_oob_size;
+	char *mtd_oobavail;
 	char *mtd_region_cnt;
 	char *mtd_flags;
 	unsigned int sysfs_supported:1;
@@ -103,6 +106,8 @@ int legacy_dev_present(int mtd_num);
 int legacy_mtd_get_info(struct mtd_info *info);
 int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd);
 int legacy_get_dev_info1(int dev_num, struct mtd_dev_info *mtd);
+int legacy_get_mtd_oobavail(const char *node);
+int legacy_get_mtd_oobavail1(int mtd_num);
 
 #ifdef __cplusplus
 }
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 46f51fd..e1ab48e 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -215,6 +215,46 @@ int legacy_mtd_get_info(struct mtd_info *info)
 	return 0;
 }
 
+int legacy_get_mtd_oobavail(const char *node)
+{
+	struct stat st;
+	struct nand_ecclayout_user usrlay;
+	int fd, ret;
+
+	if (stat(node, &st))
+		return sys_errmsg("cannot open \"%s\"", node);
+
+	if (!S_ISCHR(st.st_mode)) {
+		errno = EINVAL;
+		return errmsg("\"%s\" is not a character device", node);
+	}
+
+	fd = open(node, O_RDONLY);
+	if (fd == -1)
+		return sys_errmsg("cannot open \"%s\"", node);
+
+	ret = ioctl(fd, ECCGETLAYOUT, &usrlay);
+	if (ret < 0) {
+		sys_errmsg("ECCGETLAYOUT ioctl request failed");
+		goto out_close;
+	}
+
+	ret = usrlay.oobavail;
+
+out_close:
+	close(fd);
+
+	return ret;
+}
+
+int legacy_get_mtd_oobavail1(int mtd_num)
+{
+	char node[sizeof(MTD_DEV_PATT) + 20];
+
+	sprintf(node, MTD_DEV_PATT, mtd_num);
+	return legacy_get_mtd_oobavail(node);
+}
+
 /**
  * legacy_get_dev_info - legacy version of 'mtd_get_dev_info()'.
  * @node: name of the MTD device node
@@ -335,6 +375,9 @@ int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
 
 	close(fd);
 
+	ret = legacy_get_mtd_oobavail(node);
+	mtd->oobavail = ret > 0 ? ret : 0;
+
 	/*
 	 * Unfortunately, the device name is not available via ioctl, and
 	 * we have to parse /proc/mtd to get it.
-- 
1.9.1
