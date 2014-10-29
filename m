Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeN-0006TC-E5
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:58 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 21/35] UBI: Fastmap: Switch to ro mode if invalidate_fastmap()
 fails
Date: Wed, 29 Oct 2014 13:45:44 +0100
Message-Id: <1414586758-9972-22-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have to switch to ro mode to guarantee that upon next UBI attach
all data is consistent.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ad3655c..79b7387 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -842,10 +842,6 @@ fail:
 		list_del(&tmp_aeb->u.list);
 		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
 	}
-	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans, u.list) {
-		list_del(&tmp_aeb->u.list);
-		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
-	}
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
 		list_del(&tmp_aeb->u.list);
 		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
@@ -1562,8 +1558,10 @@ err:
 	ret = 0;
 	if (old_fm) {
 		ret = invalidate_fastmap(ubi, old_fm);
-		if (ret < 0)
+		if (ret < 0) {
 			ubi_err("Unable to invalidiate current fastmap!");
+			ubi_ro_mode(ubi);
+		}
 		else if (ret)
 			ret = 0;
 	}
-- 
1.8.4.5
