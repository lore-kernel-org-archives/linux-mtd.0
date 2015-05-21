Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvNEC-0003Yi-QO
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 09:57:26 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <richard@nod.at>
Subject: [RFC PATCH 4/4] UBI: Fastmap: Do not add vol if it already exists
Date: Thu, 21 May 2015 09:56:05 +0000
Message-ID: <1432202165-22351-5-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1432202165-22351-1-git-send-email-shengyong1@huawei.com>
References: <1432202165-22351-1-git-send-email-shengyong1@huawei.com>
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

When writing fastmap, there is no guarantee that two same vol ID are
written to flash by mistake. Although this unlikely happens, we still
should check it when attaching.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index e3d8294..9eee904 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -192,8 +192,10 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
 
 		if (vol_id > av->vol_id)
 			p = &(*p)->rb_left;
-		else
+		else if (vol_id < av->vol_id)
 			p = &(*p)->rb_right;
+		else
+			return ERR_PTR(-EINVAL);
 	}
 
 	av = kmalloc(sizeof(struct ubi_ainf_volume), GFP_KERNEL);
@@ -748,6 +750,11 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 
 		if (!av)
 			goto fail_bad;
+		if (PTR_ERR(av) == -EINVAL) {
+			ubi_err(ubi, "volume (ID %i) already exists",
+				fmvhdr->vol_id);
+			goto fail_bad;
+		}
 
 		ai->vols_found++;
 		if (ai->highest_vol_id < be32_to_cpu(fmvhdr->vol_id))
-- 
1.8.3.4
