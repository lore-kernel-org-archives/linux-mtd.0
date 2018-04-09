From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <david.oberhollenzer@sigma-star.at>, <boris.brezillon@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 1/2] libmtd: Add support to access OOB available size
Date: Mon, 9 Apr 2018 11:10:09 +0800
Message-ID: <1523243410-65424-2-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1523243410-65424-1-git-send-email-xiaolei.li@mediatek.com>
References: <1523243410-65424-1-git-send-email-xiaolei.li@mediatek.com>
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

Fetch OOB available size by accessing /sys/class/mtd/mtdX/oobavail.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
This patch depends on the reviewing patch "mtd: Add sysfs attribute for
mtd OOB available size"[1].

[1] https://patchwork.kernel.org/patch/10319475/
---
 include/libmtd.h | 2 ++
 lib/libmtd.c     | 7 +++++++
 lib/libmtd_int.h | 3 +++
 3 files changed, 12 insertions(+)

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
index 86c89ae..76a9439 100644
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
@@ -769,6 +774,8 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 		return -1;
 	if (dev_read_pos_int(lib->mtd_oob_size, mtd_num, &mtd->oob_size))
 		return -1;
+	if (dev_read_pos_int(lib->mtd_oobavail, mtd_num, &mtd->oobavail))
+		return -1;
 	if (dev_read_pos_int(lib->mtd_region_cnt, mtd_num, &mtd->region_cnt))
 		return -1;
 	if (dev_read_hex_int(lib->mtd_flags, mtd_num, &ret))
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index 03b0863..3cab32b 100644
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
-- 
1.9.1
