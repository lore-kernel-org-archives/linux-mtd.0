Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Xau-0003Bb-Kv
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 14:25:41 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCH] UBI: fix a horrible memory deallocation bug
Date: Mon,  3 Sep 2012 17:25:56 +0300
Message-Id: <1346682356-14997-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

UBI was mistakingly using 'kfree()' instead of 'kmem_cache_free()' when
freeing "attach eraseblock" structures in vtbl.c. Thankfully, this happened
only when we were doing auto-format, so many systems were unaffected. However,
there are still many users affected.

It is strange, but the system did not crash and nothing bad happened when
the SLUB memory allocator was used. However, in case of SLOB we observed an
crash right away.

This problem was introduced in 2.6.39 by commit
"6c1e875 UBI: add slab cache for ubi_scan_leb objects"

Reported-by: Richard Genoud <richard.genoud@gmail.com>
Cc: stable@vger.kernel.org [v2.6.39+]
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/vtbl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 64b9c56..926e3df 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -340,7 +340,7 @@ retry:
 	 * of this LEB as it will be deleted and freed in 'ubi_add_to_av()'.
 	 */
 	err = ubi_add_to_av(ubi, ai, new_aeb->pnum, new_aeb->ec, vid_hdr, 0);
-	kfree(new_aeb);
+	kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
 
@@ -353,7 +353,7 @@ write_error:
 		list_add(&new_aeb->u.list, &ai->erase);
 		goto retry;
 	}
-	kfree(new_aeb);
+	kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 out_free:
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
-- 
1.7.7.6
