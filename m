Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxBpZ-0006w6-Oi
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 10:11:30 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH v2 1/6] UBI: Fastmap: Use max() to get the larger value
Date: Tue, 26 May 2015 10:07:05 +0000
Message-ID: <1432634830-129590-2-git-send-email-shengyong1@huawei.com>
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
 drivers/mtd/ubi/build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index b7f824d..ddeccdf 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -947,8 +947,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 */
 	ubi->fm_pool.max_size = min(((int)mtd_div_by_eb(ubi->mtd->size,
 		ubi->mtd) / 100) * 5, UBI_FM_MAX_POOL_SIZE);
-	if (ubi->fm_pool.max_size < UBI_FM_MIN_POOL_SIZE)
-		ubi->fm_pool.max_size = UBI_FM_MIN_POOL_SIZE;
+	ubi->fm_pool.max_size = max(ubi->fm_pool.max_size,
+		UBI_FM_MIN_POOL_SIZE);
 
 	ubi->fm_wl_pool.max_size = ubi->fm_pool.max_size / 2;
 	ubi->fm_disabled = !fm_autoconvert;
-- 
1.8.3.4
