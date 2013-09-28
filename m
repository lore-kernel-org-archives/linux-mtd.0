Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPv0H-0003YB-GY
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2013 13:56:14 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 6/7] UBI: Fix memory leak in ubi_attach_fastmap() error path
Date: Sat, 28 Sep 2013 15:55:15 +0200
Message-Id: <1380376516-30144-7-git-send-email-richard@nod.at>
In-Reply-To: <1380376516-30144-1-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
Cc: richard.genoud@gmail.com, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On error we have to free all three temporary lists.

Reported-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 05067f5..4cfc8da 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -841,6 +841,19 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 fail_bad:
 	ret = UBI_BAD_FASTMAP;
 fail:
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+		list_del(&tmp_aeb->u.list);
+	}
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans, u.list) {
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+		list_del(&tmp_aeb->u.list);
+	}
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+		list_del(&tmp_aeb->u.list);
+	}
+
 	return ret;
 }
 
-- 
1.8.3.1
