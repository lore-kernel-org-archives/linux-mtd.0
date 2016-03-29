Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1al9nv-0002Mb-LB
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2016 06:40:37 +0000
From: z00189512 <abc.zhangliang@huawei.com>
To: <dedekind1@gmail.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <abc.zhangliang@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] modify wrong comment in ubi_leb_map function.
Date: Wed, 30 Mar 2016 02:41:19 +0800
Message-ID: <1459276879-21046-1-git-send-email-abc.zhangliang@huawei.com>
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

Signed-off-by: z00189512 <abc.zhangliang@huawei.com>
---
 drivers/mtd/ubi/kapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index e844887..cc6fa01 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -708,7 +708,7 @@ int ubi_leb_map(struct ubi_volume_desc *desc, int lnum)
 	struct ubi_volume *vol = desc->vol;
 	struct ubi_device *ubi = vol->ubi;
 
-	dbg_gen("unmap LEB %d:%d", vol->vol_id, lnum);
+	dbg_gen("map LEB %d:%d", vol->vol_id, lnum);
 
 	if (desc->mode == UBI_READONLY || vol->vol_type == UBI_STATIC_VOLUME)
 		return -EROFS;
-- 
1.9.1
