Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBW7p-0000lg-Dx
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 20:32:31 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: Fix invalidate_fastmap()
Date: Mon, 19 Aug 2013 22:31:49 +0200
Message-Id: <1376944309-11342-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Onging tests uncovered that invalidate_fastmap() is broken.
It must not call ubi_wl_put_fm_peb() because all PEBs used
by the old fastmap have already been put back.

Signed-off-by: Richard Weinberger <richard@nod.at>
[rw: I did not Cc -stable because fastmap is an experimental feature.]
---
 drivers/mtd/ubi/fastmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1542751..f5aa4b0 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1343,7 +1343,7 @@ out:
 static int invalidate_fastmap(struct ubi_device *ubi,
 			      struct ubi_fastmap_layout *fm)
 {
-	int ret, i;
+	int ret;
 	struct ubi_vid_hdr *vh;
 
 	ret = erase_block(ubi, fm->e[0]->pnum);
@@ -1360,9 +1360,6 @@ static int invalidate_fastmap(struct ubi_device *ubi,
 	vh->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	ret = ubi_io_write_vid_hdr(ubi, fm->e[0]->pnum, vh);
 
-	for (i = 0; i < fm->used_blocks; i++)
-		ubi_wl_put_fm_peb(ubi, fm->e[i], i, fm->to_be_tortured[i]);
-
 	return ret;
 }
 
-- 
1.8.1.4
