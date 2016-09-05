Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvSl-00083M-D8
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:33 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 03/17] UBI: fastmap: avoid multiple be32_to_cpu() when
 unneccesary
Date: Mon,  5 Sep 2016 17:04:54 +0200
Message-Id: <1473087908-27862-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

process_pool_aeb() does several times the be32_to_cpu(new_vh->vol_id)
operation. Create a temporary variable and do it once.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/fastmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index a26dcc9d7703..ebb65ac6980f 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -370,24 +370,24 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			    struct ubi_vid_hdr *new_vh,
 			    struct ubi_ainf_peb *new_aeb)
 {
+	int vol_id = be32_to_cpu(new_vh->vol_id);
 	struct ubi_ainf_volume *av;
 
-	if (be32_to_cpu(new_vh->vol_id) == UBI_FM_SB_VOLUME_ID ||
-		be32_to_cpu(new_vh->vol_id) == UBI_FM_DATA_VOLUME_ID) {
+	if (vol_id == UBI_FM_SB_VOLUME_ID || vol_id == UBI_FM_DATA_VOLUME_ID) {
 		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 
 		return 0;
 	}
 
 	/* Find the volume this SEB belongs to */
-	av = ubi_find_av(ai, be32_to_cpu(new_vh->vol_id));
+	av = ubi_find_av(ai, vol_id);
 	if (!av) {
 		ubi_err(ubi, "orphaned volume in fastmap pool!");
 		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 		return UBI_BAD_FASTMAP;
 	}
 
-	ubi_assert(be32_to_cpu(new_vh->vol_id) == av->vol_id);
+	ubi_assert(vol_id == av->vol_id);
 
 	return update_vol(ubi, ai, av, new_vh, new_aeb);
 }
-- 
2.7.4
