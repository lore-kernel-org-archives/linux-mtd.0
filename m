Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxBni-0006wY-B6
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 10:09:35 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH v2 4/6] UBI: Init vol->reserved_pebs by assignment
Date: Tue, 26 May 2015 10:07:08 +0000
Message-ID: <1432634830-129590-5-git-send-email-shengyong1@huawei.com>
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

`vol' is a newly allocated value by kzalloc. Initialize it by assignment
instead of `+='.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/ubi/vmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index ff4d978..da2264b 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -253,8 +253,8 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 
 	/* Calculate how many eraseblocks are requested */
 	vol->usable_leb_size = ubi->leb_size - ubi->leb_size % req->alignment;
-	vol->reserved_pebs += div_u64(req->bytes + vol->usable_leb_size - 1,
-				      vol->usable_leb_size);
+	vol->reserved_pebs = div_u64(req->bytes + vol->usable_leb_size - 1,
+				     vol->usable_leb_size);
 
 	/* Reserve physical eraseblocks */
 	if (vol->reserved_pebs > ubi->avail_pebs) {
-- 
1.8.3.4
