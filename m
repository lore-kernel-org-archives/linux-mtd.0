Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxBni-0006wi-BQ
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 10:09:35 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH v2 2/6] UBI: Fastmap: Remove unnecessary `\'
Date: Tue, 26 May 2015 10:07:06 +0000
Message-ID: <1432634830-129590-3-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
References: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 02a6de2..696a4f9 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -88,13 +88,13 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi)
 {
 	size_t size;
 
-	size = sizeof(struct ubi_fm_sb) + \
-		sizeof(struct ubi_fm_hdr) + \
-		sizeof(struct ubi_fm_scan_pool) + \
-		sizeof(struct ubi_fm_scan_pool) + \
-		(ubi->peb_count * sizeof(struct ubi_fm_ec)) + \
-		(sizeof(struct ubi_fm_eba) + \
-		(ubi->peb_count * sizeof(__be32))) + \
+	size = sizeof(struct ubi_fm_sb) +
+		sizeof(struct ubi_fm_hdr) +
+		sizeof(struct ubi_fm_scan_pool) +
+		sizeof(struct ubi_fm_scan_pool) +
+		(ubi->peb_count * sizeof(struct ubi_fm_ec)) +
+		(sizeof(struct ubi_fm_eba) +
+		(ubi->peb_count * sizeof(__be32))) +
 		sizeof(struct ubi_fm_volhdr) * UBI_MAX_VOLUMES;
 	return roundup(size, ubi->leb_size);
 }
-- 
1.8.3.4
