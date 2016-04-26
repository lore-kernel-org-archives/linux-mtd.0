Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzKf-0003YO-JU
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 09:31:02 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-FEM-01.mgc.mentorg.com)
 by relay1.mentorg.com with esmtp
 id 1auzKN-0000ro-P1 from Marian_Rotariu@mentor.com
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 02:30:43 -0700
From: Marian Rotariu <marian_rotariu@mentor.com>
To: <linux-mtd@lists.infradead.org>
CC: Marian Rotariu <marian_rotariu@mentor.com>
Subject: [PATCH 3/4] mtd-utils: fetch erasereg in legacy library
Date: Tue, 26 Apr 2016 12:30:23 +0300
Message-ID: <1461663024-12022-4-git-send-email-marian_rotariu@mentor.com>
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
 lib/libmtd_legacy.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 233a92e..5f2db9c 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -233,7 +233,7 @@ int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
 {
 	struct stat st;
 	struct mtd_info_user ui;
-	int fd, ret;
+	int fd, ret, region_cnt, i;
 	loff_t offs = 0;
 	struct proc_parse_info pi;
 
@@ -282,6 +282,32 @@ int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd)
 	} else
 		mtd->bb_allowed = 1;
 
+	ret = ioctl(fd, MEMGETREGIONCOUNT, &region_cnt);
+	if (ret == -1) {
+		if (errno != EOPNOTSUPP) {
+			sys_errmsg("MEMGETREGIONCOUNT ioctl failed");
+			goto out_close;
+		}
+		errno = 0;
+		mtd->region_cnt = 0;
+	} else
+		mtd->region_cnt = region_cnt;
+
+	if (mtd->region_cnt) {
+		mtd->reginfo = calloc(mtd->region_cnt,
+				sizeof(struct region_info_user));
+		if (!mtd->reginfo) {
+			errno = ENOMEM;
+			goto out_close;
+		}
+
+		for (i = 0; i < mtd->region_cnt; i++) {
+			ret = mtd_regioninfo(fd, i, &(mtd->reginfo[i]));
+			if (ret)
+				goto out_close;
+		}
+	}
+
 	mtd->type = ui.type;
 	mtd->size = ui.size;
 	mtd->eb_size = ui.erasesize;
-- 
1.9.1
