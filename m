Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzKb-0003Qa-0q
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 09:30:58 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-FEM-01.mgc.mentorg.com)
 by relay1.mentorg.com with esmtp
 id 1auzKK-0000rc-CA from Marian_Rotariu@mentor.com
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 02:30:40 -0700
From: Marian Rotariu <marian_rotariu@mentor.com>
To: <linux-mtd@lists.infradead.org>
CC: Marian Rotariu <marian_rotariu@mentor.com>
Subject: [PATCH 2/4] mtd-utils: fetch erasereg info through ioctl
Date: Tue, 26 Apr 2016 12:30:22 +0300
Message-ID: <1461663024-12022-3-git-send-email-marian_rotariu@mentor.com>
In-Reply-To: <1461663024-12022-1-git-send-email-marian_rotariu@mentor.com>
References: <1461663024-12022-1-git-send-email-marian_rotariu@mentor.com>
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

Signed-off-by: Marian Rotariu <marian_rotariu@mentor.com>
---
 lib/libmtd.c     | 27 ++++++++++++++++++++++++++-
 lib/libmtd_int.h |  1 +
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index bf6d71f..f62cb69 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -731,8 +731,9 @@ out_close:
 
 int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 {
-	int ret;
+	int ret, fd, i;
 	struct libmtd *lib = (struct libmtd *)desc;
+	char node[sizeof(MTD_DEV_PATT) + 20];
 
 	memset(mtd, 0, sizeof(struct mtd_dev_info));
 	mtd->mtd_num = mtd_num;
@@ -779,6 +780,30 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 	mtd->bb_allowed = !!(mtd->type == MTD_NANDFLASH ||
 				mtd->type == MTD_MLCNANDFLASH);
 
+	if (mtd->region_cnt) {
+		mtd->reginfo = calloc(mtd->region_cnt,
+				sizeof(struct region_info_user));
+		if (!mtd->reginfo) {
+			errno = ENOMEM;
+			return -1;
+		}
+
+		sprintf(node, MTD_DEV_PATT, mtd_num);
+		fd = open(node, O_RDONLY);
+		if (fd == -1)
+			return sys_errmsg("cannot open \"%s\"", node);
+
+		for (i = 0; i < mtd->region_cnt; i++) {
+			ret = mtd_regioninfo(fd, i, &(mtd->reginfo[i]));
+			if (ret) {
+				close(fd);
+				return -1;
+			}
+		}
+
+		close(fd);
+	}
+
 	return 0;
 }
 
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index 7913e67..5e2ae73 100644
--- a/lib/libmtd_int.h
+++ b/lib/libmtd_int.h
@@ -33,6 +33,7 @@ extern "C" {
 #define SYSFS_MTD        "class/mtd"
 #define MTD_NAME_PATT    "mtd%d"
 #define MTD_DEV          "dev"
+#define MTD_DEV_PATT	 "/dev/mtd%d"
 #define MTD_NAME         "name"
 #define MTD_TYPE         "type"
 #define MTD_EB_SIZE      "erasesize"
-- 
1.9.1
