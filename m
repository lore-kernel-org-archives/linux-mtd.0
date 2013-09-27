Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPa72-00007D-QU
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 15:37:50 +0000
Received: by mail-wg0-f46.google.com with SMTP id k14so2815828wgh.13
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 08:37:26 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: fastmap: fix a mem leak on error path
Date: Fri, 27 Sep 2013 17:37:15 +0200
Message-Id: <1380296235-24194-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the scan_pool() function fails, the "free" list is not freed.
This leads to destroy_ai(ai) complaining with:
"kmem_cache_destroy ubi_ainf_peb_slab: Slab cache still has objects"

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/fastmap.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 05067f5..22eb527 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -841,6 +841,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 fail_bad:
 	ret = UBI_BAD_FASTMAP;
 fail:
+	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
+		kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
+		list_del(&tmp_aeb->u.list);
+	}
 	return ret;
 }
 
-- 
1.7.10.4
