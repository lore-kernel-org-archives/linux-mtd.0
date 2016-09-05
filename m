Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvSl-0007ms-DA
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:05:33 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 01/17] UBI: fastmap: use ubi_find_volume() instead of open
 coding it
Date: Mon,  5 Sep 2016 17:04:52 +0200
Message-Id: <1473087908-27862-2-git-send-email-boris.brezillon@free-electrons.com>
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

process_pool_aeb() re-implements the logic found in ubi_find_volume().
Call ubi_find_volume() to avoid this duplication.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/fastmap.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 48eb55f344eb..a26dcc9d7703 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -370,9 +370,7 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			    struct ubi_vid_hdr *new_vh,
 			    struct ubi_ainf_peb *new_aeb)
 {
-	struct ubi_ainf_volume *av, *tmp_av = NULL;
-	struct rb_node **p = &ai->volumes.rb_node, *parent = NULL;
-	int found = 0;
+	struct ubi_ainf_volume *av;
 
 	if (be32_to_cpu(new_vh->vol_id) == UBI_FM_SB_VOLUME_ID ||
 		be32_to_cpu(new_vh->vol_id) == UBI_FM_DATA_VOLUME_ID) {
@@ -382,23 +380,8 @@ static int process_pool_aeb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	}
 
 	/* Find the volume this SEB belongs to */
-	while (*p) {
-		parent = *p;
-		tmp_av = rb_entry(parent, struct ubi_ainf_volume, rb);
-
-		if (be32_to_cpu(new_vh->vol_id) > tmp_av->vol_id)
-			p = &(*p)->rb_left;
-		else if (be32_to_cpu(new_vh->vol_id) < tmp_av->vol_id)
-			p = &(*p)->rb_right;
-		else {
-			found = 1;
-			break;
-		}
-	}
-
-	if (found)
-		av = tmp_av;
-	else {
+	av = ubi_find_av(ai, be32_to_cpu(new_vh->vol_id));
+	if (!av) {
 		ubi_err(ubi, "orphaned volume in fastmap pool!");
 		kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 		return UBI_BAD_FASTMAP;
-- 
2.7.4
